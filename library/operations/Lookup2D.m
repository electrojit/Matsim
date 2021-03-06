classdef Lookup2D < binary_operator
    properties
        
    end
    
    methods
        function this = Lookup2D(varargin)
            p = inputParser;
            p.CaseSensitive = false;
            % p.PartialMatching = false;
            p.KeepUnmatched = true;            
            addOptional(p,'b1',{},@(x) isnumeric(x) || isempty(x) || isa(x,'block'));
            addOptional(p,'b2',{},@(x) isnumeric(x) || isempty(x) || isa(x,'block'));
            addParamValue(p,'table','',@(x) isnumeric(x) || ischar(x));
            addParamValue(p,'breakpoints1','',@(x) isnumeric(x) || ischar(x));
            addParamValue(p,'breakpoints2','',@(x) isnumeric(x) || ischar(x));
            parse(p,varargin{:})
            
            b1 = p.Results.b1;
            b2 = p.Results.b2;
            table = p.Results.table;
            breakpoints1 = p.Results.breakpoints1;
            breakpoints2 = p.Results.breakpoints2;
            args = helpers.validateArgs(p.Unmatched);
            
            this = this@binary_operator(b1,b2,'ops','2-D Lookup Table',args{:});
            this.set('ExtrapMethod','Clip')
            this.set('UseLastTableValue','on')

            this.set('Table',table)
            this.set('BreakpointsForDimension1',breakpoints1)
            this.set('BreakpointsForDimension2',breakpoints2)
        end
    end
    
end

