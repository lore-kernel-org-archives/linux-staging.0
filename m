Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0739E31327A
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 08:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777884362; cv=none; b=JNgKLC9ug/loKRUC1dcw+uk3oxBGjuSHXkWkNCBxlmw9l8fX2gDsBkGrwghVMtKBll8Exq16i8RrNEHJzbdcRUa16J+/cg80CFxelJJQhS5O1pGHlsbDla3yQGTNiExNylgFXi5RWfHT6cfWWYL8/xHuGny/O2o3Hx3e6ZjUYiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777884362; c=relaxed/simple;
	bh=yWEzCDgoGDnMWPKJjVfR9r0muUqxhdSGv8T8xVqkZ8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mlh31rMTjKOOs9XX3FoJc5OyiGVoHzE4EtSSSa+IiIR6N2EbRpoDYyI91pMKCI51PJ/o6jJ6rsUxhusyGw6NWmaR2xUJkXsCjYgb0usagk/CN0OIIGf4ir7fKoFdKK4/jf5VLMiV/19MuUpcKUvAW6fZv895tjSP5nUDRyTkYUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DtvPvzgh; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DtvPvzgh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777884361; x=1809420361;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yWEzCDgoGDnMWPKJjVfR9r0muUqxhdSGv8T8xVqkZ8g=;
  b=DtvPvzgh0I8aMasYcLz2tP3SUoaQCXZjrvoo/qVbUNIduhFFpa+9EMs0
   LWNpquREBajvfcGhYSwX0JCQb+KzyDtfWJyi+mgCviVN+CjBXsMBeIv9p
   /QdCARrxmIIfwm2AwCHE9f5qrxNoDXk7YMYuxFl9Uu/7E8sp/JSaowIR1
   udfD4oHsQE6S3MqS6n91YPGqJhaqC9G0zI0KLBA5+8y69eyvJYHPH/DOY
   1DUdtxbZoQRQd7/yL7KO4fVMiNatPNo/OanekEzto7ONA5+KbQWmOMV42
   kqRNDu9TDT6gNXymr49Vsf+8J8HZUohXnVrrb0as/4D+bO5RueN1XpFCZ
   Q==;
X-CSE-ConnectionGUID: F1W0plCTSgunxH25DcFyqw==
X-CSE-MsgGUID: MqHfK6aZRvupLdhd+AO1hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="82349930"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="82349930"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 01:46:01 -0700
X-CSE-ConnectionGUID: S6cLh6lERmaxYO/jal4ZyA==
X-CSE-MsgGUID: q5GrRO34S1m1keH3QGBBtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="240441681"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.78])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 01:45:58 -0700
Date: Mon, 4 May 2026 11:45:56 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Shirin Kaul <shirin.kaul11@gmail.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org,
	hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: atomisp: isp: xnr 3.0 fix whitespace issue
Message-ID: <afhcxJeQ19nXKvAo@ashevche-desk.local>
References: <20260502082516.16302-1-shirin.kaul11@gmail.com>
 <20260503105445.45058-1-shirin.kaul11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503105445.45058-1-shirin.kaul11@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, May 03, 2026 at 10:54:45AM +0000, Shirin Kaul wrote:
> Fix spaces by replacing them with tabs in function calls to comply
> with kernel coding style with checkpatch.pl.

Subject is wrong. The patch doesn't cover things outside the single file.
The patch does two things (has to be split). Also patch doesn't anyhow
rely on the preexisted changes that were submitted to the mailing list
(that cover much more that this one).

> v2:
> - Added trailing commas in arrays
> - Fixed indentation

We have special place for the changelog and comments...

> Signed-off-by: Shirin Kaul <shirin.kaul11@gmail.com>
> ---

...somewhere here.

>  .../kernels/xnr/xnr_3.0/ia_css_xnr3.host.c    | 29 +++++++++----------
>  1 file changed, 13 insertions(+), 16 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


