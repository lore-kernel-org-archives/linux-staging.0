Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28373F8E1D
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 11:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774351216; cv=none; b=JseGt36nDdIQ+j533a+T9jvB2fsLg+Xwz6w47pv6ZUuwLt0+Gtx0LhtMJMICyL0WBov03souWPiZo1FKdGLh3SQK2nH6ZmuuwIlxq8Mp634tVgnxCRyodJnjcErkjEMg/SGllXsD4oSSzf1iQroVH8Cip7XQK41Q722QObchv50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774351216; c=relaxed/simple;
	bh=9exUAJZZUlCdpMuxCNXQ89VezmCBuvc/Qpae8bTynQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXqT32X/QC2/D+YF80NlO8UC0YlmIn7w2n6tDMWsRz1BlHWSF56ShR02tHNdFH6lmucpoYYHNqlMGL1MlSwsMx4wo687sLkkoMJkJ3TC1N9/YxI458eKsQ+Dc9+peIK0jt6lCRcLi8htEOgLROy9zYO1yhr8gF5NTGxlGXhnqDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rkgury6K; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rkgury6K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774351211; x=1805887211;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9exUAJZZUlCdpMuxCNXQ89VezmCBuvc/Qpae8bTynQA=;
  b=Rkgury6KXq2HHZFPAZVv5aJs9zmSiYoMGL3RvEe5L/RS06sOGQQw59QU
   pkbfrdlr9ursQw0OCkW1wQr9C3toOCNJBrO3cY3sb/OlGsAZOBegUcTlA
   E5DkXEnUdZvAlYViq2qwwaTc0ZtTRNd94i8wLEqBpnCUiDH2Wz9rfojPm
   NcQF0dNQD1myX9H7j7z5Wf48ZurBFHvkZZO59vjoFodefdlpB2sksT1/t
   KaZHqT1I5/glEtJk4hxiQv7W2+UPRlobRV5ZOepx6bdocQXvTzr0ZLNDy
   HP6IIpjM8mrQNCfGOttSwhTFFlpjKOTe5QTTvJF0o9mEB69RPa/ygaBZY
   w==;
X-CSE-ConnectionGUID: XylSohbMSVqoDvVl1Fi35A==
X-CSE-MsgGUID: o0oOA9GIRHSoeqNoruXagg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75432050"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75432050"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 04:20:10 -0700
X-CSE-ConnectionGUID: VoeCKB2iT/GxWuGkpuvzfA==
X-CSE-MsgGUID: Nkg3GdvPQ8a8aZ/Wu57aeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="220985524"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 04:20:09 -0700
Date: Tue, 24 Mar 2026 13:20:07 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: sajal90 <sajal2005gupta@gmail.com>
Cc: gregkh@linuxfoundation.org, s9430939@naver.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: tidy logical continuations in
 xmit_linux.c
Message-ID: <acJzZ-hbLa9Ijrxe@ashevche-desk.local>
References: <20260323191501.40269-1-sajal2005gupta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323191501.40269-1-sajal2005gupta@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Mar 24, 2026 at 12:45:01AM +0530, sajal90 wrote:

This is NOT how the patches should be formed.
Your homework:

- read and study Submitting Patches documentation
https://www.kernel.org/doc/html/latest/process/submitting-patches.html

- read this
https://chris.beams.io/git-commit

> ---
>  drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 11 +++++------

...

> -	if (!rtw_mc2u_disable
> -		&& check_fwstate(pmlmepriv, WIFI_AP_STATE) == true
> -		&& (IP_MCAST_MAC(pkt->data)
> -			|| ICMPV6_MCAST_MAC(pkt->data)
> -			)
> -		&& padapter->registrypriv.wifi_spec == 0) {
> +	if (!rtw_mc2u_disable &&
> +		check_fwstate(pmlmepriv, WIFI_AP_STATE) == true &&
> +		(IP_MCAST_MAC(pkt->data) ||
> +		 ICMPV6_MCAST_MAC(pkt->data)) &&
> +		padapter->registrypriv.wifi_spec == 0) {

This isn't correct, fix the indentation and the logical splits
(less lines can be made).

-- 
With Best Regards,
Andy Shevchenko


