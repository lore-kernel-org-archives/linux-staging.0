Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F2E2147E6;
	Fri, 13 Feb 2026 15:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770996879; cv=none; b=fh9q7wDaw39i6vfG8Ls6/1klayEP62DdVXnQ140lYcTqOCSUbHIlwfvDC2yGH5Cmm+LQGCplOK0ZbS209DfxWB3gC2KkdVqCSQS7AGA/sZjZA/TACY2/zaWtkHtbjAIqMP0kR55nzh4j+Y+nerDzrWrFopNhG2sR4B4qVYjFuRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770996879; c=relaxed/simple;
	bh=GOTDlwH16MekgibpH22/4LKEUA6TwRCThzNGqllNrB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fAyHz8yKTXuybVVrVIDkd/kddI7Di4BkbCu/7fD5mg5cq/pZyOuak/Tt/OyrpEYf20WrrlQEMt7+rHUUZdgcphwqqTFFCMZgm+pv8lfeAiFxaTgjlYmve8MjaMpt3MRAjxTBg85IRvHhDWG/g580+YNInOnMuKV7WTYCdOD+n3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gN6u2UTP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gN6u2UTP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770996877; x=1802532877;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GOTDlwH16MekgibpH22/4LKEUA6TwRCThzNGqllNrB0=;
  b=gN6u2UTP6100oMKfFQSbKJcibMmbVZIvgFdb+9CgXXU3/xoS068ff5+6
   XzXmBV1kYoNn7m8fn5J1i2wnX9JWvEqCdtPvcd4TPkIs9ckM5l2+gUB2F
   TZAiD0QYzmPO9pF0FNyeDbC9RyAlgaocqYP1w8qXWUDyGFgdSMep+5NRJ
   VMPkkgAgmyZcfA2HB7s2Kc86Pl7pH084mUrISTQ7F6/6zby8aBEs1K7gw
   7930lHf00pZUdf3BZCZBxzTlhiQP/tWPVLIIE0TAfw73DQKEd+YlLZ6AH
   ZfJMzjcKe9IKSqWqetg00H5zZ9XDt5rzgzFvsndzFpwE7DrUDQgp4TVo3
   g==;
X-CSE-ConnectionGUID: JSTjVxbbQdmGd/JY79G+Jw==
X-CSE-MsgGUID: bIz3eP9iQWa0tCAGhQTw3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72087956"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="72087956"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 07:34:36 -0800
X-CSE-ConnectionGUID: elODkWL4TYyQ1z23TpxhTw==
X-CSE-MsgGUID: oQAIVuDERziEljjKgs7Cmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="213049909"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Feb 2026 07:34:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqvBg-00000000vbs-0sTR;
	Fri, 13 Feb 2026 15:34:32 +0000
Date: Fri, 13 Feb 2026 23:34:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ethan Luna <trunixcodes@zohomail.com>, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Ethan Luna <trunixcodes@zohomail.com>
Subject: Re: [PATCH] staging: rtl8723bs: remove NDIS_802_11_RATES typedef
Message-ID: <202602132351.lKF5l1tO-lkp@intel.com>
References: <20260211024115.31339-1-trunixcodes@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211024115.31339-1-trunixcodes@zohomail.com>

Hi Ethan,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Ethan-Luna/staging-rtl8723bs-remove-NDIS_802_11_RATES-typedef/20260211-104321
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260211024115.31339-1-trunixcodes%40zohomail.com
patch subject: [PATCH] staging: rtl8723bs: remove NDIS_802_11_RATES typedef
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260213/202602132351.lKF5l1tO-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602132351.lKF5l1tO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602132351.lKF5l1tO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> alpha-linux-ld: drivers/staging/rtl8723bs/core/rtw_btcoex.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/core/rtw_cmd.o:(.sbss+0x8): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/core/rtw_efuse.o:(.sbss+0xd): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/core/rtw_io.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/core/rtw_ioctl_set.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/core/rtw_ieee80211.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/core/rtw_mlme.o:(.sbss+0x3): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/core/rtw_mlme_ext.o:(.sbss+0x7): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/core/rtw_pwrctrl.o:(.sbss+0xc): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/core/rtw_recv.o:(.sbss+0xe): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/core/rtw_security.o:(.sbss+0x20): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/core/rtw_sta_mgt.o:(.sbss+0x9): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/core/rtw_wlan_util.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/core/rtw_xmit.o:(.sbss+0x1a): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/hal_intf.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/hal_com.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/hal_com_phycfg.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/hal_btcoex.o:(.sbss+0x3): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/hal_sdio.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/hal_pwr_seq.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/HalPhyRf.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/odm.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/odm_CfoTracking.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/odm_DIG.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/odm_DynamicTxPower.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/odm_EdcaTurboCheck.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/odm_HWConfig.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/odm_RegConfig8723B.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/rtl8723b_cmd.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/rtl8723b_dm.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.o:(.sbss+0x2): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/rtl8723b_rxdesc.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/rtl8723bs_recv.o:(.sbss+0x3): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.o:(.sbss+0x2): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/sdio_halinit.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/sdio_ops.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.o:(.sbss+0x1c): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.o:(.sbss+0x18): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.o:(.sbss+0x9): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/os_dep/osdep_service.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/os_dep/os_intfs.o:(.sbss+0x44): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/os_dep/sdio_intf.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/os_dep/wifi_regd.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here
   alpha-linux-ld: drivers/staging/rtl8723bs/os_dep/xmit_linux.o:(.sbss+0x0): multiple definition of `NDIS_802_11_RATES'; drivers/staging/rtl8723bs/core/rtw_ap.o:(.sbss+0x2): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
