classdef IF < Switch
    %IF Same as switch
    %   Condition is first argument    
    properties

    end
    
    methods
        function this = IF(varargin)
            p = inputParser;
            p.CaseSensitive = false;
            % p.PartialMatching = false;
            p.KeepUnmatched = true;
            addOptional(p,'cond',{},@(x) isnumeric(x) || isempty(x) || isa(x,'block'));
            addOptional(p,'b1',{},@(x) isnumeric(x) || isempty(x) || isa(x,'block'));
            addOptional(p,'b2',{},@(x) isnumeric(x) || isempty(x) || isa(x,'block'));
            parse(p,varargin{:})
            
            b1 = p.Results.b1;
            b2 = p.Results.b2;
            cond = p.Results.cond;
            args = helpers.validateArgs(p.Unmatched);
            
            this = this@Switch(b1,b2,cond,args{:});
        end
    end
end

