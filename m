Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793436703;
	b=h1EptAcQFuno3Ya+/2o49xyeMHydsk1jt52G/bdR8UqBR5Swf2Z0Fz/5iBj8e6R0TCet
	 Y+0JBQF5LnmfrUDJsoCfqGuXWufNLuY7MkyA+zXIty0y0yBvs6MVz6QBrakdgNt3bDR5C
	 cdjkdUmUqfdIydgFHsiCf289zFD2GwaNLjhJ4GapDPTp0GonbdL+hwctY42rNJz3IkRQP
	 X2vp6NsRgPGRnbPFjOmVd1HfLnQ027alIDkPaRDJqdktT2PsxyX4pebN2am8/BgDQvJZA
	 A65DEntSPKXPfvcbso4X7BE4XBTb1vWMESJQBynftN0pZGZ7IY+eAsZNZ9UATGQW0fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793436703;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=Oia3K4AHfSEsRzNJ8cTE47m0UQ5ty++Ukc5Cd7jXA8Q=;
	b=BYveAnAlHpq9GtguN+/mXZ3y/eBltStd/NplbWxZ0JlNe9/mXLdCoh19zXBtI0v9K6Dd
	 zMwEtfwwk72MsWLDUN4STp1VWUgh2GczY7Sq+P7H6TN4W6YGw37EtsBS7/18ne6zo1OXq
	 gNqG8jdcEy/r9ufglU/f3htr/GeHgUp7sV6VKbykLzduUGQop/T1nZIb/9qK8KwQLsryV
	 WJJLAzgWSBxRvAq1JPnsM40nKnF61dQCk/LGEYdJTaQHFSlkF4FY/2q8PIYCEjxM7jmdn
	 PS3OdlmavXFMWwNK06Hb4gu/jWXx1kjr/OoduuKH4SD3XBeblvE7mWCFV8iEPTaWErw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fRy4Tepd;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79177606A31C
	for <linux-staging@lists.linux.dev>; Sat, 31 Oct 2026 08:51:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79177606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fRy4Tepd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793436702; x=1824972702;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ks9bWYSJtuDY+8uGeFVP/3kU2BSZSz71I8dIOvJ1sZo=;
  b=fRy4TepdZ9LSZVNHhi1xRCpCmdV6xeSB6aDdGHZqMV0oBE8VJ+1FjR34
   Nw2lIsdxfhdGH5OYBOaAYttmSURJ4lPzZpXjY5VnfYVCQQm7covyu8nEB
   siH4sumUyfyO5C65CFtEyBWhHvPmZlT6himmqASf2ShpeVKV8i8Nsw0r1
   /+CFj6B0Ao3lxYrEmUF35vOh0RQqsqzUcoWdquQusxSjuWeMLfXcCQJGE
   2C7NgDcSOunbNsUkoa1nrtu3hjLwRY07LBE+PwR6NRjXDcQayUPc72hu9
   WP6vH969FG3aCUmH3pgxJvwdn+7MVdUxDM1vBsIInVabeJcN7iy/hVlF4
   A==;
X-CSE-ConnectionGUID: 3beFItqyR7Kc3q/plxfetg==
X-CSE-MsgGUID: zQMfic7+Q9OUSqC+x2GwGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2203883"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2203883"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 01:51:42 -0700
X-CSE-ConnectionGUID: ZH3TE4sMR3uPF3RQONTvpg==
X-CSE-MsgGUID: FZmIsDKQRxauXw6i7KvcFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5733511"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.127])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 01:51:39 -0700
Date: Sat, 31 Oct 2026 10:51:37 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nithishvelan M <mnithishvelan@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux@analog.com
Subject: Re: [PATCH RESEND] staging: iio: frequency: ad9832: use
 devm_mutex_init()
Message-ID: <auWsGZtBMmLABsz_@ashevche-desk.local>
References: <20261031075814.34379-1-mnithishvelan@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261031075814.34379-1-mnithishvelan@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Oct 31, 2026 at 01:28:14PM +0530, Nithishvelan M wrote:
> Replace mutex_init() with devm_mutex_init() in ad9832_probe() and
> check its return value. The driver already uses devm_* helpers for
> its other resources and has no remove() callback, so this ensures
> the mutex is destroyed automatically on teardown when mutex
> debugging is enabled.
> 
> No functional change intended. Compile-tested only.
> 
> Signed-off-by: Nithishvelan M <mnithishvelan@gmail.com>
> ---
> Resending because the first mail carried the patch as an attachment
> instead of inline. No changes to the patch itself.

Same comment as per that variant.

-- 
With Best Regards,
Andy Shevchenko


