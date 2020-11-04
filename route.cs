using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
namespace Bus_station
{
    #region Route
    public class Route
    {
        #region Member Variables
        protected int _route_id;
        protected string _destination;
        protected string _start_destination;
        protected int _fk_bus_id;
        #endregion
        #region Constructors
        public Route() { }
        public Route(string destination, string start_destination, int fk_bus_id)
        {
            this._destination=destination;
            this._start_destination=start_destination;
            this._fk_bus_id=fk_bus_id;
        }
        #endregion
        #region Public Properties
        public virtual int Route_id
        {
            get {return _route_id;}
            set {_route_id=value;}
        }
        public virtual string Destination
        {
            get {return _destination;}
            set {_destination=value;}
        }
        public virtual string Start_destination
        {
            get {return _start_destination;}
            set {_start_destination=value;}
        }
        public virtual int Fk_bus_id
        {
            get {return _fk_bus_id;}
            set {_fk_bus_id=value;}
        }
        #endregion
    }
    #endregion
}