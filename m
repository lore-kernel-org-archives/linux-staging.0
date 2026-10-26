Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008202;
	b=Pwjy5GS0/xHTfRNZgfPtlMEEAyZ8itGF69jvAjKtrF7FFoIi4fA5kXjyu2otvk6wKYoV
	 Nj6yvPVUCeomrS/8+AmI2fOhTT4M/WBBJwu3VeZlcKysSxevuHilcKUBxG2oii5WX9wQf
	 OHgmeeUPw/3SxtyGZIP5nBC/cCBMGoOrv2NYPHjqlHCgYs/U0Vk8pThYzZBbtv/Ry+Qt3
	 D7nVWbCLSvOsJIEXg2rAhmfO3VQTnKQNtmDLbaCBrgIDqQu2dAZly8pJssbKZMOuYmUoi
	 vXWvCZVPaC1aDOlRSHNCZ8W0CRSvhLCi6MyK7Su9/nHf6Qung5qtfEaN/osLhp24AbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008202;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=Q9f2uGWeWP2/426R1+gQS6saQbeRCspCMELW+WPFZWA=;
	b=daF1dirPciO/qCsIRtwKPNc3KPLFJeHala4OT1XjLHyFFdjAfOQuHDx8jYzcPiW1tYCQ
	 yilRDPQ2BjErd9m4FXh9LlMtB9yV2Lr/SA3IHOdST2PAKgdSstOtOH6D4wuuODpighLMO
	 es2kJb956vQYfwnz5g8sK7mCLfy6nyPIQK6vRPHso7oCdLCD530tLqiNLJhr+H5LWhzS7
	 ErnQysC7Ql7igGb4VLOjBVnH5oNxNQZmqDgaARRYpBCmz5ztcLimq5irqQu8l8CPWutfy
	 Qk18SIzpAMbFqj5L3zmnJOv9W16aM55XNQ8J/KMbLrFY0EjPuiHUSadazc8H1V5jTcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bKItXg7O;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84B9606A31D
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 09:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E84B9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bKItXg7O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793008200; x=1824544200;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0CPUBaoIM/gu62Y/pBUcQ6kvFd6fpUVAmPDb4OpbuQ8=;
  b=bKItXg7OD5KzLKtGRSIH1Eg4usyWsqk35woOMgeX3KNudoOywyjIaInP
   KGOmrKFNPxaFaSN2txwYptOrQHgxzaQy/rML3l8/bz5qNUKwkEA27aSI5
   NUh0ZN0wrIhNylT0/bGoDhxY12n6YPdiZsvEPLAOAqFdwckVXpuE0Ms4e
   sXNR9jpOq0RJl/lF44MfEfJShSANSKaxKi47yV6h+4/4mMbry5N4UFt64
   Kjssc2SEcoM2E1BnMrAdS0vwUMg37K4znT+FkU9elZk/zES1Yye2JWvZ6
   DRdTELN7inYxIk4WCcDhJ+dzeGmoktA+p2Q7cuvsr5w3aeC5B7jne14Ah
   g==;
X-CSE-ConnectionGUID: E2rmC/yjRbCArZHYzMVOcw==
X-CSE-MsgGUID: CI8VkU2xST2SF8GSH0x53w==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1570728"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1570728"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 02:50:00 -0700
X-CSE-ConnectionGUID: 0syt+QF6SOujdi1UOBKF6g==
X-CSE-MsgGUID: QE/bqolnQ8exEHLapGXJsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4569812"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 02:49:57 -0700
Date: Mon, 26 Oct 2026 11:49:54 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nithishvelan M <mnithishvelan@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nuno Sa <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: iio: impedance-analyzer: ad5933: use
 guard(mutex) in ad5933_show()
Message-ID: <at8iQhUDfDpkRxI6@ashevche-desk.local>
References: <20261026082828.652-1-mnithishvelan@gmail.com>
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
In-Reply-To: <20261026082828.652-1-mnithishvelan@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 26, 2026 at 08:28:28AM +0000, Nithishvelan M wrote:
> Use guard(mutex) to automatically manage the state lock in
> ad5933_show(). This simplifies the function by allowing direct returns
> from each switch case, eliminating the mutable return variables and
> manual mutex_unlock() calls.

LGTM now,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


