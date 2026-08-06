Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85688408617;
	Thu,  6 Aug 2026 22:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786053933; cv=none; b=l1epd1d8NbC9WRts453IE2vrcXTagbBJ9dOr5VOmKkJcf4aNUbUNdJvDPMLUtCDQfOT09BO28+pjJvTRwwCpR5DFToqkpBfm72KOTCoxbfuTllX8hm+VobEH2KiiAMff/nUnulYEjSxX0iaLcENjbYJqTgfM48jWeEau9c7XDxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786053933; c=relaxed/simple;
	bh=cEZwmTbVIkec9Me7xS8nbWS07M1KWtHhzcTLYmoZkLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jaMPVuk/jeaWxOf/qbl3oog7phZBp5hBSk48Ibwkez9aM5wiy4tM+XaJ8d4bto6scXvv0RLCFL8fZ8/EWnMJrMnxAX4tGFzU1/V2ei55JlUHgAuQONE9GWSIezJ1sbiWaunFMgnsLA+RV2wlDDNnAbgV0y0K0reZFgPEfFvUnwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i3hBWdG+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i3hBWdG+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786053932; x=1817589932;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cEZwmTbVIkec9Me7xS8nbWS07M1KWtHhzcTLYmoZkLc=;
  b=i3hBWdG+nHe3H7EjTieb0hbwvNLXbAC5jCHp3NZW0hm8q/VCrt2BtyYE
   E5/vp97XUZbMkcenWRRMbn5ojWCGfs3i2NFvdMbOw9Q7YxexUEZ7Rxcpm
   xuAKkYbhIhq9DyTbVTEsabxRtyLIf7WaBaXZ6jWLTOuOcdXe9tUfoZfPM
   03jxbMJ456wM1/APPtMXfSK15EohmahGhllu26cpdxS5b4Sq1FQqQHfCl
   uq1MzVVN9TIzfoBshFTNMv51xDYkNs5VE9NdJYAhUcKmu32kxPk7qLegm
   mnwdg/OIqgR8WEOxsbA6/2EEC/tAIpfdRPqX2x0wKDcBhLC34fE3G6W2g
   A==;
X-CSE-ConnectionGUID: KkkgJpyNRRKOOAv9LVm3Sw==
X-CSE-MsgGUID: 4b+CQeMxQumqdujOM8NFkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="109454897"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="109454897"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 15:05:31 -0700
X-CSE-ConnectionGUID: G9FHL6TNRoS9tSiyjdy40Q==
X-CSE-MsgGUID: FlhNnfM2Tx2x8mAj7JVgew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="262285122"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Aug 2026 15:05:30 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ws6DP-00000000GN9-14PQ;
	Thu, 06 Aug 2026 22:05:27 +0000
Date: Fri, 7 Aug 2026 06:04:45 +0800
From: kernel test robot <lkp@intel.com>
To: Mirza Ishan Beg <seedandsyntax@gmail.com>, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, nikolayof23@gmail.com,
	seedandsyntax@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: refactor traffic_stat access in
 collect_traffic_statistics
Message-ID: <202608070545.V0T8UE77-lkp@intel.com>
References: <20260803144826.15980-1-seedandsyntax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803144826.15980-1-seedandsyntax@gmail.com>

Hi Mirza,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Mirza-Ishan-Beg/staging-rtl8723bs-refactor-traffic_stat-access-in-collect_traffic_statistics/20260806-062100
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260803144826.15980-1-seedandsyntax%40gmail.com
patch subject: [PATCH] staging: rtl8723bs: refactor traffic_stat access in collect_traffic_statistics
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260807/202608070545.V0T8UE77-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260807/202608070545.V0T8UE77-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608070545.V0T8UE77-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/rtl8723bs/core/rtw_cmd.c: In function 'collect_traffic_statistics':
>> drivers/staging/rtl8723bs/core/rtw_cmd.c:1112:35: error: initialization of 'struct traffic_stat *' from incompatible pointer type 'struct rtw_traffic_statistics *' [-Wincompatible-pointer-types]
    1112 |         struct traffic_stat *ts = &pdvobjpriv->traffic_stat
         |                                   ^
>> drivers/staging/rtl8723bs/core/rtw_cmd.c:1115:9: error: expected ',' or ';' before 'ts'
    1115 |         ts->tx_bytes = padapter->xmitpriv.tx_bytes;
         |         ^~
>> drivers/staging/rtl8723bs/core/rtw_cmd.c:1116:11: error: invalid use of undefined type 'struct traffic_stat'
    1116 |         ts->tx_pkts = padapter->xmitpriv.tx_pkts;
         |           ^~
   drivers/staging/rtl8723bs/core/rtw_cmd.c:1117:11: error: invalid use of undefined type 'struct traffic_stat'
    1117 |         ts->tx_drop = padapter->xmitpriv.tx_drop;
         |           ^~
   drivers/staging/rtl8723bs/core/rtw_cmd.c:1120:11: error: invalid use of undefined type 'struct traffic_stat'
    1120 |         ts->rx_bytes = padapter->recvpriv.rx_bytes;
         |           ^~
   drivers/staging/rtl8723bs/core/rtw_cmd.c:1121:11: error: invalid use of undefined type 'struct traffic_stat'
    1121 |         ts->rx_pkts = padapter->recvpriv.rx_pkts;
         |           ^~
   drivers/staging/rtl8723bs/core/rtw_cmd.c:1122:11: error: invalid use of undefined type 'struct traffic_stat'
    1122 |         ts->rx_drop = padapter->recvpriv.rx_drop;
         |           ^~
   drivers/staging/rtl8723bs/core/rtw_cmd.c:1125:11: error: invalid use of undefined type 'struct traffic_stat'
    1125 |         ts->cur_tx_bytes = ts->tx_bytes - ts->last_tx_bytes;
         |           ^~
   drivers/staging/rtl8723bs/core/rtw_cmd.c:1125:30: error: invalid use of undefined type 'struct traffic_stat'
    1125 |         ts->cur_tx_bytes = ts->tx_bytes - ts->last_tx_bytes;
         |                              ^~
   drivers/staging/rtl8723bs/core/rtw_cmd.c:1125:45: error: invalid use of undefined type 'struct traffic_stat'
    1125 |         ts->cur_tx_bytes = ts->tx_bytes - ts->last_tx_bytes;
         |                                             ^~
   drivers/staging/rtl8723bs/core/rtw_cmd.c:1126:11: error: invalid use of undefined type 'struct traffic_stat'
    1126 |         ts->cur_rx_bytes = ts->rx_bytes - ts->last_rx_bytes;
         |           ^~
   drivers/staging/rtl8723bs/core/rtw_cmd.c:1126:30: error: invalid use of undefined type 'struct traffic_stat'
    1126 |         ts->cur_rx_bytes = ts->rx_bytes - ts->last_rx_bytes;
         |                              ^~
   drivers/staging/rtl8723bs/core/rtw_cmd.c:1126:45: error: invalid use of undefined type 'struct traffic_stat'
    1126 |         ts->cur_rx_bytes = ts->rx_bytes - ts->last_rx_bytes;
         |                                             ^~
   drivers/staging/rtl8723bs/core/rtw_cmd.c:1127:11: error: invalid use of undefined type 'struct traffic_stat'
    1127 |         ts->last_tx_bytes = ts->tx_bytes;
         |           ^~
   drivers/staging/rtl8723bs/core/rtw_cmd.c:1127:31: error: invalid use of undefined type 'struct traffic_stat'
    1127 |         ts->last_tx_bytes = ts->tx_bytes;
         |                               ^~
   drivers/staging/rtl8723bs/core/rtw_cmd.c:1128:11: error: invalid use of undefined type 'struct traffic_stat'
    1128 |         ts->last_rx_bytes = ts->rx_bytes;
         |           ^~
   drivers/staging/rtl8723bs/core/rtw_cmd.c:1128:31: error: invalid use of undefined type 'struct traffic_stat'
    1128 |         ts->last_rx_bytes = ts->rx_bytes;
         |                               ^~
   drivers/staging/rtl8723bs/core/rtw_cmd.c:1130:11: error: invalid use of undefined type 'struct traffic_stat'
    1130 |         ts->cur_tx_tp = (u32)(ts->cur_tx_bytes * 8 / 2 / 1024 / 1024);
         |           ^~
   drivers/staging/rtl8723bs/core/rtw_cmd.c:1130:33: error: invalid use of undefined type 'struct traffic_stat'
    1130 |         ts->cur_tx_tp = (u32)(ts->cur_tx_bytes * 8 / 2 / 1024 / 1024);
         |                                 ^~
   drivers/staging/rtl8723bs/core/rtw_cmd.c:1131:11: error: invalid use of undefined type 'struct traffic_stat'
    1131 |         ts->cur_rx_tp = (u32)(ts->cur_rx_bytes * 8 / 2 / 1024 / 1024);
         |           ^~
   drivers/staging/rtl8723bs/core/rtw_cmd.c:1131:33: error: invalid use of undefined type 'struct traffic_stat'
    1131 |         ts->cur_rx_tp = (u32)(ts->cur_rx_bytes * 8 / 2 / 1024 / 1024);
         |                                 ^~


vim +1112 drivers/staging/rtl8723bs/core/rtw_cmd.c

  1108	
  1109	static void collect_traffic_statistics(struct adapter *padapter)
  1110	{
  1111		struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(padapter);
> 1112		struct traffic_stat *ts = &pdvobjpriv->traffic_stat
  1113	
  1114		/*  Tx */
> 1115		ts->tx_bytes = padapter->xmitpriv.tx_bytes;
> 1116		ts->tx_pkts = padapter->xmitpriv.tx_pkts;
  1117		ts->tx_drop = padapter->xmitpriv.tx_drop;
  1118	
  1119		/*  Rx */
  1120		ts->rx_bytes = padapter->recvpriv.rx_bytes;
  1121		ts->rx_pkts = padapter->recvpriv.rx_pkts;
  1122		ts->rx_drop = padapter->recvpriv.rx_drop;
  1123	
  1124		/*  Calculate throughput in last interval */
  1125		ts->cur_tx_bytes = ts->tx_bytes - ts->last_tx_bytes;
  1126		ts->cur_rx_bytes = ts->rx_bytes - ts->last_rx_bytes;
  1127		ts->last_tx_bytes = ts->tx_bytes;
  1128		ts->last_rx_bytes = ts->rx_bytes;
  1129	
  1130		ts->cur_tx_tp = (u32)(ts->cur_tx_bytes * 8 / 2 / 1024 / 1024);
  1131		ts->cur_rx_tp = (u32)(ts->cur_rx_bytes * 8 / 2 / 1024 / 1024);
  1132	}
  1133	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
