Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DF12472A2
	for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 15:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772034936; cv=none; b=mNugN2qqJFtnnfqhIQECq3EsSZRL94r75q/STXEXjRLHyiTdzrm7M0ULHCJpAQ4+QecgGG1njQmkZcKmwIZheH5m771mqyHUECyJH7DL0XMzMPNuedNNCQPBvsat4ZwVtjOcCeBcmpmEtpF+NDu0oZ1doMgrDXza99ZIQmvqojU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772034936; c=relaxed/simple;
	bh=H83Ie3bl6C//gH4Aod40nBTkhX+tqlyR/r/+RrOr/5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/gMJcc8tLIgk0EhDDAVfmDZc1AE87yFxvo4yXTYCtWA/PfbLoVe/w5W7jyx+CjnabY2Z8EpCA1lPG/QrqqEj9OuJZWmoDHMQ+JhrboBr7W0JlyvpUBlFAYH6Zu9sdo3QRU2bkRCSkNuPC7tqdCeitvaiNqvc9XL15SQR96E8mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0PX0HYV; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0PX0HYV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772034935; x=1803570935;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H83Ie3bl6C//gH4Aod40nBTkhX+tqlyR/r/+RrOr/5E=;
  b=J0PX0HYVjeWarHzfLI/EkUTJZ8mxJLyk6kt90LFsROj5lG1iw7ZCoWc6
   l4Mx79io5174xXFODfszKhYfX+OIRgwgKvwgeEAp84Qkkk2zpMsIgZ+3p
   vFFmmve6vtvUBJes1yQOtd5yMAgddW6DfpDvrtsAnnQi1qbFTcfpjaVmu
   G8Nk0iBbdbxpvww65ZaZL2kFdgqKcN/SFkvJMgp8y8EOIVO/hXDKaa4CV
   mKk+T30ojco386K6wLJ0uEhtQ5/+IyQq8SLYoKeYizg+e0zFOqTdsIF2V
   scAGKMQ52k9GKGhvmoeDHdseOiTkN+p/dpcdmJ1cBUY5TLYjZkIqDcMGM
   Q==;
X-CSE-ConnectionGUID: 55GVSsY4QFuxB9hnRxgV1Q==
X-CSE-MsgGUID: z9COo3jpQ4ejrBlOabqvXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72115130"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="72115130"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 07:55:35 -0800
X-CSE-ConnectionGUID: 6cwodwNCQAimoiBrThclKQ==
X-CSE-MsgGUID: CZ5aD+UCTIawhE7Gtwd78A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="215379076"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.71])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 07:55:32 -0800
Date: Wed, 25 Feb 2026 17:55:29 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Rodrigo Filipe Faria <me@rodrigofilipefaria.org>
Cc: gregkh@linuxfoundation.org, s9430939@naver.com, architanant5@gmail.com,
	ignacio.pena87@gmail.com, strnad.jj@gmail.com,
	bryant.boatright@proton.me, kees@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rodrigo Filipe Faria <rodrigofaria@student.dei.uc.pt>
Subject: Re: [PATCH] staging: rtl8723bs: change msleep to usleep_range
Message-ID: <aZ8bcbThvwYNIs7Y@smile.fi.intel.com>
References: <20260225135723.60791-1-rodrigofaria@student.dei.uc.pt>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225135723.60791-1-rodrigofaria@student.dei.uc.pt>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Feb 25, 2026 at 01:57:23PM +0000, Rodrigo Filipe Faria wrote:
> checkpatch.pl gave "WARNING: msleep < 20ms can sleep for up to 20ms".
> 
> Kernel documentation says that usleep_range() must be used for
> delays of 10us to 20ms.
> msleep() is inaccurate with the values used.

No, the modern API is fsleep().

...

> @@ -214,7 +214,7 @@ void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
>  {
>  	_cancel_workitem_sync(&pevtpriv->c2h_wk);
>  	while (pevtpriv->c2h_wk_alive)
> -		msleep(10);
> +		usleep_range(10000, 11000);

I saw something similar in the past.
https://lore.kernel.org/linux-staging/20260214173139.49094-1-ofekalm100@gmail.com/

-- 
With Best Regards,
Andy Shevchenko


