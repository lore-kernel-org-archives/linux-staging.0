Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D6830E835;
	Wed, 11 Feb 2026 02:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770776774; cv=none; b=RraE8ap5xxlB2mCNghKg9LG2Gs21M3OYpicXdPnzdeFOZiBNi2lHXdOOGTfmDCLgJiBlfJacerzLAwWZz47CTKC5NubTHF1XVf4oqaMUAuyatmwGdZ4Xr6oMY9TXVsax9Ckxv2bbmhwa0ZeQAVBCQVqWzTAOb4BQ3LPEVBs8u9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770776774; c=relaxed/simple;
	bh=YrG4SPM/1G6cqZD3Ljnx4/RyKlSVJfgjt6uBW+uxyN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UKdUdo87HiUgwUUtTeYKck1GItm9VnZ7begRfe8tZcSvOrrcJXULVQtz24OuEKVWFYqBbZ+T7xlnb/NKBXugD+BmdOoEzQZsj0JPpENvMubjvAtJRjXVj/tZP5r/6FQPgBKoxBZIDZ+Dsmv+MjTvLo22txPv0qkySVhDSFPL66E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xgr3i8nh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xgr3i8nh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770776772; x=1802312772;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YrG4SPM/1G6cqZD3Ljnx4/RyKlSVJfgjt6uBW+uxyN8=;
  b=Xgr3i8nhIE9+AVJmREiSlY21zkec2AZ6sjaBHyy1QhTL5yZ47u4/ah5+
   cx50hCzmAif4ou9Ti1bwmENJsBSnqEqTBZSdzd6I6HW90bQ4gHB3hdzxF
   nSL8X1iJn3PfDI+Ysn8yN1giupyKhFQJK7sHUR6hRFAkf8Ekux+p3OvDa
   Cnxf0/+XXDg89fU5x8F6Td7m1KPsA15SEXvI4TyulAUnsPBQGe6Rm/U8A
   NfS+v1VBozGofnxsh8mQb24FEdyGoZkLdOliajni0OdrlPyz8MFYCEkTM
   PbEcbEx0NhzpI2dHsmDbza0ToZ/6GlknGp0NDiN1f0KyJrGnyeHcZ5Zg4
   g==;
X-CSE-ConnectionGUID: b0h9gGpARZm0DMxOjepaxw==
X-CSE-MsgGUID: REsQh8ugTsqGiheZ5UAvjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="94557480"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="94557480"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 18:26:11 -0800
X-CSE-ConnectionGUID: OAVjT+HmQA66+998RkwxGA==
X-CSE-MsgGUID: qo38QKvcS127tOl655N2lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211086900"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Feb 2026 18:26:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpzva-00000000pb6-3IVn;
	Wed, 11 Feb 2026 02:26:06 +0000
Date: Wed, 11 Feb 2026 10:26:01 +0800
From: kernel test robot <lkp@intel.com>
To: markatbritain@gmail.com, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, straube.linux@gmail.com,
	dan.carpenter@linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Mark Wu <markatbritain@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: remove NDIS_802_11 types and cleanup
 style
Message-ID: <202602111040.PumsMipt-lkp@intel.com>
References: <20260210221556.73872-1-markatbritain@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210221556.73872-1-markatbritain@gmail.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/markatbritain-gmail-com/staging-rtl8723bs-remove-NDIS_802_11-types-and-cleanup-style/20260211-062107
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260210221556.73872-1-markatbritain%40gmail.com
patch subject: [PATCH] staging: rtl8723bs: remove NDIS_802_11 types and cleanup style
config: um-randconfig-r073-20260211 (https://download.01.org/0day-ci/archive/20260211/202602111040.PumsMipt-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602111040.PumsMipt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602111040.PumsMipt-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c: In function 'rtw_cfg80211_set_encryption':
>> drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:787:72: error: initialization of 'struct ieee_crypt_arg *' from incompatible pointer type 'struct <anonymous> *' [-Wincompatible-pointer-types]
     787 |                                         struct ieee_crypt_arg *crypt = &param->u.crypt;
         |                                                                        ^
   In file included from include/linux/kernel.h:28,
                    from include/linux/skbuff.h:13,
                    from include/linux/if_ether.h:19,
                    from include/linux/etherdevice.h:20,
                    from drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:8:
>> drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:788:60: error: invalid use of undefined type 'struct ieee_crypt_arg'
     788 |                                         u32 len = min(crypt->key_len, 16U);
         |                                                            ^~
   include/linux/minmax.h:92:20: note: in definition of macro '__careful_cmp_once'
      92 |         auto ux = (x); auto uy = (y);                   \
         |                    ^
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:788:51: note: in expansion of macro 'min'
     788 |                                         u32 len = min(crypt->key_len, 16U);
         |                                                   ^~~
   In file included from <command-line>:
   include/linux/compiler.h:168:17: error: '__UNIQUE_ID_x__656' undeclared (first use in this function); did you mean '__UNIQUE_ID_y__657'?
     168 |         __PASTE(__UNIQUE_ID_,                                   \
         |                 ^~~~~~~~~~~~
   include/linux/compiler_types.h:610:23: note: in definition of macro '__compiletime_assert'
     610 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:630:9: note: in expansion of macro '_compiletime_assert'
     630 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:49:25: note: in expansion of macro 'is_signed_type'
      49 | #define __sign_use(ux) (is_signed_type(typeof(ux)) ? \
         |                         ^~~~~~~~~~~~~~
   include/linux/minmax.h:75:10: note: in expansion of macro '__sign_use'
      75 |         (__sign_use(ux) & __sign_use(uy))
         |          ^~~~~~~~~~
   include/linux/minmax.h:93:27: note: in expansion of macro '__types_ok'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:16:23: note: in expansion of macro '___PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^~~~~~~~
   include/linux/compiler.h:168:9: note: in expansion of macro '__PASTE'
     168 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^~~~~~~
   include/linux/minmax.h:98:38: note: in expansion of macro '__UNIQUE_ID'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                      ^~~~~~~~~~~
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:788:51: note: in expansion of macro 'min'
     788 |                                         u32 len = min(crypt->key_len, 16U);
         |                                                   ^~~
   include/linux/compiler.h:168:17: note: each undeclared identifier is reported only once for each function it appears in
     168 |         __PASTE(__UNIQUE_ID_,                                   \
         |                 ^~~~~~~~~~~~
   include/linux/compiler_types.h:610:23: note: in definition of macro '__compiletime_assert'
     610 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:630:9: note: in expansion of macro '_compiletime_assert'
     630 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:49:25: note: in expansion of macro 'is_signed_type'
      49 | #define __sign_use(ux) (is_signed_type(typeof(ux)) ? \
         |                         ^~~~~~~~~~~~~~
   include/linux/minmax.h:75:10: note: in expansion of macro '__sign_use'
      75 |         (__sign_use(ux) & __sign_use(uy))
         |          ^~~~~~~~~~
   include/linux/minmax.h:93:27: note: in expansion of macro '__types_ok'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:16:23: note: in expansion of macro '___PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^~~~~~~~
   include/linux/compiler.h:168:9: note: in expansion of macro '__PASTE'
     168 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^~~~~~~
   include/linux/minmax.h:98:38: note: in expansion of macro '__UNIQUE_ID'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                      ^~~~~~~~~~~
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:788:51: note: in expansion of macro 'min'
     788 |                                         u32 len = min(crypt->key_len, 16U);
         |                                                   ^~~
   include/linux/minmax.h:71:17: error: first argument to '__builtin_choose_expr' not a constant
      71 |         (typeof(__builtin_choose_expr(sizeof(ux) > 4, 1LL, 1L)))(ux) >= 0)
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:610:23: note: in definition of macro '__compiletime_assert'
--
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:70:25: note: in expansion of macro 'statically_true'
      70 | #define __is_nonneg(ux) statically_true( \
         |                         ^~~~~~~~~~~~~~~
   include/linux/minmax.h:50:14: note: in expansion of macro '__is_nonneg'
      50 |         (2 + __is_nonneg(ux)) : (1 + 2 * (sizeof(ux) < 4)))
         |              ^~~~~~~~~~~
   include/linux/minmax.h:75:10: note: in expansion of macro '__sign_use'
      75 |         (__sign_use(ux) & __sign_use(uy))
         |          ^~~~~~~~~~
   include/linux/minmax.h:93:27: note: in expansion of macro '__types_ok'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:804:51: note: in expansion of macro 'min'
     804 |                                         u32 len = min(crypt->key_len, 16U);
         |                                                   ^~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:806:57: error: invalid use of undefined type 'struct ieee_crypt_arg'
     806 |                                         if (strcmp(crypt->alg, "TKIP") == 0 ||
         |                                                         ^~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:807:57: error: invalid use of undefined type 'struct ieee_crypt_arg'
     807 |                                             strcmp(crypt->alg, "CCMP") == 0) {
         |                                                         ^~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:808:84: error: invalid use of undefined type 'struct ieee_crypt_arg'
     808 |                                                 memcpy(psec->dot118021XGrpKey[crypt->idx].skey,
         |                                                                                    ^~
   include/linux/fortify-string.h:628:34: note: in definition of macro '__fortify_memcpy_chk'
     628 |         const size_t __p_size = (p_size);                               \
         |                                  ^~~~~~
   include/linux/fortify-string.h:691:17: note: in expansion of macro '__struct_size'
     691 |                 __struct_size(p), __struct_size(q),                     \
         |                 ^~~~~~~~~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:808:49: note: in expansion of macro 'memcpy'
     808 |                                                 memcpy(psec->dot118021XGrpKey[crypt->idx].skey,
         |                                                 ^~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:809:61: error: invalid use of undefined type 'struct ieee_crypt_arg'
     809 |                                                        crypt->key, len);
         |                                                             ^~
   include/linux/fortify-string.h:629:34: note: in definition of macro '__fortify_memcpy_chk'
     629 |         const size_t __q_size = (q_size);                               \
         |                                  ^~~~~~
   include/linux/fortify-string.h:691:35: note: in expansion of macro '__struct_size'
     691 |                 __struct_size(p), __struct_size(q),                     \
         |                                   ^~~~~~~~~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:808:49: note: in expansion of macro 'memcpy'
     808 |                                                 memcpy(psec->dot118021XGrpKey[crypt->idx].skey,
         |                                                 ^~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:808:84: error: invalid use of undefined type 'struct ieee_crypt_arg'
     808 |                                                 memcpy(psec->dot118021XGrpKey[crypt->idx].skey,
         |                                                                                    ^~
   include/linux/fortify-string.h:630:40: note: in definition of macro '__fortify_memcpy_chk'
     630 |         const size_t __p_size_field = (p_size_field);                   \
         |                                        ^~~~~~~~~~~~
   include/linux/fortify-string.h:692:17: note: in expansion of macro '__member_size'
     692 |                 __member_size(p), __member_size(q),                     \
         |                 ^~~~~~~~~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:808:49: note: in expansion of macro 'memcpy'
     808 |                                                 memcpy(psec->dot118021XGrpKey[crypt->idx].skey,
         |                                                 ^~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:809:61: error: invalid use of undefined type 'struct ieee_crypt_arg'
     809 |                                                        crypt->key, len);
         |                                                             ^~
   include/linux/fortify-string.h:631:40: note: in definition of macro '__fortify_memcpy_chk'
     631 |         const size_t __q_size_field = (q_size_field);                   \
         |                                        ^~~~~~~~~~~~
   include/linux/fortify-string.h:692:35: note: in expansion of macro '__member_size'
     692 |                 __member_size(p), __member_size(q),                     \
         |                                   ^~~~~~~~~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:808:49: note: in expansion of macro 'memcpy'
     808 |                                                 memcpy(psec->dot118021XGrpKey[crypt->idx].skey,
         |                                                 ^~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:808:84: error: invalid use of undefined type 'struct ieee_crypt_arg'
     808 |                                                 memcpy(psec->dot118021XGrpKey[crypt->idx].skey,
         |                                                                                    ^~
   include/linux/fortify-string.h:645:27: note: in definition of macro '__fortify_memcpy_chk'
     645 |         __underlying_##op(p, q, __copy_size);                           \
         |                           ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:808:49: note: in expansion of macro 'memcpy'
     808 |                                                 memcpy(psec->dot118021XGrpKey[crypt->idx].skey,
         |                                                 ^~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:809:61: error: invalid use of undefined type 'struct ieee_crypt_arg'
     809 |                                                        crypt->key, len);
         |                                                             ^~
   include/linux/fortify-string.h:645:30: note: in definition of macro '__fortify_memcpy_chk'
     645 |         __underlying_##op(p, q, __copy_size);                           \
         |                              ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:808:49: note: in expansion of macro 'memcpy'
     808 |                                                 memcpy(psec->dot118021XGrpKey[crypt->idx].skey,
         |                                                 ^~~~~~
>> drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:811:62: error: 'struct security_priv' has no member named 'dot18021XGrptxmickey'; did you mean 'dot118021XGrptxmickey'?
     811 |                                                 memcpy(psec->dot18021XGrptxmickey[crypt->idx].skey,
         |                                                              ^~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:628:34: note: in definition of macro '__fortify_memcpy_chk'
     628 |         const size_t __p_size = (p_size);                               \
         |                                  ^~~~~~
   include/linux/fortify-string.h:691:17: note: in expansion of macro '__struct_size'
     691 |                 __struct_size(p), __struct_size(q),                     \
         |                 ^~~~~~~~~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:811:49: note: in expansion of macro 'memcpy'
     811 |                                                 memcpy(psec->dot18021XGrptxmickey[crypt->idx].skey,
         |                                                 ^~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:811:88: error: invalid use of undefined type 'struct ieee_crypt_arg'
     811 |                                                 memcpy(psec->dot18021XGrptxmickey[crypt->idx].skey,
         |                                                                                        ^~
   include/linux/fortify-string.h:628:34: note: in definition of macro '__fortify_memcpy_chk'
     628 |         const size_t __p_size = (p_size);                               \
         |                                  ^~~~~~
   include/linux/fortify-string.h:691:17: note: in expansion of macro '__struct_size'
     691 |                 __struct_size(p), __struct_size(q),                     \
         |                 ^~~~~~~~~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:811:49: note: in expansion of macro 'memcpy'
     811 |                                                 memcpy(psec->dot18021XGrptxmickey[crypt->idx].skey,
         |                                                 ^~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:812:62: error: invalid use of undefined type 'struct ieee_crypt_arg'
     812 |                                                        &crypt->key[16], 8);
         |                                                              ^~
   include/linux/fortify-string.h:629:34: note: in definition of macro '__fortify_memcpy_chk'
     629 |         const size_t __q_size = (q_size);                               \
         |                                  ^~~~~~
   include/linux/fortify-string.h:691:35: note: in expansion of macro '__struct_size'
     691 |                 __struct_size(p), __struct_size(q),                     \
         |                                   ^~~~~~~~~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:811:49: note: in expansion of macro 'memcpy'
     811 |                                                 memcpy(psec->dot18021XGrptxmickey[crypt->idx].skey,
         |                                                 ^~~~~~
>> drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:811:62: error: 'struct security_priv' has no member named 'dot18021XGrptxmickey'; did you mean 'dot118021XGrptxmickey'?
     811 |                                                 memcpy(psec->dot18021XGrptxmickey[crypt->idx].skey,
         |                                                              ^~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:630:40: note: in definition of macro '__fortify_memcpy_chk'
     630 |         const size_t __p_size_field = (p_size_field);                   \
         |                                        ^~~~~~~~~~~~
   include/linux/fortify-string.h:692:17: note: in expansion of macro '__member_size'
     692 |                 __member_size(p), __member_size(q),                     \
         |                 ^~~~~~~~~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:811:49: note: in expansion of macro 'memcpy'
     811 |                                                 memcpy(psec->dot18021XGrptxmickey[crypt->idx].skey,
         |                                                 ^~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:811:88: error: invalid use of undefined type 'struct ieee_crypt_arg'
     811 |                                                 memcpy(psec->dot18021XGrptxmickey[crypt->idx].skey,
         |                                                                                        ^~
   include/linux/fortify-string.h:630:40: note: in definition of macro '__fortify_memcpy_chk'
     630 |         const size_t __p_size_field = (p_size_field);                   \
         |                                        ^~~~~~~~~~~~
   include/linux/fortify-string.h:692:17: note: in expansion of macro '__member_size'
     692 |                 __member_size(p), __member_size(q),                     \
         |                 ^~~~~~~~~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:811:49: note: in expansion of macro 'memcpy'
     811 |                                                 memcpy(psec->dot18021XGrptxmickey[crypt->idx].skey,
         |                                                 ^~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:812:62: error: invalid use of undefined type 'struct ieee_crypt_arg'
     812 |                                                        &crypt->key[16], 8);
         |                                                              ^~
   include/linux/fortify-string.h:631:40: note: in definition of macro '__fortify_memcpy_chk'
     631 |         const size_t __q_size_field = (q_size_field);                   \
         |                                        ^~~~~~~~~~~~
   include/linux/fortify-string.h:692:35: note: in expansion of macro '__member_size'
     692 |                 __member_size(p), __member_size(q),                     \
         |                                   ^~~~~~~~~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:811:49: note: in expansion of macro 'memcpy'
     811 |                                                 memcpy(psec->dot18021XGrptxmickey[crypt->idx].skey,
         |                                                 ^~~~~~
>> drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:811:62: error: 'struct security_priv' has no member named 'dot18021XGrptxmickey'; did you mean 'dot118021XGrptxmickey'?
     811 |                                                 memcpy(psec->dot18021XGrptxmickey[crypt->idx].skey,
         |                                                              ^~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:645:27: note: in definition of macro '__fortify_memcpy_chk'
     645 |         __underlying_##op(p, q, __copy_size);                           \
         |                           ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:811:49: note: in expansion of macro 'memcpy'
     811 |                                                 memcpy(psec->dot18021XGrptxmickey[crypt->idx].skey,
         |                                                 ^~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:811:88: error: invalid use of undefined type 'struct ieee_crypt_arg'
     811 |                                                 memcpy(psec->dot18021XGrptxmickey[crypt->idx].skey,
         |                                                                                        ^~
   include/linux/fortify-string.h:645:27: note: in definition of macro '__fortify_memcpy_chk'
     645 |         __underlying_##op(p, q, __copy_size);                           \
         |                           ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:811:49: note: in expansion of macro 'memcpy'
     811 |                                                 memcpy(psec->dot18021XGrptxmickey[crypt->idx].skey,
         |                                                 ^~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:812:62: error: invalid use of undefined type 'struct ieee_crypt_arg'
     812 |                                                        &crypt->key[16], 8);
         |                                                              ^~
   include/linux/fortify-string.h:645:30: note: in definition of macro '__fortify_memcpy_chk'
     645 |         __underlying_##op(p, q, __copy_size);                           \
         |                              ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:811:49: note: in expansion of macro 'memcpy'
     811 |                                                 memcpy(psec->dot18021XGrptxmickey[crypt->idx].skey,
         |                                                 ^~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:814:89: error: invalid use of undefined type 'struct ieee_crypt_arg'
     814 |                                                 memcpy(psec->dot118021XGrprxmickey[crypt->idx].skey,
         |                                                                                         ^~
   include/linux/fortify-string.h:628:34: note: in definition of macro '__fortify_memcpy_chk'
     628 |         const size_t __p_size = (p_size);                               \
         |                                  ^~~~~~
   include/linux/fortify-string.h:691:17: note: in expansion of macro '__struct_size'
     691 |                 __struct_size(p), __struct_size(q),                     \
         |                 ^~~~~~~~~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:814:49: note: in expansion of macro 'memcpy'
     814 |                                                 memcpy(psec->dot118021XGrprxmickey[crypt->idx].skey,
         |                                                 ^~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:815:62: error: invalid use of undefined type 'struct ieee_crypt_arg'
     815 |                                                        &crypt->key[24], 8);
         |                                                              ^~
   include/linux/fortify-string.h:629:34: note: in definition of macro '__fortify_memcpy_chk'
     629 |         const size_t __q_size = (q_size);                               \
         |                                  ^~~~~~
   include/linux/fortify-string.h:691:35: note: in expansion of macro '__struct_size'
     691 |                 __struct_size(p), __struct_size(q),                     \
         |                                   ^~~~~~~~~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:814:49: note: in expansion of macro 'memcpy'
     814 |                                                 memcpy(psec->dot118021XGrprxmickey[crypt->idx].skey,
         |                                                 ^~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:814:89: error: invalid use of undefined type 'struct ieee_crypt_arg'
     814 |                                                 memcpy(psec->dot118021XGrprxmickey[crypt->idx].skey,
         |                                                                                         ^~
   include/linux/fortify-string.h:630:40: note: in definition of macro '__fortify_memcpy_chk'
     630 |         const size_t __p_size_field = (p_size_field);                   \
         |                                        ^~~~~~~~~~~~
   include/linux/fortify-string.h:692:17: note: in expansion of macro '__member_size'
     692 |                 __member_size(p), __member_size(q),                     \
         |                 ^~~~~~~~~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:814:49: note: in expansion of macro 'memcpy'
     814 |                                                 memcpy(psec->dot118021XGrprxmickey[crypt->idx].skey,
         |                                                 ^~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:815:62: error: invalid use of undefined type 'struct ieee_crypt_arg'
     815 |                                                        &crypt->key[24], 8);
         |                                                              ^~
   include/linux/fortify-string.h:631:40: note: in definition of macro '__fortify_memcpy_chk'
     631 |         const size_t __q_size_field = (q_size_field);                   \
         |                                        ^~~~~~~~~~~~
   include/linux/fortify-string.h:692:35: note: in expansion of macro '__member_size'
     692 |                 __member_size(p), __member_size(q),                     \
         |                                   ^~~~~~~~~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:814:49: note: in expansion of macro 'memcpy'
     814 |                                                 memcpy(psec->dot118021XGrprxmickey[crypt->idx].skey,
         |                                                 ^~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:814:89: error: invalid use of undefined type 'struct ieee_crypt_arg'
     814 |                                                 memcpy(psec->dot118021XGrprxmickey[crypt->idx].skey,
         |                                                                                         ^~
   include/linux/fortify-string.h:645:27: note: in definition of macro '__fortify_memcpy_chk'
     645 |         __underlying_##op(p, q, __copy_size);                           \
         |                           ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:814:49: note: in expansion of macro 'memcpy'
     814 |                                                 memcpy(psec->dot118021XGrprxmickey[crypt->idx].skey,
         |                                                 ^~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:815:62: error: invalid use of undefined type 'struct ieee_crypt_arg'
     815 |                                                        &crypt->key[24], 8);
         |                                                              ^~
   include/linux/fortify-string.h:645:30: note: in definition of macro '__fortify_memcpy_chk'
     645 |         __underlying_##op(p, q, __copy_size);                           \
         |                              ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:814:49: note: in expansion of macro 'memcpy'
     814 |                                                 memcpy(psec->dot118021XGrprxmickey[crypt->idx].skey,
         |                                                 ^~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:818:81: error: invalid use of undefined type 'struct ieee_crypt_arg'
     818 |                                                 psec->dot118021XGrpKeyid = crypt->idx;
         |                                                                                 ^~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:819:82: error: invalid use of undefined type 'struct ieee_crypt_arg'
     819 |                                                 rtw_set_key(padapter, psec, crypt->idx, 1, true);
         |                                                                                  ^~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:820:64: error: invalid use of undefined type 'struct ieee_crypt_arg'
     820 |                                         } else if (strcmp(crypt->alg, "BIP") == 0) {


vim +787 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c

   697	
   698	static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param *param, u32 param_len)
   699	{
   700		int ret = 0;
   701		u8 max_idx;
   702		u32 wep_key_idx, wep_key_len;
   703		struct adapter *padapter = rtw_netdev_priv(dev);
   704		struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
   705		struct security_priv *psecuritypriv = &padapter->securitypriv;
   706	
   707		param->u.crypt.err = 0;
   708		param->u.crypt.alg[IEEE_CRYPT_ALG_NAME_LEN - 1] = '\0';
   709	
   710		if (param_len < (u32)((u8 *)param->u.crypt.key - (u8 *)param) + param->u.crypt.key_len) {
   711			ret =  -EINVAL;
   712			goto exit;
   713		}
   714	
   715		if (param->sta_addr[0] != 0xff || param->sta_addr[1] != 0xff ||
   716		    param->sta_addr[2] != 0xff || param->sta_addr[3] != 0xff ||
   717		    param->sta_addr[4] != 0xff || param->sta_addr[5] != 0xff) {
   718			ret = -EINVAL;
   719			goto exit;
   720		}
   721	
   722		if (strcmp(param->u.crypt.alg, "WEP") == 0)
   723			max_idx = WEP_KEYS - 1;
   724		else
   725			max_idx = BIP_MAX_KEYID;
   726	
   727		if (param->u.crypt.idx > max_idx) {
   728			netdev_err(dev, "Error crypt.idx %d > %d\n", param->u.crypt.idx, max_idx);
   729			ret = -EINVAL;
   730			goto exit;
   731		}
   732	
   733		if (strcmp(param->u.crypt.alg, "WEP") == 0) {
   734			wep_key_idx = param->u.crypt.idx;
   735			wep_key_len = param->u.crypt.key_len;
   736	
   737			if (wep_key_len <= 0) {
   738				ret = -EINVAL;
   739				goto exit;
   740			}
   741	
   742			if (psecuritypriv->bWepDefaultKeyIdxSet == 0) {
   743				/* wep default key has not been set, so use this key index as default key. */
   744	
   745				wep_key_len = wep_key_len <= 5 ? 5 : 13;
   746	
   747				psecuritypriv->ndisencryptstatus = NDIS_802_11_ENCRYPTION_ENABLED;
   748				psecuritypriv->dot11PrivacyAlgrthm = _WEP40_;
   749				psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
   750	
   751				if (wep_key_len == 13) {
   752					psecuritypriv->dot11PrivacyAlgrthm = _WEP104_;
   753					psecuritypriv->dot118021XGrpPrivacy = _WEP104_;
   754				}
   755	
   756				psecuritypriv->dot11PrivacyKeyIndex = wep_key_idx;
   757			}
   758	
   759			memcpy(&(psecuritypriv->dot11DefKey[wep_key_idx].skey[0]), param->u.crypt.key, wep_key_len);
   760	
   761			psecuritypriv->dot11DefKeylen[wep_key_idx] = wep_key_len;
   762	
   763			rtw_set_key(padapter, psecuritypriv, wep_key_idx, 0, true);
   764	
   765			goto exit;
   766		}
   767	
   768		if (padapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) { /*  802_1x */
   769			struct sta_info *psta, *pbcmc_sta;
   770			struct sta_priv *pstapriv = &padapter->stapriv;
   771	
   772			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE | WIFI_MP_STATE) == true) { /* sta mode */
   773				psta = rtw_get_stainfo(pstapriv, get_bssid(pmlmepriv));
   774				if (psta) {
   775					/* Jeff: don't disable ieee8021x_blocked while clearing key */
   776					if (strcmp(param->u.crypt.alg, "none") != 0)
   777						psta->ieee8021x_blocked = false;
   778	
   779					if ((padapter->securitypriv.ndisencryptstatus ==
   780					     NDIS_802_11_ENCRYPTION_2_ENABLED) ||
   781					    (padapter->securitypriv.ndisencryptstatus ==
   782					     NDIS_802_11_ENCRYPTION_3_ENABLED)) {
   783						psta->dot118021XPrivacy = padapter->securitypriv.dot11PrivacyAlgrthm;
   784					}
   785	
   786					if (param->u.crypt.set_tx == 1) { /* pairwise key */
 > 787						struct ieee_crypt_arg *crypt = &param->u.crypt;
 > 788						u32 len = min(crypt->key_len, 16U);
   789	
   790						memcpy(psta->dot118021x_UncstKey.skey,
   791						       crypt->key, len);
   792						if (strcmp(param->u.crypt.alg, "TKIP") == 0) { /* set mic key */
   793							memcpy(psta->dot11tkiptxmickey.skey, &(param->u.crypt.key[16]), 8);
   794							memcpy(psta->dot11tkiprxmickey.skey, &(param->u.crypt.key[24]), 8);
   795	
   796							padapter->securitypriv.busetkipkey = false;
   797							/* _set_timer(&padapter->securitypriv.tkip_timer, 50); */
   798						}
   799	
   800						rtw_setstakey_cmd(padapter, psta, true, true);
   801					} else { /* group key */
   802						struct security_priv *psec = &padapter->securitypriv;
   803						struct ieee_crypt_arg *crypt = &param->u.crypt;
   804						u32 len = min(crypt->key_len, 16U);
   805	
   806						if (strcmp(crypt->alg, "TKIP") == 0 ||
   807						    strcmp(crypt->alg, "CCMP") == 0) {
   808							memcpy(psec->dot118021XGrpKey[crypt->idx].skey,
   809							       crypt->key, len);
   810	
 > 811							memcpy(psec->dot18021XGrptxmickey[crypt->idx].skey,
   812							       &crypt->key[16], 8);
   813	
   814							memcpy(psec->dot118021XGrprxmickey[crypt->idx].skey,
   815							       &crypt->key[24], 8);
   816	
   817							psec->binstallGrpkey = true;
   818							psec->dot118021XGrpKeyid = crypt->idx;
   819							rtw_set_key(padapter, psec, crypt->idx, 1, true);
   820						} else if (strcmp(crypt->alg, "BIP") == 0) {
   821							/* save the IGTK key, length 16 bytes */
   822							memcpy(psec->dot11wBIPKey[crypt->idx].skey,
   823							       crypt->key, len);
   824							psec->dot11wBIPKeyid = crypt->idx;
   825							psec->binstallBIPkey = true;
   826						}
   827					}
   828				}
   829	
   830				pbcmc_sta = rtw_get_bcmc_stainfo(padapter);
   831				if (pbcmc_sta) {
   832					/* Jeff: don't disable ieee8021x_blocked while clearing key */
   833					if (strcmp(param->u.crypt.alg, "none") != 0)
   834						pbcmc_sta->ieee8021x_blocked = false;
   835	
   836					if ((padapter->securitypriv.ndisencryptstatus ==
   837					     NDIS_802_11_ENCRYPTION_2_ENABLED) ||
   838					    (padapter->securitypriv.ndisencryptstatus ==
   839					     NDIS_802_11_ENCRYPTION_3_ENABLED)) {
   840						pbcmc_sta->dot118021XPrivacy = padapter->securitypriv.dot11PrivacyAlgrthm;
   841					}
   842				}
   843			} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) { /* adhoc mode */
   844			}
   845		}
   846	
   847	exit:
   848	
   849		return ret;
   850	}
   851	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
