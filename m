Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F199399375
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 12:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776169882; cv=none; b=YsitpzyPTRfKXTFMtjImv00Wg0Qf8v+yStucTUsroySSi4RN6g2SuJfmhEDoG8jusWU4jt7gkPaWsMVnTkss//qhcARvqgY5mFpwyFcrrxxgnykeqUUDWIFVDdMn8AufOwnT/hgOIrNOfMM8Vqll689iHwDc06Bw/Iz1hoStR0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776169882; c=relaxed/simple;
	bh=eSleQ34WvbjTDLIvEDlcBjymqru2fdzT4ujiCIqDTlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UboeggVCtG55wRRWO/tjB8JRdD2Rfy7k41o1jwbhtyXBF0ZTmriPuhrk5pPulHu/D5gLbQKuuQNS/CHA9T2pgkCsBzA/JGOiJIpJEbtSdLfzR43gzJhf1vZRbUtalAG74vctBDTt0ktE9aMf2uxV3tPiu64zg8CtFzyC5X35F18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+Lb6txK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+Lb6txK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776169881; x=1807705881;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eSleQ34WvbjTDLIvEDlcBjymqru2fdzT4ujiCIqDTlw=;
  b=S+Lb6txKeJV+E4kC5f8VRXBSZYgCP2gJA4MVrLG/aZxptrix1UD+TVqf
   Sun7UFeRIAYxgIem3JH+qYghSz31k7zdQIwooY4KHI/mazupt42hGfNhO
   JH9cy7rvh6Dm9l1Wu8B2FRcVIKrgw6OjCvRSG+xh6XsBoENZbIOZaq4kP
   38Q3TvcTS2ayxXR131OZ6oogP0FHRxZrinm7vehqA26YmxcHcEDM2BMvy
   sfqgSZ4ZuzoXo00bDRLsAEADhLVO/Su4wi470aPVEwuJfy5Rc4DiKwseO
   /Zwizw5XKDQAzmbnikmHugTMsdVOCfC3YCkRj3L8t2HpDQYeR0weeapr7
   A==;
X-CSE-ConnectionGUID: gJHFUDUXQASGeaxgnzEaow==
X-CSE-MsgGUID: 3AcYsG07TvqTvUp8uRL0gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77306762"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77306762"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 05:31:21 -0700
X-CSE-ConnectionGUID: 6hwHACC/QRCly+M8TLKIeQ==
X-CSE-MsgGUID: 91S7HjzvTaadNza5WesYpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="268054957"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.106])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 05:31:19 -0700
Date: Tue, 14 Apr 2026 15:31:16 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marc Finkelbaum <regpacy@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 9/9] staging: rtl8723bs: wrap long lines and fix argument
 alignment
Message-ID: <ad4zlHwRaGoFUIyZ@ashevche-desk.local>
References: <20260414095833.76480-1-regpacy@gmail.com>
 <20260414095833.76480-10-regpacy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414095833.76480-10-regpacy@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Apr 14, 2026 at 12:58:33PM +0300, Marc Finkelbaum wrote:
> Break lines that exceed 80 columns and align continuation arguments to
> the opening parenthesis. Affected sites: scnprintf calls in
> dump_chip_info, hw_chnlPlan assignment, Queue2Pipe[7] assignments in
> the pipe-mapping functions, rtw_hal_set_hwreg in hal_init_macaddr,
> c2h_evt payload read loop, rtw_write16/rtw_write8 in SetHwReg and
> rtw_hal_check_rxfifo_full, rtw_get_stainfo and the UndecoratedSmoothedPWDB
> assignment in GetHalDefVar, ODM_CmnInfoPtrArrayHook calls in SetHalODMVar,
> and rtw_hal_read_rfreg/PHY_SetRFReg in rtw_bb_rf_gain_offset.
> 
> No functional change.

"No" to most of the changes here. Use the common sense.

...

>  	char buf[128];
>  	size_t cnt = 0;
>  
> -	cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "Chip Version Info: CHIP_8723B_%s_",
> -			IS_NORMAL_CHIP(ChipVersion) ? "Normal_Chip" : "Test_Chip");
> +	cnt += scnprintf(buf + cnt, sizeof(buf) - cnt,
> +			 "Chip Version Info: CHIP_8723B_%s_",
> +			 IS_NORMAL_CHIP(ChipVersion) ? "Normal_Chip" :
> +						       "Test_Chip");

Rather check if this needs to be converted to use sysfs_emit_at().

...

> -		hw_chnlPlan = hw_channel_plan & (~EEPROM_CHANNEL_PLAN_BY_HW_MASK);
> +		hw_chnlPlan = hw_channel_plan &
> +			      (~EEPROM_CHANNEL_PLAN_BY_HW_MASK);

Definitely "no". And there are too many parentheses.

		hw_chnlPlan = hw_channel_plan & ~EEPROM_CHANNEL_PLAN_BY_HW_MASK;

is exactly 80 characters, btw.

...

>  		pdvobjpriv->Queue2Pipe[4] = pdvobjpriv->RtOutPipe[0]; /* BCN */
>  		pdvobjpriv->Queue2Pipe[5] = pdvobjpriv->RtOutPipe[0]; /* MGT */
>  		pdvobjpriv->Queue2Pipe[6] = pdvobjpriv->RtOutPipe[0]; /* HIGH */
> -		pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0]; /* TXCMD */
> +		pdvobjpriv->Queue2Pipe[7] =
> +			pdvobjpriv->RtOutPipe[0]; /* TXCMD */

"No".
These are well adjusted right now and also you already touched this code
once, do not do ping-pong series (order the changes the way that you don't
change the same line(s) more than once).

...

>  	} else { /* typical setting */
> +

Huh?!
You have a patch that removed this and other blank lines, what's going on?

...

>  		if (padapter->eeprompriv.EEPROMRFGainVal != 0xff) {
> -			rtw_hal_read_rfreg(padapter, RF_PATH_A, 0x7f, 0xffffffff);
> +			rtw_hal_read_rfreg(padapter, RF_PATH_A, 0x7f,
> +					   0xffffffff);

83 is okay when it gives better readability (and here is the case).

>  			for (i = 0; i < ARRAY_SIZE(Array_kfreemap); i += 2) {
>  				v1 = Array[i];
>  				v2 = Array[i + 1];
> -				if (v1 == padapter->eeprompriv.EEPROMRFGainVal) {
> +				if (v1 ==
> +				    padapter->eeprompriv.EEPROMRFGainVal) {
>  					target = v2;
>  					break;
>  				}
>  			}

-- 
With Best Regards,
Andy Shevchenko


