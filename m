Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B2D344DBE;
	Wed, 28 Jan 2026 09:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769592574; cv=none; b=c1pWRW+4FzGYMA+9OfPhOCH+JXmsG2nraw7AZH/QYJCzoDSd6J5XXtIZhOj1BmoFWHtWjHLJwPO9RAOreCGnH/tHDq2rk+6OWT2sgNAsDPpn2Tu+a7zLpWb3maHWM6l/QT1MbJerZFdN8/C0j4dzHycTlT6gTgEXn8bNMWBgBy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769592574; c=relaxed/simple;
	bh=rDwq9sRL1qF9bXn85h9PIWuBPIylHoYEZLBuixGkovw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=se4lePXS6RWFY9ycfTQ01smdQrZ2Fp5MMfAORNLksaxkU+snE8VHQVRKMntfGcufmagbsmzXdAQCg9GtVFM+qAD9TS3dPQTygrCVpyKeHcrGZlaIgtCJDlOd/0Bl1WHF8j/t8M8TIN2JG4QEFdxl2ToDt5k+wm7cLbOj4UykgCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ib4Ue8TF; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ib4Ue8TF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769592572; x=1801128572;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rDwq9sRL1qF9bXn85h9PIWuBPIylHoYEZLBuixGkovw=;
  b=Ib4Ue8TFCz/D+YOw3DGEoO4nHJeE/CoHBibpUNeclppM5q1iSqNxy2vs
   OiM5kMRLeJW5GrHJBWU/k7jwH1uVKAXmqAv8xp/zq5Vjg6BhWnIJOaZeT
   qfmQTAJkrl7TAqCK6l3t5PM+ryoKKTGiwfvrL/Ndt+H8bBYFyMMbWp7Jf
   WHCOWlQEp5TG7/Jph2H5xMMt4tPWkKaDes6rRAg5ILR+TFTz8VuG3dY5I
   H1Kh/B2WnHd0rBYKuuXVoISDJCrJeDVaGjGkkl7vleTxb8Cw9OBLWgVpK
   lb4jLkms/5YXeK0qMeYZKF7p3OpKF7rzdMM6LY/T4HMRoS3MvH8VTv2e6
   g==;
X-CSE-ConnectionGUID: FYrdGDthR4G/7j0d+qxWaQ==
X-CSE-MsgGUID: Kwr33zCISz6M7kvtXSHISA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="74659601"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="74659601"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 01:29:31 -0800
X-CSE-ConnectionGUID: LZI6xFysRYGIU3MRBEPbKQ==
X-CSE-MsgGUID: F6dQHfW0SYSplVVoFPGyzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="212319906"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Jan 2026 01:29:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl1rZ-00000000ZVU-1r2H;
	Wed, 28 Jan 2026 09:29:25 +0000
Date: Wed, 28 Jan 2026 17:29:01 +0800
From: kernel test robot <lkp@intel.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <error27@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: Re: [PATCH v2 2/4] staging: rtl8723bs: remove dead RX FIFO  overflow
 logic
Message-ID: <202601281752.mqChL1f6-lkp@intel.com>
References: <20260128004009.51095-3-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128004009.51095-3-ethantidmore06@gmail.com>

Hi Ethan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Ethan-Tidmore/staging-rtl8723bs-remove-dead-RX-info-reset-logic/20260128-084338
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260128004009.51095-3-ethantidmore06%40gmail.com
patch subject: [PATCH v2 2/4] staging: rtl8723bs: remove dead RX FIFO  overflow logic
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260128/202601281752.mqChL1f6-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281752.mqChL1f6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601281752.mqChL1f6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/rtl8723bs/hal/rtl8723b_dm.c: In function 'rtl8723b_HalDmWatchDog':
>> drivers/staging/rtl8723bs/hal/rtl8723b_dm.c:127:14: warning: variable 'fw_current_in_ps_mode' set but not used [-Wunused-but-set-variable]
     127 |         bool fw_current_in_ps_mode = false;
         |              ^~~~~~~~~~~~~~~~~~~~~


vim +/fw_current_in_ps_mode +127 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c

554c0a3abf216c Hans de Goede         2017-03-29  124  
554c0a3abf216c Hans de Goede         2017-03-29  125  void rtl8723b_HalDmWatchDog(struct adapter *Adapter)
554c0a3abf216c Hans de Goede         2017-03-29  126  {
90b69822a5cb6b Fabio M. De Francesco 2021-04-11 @127  	bool fw_current_in_ps_mode = false;
554c0a3abf216c Hans de Goede         2017-03-29  128  	bool bFwPSAwake = true;
554c0a3abf216c Hans de Goede         2017-03-29  129  	u8 hw_init_completed = false;
554c0a3abf216c Hans de Goede         2017-03-29  130  	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
554c0a3abf216c Hans de Goede         2017-03-29  131  
554c0a3abf216c Hans de Goede         2017-03-29  132  	hw_init_completed = Adapter->hw_init_completed;
554c0a3abf216c Hans de Goede         2017-03-29  133  
554c0a3abf216c Hans de Goede         2017-03-29  134  	if (hw_init_completed == false)
554c0a3abf216c Hans de Goede         2017-03-29  135  		goto skip_dm;
554c0a3abf216c Hans de Goede         2017-03-29  136  
90b69822a5cb6b Fabio M. De Francesco 2021-04-11  137  	fw_current_in_ps_mode = adapter_to_pwrctl(Adapter)->fw_current_in_ps_mode;
554c0a3abf216c Hans de Goede         2017-03-29  138  	rtw_hal_get_hwreg(Adapter, HW_VAR_FWLPS_RF_ON, (u8 *)(&bFwPSAwake));
554c0a3abf216c Hans de Goede         2017-03-29  139  
554c0a3abf216c Hans de Goede         2017-03-29  140  	/* ODM */
554c0a3abf216c Hans de Goede         2017-03-29  141  	if (hw_init_completed == true) {
554c0a3abf216c Hans de Goede         2017-03-29  142  		u8 bLinked = false;
554c0a3abf216c Hans de Goede         2017-03-29  143  		u8 bsta_state = false;
14c77a18375db3 Nishka Dasgupta       2019-07-02  144  		bool bBtDisabled = true;
554c0a3abf216c Hans de Goede         2017-03-29  145  
554c0a3abf216c Hans de Goede         2017-03-29  146  		if (rtw_linked_check(Adapter)) {
554c0a3abf216c Hans de Goede         2017-03-29  147  			bLinked = true;
554c0a3abf216c Hans de Goede         2017-03-29  148  			if (check_fwstate(&Adapter->mlmepriv, WIFI_STATION_STATE))
554c0a3abf216c Hans de Goede         2017-03-29  149  				bsta_state = true;
554c0a3abf216c Hans de Goede         2017-03-29  150  		}
554c0a3abf216c Hans de Goede         2017-03-29  151  
554c0a3abf216c Hans de Goede         2017-03-29  152  		ODM_CmnInfoUpdate(&pHalData->odmpriv, ODM_CMNINFO_LINK, bLinked);
554c0a3abf216c Hans de Goede         2017-03-29  153  		ODM_CmnInfoUpdate(&pHalData->odmpriv, ODM_CMNINFO_STATION_STATE, bsta_state);
554c0a3abf216c Hans de Goede         2017-03-29  154  
554c0a3abf216c Hans de Goede         2017-03-29  155  		/* ODM_CmnInfoUpdate(&pHalData->odmpriv , ODM_CMNINFO_RSSI_MIN, pdmpriv->MinUndecoratedPWDBForDM); */
554c0a3abf216c Hans de Goede         2017-03-29  156  
d1f4b78027202d Nishka Dasgupta       2019-07-01  157  		bBtDisabled = hal_btcoex_IsBtDisabled(Adapter);
554c0a3abf216c Hans de Goede         2017-03-29  158  
a8fa78b8f49752 Javier F. Arias       2019-11-05  159  		ODM_CmnInfoUpdate(&pHalData->odmpriv, ODM_CMNINFO_BT_ENABLED,
c3a12cc1ec4c9c Javier F. Arias       2019-11-05  160  				  !bBtDisabled);
554c0a3abf216c Hans de Goede         2017-03-29  161  
554c0a3abf216c Hans de Goede         2017-03-29  162  		ODM_DMWatchdog(&pHalData->odmpriv);
554c0a3abf216c Hans de Goede         2017-03-29  163  	}
554c0a3abf216c Hans de Goede         2017-03-29  164  
554c0a3abf216c Hans de Goede         2017-03-29  165  skip_dm:
554c0a3abf216c Hans de Goede         2017-03-29  166  	return;
554c0a3abf216c Hans de Goede         2017-03-29  167  }
554c0a3abf216c Hans de Goede         2017-03-29  168  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
