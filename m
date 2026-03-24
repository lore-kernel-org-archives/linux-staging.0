Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB95F3ECBDB
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 11:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774351355; cv=none; b=b46MetyUAk3wWd+Wu1Cx9zqD8Veud1CrBs9885CVzlskdTfvs2w2HYnX150Z4G/DUbS5KetOmGqNxXH879a9quCCfI+8pmV054Wv/Bl4hz9u/mJ8uVF89y2MPmz7hUI2u3C9sMgk5S/SF2A8ZShcbi3kJ4X3zvJzB1cOuWhMiTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774351355; c=relaxed/simple;
	bh=speMCjmCENpe0yX5rmMiXRyklXKe1ZdhjemVSBT/q0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A6O68N69XHVNTkee7pzLjbGhQ+kzBun3JH5SPUfNRQnVNlvo/hK07ToWwwOSa56myy9pw/BEa5jrXbXVr/tjkK1MBR6BB9dgDrJflV/sqnLLlwfKvSqZ6JQFjjpXbbJo/0SdsN3fzD4IPQjNJpWAO4iFa3ImpbDzDUxK6QVUqdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sbt5UJtZ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sbt5UJtZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774351354; x=1805887354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=speMCjmCENpe0yX5rmMiXRyklXKe1ZdhjemVSBT/q0M=;
  b=Sbt5UJtZw2mPvYM94GrzcdqpLrFTnTSu52sTQj0pORYmjkJ5E/q+r35K
   j+EXbdVWQ4jgKypMS7iXXH7KDYvAM7mlKgkYndPqpIGI9DOqFJR2cR+zN
   jw3keGeROwW9F8Pu8g1FcVTXUyK6BboBRCARiNnSgBeprHiY4hQoZCcK+
   WCCQRxPcF/7vymuM0N7fgOLHYj88BA8/M/qTSxzzyyE6q3AFIvCSslrKH
   2T18ikc/ujrCFQq6yRsgnguJBb7A61LBOO0Aqvl9oZ+3MWZHhDmRFau7o
   U5u/gLM1K+CzVanSCp/OysBXU772WZjiC2g3uEo7LiULIxmaDLDWDNDQ0
   Q==;
X-CSE-ConnectionGUID: QuHLKM6pSmG7vRM1y9ypBg==
X-CSE-MsgGUID: INLc5kUkS4y/mr1EHs7aJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="79272479"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="79272479"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 04:22:33 -0700
X-CSE-ConnectionGUID: 9CcoVqN8Q5OTVaTaMC7oNw==
X-CSE-MsgGUID: pgUwQLeOStmIuOqOFbubtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="224294441"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 04:22:32 -0700
Date: Tue, 24 Mar 2026 13:22:29 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: sajal90 <sajal2005gupta@gmail.com>, gregkh@linuxfoundation.org,
	s9430939@naver.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: tidy logical continuations in
 xmit_linux.c
Message-ID: <acJz9ea7VNnUdY2A@ashevche-desk.local>
References: <20260323191501.40269-1-sajal2005gupta@gmail.com>
 <DHAO3ZQ8EPCF.RAJ0TUZ6QEX0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHAO3ZQ8EPCF.RAJ0TUZ6QEX0@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Mar 23, 2026 at 09:47:42PM -0500, Ethan Tidmore wrote:
> On Mon Mar 23, 2026 at 2:15 PM CDT, sajal90 wrote:

...

>  You fixed the logical continuation problem but the alignment is still
>  wrong. It should be something like:
> 
> 	if (!rtw_mc2u_disable &&
> 	    check_fwstate(pmlmepriv, WIFI_AP_STATE) &&

Why not

	if (!rtw_mc2u_disable && check_fwstate(pmlmepriv, WIFI_AP_STATE) &&

?

> 	    (IP_MCAST_MAC(pkt->data) || 
> 	     ICMPV6_MCAST_MAC(pkt->data)) &&

This also can be joined as it's logically a one piece of the conditional.

	    (IP_MCAST_MAC(pkt->data) || ICMPV6_MCAST_MAC(pkt->data)) &&

> 	    !padapter->registrypriv.wifi_spec) {

-- 
With Best Regards,
Andy Shevchenko


