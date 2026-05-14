Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329033A8750;
	Thu, 14 May 2026 19:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778788289; cv=none; b=eDsfO+KIAs9fuh8xNaes38bkJeD1oLZ3e7//0/ohzdRHliolDRDZRSlbL4htfWHioLa6Wpur+7uKaSaccoYEO+vVgPMFEuXfdax8FdlzW3xLtIZY1V1JOlUriLyXCC1BRFSXiY1UVC70WKi2LW3pm0zikT5nha1oqWvU2DxnL9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778788289; c=relaxed/simple;
	bh=EtYPcPCOvJkKdQ1uIjIS9a87FIZzRmhuWM9IYcmDqow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvUZ4pSDfiucr31PdvM/2E1UrS9J4Dnl0qm1R+GbwDpQnnJg0hlT7upFgwn77KJA0iO+Jw479pHCDVUkGA5tn/OQsDzcMy95i/kpNJgCqajaqCO4uHFicwny4NbKHPoecUm38RIiQcy7kAYrU9DtR5Sz9Qz1k6xeSUiHDAEFzxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JENlmhPL; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JENlmhPL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778788287; x=1810324287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=EtYPcPCOvJkKdQ1uIjIS9a87FIZzRmhuWM9IYcmDqow=;
  b=JENlmhPL5dMEj8EwR4hp6wSGKJ3UgEEYdtaf4s7AAYACtbQ+W4ca23kp
   abeplHRXgwplFvzKJ30CBlhE7xaZjclvww0zxwHvAfbJVlZOc6ex4AlcM
   fB0MpP7zzUdcyGynQaSigOsuh7O96hSM2ism83Hn2zOCjKXyrWH59B/K3
   LpCapR9ouEZIciXPNVmzwQisDfSCfiInNLiHEPhLfclu8tOmQLyMUn70o
   toD54iRqibIiouWuSnTPnHhMtHmn8rjzUhmT+MddxsTVVzXQyS7PlZ2wb
   y3pkpUJ9x5kahkNK4PyG+5yGXxxCaSb81qaxf1pN1c+XyUCkITEJ2HXXR
   A==;
X-CSE-ConnectionGUID: i4DcNdUkQiO0ZznC/KjCIA==
X-CSE-MsgGUID: VG3xmewJSoyc4Hq15koGFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="78877758"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="78877758"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 12:51:27 -0700
X-CSE-ConnectionGUID: CLqbQm+TRzmFLkTYfNKKUA==
X-CSE-MsgGUID: gdvbn8pvToW5bVfnZBAJCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="238740661"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 May 2026 12:51:25 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNc5a-0000000072l-1uTs;
	Thu, 14 May 2026 19:51:22 +0000
Date: Fri, 15 May 2026 03:50:29 +0800
From: kernel test robot <lkp@intel.com>
To: Moksh Panicker <mokshpanicker.7@gmail.com>, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: fix coding style in rtw_efuse.c
Message-ID: <202605150301.7FuEahpv-lkp@intel.com>
References: <20260510063314.34066-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260510063314.34066-1-mokshpanicker.7@gmail.com>

Hi Moksh,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Moksh-Panicker/staging-rtl8723bs-fix-coding-style-in-rtw_efuse-c/20260514-222556
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260510063314.34066-1-mokshpanicker.7%40gmail.com
patch subject: [PATCH] staging: rtl8723bs: fix coding style in rtw_efuse.c
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260515/202605150301.7FuEahpv-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150301.7FuEahpv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605150301.7FuEahpv-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/staging/rtl8723bs/core/rtw_efuse.c: In function 'rtw_efuse_read_1_byte':
>> drivers/staging/rtl8723bs/core/rtw_efuse.c:135:13: error: invalid storage class for function 'Efuse_ReadAllMap'
     135 | static void Efuse_ReadAllMap(struct adapter *padapter, u8 efuseType, u8 *Efuse)
         |             ^~~~~~~~~~~~~~~~
>> drivers/staging/rtl8723bs/core/rtw_efuse.c:166:13: error: invalid storage class for function 'efuse_ShadowRead1Byte'
     166 | static void efuse_ShadowRead1Byte(struct adapter *padapter, u16 Offset, u8 *Value)
         |             ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/rtl8723bs/core/rtw_efuse.c:175:13: error: invalid storage class for function 'efuse_ShadowRead2Byte'
     175 | static void efuse_ShadowRead2Byte(struct adapter *padapter, u16 Offset, u16 *Value)
         |             ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/rtl8723bs/core/rtw_efuse.c:185:13: error: invalid storage class for function 'efuse_ShadowRead4Byte'
     185 | static void efuse_ShadowRead4Byte(struct adapter *padapter, u16 Offset, u32 *Value)
         |             ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/rtl8723bs/core/rtw_efuse.c:253:1: error: expected declaration or statement at end of input
     253 | } /* rtw_efuse_shadow_read*/
         | ^
   drivers/staging/rtl8723bs/core/rtw_efuse.c: At top level:
>> drivers/staging/rtl8723bs/core/rtw_efuse.c:244:6: warning: 'rtw_efuse_shadow_read' defined but not used [-Wunused-function]
     244 | void rtw_efuse_shadow_read(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/rtl8723bs/core/rtw_efuse.c:212:6: warning: 'rtw_efuse_shadow_map_update' defined but not used [-Wunused-function]
     212 | void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuseType)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/rtl8723bs/core/rtw_efuse.c:82:4: warning: 'rtw_efuse_one_byte_read' defined but not used [-Wunused-function]
      82 | u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16   addr, u8     *data)
         |    ^~~~~~~~~~~~~~~~~~~~~~~


vim +/Efuse_ReadAllMap +135 drivers/staging/rtl8723bs/core/rtw_efuse.c

554c0a3abf216c Hans de Goede        2017-03-29   80  
554c0a3abf216c Hans de Goede        2017-03-29   81  /*  11/16/2008 MH Read one byte from real Efuse. */
ceeea324fb96ba Moksh Panicker       2026-05-10  @82  u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16   addr, u8	*data)
554c0a3abf216c Hans de Goede        2017-03-29   83  {
554c0a3abf216c Hans de Goede        2017-03-29   84  	u32 tmpidx = 0;
554c0a3abf216c Hans de Goede        2017-03-29   85  	u8 bResult;
554c0a3abf216c Hans de Goede        2017-03-29   86  	u8 readbyte;
554c0a3abf216c Hans de Goede        2017-03-29   87  
554c0a3abf216c Hans de Goede        2017-03-29   88  	/*  <20130121, Kordan> For SMIC EFUSE specificatoin. */
554c0a3abf216c Hans de Goede        2017-03-29   89  	/* 0x34[11]: SW force PGMEN input of efuse to high. (for the bank selected by 0x34[9:8]) */
554c0a3abf216c Hans de Goede        2017-03-29   90  	/* PHY_SetMacReg(padapter, 0x34, BIT11, 0); */
6a620bb2f4c1b4 Michael Steinmötzger 2026-05-09   91  	rtw_write16(padapter, 0x34, rtw_read16(padapter, 0x34) & (~BIT(11)));
554c0a3abf216c Hans de Goede        2017-03-29   92  
554c0a3abf216c Hans de Goede        2017-03-29   93  	/*  -----------------e-fuse reg ctrl --------------------------------- */
554c0a3abf216c Hans de Goede        2017-03-29   94  	/* address */
554c0a3abf216c Hans de Goede        2017-03-29   95  	rtw_write8(padapter, EFUSE_CTRL + 1, (u8)(addr & 0xff));
554c0a3abf216c Hans de Goede        2017-03-29   96  	rtw_write8(padapter, EFUSE_CTRL + 2, ((u8)((addr >> 8) & 0x03)) |
554c0a3abf216c Hans de Goede        2017-03-29   97  	(rtw_read8(padapter, EFUSE_CTRL + 2) & 0xFC));
554c0a3abf216c Hans de Goede        2017-03-29   98  
554c0a3abf216c Hans de Goede        2017-03-29   99  	/* rtw_write8(padapter, EFUSE_CTRL+3,  0x72); read cmd */
554c0a3abf216c Hans de Goede        2017-03-29  100  	/* Write bit 32 0 */
554c0a3abf216c Hans de Goede        2017-03-29  101  	readbyte = rtw_read8(padapter, EFUSE_CTRL + 3);
554c0a3abf216c Hans de Goede        2017-03-29  102  	rtw_write8(padapter, EFUSE_CTRL + 3, (readbyte & 0x7f));
554c0a3abf216c Hans de Goede        2017-03-29  103  
554c0a3abf216c Hans de Goede        2017-03-29  104  	while (!(0x80 & rtw_read8(padapter, EFUSE_CTRL + 3)) && (tmpidx < 1000)) {
554c0a3abf216c Hans de Goede        2017-03-29  105  		mdelay(1);
554c0a3abf216c Hans de Goede        2017-03-29  106  		tmpidx++;
554c0a3abf216c Hans de Goede        2017-03-29  107  	}
554c0a3abf216c Hans de Goede        2017-03-29  108  	if (tmpidx < 100) {
554c0a3abf216c Hans de Goede        2017-03-29  109  		*data = rtw_read8(padapter, EFUSE_CTRL);
554c0a3abf216c Hans de Goede        2017-03-29  110  		bResult = true;
554c0a3abf216c Hans de Goede        2017-03-29  111  	} else {
554c0a3abf216c Hans de Goede        2017-03-29  112  		*data = 0xff;
554c0a3abf216c Hans de Goede        2017-03-29  113  		bResult = false;
554c0a3abf216c Hans de Goede        2017-03-29  114  	}
554c0a3abf216c Hans de Goede        2017-03-29  115  
554c0a3abf216c Hans de Goede        2017-03-29  116  	return bResult;
554c0a3abf216c Hans de Goede        2017-03-29  117  }
554c0a3abf216c Hans de Goede        2017-03-29  118  
554c0a3abf216c Hans de Goede        2017-03-29  119  /*-----------------------------------------------------------------------------
554c0a3abf216c Hans de Goede        2017-03-29  120   * Function:	Efuse_ReadAllMap
554c0a3abf216c Hans de Goede        2017-03-29  121   *
554c0a3abf216c Hans de Goede        2017-03-29  122   * Overview:	Read All Efuse content
554c0a3abf216c Hans de Goede        2017-03-29  123   *
554c0a3abf216c Hans de Goede        2017-03-29  124   * Input:       NONE
554c0a3abf216c Hans de Goede        2017-03-29  125   *
554c0a3abf216c Hans de Goede        2017-03-29  126   * Output:      NONE
554c0a3abf216c Hans de Goede        2017-03-29  127   *
554c0a3abf216c Hans de Goede        2017-03-29  128   * Return:      NONE
554c0a3abf216c Hans de Goede        2017-03-29  129   *
554c0a3abf216c Hans de Goede        2017-03-29  130   * Revised History:
554c0a3abf216c Hans de Goede        2017-03-29  131   * When			Who		Remark
554c0a3abf216c Hans de Goede        2017-03-29  132   * 11/11/2008	MHC		Create Version 0.
554c0a3abf216c Hans de Goede        2017-03-29  133   *
35b79fd9fbdce9 Ignacio Pena         2025-07-16  134   */
e8605159aec9bc Michael Straube      2025-08-23 @135  static void Efuse_ReadAllMap(struct adapter *padapter, u8 efuseType, u8 *Efuse)
554c0a3abf216c Hans de Goede        2017-03-29  136  {
554c0a3abf216c Hans de Goede        2017-03-29  137  	u16 mapLen = 0;
554c0a3abf216c Hans de Goede        2017-03-29  138  
236faa3b92d336 Michael Straube      2025-08-24  139  	Hal_EfusePowerSwitch(padapter, true);
554c0a3abf216c Hans de Goede        2017-03-29  140  
fd865573df743e Siwanan Bungtong     2026-02-10  141  	Hal_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, &mapLen);
554c0a3abf216c Hans de Goede        2017-03-29  142  
0124378e9ed4fd Michael Straube      2025-08-23  143  	Hal_ReadEFuse(padapter, efuseType, 0, mapLen, Efuse);
554c0a3abf216c Hans de Goede        2017-03-29  144  
236faa3b92d336 Michael Straube      2025-08-24  145  	Hal_EfusePowerSwitch(padapter, false);
554c0a3abf216c Hans de Goede        2017-03-29  146  }
554c0a3abf216c Hans de Goede        2017-03-29  147  
554c0a3abf216c Hans de Goede        2017-03-29  148  /*-----------------------------------------------------------------------------
554c0a3abf216c Hans de Goede        2017-03-29  149   * Function:	efuse_ShadowRead1Byte
554c0a3abf216c Hans de Goede        2017-03-29  150   *		efuse_ShadowRead2Byte
554c0a3abf216c Hans de Goede        2017-03-29  151   *		efuse_ShadowRead4Byte
554c0a3abf216c Hans de Goede        2017-03-29  152   *
554c0a3abf216c Hans de Goede        2017-03-29  153   * Overview:	Read from efuse init map by one/two/four bytes !!!!!
554c0a3abf216c Hans de Goede        2017-03-29  154   *
554c0a3abf216c Hans de Goede        2017-03-29  155   * Input:       NONE
554c0a3abf216c Hans de Goede        2017-03-29  156   *
554c0a3abf216c Hans de Goede        2017-03-29  157   * Output:      NONE
554c0a3abf216c Hans de Goede        2017-03-29  158   *
554c0a3abf216c Hans de Goede        2017-03-29  159   * Return:      NONE
554c0a3abf216c Hans de Goede        2017-03-29  160   *
554c0a3abf216c Hans de Goede        2017-03-29  161   * Revised History:
554c0a3abf216c Hans de Goede        2017-03-29  162   * When			Who		Remark
554c0a3abf216c Hans de Goede        2017-03-29  163   * 11/12/2008	MHC		Create Version 0.
554c0a3abf216c Hans de Goede        2017-03-29  164   *
35b79fd9fbdce9 Ignacio Pena         2025-07-16  165   */
5641eeec0f5835 Ross Schmidt         2020-11-09 @166  static void efuse_ShadowRead1Byte(struct adapter *padapter, u16 Offset, u8 *Value)
554c0a3abf216c Hans de Goede        2017-03-29  167  {
554c0a3abf216c Hans de Goede        2017-03-29  168  	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
554c0a3abf216c Hans de Goede        2017-03-29  169  
554c0a3abf216c Hans de Goede        2017-03-29  170  	*Value = pEEPROM->efuse_eeprom_data[Offset];
554c0a3abf216c Hans de Goede        2017-03-29  171  
554c0a3abf216c Hans de Goede        2017-03-29  172  }	/*  EFUSE_ShadowRead1Byte */
554c0a3abf216c Hans de Goede        2017-03-29  173  
554c0a3abf216c Hans de Goede        2017-03-29  174  /* Read Two Bytes */
5641eeec0f5835 Ross Schmidt         2020-11-09 @175  static void efuse_ShadowRead2Byte(struct adapter *padapter, u16 Offset, u16 *Value)
554c0a3abf216c Hans de Goede        2017-03-29  176  {
554c0a3abf216c Hans de Goede        2017-03-29  177  	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
554c0a3abf216c Hans de Goede        2017-03-29  178  
554c0a3abf216c Hans de Goede        2017-03-29  179  	*Value = pEEPROM->efuse_eeprom_data[Offset];
554c0a3abf216c Hans de Goede        2017-03-29  180  	*Value |= pEEPROM->efuse_eeprom_data[Offset + 1] << 8;
554c0a3abf216c Hans de Goede        2017-03-29  181  
554c0a3abf216c Hans de Goede        2017-03-29  182  }	/*  EFUSE_ShadowRead2Byte */
554c0a3abf216c Hans de Goede        2017-03-29  183  
554c0a3abf216c Hans de Goede        2017-03-29  184  /* Read Four Bytes */
5641eeec0f5835 Ross Schmidt         2020-11-09 @185  static void efuse_ShadowRead4Byte(struct adapter *padapter, u16 Offset, u32 *Value)
554c0a3abf216c Hans de Goede        2017-03-29  186  {
554c0a3abf216c Hans de Goede        2017-03-29  187  	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
554c0a3abf216c Hans de Goede        2017-03-29  188  
554c0a3abf216c Hans de Goede        2017-03-29  189  	*Value = pEEPROM->efuse_eeprom_data[Offset];
554c0a3abf216c Hans de Goede        2017-03-29  190  	*Value |= pEEPROM->efuse_eeprom_data[Offset + 1] << 8;
554c0a3abf216c Hans de Goede        2017-03-29  191  	*Value |= pEEPROM->efuse_eeprom_data[Offset + 2] << 16;
554c0a3abf216c Hans de Goede        2017-03-29  192  	*Value |= pEEPROM->efuse_eeprom_data[Offset + 3] << 24;
554c0a3abf216c Hans de Goede        2017-03-29  193  
554c0a3abf216c Hans de Goede        2017-03-29  194  }	/*  efuse_ShadowRead4Byte */
554c0a3abf216c Hans de Goede        2017-03-29  195  
554c0a3abf216c Hans de Goede        2017-03-29  196  /*-----------------------------------------------------------------------------
3f188a336f9582 Linus Probert        2026-04-04  197   * Function:	rtw_efuse_shadow_map_update
554c0a3abf216c Hans de Goede        2017-03-29  198   *
554c0a3abf216c Hans de Goede        2017-03-29  199   * Overview:	Transfer current EFUSE content to shadow init and modify map.
554c0a3abf216c Hans de Goede        2017-03-29  200   *
554c0a3abf216c Hans de Goede        2017-03-29  201   * Input:       NONE
554c0a3abf216c Hans de Goede        2017-03-29  202   *
554c0a3abf216c Hans de Goede        2017-03-29  203   * Output:      NONE
554c0a3abf216c Hans de Goede        2017-03-29  204   *
554c0a3abf216c Hans de Goede        2017-03-29  205   * Return:      NONE
554c0a3abf216c Hans de Goede        2017-03-29  206   *
554c0a3abf216c Hans de Goede        2017-03-29  207   * Revised History:
554c0a3abf216c Hans de Goede        2017-03-29  208   * When			Who		Remark
554c0a3abf216c Hans de Goede        2017-03-29  209   * 11/13/2008	MHC		Create Version 0.
554c0a3abf216c Hans de Goede        2017-03-29  210   *
35b79fd9fbdce9 Ignacio Pena         2025-07-16  211   */
3f188a336f9582 Linus Probert        2026-04-04 @212  void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuseType)
554c0a3abf216c Hans de Goede        2017-03-29  213  {
554c0a3abf216c Hans de Goede        2017-03-29  214  	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
554c0a3abf216c Hans de Goede        2017-03-29  215  	u16 mapLen = 0;
554c0a3abf216c Hans de Goede        2017-03-29  216  
fd865573df743e Siwanan Bungtong     2026-02-10  217  	Hal_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, &mapLen);
554c0a3abf216c Hans de Goede        2017-03-29  218  
d2ab9916f0122c Michael Straube      2018-06-30  219  	if (pEEPROM->bautoload_fail_flag)
554c0a3abf216c Hans de Goede        2017-03-29  220  		memset(pEEPROM->efuse_eeprom_data, 0xFF, mapLen);
d2ab9916f0122c Michael Straube      2018-06-30  221  	else
e8605159aec9bc Michael Straube      2025-08-23  222  		Efuse_ReadAllMap(padapter, efuseType, pEEPROM->efuse_eeprom_data);
554c0a3abf216c Hans de Goede        2017-03-29  223  
554c0a3abf216c Hans de Goede        2017-03-29  224  	/* PlatformMoveMemory((void *)&pHalData->EfuseMap[EFUSE_MODIFY_MAP][0], */
554c0a3abf216c Hans de Goede        2017-03-29  225  	/* void *)&pHalData->EfuseMap[EFUSE_INIT_MAP][0], mapLen); */
3f188a336f9582 Linus Probert        2026-04-04  226  } /*  rtw_efuse_shadow_map_update */
554c0a3abf216c Hans de Goede        2017-03-29  227  
554c0a3abf216c Hans de Goede        2017-03-29  228  /*-----------------------------------------------------------------------------
7a590f2660887a Linus Probert        2026-04-04  229   * Function:	rtw_efuse_shadow_read
554c0a3abf216c Hans de Goede        2017-03-29  230   *
554c0a3abf216c Hans de Goede        2017-03-29  231   * Overview:	Read from efuse init map !!!!!
554c0a3abf216c Hans de Goede        2017-03-29  232   *
554c0a3abf216c Hans de Goede        2017-03-29  233   * Input:       NONE
554c0a3abf216c Hans de Goede        2017-03-29  234   *
554c0a3abf216c Hans de Goede        2017-03-29  235   * Output:      NONE
554c0a3abf216c Hans de Goede        2017-03-29  236   *
554c0a3abf216c Hans de Goede        2017-03-29  237   * Return:      NONE
554c0a3abf216c Hans de Goede        2017-03-29  238   *
554c0a3abf216c Hans de Goede        2017-03-29  239   * Revised History:
554c0a3abf216c Hans de Goede        2017-03-29  240   * When			Who		Remark
554c0a3abf216c Hans de Goede        2017-03-29  241   * 11/12/2008	MHC		Create Version 0.
554c0a3abf216c Hans de Goede        2017-03-29  242   *
35b79fd9fbdce9 Ignacio Pena         2025-07-16  243   */
7a590f2660887a Linus Probert        2026-04-04 @244  void rtw_efuse_shadow_read(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value)
554c0a3abf216c Hans de Goede        2017-03-29  245  {
554c0a3abf216c Hans de Goede        2017-03-29  246  	if (Type == 1)
554c0a3abf216c Hans de Goede        2017-03-29  247  		efuse_ShadowRead1Byte(padapter, Offset, (u8 *)Value);
554c0a3abf216c Hans de Goede        2017-03-29  248  	else if (Type == 2)
554c0a3abf216c Hans de Goede        2017-03-29  249  		efuse_ShadowRead2Byte(padapter, Offset, (u16 *)Value);
554c0a3abf216c Hans de Goede        2017-03-29  250  	else if (Type == 4)
554c0a3abf216c Hans de Goede        2017-03-29  251  		efuse_ShadowRead4Byte(padapter, Offset, (u32 *)Value);
554c0a3abf216c Hans de Goede        2017-03-29  252  
7a590f2660887a Linus Probert        2026-04-04 @253  } /* rtw_efuse_shadow_read*/

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
