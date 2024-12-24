Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608E71D89FE;
	Tue, 24 Dec 2024 16:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735059142; cv=none; b=sD7HgA8UOyY8QGwZZEYzF3Gr4PNDTMQKWVfUhZYeFDEEyfngxd7BHM3gnmtmQWMMAtQuzDJb7XJxnYBDGxFmODiXA0n+Ek2ShslQHKWM2Qs720fLRWdIgjaW3pjqq1pfPzLcJec8P2GP3smJ3wRrQ7exW9AANg7V6HdV1IkH3VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735059142; c=relaxed/simple;
	bh=Xiy95Bg/zDApQ8v5g8I2W7fl2ycrxRwkKRdmziiZBmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TeKuf6xkFHF5AObC6bOhC2KSlATnIqIJ9j23JdsUvMXuiWY6mX8AOoRmMtYKo1bP9rbaTsR+aX/bjGxricSIJohLFT+wkXe2hJhd7DIH2kGMDPjr4bzdcBl7kRJUZEQoEUWsS1D82YI1WncG7luycfbZt67W2w3Nex9fmoUgd5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SgziVUb4; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SgziVUb4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735059140; x=1766595140;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xiy95Bg/zDApQ8v5g8I2W7fl2ycrxRwkKRdmziiZBmk=;
  b=SgziVUb46b6ZbOULawp6iJV7UDB86d0z2ckYPXjZjmBT51pvcFsH3yUB
   or0pqtkfwIvnEQBN4Ue6JbgWrsTigMvBzo9k77OCINkoxP9BC9V6H10Sb
   MKUtSwacknvKsGOHcWf1ThMZoXi9Lw02qJGI93M0g97lpo7c2qwj/VRat
   5AkY56BqO51FPLgFk+RnYcxLwr6c/n1u4d+odw7ak3e5FTKe/zykh3T95
   u90QBK6LO+m+eybFqW9kjnyG1s5oP4ETcPi2p64IC3A0eLlP9mtJAONTG
   8L3cSKq9g+USf4tAVhBcYBj8dIIQR+iUkGYz9nwVSx2ZKckd405xrTG8W
   w==;
X-CSE-ConnectionGUID: 6KinpzSVR5OhHCuLHykseA==
X-CSE-MsgGUID: Ag4lIVqJQ5Wil6HvPCZu4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="34804019"
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="34804019"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 08:52:20 -0800
X-CSE-ConnectionGUID: srDiq7g7QJSgVkYp6bXT1A==
X-CSE-MsgGUID: 2zdFszxLQpiu4pqEkhmBFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="104375838"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Dec 2024 08:52:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQ88l-0001It-1W;
	Tue, 24 Dec 2024 16:52:15 +0000
Date: Wed, 25 Dec 2024 00:51:37 +0800
From: kernel test robot <lkp@intel.com>
To: Atharva Tiwari <evepolonium@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, evepolonium@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Meir Elisha <meir6264@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Dan Carpenter <error27@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix network selection and A-MPDU
 reordering in rtw_mlme.c
Message-ID: <202412250035.fWv25gIa-lkp@intel.com>
References: <20241224072754.2352-1-evepolonium@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224072754.2352-1-evepolonium@gmail.com>

Hi Atharva,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Atharva-Tiwari/staging-rtl8723bs-fix-network-selection-and-A-MPDU-reordering-in-rtw_mlme-c/20241224-152918
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20241224072754.2352-1-evepolonium%40gmail.com
patch subject: [PATCH] staging: rtl8723bs: fix network selection and A-MPDU reordering in rtw_mlme.c
config: csky-randconfig-001-20241224 (https://download.01.org/0day-ci/archive/20241225/202412250035.fWv25gIa-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241225/202412250035.fWv25gIa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412250035.fWv25gIa-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/rtl8723bs/core/rtw_mlme.c: In function 'rtw_joinbss_update_stainfo':
>> drivers/staging/rtl8723bs/core/rtw_mlme.c:1005:21: error: implicit declaration of function 'rtw_check_ap_supports_ampdu' [-Wimplicit-function-declaration]
    1005 |                 if (rtw_check_ap_supports_ampdu(pnetwork)) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/rtw_check_ap_supports_ampdu +1005 drivers/staging/rtl8723bs/core/rtw_mlme.c

   946	
   947	static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, struct wlan_network *pnetwork)
   948	{
   949		int i;
   950		struct sta_info *bmc_sta, *psta = NULL;
   951		struct recv_reorder_ctrl *preorder_ctrl;
   952		struct sta_priv *pstapriv = &padapter->stapriv;
   953		struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
   954	
   955		psta = rtw_get_stainfo(pstapriv, pnetwork->network.mac_address);
   956		if (!psta)
   957			psta = rtw_alloc_stainfo(pstapriv, pnetwork->network.mac_address);
   958	
   959		if (psta) { /* update ptarget_sta */
   960	
   961			psta->aid  = pnetwork->join_res;
   962	
   963			update_sta_info(padapter, psta);
   964	
   965			/* update station supportRate */
   966			psta->bssratelen = rtw_get_rateset_len(pnetwork->network.supported_rates);
   967			memcpy(psta->bssrateset, pnetwork->network.supported_rates, psta->bssratelen);
   968			rtw_hal_update_sta_rate_mask(padapter, psta);
   969	
   970			psta->wireless_mode = pmlmeext->cur_wireless_mode;
   971			psta->raid = networktype_to_raid_ex(padapter, psta);
   972	
   973			/* sta mode */
   974			rtw_hal_set_odm_var(padapter, HAL_ODM_STA_INFO, psta, true);
   975	
   976			/* security related */
   977			if (padapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) {
   978				padapter->securitypriv.binstallGrpkey = false;
   979				padapter->securitypriv.busetkipkey = false;
   980				padapter->securitypriv.bgrpkey_handshake = false;
   981	
   982				psta->ieee8021x_blocked = true;
   983				psta->dot118021XPrivacy = padapter->securitypriv.dot11PrivacyAlgrthm;
   984	
   985				memset((u8 *)&psta->dot118021x_UncstKey, 0, sizeof(union Keytype));
   986	
   987				memset((u8 *)&psta->dot11tkiprxmickey, 0, sizeof(union Keytype));
   988				memset((u8 *)&psta->dot11tkiptxmickey, 0, sizeof(union Keytype));
   989	
   990				memset((u8 *)&psta->dot11txpn, 0, sizeof(union pn48));
   991				psta->dot11txpn.val = psta->dot11txpn.val + 1;
   992				memset((u8 *)&psta->dot11wtxpn, 0, sizeof(union pn48));
   993				memset((u8 *)&psta->dot11rxpn, 0, sizeof(union pn48));
   994			}
   995	
   996			/* When doing the WPS, the wps_ie_len won't equal to 0 */
   997			/* And the Wi-Fi driver shouldn't allow the data packet to be transmitted. */
   998			if (padapter->securitypriv.wps_ie_len != 0) {
   999				psta->ieee8021x_blocked = true;
  1000				padapter->securitypriv.wps_ie_len = 0;
  1001			}
  1002	
  1003			/* for A-MPDU Rx reordering buffer control for bmc_sta & sta_info */
  1004			/* if A-MPDU Rx is enabled, resetting  rx_ordering_ctrl wstart_b(indicate_seq) to default value = 0xffff */
> 1005			if (rtw_check_ap_supports_ampdu(pnetwork)) {
  1006				for (i = 0; i < 16 ; i++) {
  1007					preorder_ctrl = &psta->recvreorder_ctrl[i];
  1008					preorder_ctrl->enable = true; /* Enable A-MPDU reordering */
  1009					preorder_ctrl->indicate_seq = 0; /* Starting sequence number */
  1010					preorder_ctrl->wend_b = 0xffff;
  1011					preorder_ctrl->wsize_b = 64;/* max_ampdu_sz;ex. 32(kbytes) -> wsize_b =32 */
  1012				}
  1013			} else {
  1014				for (i = 0; i < 16; i++) {
  1015					preorder_ctrl = &psta->recvreorder_ctrl[i];
  1016					preorder_ctrl->enable = false;
  1017					preorder_ctrl->indicate_seq = 0xffff;
  1018					preorder_ctrl->wend_b = 0xffff;
  1019					preorder_ctrl->wsize_b = 64;  /* max_ampdu_sz; adjust as needed */
  1020				}
  1021			}
  1022			bmc_sta = rtw_get_bcmc_stainfo(padapter);
  1023			if (bmc_sta) {
  1024				for (i = 0; i < 16 ; i++) {
  1025					preorder_ctrl = &bmc_sta->recvreorder_ctrl[i];
  1026					preorder_ctrl->enable = false;
  1027					preorder_ctrl->indicate_seq = 0xffff;
  1028					preorder_ctrl->wend_b = 0xffff;
  1029					preorder_ctrl->wsize_b = 64;/* max_ampdu_sz;ex. 32(kbytes) -> wsize_b =32 */
  1030				}
  1031			}
  1032		}
  1033	
  1034		return psta;
  1035	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
