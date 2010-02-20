%module oll

%include "std_vector.i"
%include "std_pair.i"

namespace std {
  %template(IntVector) vector<int>;
  %template(FloatVector) vector<float>;
  %template(IntFloatPair) pair<int,float>;
  %template(FeatureVector) std::vector<std::pair<int, float> >;
};

%{
#include "oll.hpp"
%}

%include "oll.hpp"

%template(trainExampleP) oll_tool::oll::trainExample<oll_tool::P_s>;
%template(trainExampleAP) oll_tool::oll::trainExample<oll_tool::AP_s>;
%template(trainExamplePA) oll_tool::oll::trainExample<oll_tool::PA_s>;
%template(trainExamplePA1) oll_tool::oll::trainExample<oll_tool::PA1_s>;
%template(trainExamplePA2) oll_tool::oll::trainExample<oll_tool::PA2_s>;
%template(trainExamplePAK) oll_tool::oll::trainExample<oll_tool::PAK_s>;
%template(trainExampleCW) oll_tool::oll::trainExample<oll_tool::CW_s>;
%template(trainExampleAL) oll_tool::oll::trainExample<oll_tool::AL_s>;
