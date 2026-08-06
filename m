Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4E548551F;
	Thu,  6 Aug 2026 17:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786036605; cv=none; b=MyeNtJuoMNwoIA5RqJPQ3mJ3d7t6Rnyc+VXVH69dhL4touCSNluC1uI5lrAI4LINraoZT6OYlBRByu/EH0c9bDRxSkmagGuX1Ke392bKUeENQy4tLy6J2AQPCWkxdiEzNp813W6uncZKMll1JbbBQb1ltlVwPzjwakrKwygfefk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786036605; c=relaxed/simple;
	bh=4Sq8YIMSRTIO/KIInPj/Oe7HRtw9ynnJ/uLV9HMJ93o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+tJ5WGQXXXic5qzCrJEqui8QI5AE4Mx5GV8BlRFw0f+PO1VB/qmwFjwPiiP72g9GMNmAbvkOEuDYHIQxO773vDkdIeZ2ncRX1Iopn9VyUWaroT2X8mFOZ7LmFWdXjazBx0hbXy7KzZ91mv+SDBpChW962nz5qM6/sl5xevAM+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k8fnCzEm; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k8fnCzEm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786036603; x=1817572603;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4Sq8YIMSRTIO/KIInPj/Oe7HRtw9ynnJ/uLV9HMJ93o=;
  b=k8fnCzEmu3NdXi2igGQ3wE5JvNVmeiUJcoajVnRR6coTRfZ8Kgnab1MW
   h8vNLG7kKpWzhJJfUHQHer/iRE2LVh9OGYor48AC7ac9jc/B1NVtNK6O7
   zL0olUomv1jKD+fyquZtmMJA2WelplqPfp0ZA8xMgr8XVGYwyAeprIJhI
   DY3XkUnflATlHqaG2gLe648CFao5dFDcizFLzLl8lo8Pc/srzAVeJ76X3
   ceICcyKC/GUhybkcuGMMhHhJh0VVwreYgyAiBkSORysQH3+uCNR8oGU0z
   /U5RYO7tJbfVx4AAyD3ohqk67x4SL4dT9lTM4q01ExPneXAM/67eZpOhv
   Q==;
X-CSE-ConnectionGUID: Vp6f8VwhQlCwewOTCkwGaw==
X-CSE-MsgGUID: zm2Rc5ZxTCCHF01fjgPYIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86514545"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="86514545"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 10:16:43 -0700
X-CSE-ConnectionGUID: FntjmgNuRzatEE3aXcxpHA==
X-CSE-MsgGUID: F6YmuKn/TtyoLNvdrgjv5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="265645667"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Aug 2026 10:16:41 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ws1hu-00000000FmD-3XcW;
	Thu, 06 Aug 2026 17:16:38 +0000
Date: Fri, 7 Aug 2026 01:15:57 +0800
From: kernel test robot <lkp@intel.com>
To: Mirza Ishan Beg <seedandsyntax@gmail.com>, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, nikolayof23@gmail.com,
	seedandsyntax@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: refactor traffic_stat access in
 collect_traffic_statistics
Message-ID: <202608070159.puVnOVxb-lkp@intel.com>
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
config: arm-randconfig-r051-20260806 (https://download.01.org/0day-ci/archive/20260807/202608070159.puVnOVxb-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260807/202608070159.puVnOVxb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608070159.puVnOVxb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/rtl8723bs/core/rtw_cmd.c: In function 'collect_traffic_statistics':
   drivers/staging/rtl8723bs/core/rtw_cmd.c:1112:28: error: initialization of 'struct traffic_stat *' from incompatible pointer type 'struct rtw_traffic_statistics *' [-Werror=incompatible-pointer-types]
     struct traffic_stat *ts = &pdvobjpriv->traffic_stat
                               ^
   drivers/staging/rtl8723bs/core/rtw_cmd.c:1115:2: error: expected ',' or ';' before 'ts'
     ts->tx_bytes = padapter->xmitpriv.tx_bytes;
     ^~
>> drivers/staging/rtl8723bs/core/rtw_cmd.c:1116:4: error: dereferencing pointer to incomplete type 'struct traffic_stat'
     ts->tx_pkts = padapter->xmitpriv.tx_pkts;
       ^~
   cc1: some warnings being treated as errors


vim +1116 drivers/staging/rtl8723bs/core/rtw_cmd.c

  1108	
  1109	static void collect_traffic_statistics(struct adapter *padapter)
  1110	{
  1111		struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(padapter);
  1112		struct traffic_stat *ts = &pdvobjpriv->traffic_stat
  1113	
  1114		/*  Tx */
  1115		ts->tx_bytes = padapter->xmitpriv.tx_bytes;
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
