// Decompiled by library.dedaub.com
// 2022.12.01 14:54 UTC

// Data structures and variables inferred from the use of storage instructions
uint256 _airDropPot_; // STORAGE[0x0]
uint256 _airDropTracker_; // STORAGE[0x1]
uint256 _rID_; // STORAGE[0x2]
uint256 stor_3; // STORAGE[0x3]
uint256 _pID_; // STORAGE[0x4]
mapping (uint256 => [uint256]) _pIDxAddr_; // STORAGE[0x5]
mapping (uint256 => [uint256]) _pIDxName_; // STORAGE[0x6]
mapping (uint256 => [uint256]) _player_; // STORAGE[0x7]
mapping (uint256 => [uint256]) owner_8; // STORAGE[0x8]
mapping (uint256 => [uint256]) map_9; // STORAGE[0x9]
mapping (uint256 => [uint256]) _registerNameXaddr; // STORAGE[0xa]
mapping (uint256 => [uint256]) map_b; // STORAGE[0xb]
mapping (uint256 => [uint256]) map_c; // STORAGE[0xc]
mapping (uint256 => [uint256]) _getTimeLeft; // STORAGE[0xd]
mapping (uint256 => [uint256]) map_e; // STORAGE[0xe]
mapping (uint256 => [uint256]) map_f; // STORAGE[0xf]
mapping (uint256 => [uint256]) _fees_; // STORAGE[0x10]
mapping (uint256 => [uint256]) map_11; // STORAGE[0x11]
uint256 _activated_; // STORAGE[0x12] bytes 0 to 0
uint256 stor_ad67d757c34507f157cacfa2e3153e9f260a2244f30428821be7be64587ac55f_0_0; // STORAGE[0xad67d757c34507f157cacfa2e3153e9f260a2244f30428821be7be64587ac55f] bytes 0 to 0

// Events
onBuyAndDistribute(address, bytes32, uint256, uint256, uint256, address, bytes32, uint256, uint256, uint256);
onWithdrawAndDistribute(address, bytes32, uint256, uint256, uint256, address, bytes32, uint256, uint256, uint256);
onWithdraw(uint256, address, bytes32, uint256, uint256);
onNewName(uint256, address, bytes32, bool, uint256, address, bytes32, uint256, uint256);
onReLoadAndDistribute(address, bytes32, uint256, uint256, address, bytes32, uint256, uint256, uint256);
onEndTx(uint256, uint256, bytes32, address, uint256, uint256, address, bytes32, uint256, uint256, uint256, uint256, uint256);

function 0x10b4() private { 
    v0 = new struct(8);
    v0.word0 = 0;
    v0.word1 = 0;
    v0.word2 = 0;
    v0.word3 = 0;
    v0.word4 = 0;
    v0.word5 = 0;
    v0.word6 = 0;
    v0.word7 = 0;
    require(1 == _activated_, Error('not ready'));
    require(!msg.sender.code.size, Error('addr error'));
    v1 = v2 = 1 == 0xff & owner_8[msg.sender];
    if (v2) {
        v1 = v3 = block.timestamp > _getTimeLeft[_rID_][2];
    }
    if (v1) {
        v1 = v4 = !(0xff & _getTimeLeft[_rID_][0x3]);
    }
    if (v1) {
        v1 = v5 = _getTimeLeft[_rID_];
    }
    if (!v1) {
        v6 = 0x320a(_pIDxAddr_[msg.sender]);
        if (v6 > 0) {
            v7 = address(_player_[_pIDxAddr_[msg.sender]]).call().value(v6).gas(2300 * !v6);
            require(v7); // checks call status, propagates error data on error
        }
        emit onWithdraw(_pIDxAddr_[msg.sender], msg.sender, _player_[_pIDxAddr_[msg.sender]][1], v6, block.timestamp);
        return ;
    } else {
        _getTimeLeft[_rID_][3] = 0x1 | ~0xff & _getTimeLeft[_rID_][0x3];
        v8 = 0x2555();
        v9 = 0x320a(v0);
        if (v9 > 0) {
            v10 = address(_player_[v0]).call().value(v9).gas(2300 * !v9);
            require(v10); // checks call status, propagates error data on error
        }
        MEM[0 + v8] = MEM[0 + v8] + 0;
        MEM[32 + v8] = MEM[32 + v8] + v0;
        emit onWithdrawAndDistribute(msg.sender, ~0x0 & (~0x0 & _player_[v0][0x1]), v9, MEM[0 + v8], MEM[32 + v8], address(MEM[64 + v8]), ~0x0 & (~0x0 & MEM[96 + v8]), MEM[128 + v8], MEM[160 + v8], MEM[192 + v8]);
        return _rID_;
    }
}

function 0x17ae(uint256 varg0) private { 
    v0 = 0x2983(varg0);
    if (_pIDxName_[v0]) {
        return 0;
    } else {
        return 1;
    }
}

function 0x1954(uint256 varg0) private { 
    v0 = address(varg0);
    if (!_player_[_pIDxAddr_[v0]][1]) {
        return 0;
    } else {
        return 1;
    }
}

function () public payable { 
    v0 = new struct(8);
    v0.word0 = 0;
    v0.word1 = 0;
    v0.word2 = 0;
    v0.word3 = 0;
    v0.word4 = 0;
    v0.word5 = 0;
    v0.word6 = 0;
    v0.word7 = 0;
    require(1 == _activated_, Error('not ready'));
    require(!msg.sender.code.size, Error('addr error'));
    require(msg.value >= 0x3b9aca00, Error('eth less'));
    require(msg.value <= 0x152d02c7e14af6800000, Error('eth more'));
    require(_pIDxAddr_[msg.sender], Error('buy fail'));
    0x9a0(v0, 0);
}

function 0x1ee1(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5) private { 
    varg4 = v0 = 0;
    if (!map_9[varg5][2]) {
        v1 = new struct(8);
        v1.word0 = 0;
        v1.word1 = 0;
        v1.word2 = 0;
        v1.word3 = 0;
        v1.word4 = 0;
        v1.word5 = 0;
        v1.word6 = 0;
        v1.word7 = 0;
        if (_player_[varg4][5]) {
            0x3f76(_player_[varg4][5], varg4);
        }
        _player_[varg4][5] = _rID_;
        varg0.word0 += 10;
    }
    if (varg3 <= 0x3b9aca00) {
        return ;
    } else {
        if (0xff & owner_8[varg5]) {
            v2 = _getTimeLeft[varg5][7];
            v3 = _SafeMul(0x21e19e0c9bab2400000, varg3);
            assert(v2);
            v4 = v5 = v3 / v2;
        } else {
            v6 = _SafeMul(100, varg3);
            assert(3);
            v4 = v7 = v6 / 3;
        }
        if (v4 >= 0xde0b6b3a7640000) {
            v8 = v9 = 1 == 0xff & owner_8[varg5];
            if (v9) {
                v8 = v10 = _getTimeLeft[varg5][7] >= stor_3;
            }
            if (v8) {
                v11 = v12 = block.timestamp > _getTimeLeft[varg5][2];
                if (v12) {
                    v11 = !_getTimeLeft[varg5];
                }
                if (!v11) {
                    v13 = 0x33b6(v4, 0xde0b6b3a7640000, 120);
                    v14 = _getTimeLeft[varg5][2] + v13;
                    require(v14 >= v13, Error('add failed'));
                } else {
                    v15 = 0x33b6(v4, 0xde0b6b3a7640000, 120);
                    v14 = v16 = block.timestamp + v15;
                    require(v16 >= v15, Error('add failed'));
                }
                require(block.timestamp + 0x15180 >= 0x15180, Error('add failed'));
                if (v14 >= block.timestamp + 0x15180) {
                    require(block.timestamp + 0x15180 >= 0x15180, Error('add failed'));
                    _getTimeLeft[varg5][2] = block.timestamp + 0x15180;
                } else {
                    _getTimeLeft[varg5][2] = v14;
                }
                goto 0x1fd5;
            }
            if (varg4 != _getTimeLeft[varg5]) {
                _getTimeLeft[varg5] = varg4;
            }
            if (varg1 != _getTimeLeft[varg5][1]) {
                _getTimeLeft[varg5][1] = varg1;
            }
            varg0.word0 += 100;
        }
        if (varg3 >= 0x16345785d8a0000) {
            _airDropTracker_ += 1;
            varg3 = v17 = 8272;
            v4 = v18 = 0;
            v4 = v19 = 14789;
            v4 = v20 = block.number;
            v4 = v21 = 20058;
            v22 = v23 = v23.data;
            v24 = v25 = 32 + MEM[64];
            while (v26 >= 32) {
                MEM[v22] = MEM[v24];
                v26 = v26 + ~31;
                v22 += 32;
                v24 += 32;
            }
            MEM[v22] = MEM[v22] & ~0 + 256 ** (32 - v26) | MEM[v24] & ~(~0 + 256 ** (32 - v26));
            assert(block.timestamp);
            v4 = v27 = keccak256(msg.sender) / block.timestamp;
            v4 = v28 = 20101;
            v4 = v29 = block.gaslimit;
            v4 = v30 = 20101;
            v31 = v32 = v32.data;
            v33 = v34 = 32 + MEM[64];
            while (v35 >= 32) {
                MEM[v31] = MEM[v33];
                v35 = v35 + ~31;
                v31 += 32;
                v33 += 32;
            }
            MEM[v31] = MEM[v31] & ~0 + 256 ** (32 - v35) | MEM[v33] & ~(~0 + 256 ** (32 - v35));
            assert(block.timestamp);
            v4 = v36 = keccak256(address(block.coinbase)) / block.timestamp;
            v37 = block.difficulty + block.timestamp;
            require(v37 >= block.timestamp, Error('add failed'));
            while (1) {
                v37 += v4;
                if (v37 >= v37) {
                    break;
                }
                goto {'0x4e85B0x2041', '0x4e5aB0x2041', '0x39c5B0x2041'};
            }
            revert(Error('add failed'));
            v38 = v39 = v39.data;
            v40 = v41 = 32 + MEM[64];
            while (v42 >= 32) {
                MEM[v38] = MEM[v40];
                v42 = v42 + ~31;
                v38 += 32;
                v40 += 32;
            }
            MEM[v38] = MEM[v38] & ~0 + 256 ** (32 - v42) | MEM[v40] & ~(~0 + 256 ** (32 - v42));
            if (keccak256(v37) - 1000 * (keccak256(v37) / 1000) >= _airDropTracker_) {
                v43 = v44 = 0;
            } else {
                v43 = v45 = 1;
            }
            if (1 == v43) {
                if (v17 < 0x8ac7230489e80000) {
                    v46 = v47 = v17 >= 0xde0b6b3a7640000;
                    if (v47) {
                        v46 = v48 = v17 < 0x8ac7230489e80000;
                    }
                    if (!v46) {
                        v49 = v50 = v17 >= 0x16345785d8a0000;
                        if (v50) {
                            v49 = v51 = v17 < 0xde0b6b3a7640000;
                        }
                        if (v49) {
                            v52 = _SafeMul(25, _airDropPot_);
                            assert(100);
                            v4 = v53 = v52 / 100;
                            require(v53 + _player_[v0][2] >= _player_[v0][2], Error('add failed'));
                            _player_[v0][2] += v53;
                            v54 = _SafeSub(v53, _airDropPot_);
                            _airDropPot_ = v54;
                            MEM[v55] += 0xeca8847c4129106ce8300000000;
                        }
                    } else {
                        v56 = _SafeMul(50, _airDropPot_);
                        assert(100);
                        v4 = v57 = v56 / 100;
                        require(v57 + _player_[v0][2] >= _player_[v0][2], Error('add failed'));
                        _player_[v0][2] += v57;
                        v58 = _SafeSub(v57, _airDropPot_);
                        _airDropPot_ = v58;
                        MEM[v55] += 0x9dc5ada82b70b59df0200000000;
                    }
                } else {
                    v59 = _SafeMul(75, _airDropPot_);
                    assert(100);
                    v4 = v60 = v59 / 100;
                    require(v60 + _player_[v0][2] >= _player_[v0][2], Error('add failed'));
                    _player_[v0][2] += v60;
                    v61 = _SafeSub(v60, _airDropPot_);
                    _airDropPot_ = v61;
                    MEM[v55] += 0xeca8847c4129106ce8300000000;
                }
                MEM[v55] = 0x7e37be2022c0914b2680000000 + (v4 * 0x314dc6448d9338c15b0a00000000 + MEM[v55]);
                _airDropTracker_ = 0;
            }
        }
        MEM[v4] += _airDropTracker_ * 1000;
        require(map_9[v4][2] + v4 >= v4, Error('add failed'));
        map_9[v4][2] = map_9[v4][2] + v4;
        require(map_9[v4][3] + v4 >= v4, Error('add failed'));
        map_9[v4][3] = map_9[v4][3] + v4;
        require(map_9[v4] + varg3 >= varg3, Error('add failed'));
        map_9[v4] = map_9[v4] + varg3;
        require(map_b[v4] + varg3 >= varg3, Error('add failed'));
        map_b[v4] = map_b[v4] + varg3;
        require(map_b[v4] + v4 >= v4, Error('add failed'));
        map_c[v4] = map_b[v4] + v4;
        require(map_c[v4][5] + v4 >= v4, Error('add failed'));
        _getTimeLeft[v4][5] = map_c[v4][5] + v4;
        require(_getTimeLeft[v4][9] + v4 >= v4, Error('add failed'));
        _getTimeLeft[v4][9] = _getTimeLeft[v4][9] + v4;
        require(_getTimeLeft[v4][6] + varg3 >= varg3, Error('add failed'));
        _getTimeLeft[v4][6] = _getTimeLeft[v4][6] + varg3;
        require(map_e[v4] + varg3 >= varg3, Error('add failed'));
        map_e[v4] = map_e[v4] + varg3;
        require(map_e[v4] + v4 >= v4, Error('add failed'));
        map_f[v4] = map_e[v4] + v4;
        v62 = new struct(8);
        v62.word0 = 0;
        v62.word1 = 0;
        v62.word2 = 0;
        v62.word3 = 0;
        v62.word4 = 0;
        v62.word5 = 0;
        v62.word6 = 0;
        v62.word7 = 0;
        require(varg3 / 50 + _airDropPot_ >= _airDropPot_, Error('add failed'));
        _airDropPot_ += varg3 / 50;
        v63 = _SafeMul(8, varg3);
        assert(100);
        v64 = v65 = v63 / 100;
        v66 = v67 = varg3 >> 2;
        v68 = v69 = 0;
        while (v68 < 9) {
            if (map_9[v4][3]) {
                v70 = _SafeMul(map_11[v68], v67);
                assert(100);
                require(_player_[v4][4] + v70 / 100 >= v70 / 100, Error('add failed'));
                _player_[v4][4] = _player_[v4][4] + v70 / 100;
                v66 = _SafeSub(v70 / 100, v66);
                v4 = v71 = _player_[v4][6];
            }
            v68 = v68 + 1;
        }
        if (v66 > 0) {
            v64 = v66 + v65;
            require(v64 >= v65, Error('add failed'));
        }
        v72 = 0x5e96db84a4babf5958db3e1cf130d996947b1702.deposit().value(v64 >> 1).gas(msg.gas);
        if (v72) {
            v64 = v73 = _SafeSub(v64 >> 1, v64);
        }
        v74 = 0xef0aac2d19f482225dc4ae2eaf85fc80db589439.deposit().value(v64).gas(msg.gas);
        if (v74) {
            v64 = v75 = 0;
        }
        v76 = new struct(8);
        v76.word0 = 0;
        v76.word1 = 0;
        v76.word2 = 0;
        v76.word3 = 0;
        v76.word4 = 0;
        v76.word5 = 0;
        v76.word6 = 0;
        v76.word7 = 0;
        v77 = _SafeMul(_fees_[v4], varg3);
        assert(100);
        v78 = v79 = v77 / 100;
        v80 = _SafeMul(35, varg3);
        assert(100);
        v81 = _SafeSub(v79, varg3);
        require(v80 / 100 <= v81, Error('sub failed'));
        v82 = v83 = v81 - v80 / 100;
        if (v64 > 0) {
            v82 = v64 + v83;
            require(v82 >= v83, Error('add failed'));
        }
        v84 = _SafeMul(0xde0b6b3a7640000, v79);
        assert(_getTimeLeft[v4][9]);
        v85 = v86 = 1;
        while (v85 <= _pID_) {
            v87 = _SafeMul(map_9[v85][3], v84 / _getTimeLeft[v4][9]);
            if (0xde0b6b3a7640000) {
                break;
            }
            assert(0xde0b6b3a7640000);
            v88 = _SafeMul(5, map_9[v85]);
            if (map_9[v85][1] + v87 / 0xde0b6b3a7640000 >= v87 / 0xde0b6b3a7640000) {
                break;
            }
            require(map_9[v85][1] + v87 / 0xde0b6b3a7640000 >= v87 / 0xde0b6b3a7640000, Error('add failed'));
            if (map_9[v85][1] + v87 / 0xde0b6b3a7640000 < v88) {
                v78 = _SafeSub(v87 / 0xde0b6b3a7640000, v78);
                require(map_9[v85][1] + v87 / 0xde0b6b3a7640000 >= v87 / 0xde0b6b3a7640000, Error('add failed'));
                map_9[v85][1] = map_9[v85][1] + v87 / 0xde0b6b3a7640000;
                require(v87 / 0xde0b6b3a7640000 + map_9[v85][3] >= map_9[v85][3], Error('add failed'));
                _player_[v85][3] = v87 / 0xde0b6b3a7640000 + map_9[v85][3];
            } else {
                v89 = _SafeMul(5, map_9[v85]);
                v90 = _SafeSub(map_9[v85][1], v89);
                map_9[v85] = 0;
                map_9[v85][1] = 0;
                map_9[v85][3] = 0;
                v78 = _SafeSub(v90, v78);
                require(v90 + _player_[v85][3] >= _player_[v85][3], Error('add failed'));
                _player_[v85][3] += v90;
                v91 = _SafeSub(map_9[v85][3], _getTimeLeft[v85][9]);
                _getTimeLeft[v4][9] = v91;
            }
            v85 = v85 + 1;
        }
        if (v78 > 0) {
            v78 = v92 = _SafeSub(v78, v79);
        }
        require(v78 + v82 >= v82, Error('add failed'));
        require(_getTimeLeft[v4][7] + (v78 + v82) >= v78 + v82, Error('add failed'));
        _getTimeLeft[v4][7] = _getTimeLeft[v4][7] + (v78 + v82);
        MEM[v4 + 192] = v78;
        MEM[v4 + 224] = v82;
        v93 = v94 = !(0xff & owner_8[v4]);
        if (v94) {
            v93 = v95 = _getTimeLeft[v4][7] >= stor_3;
        }
        if (v93) {
            owner_8[v4] = 0x1 | ~0xff & owner_8[v4];
            _getTimeLeft[v4][4] = block.timestamp;
            _getTimeLeft[v4][2] = 0x15180 + block.timestamp;
        }
        MEM[0 + v4] = MEM[0 + v4] + 0xde0b6b3a7640000 * block.timestamp + 0x1431e0fae6d7217caa0000000 * v4;
        MEM[32 + v4] = MEM[32 + v4] + varg4 + 0x1aba4714957d300d0e549208b31adb10000000000000 * _rID_;
        emit onEndTx(MEM[0 + v4], MEM[32 + v4], ~0x0 & (~0x0 & _player_[varg4][0x1]), msg.sender, varg3, v4, address(MEM[64 + v4]), ~0x0 & (~0x0 & MEM[96 + v4]), MEM[128 + v4], MEM[160 + v4], MEM[192 + v4], MEM[224 + v4], _airDropPot_);
        return ;
    }
}

function 0x2555() private { 
    v0 = new struct(8);
    v0.word0 = 0;
    v0.word1 = 0;
    v0.word2 = 0;
    v0.word3 = 0;
    v0.word4 = 0;
    v0.word5 = 0;
    v0.word6 = 0;
    v0.word7 = 0;
    v0 = v1 = _rID_;
    v0 = v2 = 0;
    v0 = v3 = _getTimeLeft[v1];
    v0 = v4 = _getTimeLeft[v1][1];
    v0 = v5 = _getTimeLeft[v1][7];
    v6 = _SafeMul(50, v5);
    assert(100);
    v0 = v7 = v6 / 100;
    v8 = _SafeMul(10, v5);
    assert(100);
    v0 = v9 = v8 / 100;
    v10 = _SafeMul(30, v5);
    assert(100);
    v0 = v11 = v10 / 100;
    v0 = v12 = 9730;
    v0 = v13 = 19539;
    v14 = v15 = _SafeSub(v11, v5);
    while (1) {
        v14 = _SafeSub(v0, v14);
    }
    v16 = 0x3d6a(v0, v0);
    if (v16 > 0) {
        v14 = v17 = v16 + v14;
        require(v17 >= v14, Error('add failed'));
    }
    v18 = _SafeMul(0xde0b6b3a7640000, v0);
    assert(map_f[v0]);
    v19 = _SafeMul(map_f[v0], v18 / map_f[v0]);
    assert(0xde0b6b3a7640000);
    require(v19 / 0xde0b6b3a7640000 <= v0, Error('sub failed'));
    if (v0 - v19 / 0xde0b6b3a7640000 > 0) {
        v0 = v20 = _SafeSub(v0 - v19 / 0xde0b6b3a7640000, v0);
        v14 += v0 - v19 / 0xde0b6b3a7640000;
        require(v14 >= v14, Error('add failed'));
    }
    require(_player_[v0][2] + v0 >= v0, Error('add failed'));
    _player_[v0][2] = _player_[v0][2] + v0;
    _getTimeLeft[v0][8] = v18 / map_f[v0];
    MEM[0 + v1] = MEM[0 + v1] + 0xf4240 * _getTimeLeft[v0][2];
    MEM[32 + v1] = MEM[32 + v1] + 0x52b7d2dcc80cd2e4000000 * v0 + 0x16345785d8a0000 * v0;
    MEM[64 + v1] = address(_getTimeLeft[v0][0]);
    MEM[96 + v1] = ~0x0 & (~0x0 & _getTimeLeft[v0][0x1]);
    MEM[128 + v1] = v0;
    MEM[192 + v1] = v0;
    MEM[160 + v1] = v14;
    _rID_ += 1;
    v21 = 1 + v0;
    if (v14 >= stor_3) {
        owner_8[v21] = 0x1 | ~0xff & owner_8[v21];
        _getTimeLeft[v21][4] = block.timestamp;
        require(0x15180 + block.timestamp >= block.timestamp, Error('add failed'));
        _getTimeLeft[v21][2] = 0x15180 + block.timestamp;
    } else {
        owner_8[v21] = ~0xff & owner_8[v21];
    }
    _getTimeLeft[v21][7] = v14;
    _getTimeLeft[v21][6] = v14;
    return v1;
}

function 0x2955(uint256 varg0, uint256 varg1) private { 
    v0 = _SafeMul(varg0, varg1);
    assert(0x21e19e0c9bab2400000);
    return v0 / 0x21e19e0c9bab2400000;
}

function 0x2983(uint256 varg0) private { 
    v0 = v1 = 0;
    v2 = v3 = varg0.length <= 32;
    if (varg0.length <= 32) {
        v2 = v4 = varg0.length > 0;
    }
    require(v2, Error('must be between 1 and 32 characters'));
    assert(0 < varg0.length);
    v5 = v6 = 0x2000000000000000000000000000000000000000000000000000000000000000 != ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[0] >> 248 << 248;
    if (v6) {
        assert(varg0.length - 1 < varg0.length);
        v5 = v7 = 0x2000000000000000000000000000000000000000000000000000000000000000 != ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[varg0.length - 1] >> 248 << 248;
    }
    require(v5, Error('cannot start or end with space'));
    assert(0 < varg0.length);
    if (0x3000000000000000000000000000000000000000000000000000000000000000 == ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[0] >> 248 << 248) {
        assert(1 < varg0.length);
        require(0x7800000000000000000000000000000000000000000000000000000000000000 != ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[1] >> 248 << 248, Error('cannot start with 0x'));
        assert(1 < varg0.length);
        require(0x5800000000000000000000000000000000000000000000000000000000000000 != ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[1] >> 248 << 248, Error('cannot start with 0x'));
    }
    v8 = v9 = 0;
    while (v8 < varg0.length) {
        if (v8 < varg0.length) {
            break;
        }
        assert(v8 < varg0.length);
        v10 = v11 = ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[v8] >> 248 << 248 > 0x4000000000000000000000000000000000000000000000000000000000000000;
        if (v11) {
            assert(v8 < varg0.length);
            v10 = v12 = ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[v8] >> 248 << 248 < 0x5b00000000000000000000000000000000000000000000000000000000000000;
        }
        if (!v10) {
            assert(v8 < varg0.length);
            v13 = v14 = 0x2000000000000000000000000000000000000000000000000000000000000000 == ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[v8] >> 248 << 248;
            if (0x2000000000000000000000000000000000000000000000000000000000000000 != ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[v8] >> 248 << 248) {
                assert(v8 < varg0.length);
                v13 = v15 = ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[v8] >> 248 << 248 > 0x6000000000000000000000000000000000000000000000000000000000000000;
                if (v15) {
                    assert(v8 < varg0.length);
                    v13 = v16 = ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[v8] >> 248 << 248 < 0x7b00000000000000000000000000000000000000000000000000000000000000;
                }
            }
            if (!v13) {
                assert(v8 < varg0.length);
                v13 = v17 = ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[v8] >> 248 << 248 > 0x2f00000000000000000000000000000000000000000000000000000000000000;
                if (v17) {
                    assert(v8 < varg0.length);
                    v13 = v18 = ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[v8] >> 248 << 248 < 0x3a00000000000000000000000000000000000000000000000000000000000000;
                }
            }
            require(v13, Error('invalid characters'));
            assert(v8 < varg0.length);
            if (0x2000000000000000000000000000000000000000000000000000000000000000 == ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[v8] >> 248 << 248) {
                assert(1 + v8 < varg0.length);
                require(0x2000000000000000000000000000000000000000000000000000000000000000 != ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[1 + v8] >> 248 << 248, Error('spaces error'));
            }
            v19 = v20 = !v0;
            if (v20) {
                assert(v8 < varg0.length);
                v19 = v21 = ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[v8] >> 248 << 248 < 0x3000000000000000000000000000000000000000000000000000000000000000;
                if (~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[v8] >> 248 << 248 >= 0x3000000000000000000000000000000000000000000000000000000000000000) {
                    assert(v8 < varg0.length);
                    v19 = v22 = ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[v8] >> 248 << 248 > 0x3900000000000000000000000000000000000000000000000000000000000000;
                }
            }
            if (v19) {
                v0 = v23 = 1;
            }
        } else {
            assert(v8 < varg0.length);
            assert(v8 < varg0.length);
            MEM8[varg0.data + v8] = (byte(~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & 32 + (varg0[v8] >> 248 << 248 >> 248) << 248, 0x0)) & 0xFF;
            if (!v0) {
                v0 = v24 = 1;
            }
        }
        v8 = v8 + 1;
    }
    require(v0 == 1, Error('only num'));
    return MEM[varg0.data];
}

function 0x320a(uint256 varg0) private { 
    0x3f76(_player_[varg0][5], varg0);
    v0 = _player_[varg0][2];
    require(_player_[varg0][3] + v0 >= v0, Error('add failed'));
    require(_player_[varg0][4] + (_player_[varg0][3] + v0) >= _player_[varg0][3] + v0, Error('add failed'));
    if (_player_[varg0][4] + (_player_[varg0][3] + v0) <= 0) {
        return _player_[varg0][4] + (_player_[varg0][3] + v0);
    } else {
        _player_[varg0][2] = 0;
        _player_[varg0][3] = 0;
        _player_[varg0][4] = 0;
        return _player_[varg0][4] + (_player_[varg0][3] + v0);
    }
}

function 0x3298(uint256 varg0) private { 
    v0 = v1 = varg0 < 0;
    if (varg0 >= 0) {
        v0 = v2 = varg0 > 3;
    }
    if (v0) {
        varg0 = v3 = 0;
    }
    return varg0;
}

function _SafeMul(uint256 varg0, uint256 varg1) private { 
    if (varg1) {
        v0 = varg0 * varg1;
        assert(varg1);
        require(v0 / varg1 == varg0, Error('mul failed'));
        return v0;
    } else {
        return 0;
    }
}

function 0x3334(uint256 varg0) private { 
    v0 = _getTimeLeft[varg0][1];
    v1 = map_c[v2];
    v3 = map_f[v2];
    MEM[0] = varg0;
    MEM[32] = 13;
    v4 = _SafeMul(30, _getTimeLeft[varg0][7]);
    assert(100);
    if (v4 / 100) {
        v5 = 0xde0b6b3a7640000 * (v4 / 100);
        assert(v4 / 100);
        require(v5 / (v4 / 100) == 0xde0b6b3a7640000, Error('mul failed'));
        goto 0x33c3;
    } else {
        v5 = v6 = 0;
    }
    assert(v3);
    return v5 / v3, varg0, v2;
}

function 0x33b6(uint256 varg0, uint256 varg1, uint256 varg2) private { 
    v0 = varg0 / varg1;
    if (v0) {
        v1 = varg2 * v0;
        assert(v0);
        require(v1 / v0 == varg2, Error('mul failed'));
        return v1;
    } else {
        return 0;
    }
}

function 0x33d7(uint256 varg0, uint256 varg1) private { 
    v0 = _getTimeLeft[varg0][1];
    MEM[32] = 13;
    v1 = _SafeSub(map_9[varg1][4], _getTimeLeft[varg0][8]);
    v2 = v3 = v1 > 0;
    if (v3) {
        v2 = v4 = map_c[varg1] > 0;
    }
    if (!v2) {
        return 0;
    } else {
        v5 = _SafeMul(map_c[varg1], map_c[varg1][8]);
        assert(0xde0b6b3a7640000);
        return v5 / 0xde0b6b3a7640000;
    }
}

function _SafeSub(uint256 varg0, uint256 varg1) private { 
    require(varg0 <= varg1, Error('sub failed'));
    return varg1 - varg0;
}

function getBuyPrice() public nonPayable { 
    v0 = v1 = block.timestamp > _getTimeLeft[_rID_][4];
    if (v1) {
        v0 = v2 = block.timestamp <= _getTimeLeft[_rID_][2];
        if (block.timestamp > _getTimeLeft[_rID_][2]) {
            v0 = v3 = block.timestamp > _getTimeLeft[_rID_][2];
            if (v3) {
                v0 = v4 = !_getTimeLeft[_rID_];
            }
        }
    }
    if (v0) {
        v0 = _getTimeLeft[_rID_][7] >= stor_3;
    }
    if (!v0) {
        v5 = v6 = 0x6a94d74f430000;
    } else {
        v5 = 0x2955(_getTimeLeft[_rID_][7], 0xde0b6b3a7640000);
    }
    return v5;
}

function name() public nonPayable { 
    v0 = new array[](v1.length);
    v2 = v3 = 0;
    while (v2 < v1.length) {
        v0[v2] = v1[v2];
        v2 += 32;
    }
    if (25) {
        MEM[v0.data] = ~0xffffffffffffff & 'Bingo4Beast Long Official';
    }
    return v0;
}

function 0x3d6a(uint256 varg0, uint256 varg1) private { 
    v0 = v1 = 0;
    v2 = _getTimeLeft[varg1];
    v3 = v4 = _getTimeLeft[varg1][6];
    while (v0 < 9) {
        if (map_9[varg1][3]) {
            v5 = _SafeMul(map_11[v0], varg0);
            assert(100);
            require(_player_[v3][4] + v5 / 100 >= v5 / 100, Error('add failed'));
            _player_[v3][4] = _player_[v3][4] + v5 / 100;
            varg0 = _SafeSub(v5 / 100, varg0);
            v3 = v6 = _player_[v3][6];
        }
        v0 = v0 + 1;
    }
    if (varg0 <= 0) {
        return varg0;
    } else {
        v7 = varg0 >> 1;
        v8 = 0x5e96db84a4babf5958db3e1cf130d996947b1702.deposit().value(v7).gas(msg.gas);
        if (v8) {
            varg0 = v9 = _SafeSub(v7, varg0);
        }
        v10 = 0xef0aac2d19f482225dc4ae2eaf85fc80db589439.deposit().value(varg0).gas(msg.gas);
        if (!v10) {
            return varg0;
        } else {
            return 0;
        }
    }
}

function 0x3f76(uint256 varg0, uint256 varg1) private { 
    v0 = _getTimeLeft[varg0][1];
    MEM[32] = 13;
    v1 = _SafeSub(map_9[varg1][4], _getTimeLeft[varg0][8]);
    v2 = v3 = v1 > 0;
    if (v3) {
        v2 = v4 = map_c[varg1] > 0;
    }
    if (v2) {
        v5 = _getTimeLeft[varg0][8];
        map_9[varg1][4] = v5;
        MEM[0] = varg0;
        MEM[32] = 13;
        v6 = _SafeMul(map_c[varg1], v5);
        assert(0xde0b6b3a7640000);
        v7 = _player_[varg1][3];
        require(v6 / 0xde0b6b3a7640000 + v7 >= v7, Error('add failed'));
        _player_[varg1][3] = v6 / 0xde0b6b3a7640000 + v7;
    }
    return ;
}

function 0x0b864f26(uint256 varg0, uint256 varg1, uint256 varg2) public nonPayable { 
    return map_c[varg2];
}

function 0x0d261c25(uint256 varg0, uint256 varg1) public nonPayable { 
    return map_f[varg1];
}

function activate() public nonPayable { 
    require(msg.sender == 0x39cfdb0c1e952f65e76d2b114dd6bf86e4fb2f81, Error('only manager just can do it'));
    require(!_activated_, Error('game already activated'));
    _activated_ = 1;
    _rID_ = 1;
    MEM[0] = 1;
    MEM[32] = 8;
    stor_ad67d757c34507f157cacfa2e3153e9f260a2244f30428821be7be64587ac55f_0_0 = 0;
}

function pIDxAddr_(address varg0) public nonPayable { 
    return _pIDxAddr_[varg0];
}

function airDropTracker_() public nonPayable { 
    return _airDropTracker_;
}

function round_(uint256 varg0) public nonPayable { 
    return _getTimeLeft[varg0], _getTimeLeft[varg0][1], _getTimeLeft[varg0][2], _getTimeLeft[varg0][0x3] & 0xff, _getTimeLeft[varg0][4], _getTimeLeft[varg0][5], _getTimeLeft[varg0][6], _getTimeLeft[varg0][7], _getTimeLeft[varg0][8], _getTimeLeft[varg0][9];
}

function registerNameXaddr(string varg0, address varg1) public nonPayable { 
    v0 = new bytes[](varg0.length);
    v1 = msg.data.length;
    CALLDATACOPY(v0.data, 36 + varg0, varg0.length);
    v2 = new struct(8);
    v2.word0 = 0;
    v2.word1 = 0;
    v2.word2 = 0;
    v2.word3 = 0;
    v2.word4 = 0;
    v2.word5 = 0;
    v2.word6 = 0;
    v2.word7 = 0;
    require(!msg.sender.code.size, Error('addr error'));
    require(!_pIDxAddr_[msg.sender], Error('register fail'));
    require(varg1, Error('register fail'));
    v3 = _pIDxAddr_[varg1];
    require(v3, Error('register fail'));
    v4 = 0x2983(v0);
    _pID_ += 1;
    _pIDxAddr_[msg.sender] = 1 + _pID_;
    _player_[msg.sender] = msg.sender | ~0xffffffffffffffffffffffffffffffffffffffff & _player_[msg.sender];
    v5 = _pIDxAddr_[msg.sender];
    _player_[v5][6] = v3;
    v2.word0 += 1;
    _player_[v5][1] = v4;
    _pIDxName_[v5] = v5;
    if (!(0xff & _pIDxName_[v5])) {
        _registerNameXaddr[v5] = 0x1 | ~0xff & _registerNameXaddr[v5];
    }
    emit onNewName(v5, msg.sender, v4, 1, v3, address(_player_[v3]), _player_[v3][1], msg.value, block.timestamp);
}

function fees_(uint256 varg0) public nonPayable { 
    return _fees_[varg0], _fees_[varg0][1];
}

function pIDxName_(bytes32 varg0) public nonPayable { 
    return _pIDxName_[varg0];
}

function withdraw() public nonPayable { 
    v0 = 0x10b4();
}

function pID_() public nonPayable { 
    return _pID_;
}

function 0x5fd9a484(uint256 varg0) public payable { 
    v0 = new struct(8);
    v0.word0 = 0;
    v0.word1 = 0;
    v0.word2 = 0;
    v0.word3 = 0;
    v0.word4 = 0;
    v0.word5 = 0;
    v0.word6 = 0;
    v0.word7 = 0;
    require(1 == _activated_, Error('not ready'));
    require(!msg.sender.code.size, Error('addr error'));
    require(msg.value >= 0x3b9aca00, Error('eth less'));
    require(msg.value <= 0x152d02c7e14af6800000, Error('eth more'));
    require(_pIDxAddr_[msg.sender], Error('buy fail'));
    v1 = 0x3298(varg0);
    0x9a0(v0, v1);
}

function rID_() public nonPayable { 
    return _rID_;
}

function getPlayerVaults(uint256 varg0) public nonPayable { 
    v0 = v1 = 0;
    v2 = v3 = 1 == 0xff & owner_8[_rID_];
    if (v3) {
        v2 = v4 = block.timestamp > _getTimeLeft[_rID_][2];
    }
    if (v2) {
        v2 = v5 = !(0xff & _getTimeLeft[_rID_][0x3]);
    }
    if (v2) {
        v2 = _getTimeLeft[_rID_];
    }
    if (!v2) {
        v6 = v7 = _player_[varg0][2];
        v8 = 0x33d7(_player_[varg0][5], varg0);
        v9 = v8 + _player_[varg0][3];
        require(v9 >= _player_[varg0][3], Error('add failed'));
        goto 0x1741B0x62b;
    } else if (varg0 != _getTimeLeft[_rID_]) {
        v10 = _player_[varg0][2];
        v11, v12, v6 = v13 = 0x3334(_rID_);
        v9 = v14 = v11 + _player_[v1][3];
        require(v14 >= _player_[v1][3], Error('add failed'));
    } else {
        v15 = _SafeMul(50, _getTimeLeft[_rID_][7]);
        assert(100);
        require(v15 / 100 + _player_[varg0][2] >= _player_[varg0][2], Error('add failed'));
        v16, v17, v6 = v18 = 0x3334(_rID_);
        v9 = v19 = v16 + _player_[v1][3];
        require(v19 >= _player_[v1][3], Error('add failed'));
        goto 0x1741B0x62b;
    }
    return v6, v9, _player_[v0][4];
}

function checkIfNameValid(string varg0) public nonPayable { 
    v0 = new bytes[](varg0.length);
    v1 = msg.data.length;
    CALLDATACOPY(v0.data, 36 + varg0, varg0.length);
    v2 = 0x17ae(v0);
    return v2;
}

function 0x7092dd3b(uint256 varg0) public nonPayable { 
    require(msg.sender == 0x39cfdb0c1e952f65e76d2b114dd6bf86e4fb2f81, Error('only manager just can activate'));
    stor_3 = varg0;
}

function getCurrentRoundInfo() public nonPayable { 
    MEM[0] = _rID_;
    MEM[32] = 13;
    return _rID_, _getTimeLeft[_rID_][5], _getTimeLeft[_rID_][2], _getTimeLeft[_rID_][4], _getTimeLeft[_rID_][7], _getTimeLeft[_rID_][1], _getTimeLeft[_rID_], map_e[0], map_e[1], map_e[1], map_e[3], _airDropPot_, _airDropTracker_, _getTimeLeft[_rID_][6];
}

function 0x76c008c9(uint256 varg0, uint256 varg1) public nonPayable { 
    return 0xff & _registerNameXaddr[varg1];
}

function symbol() public nonPayable { 
    v0 = new array[](v1.length);
    v2 = v3 = 0;
    while (v2 < v1.length) {
        v0[v2] = v1[v2];
        v2 += 32;
    }
    if (3) {
        MEM[v0.data] = 0x4234420000000000000000000000000000000000000000000000000000000000;
    }
    return v0;
}

function 0x9baa66f7(uint256 varg0) public nonPayable { 
    return map_11[varg0];
}

function 0x9be5bb0d(uint256 varg0) public nonPayable { 
    return 0xff & owner_8[varg0];
}

function 0xa071c7ac(uint256 varg0) public nonPayable { 
    v0 = 0x1954(address(varg0));
    return v0;
}

function player_(uint256 varg0) public nonPayable { 
    return address(_player_[varg0]), _player_[varg0][1], _player_[varg0][2], _player_[varg0][3], _player_[varg0][4], _player_[varg0][5], _player_[varg0][6];
}

function 0xbade2c65(uint256 varg0, uint256 varg1) public nonPayable { 
    v0 = new struct(8);
    v0.word0 = 0;
    v0.word1 = 0;
    v0.word2 = 0;
    v0.word3 = 0;
    v0.word4 = 0;
    v0.word5 = 0;
    v0.word6 = 0;
    v0.word7 = 0;
    require(1 == _activated_, Error('not ready'));
    require(!msg.sender.code.size, Error('addr error'));
    require(varg1 >= 0x3b9aca00, Error('eth less'));
    require(varg1 <= 0x152d02c7e14af6800000, Error('eth more'));
    require(_pIDxAddr_[msg.sender], Error('buy fail'));
    v1 = 0x3298(varg0);
    v2 = v3 = !(0xff & owner_8[_rID_]);
    if (0xff & owner_8[_rID_]) {
        v2 = v4 = block.timestamp > _getTimeLeft[_rID_][4];
        if (v4) {
            v2 = v5 = block.timestamp <= _getTimeLeft[_rID_][2];
            if (block.timestamp > _getTimeLeft[_rID_][2]) {
                v2 = v6 = block.timestamp > _getTimeLeft[_rID_][2];
                if (v6) {
                    v2 = !_getTimeLeft[_rID_];
                }
            }
        }
    }
    if (!v2) {
        v7 = v8 = block.timestamp > _getTimeLeft[_rID_][2];
        if (v8) {
            v7 = !(0xff & _getTimeLeft[_rID_][0x3]);
        }
        if (!v7) {
            goto 0x4bd8B0x844;
        } else {
            _getTimeLeft[_rID_][3] = 0x1 | ~0xff & _getTimeLeft[_rID_][0x3];
            v9 = 0x2555();
            MEM[v9] += v0 * 0xde0b6b3a7640000;
            MEM[v9 + 32] += v1;
            emit onReLoadAndDistribute(msg.sender, _player_[v1][1], MEM[v9], MEM[v9 + 32], address(MEM[v9 + 64]), MEM[v9 + 96], MEM[v9 + 128], MEM[v9 + 160], MEM[v9 + 192]);
        }
    } else {
        v10 = 0x320a(_pIDxAddr_[msg.sender]);
        v11 = _SafeSub(varg1, v10);
        _player_[_pIDxAddr_[msg.sender]][3] = v11;
        0x1ee1(v0, v1, _player_[_pIDxAddr_[msg.sender]][6], varg1, _pIDxAddr_[msg.sender], _rID_);
        goto 0x4bd8B0x844;
    }
}

function 0xc2c46413(uint256 varg0, uint256 varg1) public nonPayable { 
    return map_9[varg1], map_9[varg1][1], map_9[varg1][2], map_9[varg1][3], map_9[varg1][4];
}

function getTimeLeft() public nonPayable { 
    if (block.timestamp >= _getTimeLeft[_rID_][2]) {
        v0 = v1 = 0;
    } else {
        if (block.timestamp <= _getTimeLeft[_rID_][4]) {
            v0 = v2 = _SafeSub(block.timestamp, _getTimeLeft[_rID_][4]);
        } else {
            v0 = v3 = _SafeSub(block.timestamp, _getTimeLeft[_rID_][2]);
        }
        goto 0x1c94B0x8a5;
    }
    return v0;
}

function 0xca93e3c2(uint256 varg0, uint256 varg1) public nonPayable { 
    return map_e[varg1];
}

function iWantXKeys(uint256 varg0) public nonPayable { 
    v0 = v1 = block.timestamp > _getTimeLeft[_rID_][4];
    if (v1) {
        v0 = v2 = block.timestamp <= _getTimeLeft[_rID_][2];
        if (block.timestamp > _getTimeLeft[_rID_][2]) {
            v0 = v3 = block.timestamp > _getTimeLeft[_rID_][2];
            if (v3) {
                v0 = v4 = !_getTimeLeft[_rID_];
            }
        }
    }
    if (v0) {
        v0 = _getTimeLeft[_rID_][7] >= stor_3;
    }
    if (!v0) {
        v5 = v6 = _SafeMul(0x6a94d74f430000, varg0);
    } else {
        v7 = _SafeMul(0xde0b6b3a7640000, varg0);
        v5 = v8 = 0x2955(_getTimeLeft[_rID_][7], v7);
    }
    return v5;
}

function activated_() public nonPayable { 
    return _activated_;
}

function airDropPot_() public nonPayable { 
    return _airDropPot_;
}

function 0xdcc617bd() public nonPayable { 
    return stor_3;
}

function 0xec2a6e3d(uint256 varg0, uint256 varg1, uint256 varg2) public nonPayable { 
    return map_b[varg2];
}

function getPlayerInfoByAddress(address varg0) public nonPayable { 
    v0 = _pIDxAddr_[varg0];
    MEM[0] = v0;
    MEM[32] = 7;
    v1 = 0x33d7(_player_[v0][5], v0);
    require(v1 + _player_[v0][3] >= _player_[v0][3], Error('add failed'));
    return v0, _player_[v0][1], map_9[v0][2], _player_[v0][2], v1 + _player_[v0][3], _player_[v0][4], map_9[v0][0], map_9[v0][6];
}

function 0x9a0(uint256 varg0, uint256 varg1) private { 
    v0 = v1 = !(0xff & owner_8[_rID_]);
    if (0xff & owner_8[_rID_]) {
        v0 = v2 = block.timestamp > _getTimeLeft[_rID_][4];
        if (v2) {
            v0 = v3 = block.timestamp <= _getTimeLeft[_rID_][2];
            if (block.timestamp > _getTimeLeft[_rID_][2]) {
                v0 = v4 = block.timestamp > _getTimeLeft[_rID_][2];
                if (v4) {
                    v0 = v5 = !_getTimeLeft[_rID_];
                }
            }
        }
    }
    if (!v0) {
        v6 = v7 = block.timestamp > _getTimeLeft[_rID_][2];
        if (v7) {
            v6 = v8 = !(0xff & _getTimeLeft[_rID_][0x3]);
        }
        if (v6) {
            _getTimeLeft[_rID_][3] = 0x1 | ~0xff & _getTimeLeft[_rID_][0x3];
            v9 = 0x2555();
            MEM[v9] += varg0 * 0xde0b6b3a7640000;
            MEM[v9 + 32] += varg1;
            v10 = _player_[varg1][1];
            emit onBuyAndDistribute(msg.sender, v10, msg.value, MEM[v9], MEM[v9 + 32], address(MEM[v9 + 64]), MEM[v9 + 96], MEM[v9 + 128], MEM[v9 + 160], MEM[v9 + 192]);
        }
        v11 = _player_[varg1][3];
        require(msg.value + v11 >= v11, Error('add failed'));
        _player_[varg1][3] = msg.value + v11;
    } else {
        0x1ee1(varg0, varg1, v12, msg.value, v13, _rID_);
    }
    return ;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length >= 4) {
        v0 = uint32(function_selector >> 224);
        if (v0 == 0x18a25e8) {
            getBuyPrice();
        } else if (0x6fdde03 == v0) {
            name();
        } else if (0xb864f26 == v0) {
            0x0b864f26();
        } else if (0xd261c25 == v0) {
            0x0d261c25();
        } else if (0xf15f4c0 == v0) {
            activate();
        } else if (0x10f01eba == v0) {
            pIDxAddr_(address);
        } else if (0x11a09ae7 == v0) {
            airDropTracker_();
        } else if (0x24c33d33 == v0) {
            round_(uint256);
        } else if (0x27d87924 == v0) {
            registerNameXaddr(string,address);
        } else if (0x2ce21999 == v0) {
            fees_(uint256);
        } else if (0x2e19ebdc == v0) {
            pIDxName_(bytes32);
        } else if (0x3ccfd60b == v0) {
            withdraw();
        } else if (0x4b227176 == v0) {
            pID_();
        } else if (0x5fd9a484 == v0) {
            0x5fd9a484();
        } else if (0x624ae5c0 == v0) {
            rID_();
        } else if (0x63066434 == v0) {
            getPlayerVaults(uint256);
        } else if (0x6c52660d == v0) {
            checkIfNameValid(string);
        } else if (0x7092dd3b == v0) {
            0x7092dd3b();
        } else if (0x747dff42 == v0) {
            getCurrentRoundInfo();
        } else if (0x76c008c9 == v0) {
            0x76c008c9();
        } else if (0x95d89b41 == v0) {
            symbol();
        } else if (0x9baa66f7 == v0) {
            0x9baa66f7();
        } else if (0x9be5bb0d == v0) {
            0x9be5bb0d();
        } else if (0xa071c7ac == v0) {
            0xa071c7ac();
        } else if (0xb81d3c0a == v0) {
            player_(uint256);
        } else if (0xbade2c65 == v0) {
            0xbade2c65();
        } else if (0xc2c46413 == v0) {
            0xc2c46413();
        } else if (0xc7e284b8 == v0) {
            getTimeLeft();
        } else if (0xca93e3c2 == v0) {
            0xca93e3c2();
        } else if (0xcf808000 == v0) {
            iWantXKeys(uint256);
        } else if (0xd53b2679 == v0) {
            activated_();
        } else if (0xd87574e0 == v0) {
            airDropPot_();
        } else if (0xdcc617bd == v0) {
            0xdcc617bd();
        } else if (0xec2a6e3d == v0) {
            0xec2a6e3d();
        } else if (0xee0b5d8b == v0) {
            getPlayerInfoByAddress(address);
        }
    }
    ();
}
