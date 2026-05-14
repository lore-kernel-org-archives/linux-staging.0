Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B4431ED7D;
	Thu, 14 May 2026 01:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778722747; cv=none; b=lj2kg1KxJLk1DPCfUvQ0qxYCK9lAHInFj1+f2yIehhc4QeltprhYjgKzZQGGTlNFCzO9jNEHYk5/NrLBDC8CDnRZ7/ctecGsO1WBN8oaNwJDp1CnRJT/Oayk3qsRSl5L98tuhvDBpdDyRgty3nBgef1ZnA2xhQLqahtYb+qzSsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778722747; c=relaxed/simple;
	bh=jYrKEV/2r57K+02pEHriwg5J0TZ/CE4HZ9NiWnHWToE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cGBzU/aiA/VdutAVUr8QiU4y9qUTL9wJ7Waiv4lBIg7YsJ1jB3N9UCPENFOn8qpfhDz9do5beQrzveBsGo765/Sk1P3hbhvJCkf7Tmh+cm4BmbJqaUn/b/tBImscFnHWzW7Ssoe3ADHooTsYN3yH6FcYWv2HmclYfWMUZCtDeUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mfm7r+Hj; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mfm7r+Hj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778722744; x=1810258744;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jYrKEV/2r57K+02pEHriwg5J0TZ/CE4HZ9NiWnHWToE=;
  b=Mfm7r+HjJT7995p1hcF5R9FBd/DSIvh/7isSt2C5mmAZtxhByDtyV6Tx
   YtSG7qVQNqJMu+z8nNDPckeqkMHx1CaCzPuQoSUFuC58zGRCUXop4Sszj
   fIrA2iOd7WLR43TBQzlvNLYXRaZ2sIkYkB7HBIwL32V9mvUEy10h1Bf8Q
   e3LG0fvrV83FHQCCwHrMvaEMlDrbEOVaTqYMaycal/iAnD1M/Mwe57QCC
   eGzjnuQdBMb3YNoid4MsoifWDccS6oHIFw4/5NWOFuapnAcsIGz2TP2NC
   yUPBRfKNXZ+5NiJESws8J18jOPu96xFx8/hhAgo8uVHMQEi0gQiscEz8n
   A==;
X-CSE-ConnectionGUID: QMMbHXGZQKORR9tpck1qKA==
X-CSE-MsgGUID: P0Q+FwmeSTWeF7C/qCQ/7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79641202"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="79641202"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 18:39:03 -0700
X-CSE-ConnectionGUID: HCz3mVAgQN2pM/qHCukjTA==
X-CSE-MsgGUID: 1BrObB40Rg6PI9ZnOugQbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="233808712"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 May 2026 18:39:01 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNL2Q-000000005Xr-1Nef;
	Thu, 14 May 2026 01:38:58 +0000
Date: Thu, 14 May 2026 09:38:01 +0800
From: kernel test robot <lkp@intel.com>
To: Ashwin Gundarapu <linuxuser509@zohomail.in>,
	gregkh <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-staging <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v7] staging: rtl8723bs: remove unnecessary braces in
 rtw_mlme.c
Message-ID: <202605140922.bRAAESNB-lkp@intel.com>
References: <19e1c077ee4.2272059b46402.3689085453526247548@zohomail.in>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19e1c077ee4.2272059b46402.3689085453526247548@zohomail.in>

Hi Ashwin,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Ashwin-Gundarapu/staging-rtl8723bs-remove-unnecessary-braces-in-rtw_mlme-c/20260514-040753
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/19e1c077ee4.2272059b46402.3689085453526247548%40zohomail.in
patch subject: [PATCH v7] staging: rtl8723bs: remove unnecessary braces in rtw_mlme.c
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260514/202605140922.bRAAESNB-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140922.bRAAESNB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140922.bRAAESNB-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/staging/rtl8723bs/core/rtw_mlme.c: In function 'rtw_update_scanned_network':
>> drivers/staging/rtl8723bs/core/rtw_mlme.c:567:6: error: static declaration of 'rtw_add_network' follows non-static declaration
     567 | void rtw_add_network(struct adapter *adapter, struct wlan_bssid_ex *pnetwork)
         |      ^~~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/core/rtw_mlme.c:566:6: note: previous declaration of 'rtw_add_network' with type 'void(struct adapter *, struct wlan_bssid_ex *)'
     566 | void rtw_add_network(struct adapter *adapter, struct wlan_bssid_ex *pnetwork);
         |      ^~~~~~~~~~~~~~~
>> drivers/staging/rtl8723bs/core/rtw_mlme.c:581:13: error: invalid storage class for function 'rtw_is_desired_network'
     581 | static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwork)
         |             ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/rtl8723bs/core/rtw_mlme.c:781:13: error: invalid storage class for function 'free_scanqueue'
     781 | static void free_scanqueue(struct       mlme_priv *pmlmepriv)
         |             ^~~~~~~~~~~~~~
>> drivers/staging/rtl8723bs/core/rtw_mlme.c:804:13: error: invalid storage class for function 'find_network'
     804 | static void find_network(struct adapter *adapter)
         |             ^~~~~~~~~~~~
>> drivers/staging/rtl8723bs/core/rtw_mlme.c:941:25: error: invalid storage class for function 'rtw_joinbss_update_stainfo'
     941 | static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, struct wlan_network *pnetwork)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/rtl8723bs/core/rtw_mlme.c:1025:13: error: invalid storage class for function 'rtw_joinbss_update_network'
    1025 | static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_network *ptarget_wlan, struct wlan_network  *pnetwork)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/rtl8723bs/core/rtw_mlme.c:1568:13: error: invalid storage class for function 'rtw_auto_scan_handler'
    1568 | static void rtw_auto_scan_handler(struct adapter *padapter)
         |             ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/rtl8723bs/core/rtw_mlme.c:1655:12: error: invalid storage class for function 'rtw_check_roaming_candidate'
    1655 | static int rtw_check_roaming_candidate(struct mlme_priv *mlme
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/rtl8723bs/core/rtw_mlme.c:1736:12: error: invalid storage class for function 'rtw_check_join_candidate'
    1736 | static int rtw_check_join_candidate(struct mlme_priv *mlme
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/rtl8723bs/core/rtw_mlme.c:1984:12: error: invalid storage class for function 'SecIsInPMKIDList'
    1984 | static int SecIsInPMKIDList(struct adapter *Adapter, u8 *bssid)
         |            ^~~~~~~~~~~~~~~~
>> drivers/staging/rtl8723bs/core/rtw_mlme.c:2004:12: error: invalid storage class for function 'rtw_append_pmkid'
    2004 | static int rtw_append_pmkid(struct adapter *Adapter, int iEntry, u8 *ie, uint ie_len)
         |            ^~~~~~~~~~~~~~~~
>> drivers/staging/rtl8723bs/core/rtw_mlme.c:2021:13: error: invalid storage class for function 'rtw_report_sec_ie'
    2021 | static void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
         |             ^~~~~~~~~~~~~~~~~
>> drivers/staging/rtl8723bs/core/rtw_mlme.c:2569:1: error: expected declaration or statement at end of input
    2569 | }
         | ^
   drivers/staging/rtl8723bs/core/rtw_mlme.c: At top level:
>> drivers/staging/rtl8723bs/core/rtw_mlme.c:2558:6: warning: 'rtw_linked_check' defined but not used [-Wunused-function]
    2558 | bool rtw_linked_check(struct adapter *padapter)
         |      ^~~~~~~~~~~~~~~~
>> drivers/staging/rtl8723bs/core/rtw_mlme.c:2538:6: warning: '_rtw_roaming' defined but not used [-Wunused-function]
    2538 | void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
         |      ^~~~~~~~~~~~
>> drivers/staging/rtl8723bs/core/rtw_mlme.c:2529:6: warning: 'rtw_roaming' defined but not used [-Wunused-function]
    2529 | void rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
         |      ^~~~~~~~~~~
>> drivers/staging/rtl8723bs/core/rtw_mlme.c:2499:6: warning: 'rtw_append_exented_cap' defined but not used [-Wunused-function]
    2499 | void rtw_append_exented_cap(struct adapter *padapter, u8 *out_ie, uint *pout_len)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/rtl8723bs/core/rtw_mlme.c:2462:6: warning: 'rtw_issue_addbareq_cmd' defined but not used [-Wunused-function]
    2462 | void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitframe)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/rtl8723bs/core/rtw_mlme.c:2378:6: warning: 'rtw_update_ht_cap' defined but not used [-Wunused-function]
    2378 | void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channel)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/staging/rtl8723bs/core/rtw_mlme.c:2255:14: warning: 'rtw_restructure_ht_ie' defined but not used [-Wunused-function]
    2255 | unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_ie, uint in_len, uint *pout_len, u8 channel)
         |              ^~~~~~~~~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/core/rtw_mlme.c:2240:6: warning: 'rtw_build_wmm_ie_ht' defined but not used [-Wunused-function]
    2240 | void rtw_build_wmm_ie_ht(struct adapter *padapter, u8 *out_ie, uint *pout_len)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/core/rtw_mlme.c:2187:6: warning: 'rtw_ht_use_default_setting' defined but not used [-Wunused-function]
    2187 | void rtw_ht_use_default_setting(struct adapter *padapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/core/rtw_mlme.c:2158:6: warning: 'rtw_joinbss_reset' defined but not used [-Wunused-function]
    2158 | void rtw_joinbss_reset(struct adapter *padapter)
         |      ^~~~~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/core/rtw_mlme.c:2108:6: warning: 'rtw_update_registrypriv_dev_network' defined but not used [-Wunused-function]
    2108 | void rtw_update_registrypriv_dev_network(struct adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/core/rtw_mlme.c:2093:6: warning: 'rtw_init_registrypriv_dev_network' defined but not used [-Wunused-function]
    2093 | void rtw_init_registrypriv_dev_network(struct adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/core/rtw_mlme.c:2054:12: warning: 'rtw_restruct_sec_ie' defined but not used [-Wunused-function]
    2054 | signed int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_len)
         |            ^~~~~~~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/core/rtw_mlme.c:1944:5: warning: 'rtw_restruct_wmm_ie' defined but not used [-Wunused-function]
    1944 | int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_len, uint initial_out_len)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/core/rtw_mlme.c:1869:12: warning: 'rtw_set_key' defined but not used [-Wunused-function]
    1869 | signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecuritypriv, signed int keyid, u8 set_tx, bool enqueue)
         |            ^~~~~~~~~~~
   drivers/staging/rtl8723bs/core/rtw_mlme.c:1833:12: warning: 'rtw_set_auth' defined but not used [-Wunused-function]
    1833 | signed int rtw_set_auth(struct adapter *adapter, struct security_priv *psecuritypriv)
         |            ^~~~~~~~~~~~
   drivers/staging/rtl8723bs/core/rtw_mlme.c:1782:5: warning: 'rtw_select_and_join_from_scanned_queue' defined but not used [-Wunused-function]
    1782 | int rtw_select_and_join_from_scanned_queue(struct mlme_priv *pmlmepriv)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/core/rtw_mlme.c:1691:5: warning: 'rtw_select_roaming_candidate' defined but not used [-Wunused-function]
    1691 | int rtw_select_roaming_candidate(struct mlme_priv *mlme)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/core/rtw_mlme.c:1642:6: warning: 'rtw_set_scan_deny' defined but not used [-Wunused-function]
    1642 | void rtw_set_scan_deny(struct adapter *adapter, u32 ms)
         |      ^~~~~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/core/rtw_mlme.c:1591:6: warning: 'rtw_dynamic_check_timer_handler' defined but not used [-Wunused-function]
    1591 | void rtw_dynamic_check_timer_handler(struct adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/core/rtw_mlme.c:1536:6: warning: 'rtw_scan_timeout_handler' defined but not used [-Wunused-function]
    1536 | void rtw_scan_timeout_handler(struct timer_list *t)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/core/rtw_mlme.c:1493:6: warning: '_rtw_join_timeout_handler' defined but not used [-Wunused-function]
    1493 | void _rtw_join_timeout_handler(struct timer_list *t)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/core/rtw_mlme.c:1484:6: warning: 'rtw_wmm_event_callback' defined but not used [-Wunused-function]
    1484 | void rtw_wmm_event_callback(struct adapter *padapter, u8 *pbuf)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/core/rtw_mlme.c:1475:6: warning: 'rtw_cpwm_event_callback' defined but not used [-Wunused-function]
    1475 | void rtw_cpwm_event_callback(struct adapter *padapter, u8 *pbuf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/core/rtw_mlme.c:1358:6: warning: 'rtw_stadel_event_callback' defined but not used [-Wunused-function]
    1358 | void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/core/rtw_mlme.c:1267:6: warning: 'rtw_stassoc_event_callback' defined but not used [-Wunused-function]
    1267 | void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/core/rtw_mlme.c:1246:6: warning: 'rtw_joinbss_event_callback' defined but not used [-Wunused-function]
    1246 | void rtw_joinbss_event_callback(struct adapter *adapter, u8 *pbuf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/core/rtw_mlme.c:1138:6: warning: 'rtw_joinbss_event_prehandle' defined but not used [-Wunused-function]
    1138 | void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/core/rtw_mlme.c:919:6: warning: 'rtw_scan_abort' defined but not used [-Wunused-function]
     919 | void rtw_scan_abort(struct adapter *adapter)
         |      ^~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/core/rtw_mlme.c:777:6: warning: 'rtw_fwdbg_event_callback' defined but not used [-Wunused-function]
     777 | void rtw_fwdbg_event_callback(struct adapter *adapter, u8 *pbuf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/core/rtw_mlme.c:773:6: warning: 'rtw_dummy_event_callback' defined but not used [-Wunused-function]
     773 | void rtw_dummy_event_callback(struct adapter *adapter, u8 *pbuf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/core/rtw_mlme.c:674:6: warning: 'rtw_surveydone_event_callback' defined but not used [-Wunused-function]
     674 | void rtw_surveydone_event_callback(struct adapter       *adapter, u8 *pbuf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/core/rtw_mlme.c:631:6: warning: 'rtw_survey_event_callback' defined but not used [-Wunused-function]
     631 | void rtw_survey_event_callback(struct adapter   *adapter, u8 *pbuf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/core/rtw_mlme.c:627:6: warning: 'rtw_atimdone_event_callback' defined but not used [-Wunused-function]
     627 | void rtw_atimdone_event_callback(struct adapter *adapter, u8 *pbuf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/rtw_add_network +567 drivers/staging/rtl8723bs/core/rtw_mlme.c

554c0a3abf216c Hans de Goede              2017-03-29  565  
554c0a3abf216c Hans de Goede              2017-03-29 @566  void rtw_add_network(struct adapter *adapter, struct wlan_bssid_ex *pnetwork);
554c0a3abf216c Hans de Goede              2017-03-29 @567  void rtw_add_network(struct adapter *adapter, struct wlan_bssid_ex *pnetwork)
554c0a3abf216c Hans de Goede              2017-03-29  568  {
554c0a3abf216c Hans de Goede              2017-03-29  569  	update_current_network(adapter, pnetwork);
554c0a3abf216c Hans de Goede              2017-03-29  570  	rtw_update_scanned_network(adapter, pnetwork);
554c0a3abf216c Hans de Goede              2017-03-29  571  }
554c0a3abf216c Hans de Goede              2017-03-29  572  
08a2e17462dc3b Zhuoheng Li                2025-08-05  573  /* select the desired network based on the capability of the (i)bss.
08a2e17462dc3b Zhuoheng Li                2025-08-05  574   * check items:
08a2e17462dc3b Zhuoheng Li                2025-08-05  575   * (1) security
08a2e17462dc3b Zhuoheng Li                2025-08-05  576   * (2) network_type
08a2e17462dc3b Zhuoheng Li                2025-08-05  577   * (3) WMM
08a2e17462dc3b Zhuoheng Li                2025-08-05  578   * (4) HT
08a2e17462dc3b Zhuoheng Li                2025-08-05  579   * (5) others
08a2e17462dc3b Zhuoheng Li                2025-08-05  580   */
c776297d23c045 Nikolay Kulikov            2026-03-09 @581  static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwork)
554c0a3abf216c Hans de Goede              2017-03-29  582  {
554c0a3abf216c Hans de Goede              2017-03-29  583  	struct security_priv *psecuritypriv = &adapter->securitypriv;
554c0a3abf216c Hans de Goede              2017-03-29  584  	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
554c0a3abf216c Hans de Goede              2017-03-29  585  	u32 desired_encmode;
554c0a3abf216c Hans de Goede              2017-03-29  586  	u32 privacy;
554c0a3abf216c Hans de Goede              2017-03-29  587  	uint wps_ielen;
c776297d23c045 Nikolay Kulikov            2026-03-09  588  	bool bselected = true;
554c0a3abf216c Hans de Goede              2017-03-29  589  
554c0a3abf216c Hans de Goede              2017-03-29  590  	desired_encmode = psecuritypriv->ndisencryptstatus;
d3fcee1b78a533 Fabio Aiuto                2021-07-21  591  	privacy = pnetwork->network.privacy;
554c0a3abf216c Hans de Goede              2017-03-29  592  
554c0a3abf216c Hans de Goede              2017-03-29  593  	if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS)) {
d3fcee1b78a533 Fabio Aiuto                2021-07-21  594  		if (rtw_get_wps_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, pnetwork->network.ie_length - _FIXED_IE_LENGTH_, NULL, &wps_ielen))
554c0a3abf216c Hans de Goede              2017-03-29  595  			return true;
554c0a3abf216c Hans de Goede              2017-03-29  596  		else
554c0a3abf216c Hans de Goede              2017-03-29  597  			return false;
554c0a3abf216c Hans de Goede              2017-03-29  598  	}
554c0a3abf216c Hans de Goede              2017-03-29  599  	if (adapter->registrypriv.wifi_spec == 1) { /* for  correct flow of 8021X  to do.... */
554c0a3abf216c Hans de Goede              2017-03-29  600  		u8 *p = NULL;
554c0a3abf216c Hans de Goede              2017-03-29  601  		uint ie_len = 0;
554c0a3abf216c Hans de Goede              2017-03-29  602  
554c0a3abf216c Hans de Goede              2017-03-29  603  		if ((desired_encmode == Ndis802_11EncryptionDisabled) && (privacy != 0))
554c0a3abf216c Hans de Goede              2017-03-29  604  			bselected = false;
554c0a3abf216c Hans de Goede              2017-03-29  605  
554c0a3abf216c Hans de Goede              2017-03-29  606  		if (psecuritypriv->ndisauthtype == Ndis802_11AuthModeWPA2PSK) {
d3fcee1b78a533 Fabio Aiuto                2021-07-21  607  			p = rtw_get_ie(pnetwork->network.ies + _BEACON_IE_OFFSET_, WLAN_EID_RSN, &ie_len, (pnetwork->network.ie_length - _BEACON_IE_OFFSET_));
92f87db5a964d4 Wambui Karuga              2019-10-10  608  			if (p && ie_len > 0)
554c0a3abf216c Hans de Goede              2017-03-29  609  				bselected = true;
92f87db5a964d4 Wambui Karuga              2019-10-10  610  			else
554c0a3abf216c Hans de Goede              2017-03-29  611  				bselected = false;
554c0a3abf216c Hans de Goede              2017-03-29  612  		}
554c0a3abf216c Hans de Goede              2017-03-29  613  	}
554c0a3abf216c Hans de Goede              2017-03-29  614  
709c8e49b51c37 Fabio Aiuto                2021-04-07  615  	if ((desired_encmode != Ndis802_11EncryptionDisabled) && (privacy == 0))
554c0a3abf216c Hans de Goede              2017-03-29  616  		bselected = false;
554c0a3abf216c Hans de Goede              2017-03-29  617  
2c1312898d0362 Michael Huang              2026-01-26  618  	if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
d3fcee1b78a533 Fabio Aiuto                2021-07-21  619  		if (pnetwork->network.infrastructure_mode != pmlmepriv->cur_network.network.infrastructure_mode)
554c0a3abf216c Hans de Goede              2017-03-29  620  			bselected = false;
554c0a3abf216c Hans de Goede              2017-03-29  621  	}
554c0a3abf216c Hans de Goede              2017-03-29  622  
554c0a3abf216c Hans de Goede              2017-03-29  623  	return bselected;
554c0a3abf216c Hans de Goede              2017-03-29  624  }
554c0a3abf216c Hans de Goede              2017-03-29  625  
554c0a3abf216c Hans de Goede              2017-03-29  626  /* TODO: Perry : For Power Management */
554c0a3abf216c Hans de Goede              2017-03-29 @627  void rtw_atimdone_event_callback(struct adapter	*adapter, u8 *pbuf)
554c0a3abf216c Hans de Goede              2017-03-29  628  {
554c0a3abf216c Hans de Goede              2017-03-29  629  }
554c0a3abf216c Hans de Goede              2017-03-29  630  
554c0a3abf216c Hans de Goede              2017-03-29 @631  void rtw_survey_event_callback(struct adapter	*adapter, u8 *pbuf)
554c0a3abf216c Hans de Goede              2017-03-29  632  {
554c0a3abf216c Hans de Goede              2017-03-29  633  	u32 len;
554c0a3abf216c Hans de Goede              2017-03-29  634  	struct wlan_bssid_ex *pnetwork;
400a23b2e0ca93 Vivek BalachandharTN       2025-07-20  635  	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
554c0a3abf216c Hans de Goede              2017-03-29  636  
554c0a3abf216c Hans de Goede              2017-03-29  637  	pnetwork = (struct wlan_bssid_ex *)pbuf;
554c0a3abf216c Hans de Goede              2017-03-29  638  
554c0a3abf216c Hans de Goede              2017-03-29  639  	len = get_wlan_bssid_ex_sz(pnetwork);
a8f74a8261111e Fabio Aiuto                2021-04-04  640  	if (len > (sizeof(struct wlan_bssid_ex)))
554c0a3abf216c Hans de Goede              2017-03-29  641  		return;
554c0a3abf216c Hans de Goede              2017-03-29  642  
554c0a3abf216c Hans de Goede              2017-03-29  643  	spin_lock_bh(&pmlmepriv->lock);
554c0a3abf216c Hans de Goede              2017-03-29  644  
554c0a3abf216c Hans de Goede              2017-03-29  645  	/*  update IBSS_network 's timestamp */
2c1312898d0362 Michael Huang              2026-01-26  646  	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
400a23b2e0ca93 Vivek BalachandharTN       2025-07-20  647  		if (!memcmp(&pmlmepriv->cur_network.network.mac_address, pnetwork->mac_address, ETH_ALEN)) {
554c0a3abf216c Hans de Goede              2017-03-29  648  			struct wlan_network *ibss_wlan = NULL;
554c0a3abf216c Hans de Goede              2017-03-29  649  
d3fcee1b78a533 Fabio Aiuto                2021-07-21  650  			memcpy(pmlmepriv->cur_network.network.ies, pnetwork->ies, 8);
400a23b2e0ca93 Vivek BalachandharTN       2025-07-20  651  			spin_lock_bh(&pmlmepriv->scanned_queue.lock);
d3fcee1b78a533 Fabio Aiuto                2021-07-21  652  			ibss_wlan = rtw_find_network(&pmlmepriv->scanned_queue,  pnetwork->mac_address);
554c0a3abf216c Hans de Goede              2017-03-29  653  			if (ibss_wlan) {
d3fcee1b78a533 Fabio Aiuto                2021-07-21  654  				memcpy(ibss_wlan->network.ies, pnetwork->ies, 8);
400a23b2e0ca93 Vivek BalachandharTN       2025-07-20  655  				spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
554c0a3abf216c Hans de Goede              2017-03-29  656  				goto exit;
554c0a3abf216c Hans de Goede              2017-03-29  657  			}
400a23b2e0ca93 Vivek BalachandharTN       2025-07-20  658  			spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
554c0a3abf216c Hans de Goede              2017-03-29  659  		}
554c0a3abf216c Hans de Goede              2017-03-29  660  	}
554c0a3abf216c Hans de Goede              2017-03-29  661  
554c0a3abf216c Hans de Goede              2017-03-29  662  	/*  lock pmlmepriv->lock when you accessing network_q */
2c1312898d0362 Michael Huang              2026-01-26  663  	if (!check_fwstate(pmlmepriv, _FW_UNDER_LINKING)) {
6994aa430368ed Fabio Aiuto                2021-07-21  664  		if (pnetwork->ssid.ssid[0] == 0)
6994aa430368ed Fabio Aiuto                2021-07-21  665  			pnetwork->ssid.ssid_length = 0;
554c0a3abf216c Hans de Goede              2017-03-29  666  		rtw_add_network(adapter, pnetwork);
554c0a3abf216c Hans de Goede              2017-03-29  667  	}
554c0a3abf216c Hans de Goede              2017-03-29  668  
554c0a3abf216c Hans de Goede              2017-03-29  669  exit:
554c0a3abf216c Hans de Goede              2017-03-29  670  
554c0a3abf216c Hans de Goede              2017-03-29  671  	spin_unlock_bh(&pmlmepriv->lock);
554c0a3abf216c Hans de Goede              2017-03-29  672  }
554c0a3abf216c Hans de Goede              2017-03-29  673  
554c0a3abf216c Hans de Goede              2017-03-29 @674  void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
554c0a3abf216c Hans de Goede              2017-03-29  675  {
400a23b2e0ca93 Vivek BalachandharTN       2025-07-20  676  	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
554c0a3abf216c Hans de Goede              2017-03-29  677  
554c0a3abf216c Hans de Goede              2017-03-29  678  	spin_lock_bh(&pmlmepriv->lock);
554c0a3abf216c Hans de Goede              2017-03-29  679  	if (pmlmepriv->wps_probe_req_ie) {
554c0a3abf216c Hans de Goede              2017-03-29  680  		pmlmepriv->wps_probe_req_ie_len = 0;
554c0a3abf216c Hans de Goede              2017-03-29  681  		kfree(pmlmepriv->wps_probe_req_ie);
554c0a3abf216c Hans de Goede              2017-03-29  682  		pmlmepriv->wps_probe_req_ie = NULL;
554c0a3abf216c Hans de Goede              2017-03-29  683  	}
554c0a3abf216c Hans de Goede              2017-03-29  684  
554c0a3abf216c Hans de Goede              2017-03-29  685  	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY)) {
cc7ad0d77b51c8 Duoming Zhou               2022-04-09  686  		spin_unlock_bh(&pmlmepriv->lock);
8fa7292fee5c52 Thomas Gleixner            2025-04-05  687  		timer_delete_sync(&pmlmepriv->scan_to_timer);
cc7ad0d77b51c8 Duoming Zhou               2022-04-09  688  		spin_lock_bh(&pmlmepriv->lock);
554c0a3abf216c Hans de Goede              2017-03-29  689  		_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY);
554c0a3abf216c Hans de Goede              2017-03-29  690  	}
554c0a3abf216c Hans de Goede              2017-03-29  691  
554c0a3abf216c Hans de Goede              2017-03-29  692  	rtw_set_signal_stat_timer(&adapter->recvpriv);
554c0a3abf216c Hans de Goede              2017-03-29  693  
e7e12d6650ec16 Wambui Karuga              2019-10-10  694  	if (pmlmepriv->to_join) {
2c1312898d0362 Michael Huang              2026-01-26  695  		if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
2c1312898d0362 Michael Huang              2026-01-26  696  			if (!check_fwstate(pmlmepriv, _FW_LINKED)) {
554c0a3abf216c Hans de Goede              2017-03-29  697  				set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
554c0a3abf216c Hans de Goede              2017-03-29  698  
554c0a3abf216c Hans de Goede              2017-03-29  699  				if (rtw_select_and_join_from_scanned_queue(pmlmepriv) == _SUCCESS) {
554c0a3abf216c Hans de Goede              2017-03-29  700  					_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
554c0a3abf216c Hans de Goede              2017-03-29  701  				} else {
ecd20f1b1e2f42 Fabio Aiuto                2021-04-04  702  					u8 ret = _SUCCESS;
400a23b2e0ca93 Vivek BalachandharTN       2025-07-20  703  					struct wlan_bssid_ex    *pdev_network = &adapter->registrypriv.dev_network;
d3fcee1b78a533 Fabio Aiuto                2021-07-21  704  					u8 *pibss = adapter->registrypriv.dev_network.mac_address;
554c0a3abf216c Hans de Goede              2017-03-29  705  
554c0a3abf216c Hans de Goede              2017-03-29  706  					/* pmlmepriv->fw_state ^= _FW_UNDER_SURVEY;because don't set assoc_timer */
554c0a3abf216c Hans de Goede              2017-03-29  707  					_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY);
554c0a3abf216c Hans de Goede              2017-03-29  708  
d3fcee1b78a533 Fabio Aiuto                2021-07-21  709  					memcpy(&pdev_network->ssid, &pmlmepriv->assoc_ssid, sizeof(struct ndis_802_11_ssid));
554c0a3abf216c Hans de Goede              2017-03-29  710  
554c0a3abf216c Hans de Goede              2017-03-29  711  					rtw_update_registrypriv_dev_network(adapter);
554c0a3abf216c Hans de Goede              2017-03-29  712  					rtw_generate_random_ibss(pibss);
554c0a3abf216c Hans de Goede              2017-03-29  713  
554c0a3abf216c Hans de Goede              2017-03-29  714  					pmlmepriv->fw_state = WIFI_ADHOC_MASTER_STATE;
554c0a3abf216c Hans de Goede              2017-03-29  715  
554c0a3abf216c Hans de Goede              2017-03-29  716  					pmlmepriv->to_join = false;
ecd20f1b1e2f42 Fabio Aiuto                2021-04-04  717  
ecd20f1b1e2f42 Fabio Aiuto                2021-04-04  718  					ret = rtw_createbss_cmd(adapter);
ecd20f1b1e2f42 Fabio Aiuto                2021-04-04  719  					if (ret != _SUCCESS)
ecd20f1b1e2f42 Fabio Aiuto                2021-04-04  720  						goto unlock;
554c0a3abf216c Hans de Goede              2017-03-29  721  				}
554c0a3abf216c Hans de Goede              2017-03-29  722  			}
554c0a3abf216c Hans de Goede              2017-03-29  723  		} else {
554c0a3abf216c Hans de Goede              2017-03-29  724  			int s_ret;
6c7b8ac995d996 Brother Matthew De Angelis 2020-12-05  725  
554c0a3abf216c Hans de Goede              2017-03-29  726  			set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
554c0a3abf216c Hans de Goede              2017-03-29  727  			pmlmepriv->to_join = false;
554c0a3abf216c Hans de Goede              2017-03-29  728  			s_ret = rtw_select_and_join_from_scanned_queue(pmlmepriv);
70eb91dfa2adfd Sevinj Aghayeva            2022-03-30  729  			if (s_ret == _SUCCESS) {
554c0a3abf216c Hans de Goede              2017-03-29  730  				_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
554c0a3abf216c Hans de Goede              2017-03-29  731  			} else if (s_ret == 2) {/* there is no need to wait for join */
554c0a3abf216c Hans de Goede              2017-03-29  732  				_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
554c0a3abf216c Hans de Goede              2017-03-29  733  				rtw_indicate_connect(adapter);
554c0a3abf216c Hans de Goede              2017-03-29  734  			} else {
554c0a3abf216c Hans de Goede              2017-03-29  735  				if (rtw_to_roam(adapter) != 0) {
554c0a3abf216c Hans de Goede              2017-03-29  736  					if (rtw_dec_to_roam(adapter) == 0
554c0a3abf216c Hans de Goede              2017-03-29  737  						|| _SUCCESS != rtw_sitesurvey_cmd(adapter, &pmlmepriv->assoc_ssid, 1, NULL, 0)
554c0a3abf216c Hans de Goede              2017-03-29  738  					) {
554c0a3abf216c Hans de Goede              2017-03-29  739  						rtw_set_to_roam(adapter, 0);
554c0a3abf216c Hans de Goede              2017-03-29  740  						rtw_free_assoc_resources(adapter, 1);
554c0a3abf216c Hans de Goede              2017-03-29  741  						rtw_indicate_disconnect(adapter);
554c0a3abf216c Hans de Goede              2017-03-29  742  					} else {
554c0a3abf216c Hans de Goede              2017-03-29  743  						pmlmepriv->to_join = true;
554c0a3abf216c Hans de Goede              2017-03-29  744  					}
554c0a3abf216c Hans de Goede              2017-03-29  745  				} else
554c0a3abf216c Hans de Goede              2017-03-29  746  					rtw_indicate_disconnect(adapter);
554c0a3abf216c Hans de Goede              2017-03-29  747  
554c0a3abf216c Hans de Goede              2017-03-29  748  				_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
554c0a3abf216c Hans de Goede              2017-03-29  749  			}
554c0a3abf216c Hans de Goede              2017-03-29  750  		}
554c0a3abf216c Hans de Goede              2017-03-29  751  	} else {
554c0a3abf216c Hans de Goede              2017-03-29  752  		if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
554c0a3abf216c Hans de Goede              2017-03-29  753  			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)
554c0a3abf216c Hans de Goede              2017-03-29  754  				&& check_fwstate(pmlmepriv, _FW_LINKED)) {
554c0a3abf216c Hans de Goede              2017-03-29  755  				if (rtw_select_roaming_candidate(pmlmepriv) == _SUCCESS) {
d3fcee1b78a533 Fabio Aiuto                2021-07-21  756  					receive_disconnect(adapter, pmlmepriv->cur_network.network.mac_address
554c0a3abf216c Hans de Goede              2017-03-29  757  						, WLAN_REASON_ACTIVE_ROAM);
554c0a3abf216c Hans de Goede              2017-03-29  758  				}
554c0a3abf216c Hans de Goede              2017-03-29  759  			}
554c0a3abf216c Hans de Goede              2017-03-29  760  		}
554c0a3abf216c Hans de Goede              2017-03-29  761  	}
554c0a3abf216c Hans de Goede              2017-03-29  762  
ecd20f1b1e2f42 Fabio Aiuto                2021-04-04  763  unlock:
554c0a3abf216c Hans de Goede              2017-03-29  764  	spin_unlock_bh(&pmlmepriv->lock);
554c0a3abf216c Hans de Goede              2017-03-29  765  
554c0a3abf216c Hans de Goede              2017-03-29  766  	rtw_os_xmit_schedule(adapter);
554c0a3abf216c Hans de Goede              2017-03-29  767  
554c0a3abf216c Hans de Goede              2017-03-29  768  	rtw_cfg80211_surveydone_event_callback(adapter);
554c0a3abf216c Hans de Goede              2017-03-29  769  
554c0a3abf216c Hans de Goede              2017-03-29  770  	rtw_indicate_scan_done(adapter, false);
554c0a3abf216c Hans de Goede              2017-03-29  771  }
554c0a3abf216c Hans de Goede              2017-03-29  772  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
