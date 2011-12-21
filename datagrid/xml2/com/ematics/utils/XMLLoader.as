package com.ematics.utils
{
    import flash.events.*;
    import flash.net.*;
    import flash.xml.*

        /**
         * XMLLoader is a ValueObject for the FlepStudio API.
         * This class loads a parses an xml file - no XMLList used
         *
         * @author Filippo Lughi
         * @version Actionscript 3.0
         */
         
        public class XMLLoader extends EventDispatcher
        {
            private var _file_url:URLRequest;
            private var _file_xml:XML;
            private var _urlLoader:URLLoader;

            /**
             * Construct a new XMLLoader instance
             *
             * @param        .target                IEventDispatcher
             */
            public function XMLLoader(target:IEventDispatcher=null)
            {
                urlLoader=new URLLoader();
                super(target);
            }

            /**
             * The request to load the file
             */
            public function get file_url():URLRequest
            {
                return _file_url;
            }

            public function set file_url(file:URLRequest):void
            {
                _file_url=file;
            }

            /**
             * The XML file
             */
            public function get file_xml():XML
            {
                return _file_xml;
            }

            public function set file_xml(xml:XML):void
            {
                _file_xml=xml;
            }

            /**
             * The loader instance
             */
            public function get urlLoader():URLLoader
            {
                return _urlLoader;
            }

            public function set urlLoader(loader:URLLoader):void
            {
                _urlLoader=loader;
            }

            /**
             * Load the XML file
             *
             * @param        .strFileName                String
             */
            public function load(strFileName:String):void
            {
                file_url=new URLRequest(strFileName);
                urlLoader.load(file_url);
                urlLoader.addEventListener(Event.COMPLETE,onXMLLoaded);
            }

            /**
             * Finish loading
             *
             * @param        .evt                Event
             */
            private function onXMLLoaded(evt:Event):void
            {
                urlLoader.removeEventListener(Event.COMPLETE,onXMLLoaded);

                var dataLoader:URLLoader=evt.target as URLLoader;
                file_xml=new XML(dataLoader.data);
                dispatchEvent(new CustomEvent(CustomEvent.ONLOADED,file_xml));

                file_xml=null;
                dataLoader=null;
                urlLoader=null;
            }
        }
}
