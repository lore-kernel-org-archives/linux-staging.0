Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41852D8376;
	Fri, 30 Jan 2026 15:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769787083; cv=none; b=hROTROsEBPQRCNgpfUcvQoTIbEy9TEyxhMQaosKYWNwzAJIiLstKQMCT61yUU4ko4lm/l6B+i0GQqX9ICR5/7EkAymla+FQ7oyHc3AURgbxt044k97Fg5by/+TD5fKlYENCMFd+x+hL7+NJ9fYRezuhPjJLW+HQN9Oa7d1Jczws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769787083; c=relaxed/simple;
	bh=27JNLVpBQSqypA1FT6EYjQXq5WOL16+oIbTAsf2H2R0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WWCD9jug/PLGdkFhyXE5NZFC8dmCFom2VEylkJdI9TDKAx9PgHD14Ne2vLB8zpsMRXcl+6Rvitjm8OrFto4I4pMbIqw113D4xpS6Dlo7El3kJxOtLvgE3844BuiAa9F5FTX6M5jJl754ZAz5F7nKKCdr/FCKNvk7QUW8V21Nn6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MxtP2A7o; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MxtP2A7o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769787080; x=1801323080;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=27JNLVpBQSqypA1FT6EYjQXq5WOL16+oIbTAsf2H2R0=;
  b=MxtP2A7oGHIv0EMrM8bGYJiu+/gFrzlXrNtwEScNki9LE+7eAlgqIdZ9
   COk1fGn+5xp/Jn9v77+rKTZjI9Ofype8jrLrefM1SFvs76o3UmxCaNmoN
   XS1KLhSr7ilzS0kMBTjfcMxAJgqvzRI3JE/rQPDiG/UuZ/yhEX6x/qJ9d
   figOO+jIgzcwt+zSTUZPTXprEGUvpsiR9PVHt5EnQ6za5cCvkH3of4WhO
   x1oT0S9+prRbqG/BwkaBhpu7O9PnxL9qYEubFcOMf4U4a1Z6PCIHsSVuf
   eq8tuQMk15ZshzPgjC7SFGhRRXLUlKobsyvxqJwlTEkYO/f4Nb+Ie/wpO
   A==;
X-CSE-ConnectionGUID: 1vwLSNXtSnS39MHwQYpisA==
X-CSE-MsgGUID: HBT22HHhT9+3zAohbUdm5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="73640451"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="73640451"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 07:31:19 -0800
X-CSE-ConnectionGUID: tZfXaOsfSDy+F77gQHXNKw==
X-CSE-MsgGUID: 9cqSSffiR2S9fMJQz2kSPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="213774722"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Jan 2026 07:31:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlqSp-00000000d5A-1A5n;
	Fri, 30 Jan 2026 15:31:15 +0000
Date: Fri, 30 Jan 2026 23:30:25 +0800
From: kernel test robot <lkp@intel.com>
To: SAJJA EASWAR SAI <eshwarsajja20@gmail.com>, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, eshwarsajja20@gmail.com
Subject: Re: [PATCH] staging: rtw_mlme_ext: remove hardcoded dead debug code
Message-ID: <202601302336.Jt5bRreu-lkp@intel.com>
References: <20260130062956.858992-1-eshwarsajja20@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130062956.858992-1-eshwarsajja20@gmail.com>

Hi SAJJA,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/SAJJA-EASWAR-SAI/staging-rtw_mlme_ext-remove-hardcoded-dead-debug-code/20260130-143203
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260130062956.858992-1-eshwarsajja20%40gmail.com
patch subject: [PATCH] staging: rtw_mlme_ext: remove hardcoded dead debug code
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260130/202601302336.Jt5bRreu-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601302336.Jt5bRreu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601302336.Jt5bRreu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/rtl8723bs/core/rtw_mlme_ext.c: In function 'OnAction_sa_query':
>> drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:1851:31: warning: unused variable 'pattrib' [-Wunused-variable]
    1851 |         struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
         |                               ^~~~~~~


vim +/pattrib +1851 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c

554c0a3abf216c Hans de Goede   2017-03-29  1847  
554c0a3abf216c Hans de Goede   2017-03-29  1848  unsigned int OnAction_sa_query(struct adapter *padapter, union recv_frame *precv_frame)
554c0a3abf216c Hans de Goede   2017-03-29  1849  {
554c0a3abf216c Hans de Goede   2017-03-29  1850  	u8 *pframe = precv_frame->u.hdr.rx_data;
554c0a3abf216c Hans de Goede   2017-03-29 @1851  	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
554c0a3abf216c Hans de Goede   2017-03-29  1852  	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
554c0a3abf216c Hans de Goede   2017-03-29  1853  	unsigned short tid;
554c0a3abf216c Hans de Goede   2017-03-29  1854  
554c0a3abf216c Hans de Goede   2017-03-29  1855  	switch (pframe[WLAN_HDR_A3_LEN+1]) {
554c0a3abf216c Hans de Goede   2017-03-29  1856  	case 0: /* SA Query req */
554c0a3abf216c Hans de Goede   2017-03-29  1857  		memcpy(&tid, &pframe[WLAN_HDR_A3_LEN+2], sizeof(unsigned short));
554c0a3abf216c Hans de Goede   2017-03-29  1858  		issue_action_SA_Query(padapter, GetAddr2Ptr(pframe), 1, tid);
554c0a3abf216c Hans de Goede   2017-03-29  1859  		break;
554c0a3abf216c Hans de Goede   2017-03-29  1860  
554c0a3abf216c Hans de Goede   2017-03-29  1861  	case 1: /* SA Query rsp */
8fa7292fee5c52 Thomas Gleixner 2025-04-05  1862  		timer_delete_sync(&pmlmeext->sa_query_timer);
554c0a3abf216c Hans de Goede   2017-03-29  1863  		break;
554c0a3abf216c Hans de Goede   2017-03-29  1864  	default:
554c0a3abf216c Hans de Goede   2017-03-29  1865  		break;
554c0a3abf216c Hans de Goede   2017-03-29  1866  	}
554c0a3abf216c Hans de Goede   2017-03-29  1867  	return _SUCCESS;
554c0a3abf216c Hans de Goede   2017-03-29  1868  }
554c0a3abf216c Hans de Goede   2017-03-29  1869  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
