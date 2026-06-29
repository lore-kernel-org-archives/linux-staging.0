Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16663793B4
	for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 14:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744345; cv=none; b=kajhu50U3ylMTIioGh82gdbQEHJLuWQjUWZOYHdLZhXE23jG+PAYxS0SdMh0l8eRsyislDc9p3ZLpzd/LciIvFNn1yf/RXXZp+dXK44mzRuCYMVf/loGoqblnkh8sB7alYlcVUlZgTzP0ATyfbvc0gVl7CcE6mZ2cHtgb6EeExc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744345; c=relaxed/simple;
	bh=w3GHAqb3u4iLGjd3yw7Exzd83KYIdmWzhLlfn6AgVSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mt0LHW5DS+UlD+VxAsaW4fSa8g1NBzycutCsLlcUPkSW+Kyv2lUgWfsDZ2uCORsz9oq14qnIDr8kUjNDuTzdKnsMRGBs2Pdi3y65HFxvtBzCW5yeCqbUcnj6OnEcelfMERHCyu68ZkzWgWLowhVaA6httPaDdHx9qK7cFbD4w80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ps7AyLzw; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ps7AyLzw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782744344; x=1814280344;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w3GHAqb3u4iLGjd3yw7Exzd83KYIdmWzhLlfn6AgVSU=;
  b=Ps7AyLzwJeQu/ixKshBVixrJHYsXx1u9yOSrPmr0DyrOPcSY2j3N1Uks
   UHecaec6WFHqF9m1t1lPLA0SlyWGi+y8tGvvJUTyFOsJiSrgG97uBaGyq
   Xu7VH+pP4YChOzQWSp3xASHkJd6o0al2J0e/jDFsriS4hccoT4fTr14yA
   VkJWiQGgVkxRsmO/GIqNDsTZU0PGZ8fLoIykwV13gHf0PjZ0H0EedxMOx
   RTjrNYRkczIc0s4Ty/y7gFQhKRjBHmVLNvaMon0p4U1j8ms44B/U1GfRU
   GcZWVxPH2ZYWXb45kiQrq24KijQxgIlRHsoPXdBYF4jLkV8G4fj/huE84
   w==;
X-CSE-ConnectionGUID: 1Z2zSCRmRnCjIz7OrhGefw==
X-CSE-MsgGUID: ATjbnrMLQB+ilrcoRgaKsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="93786974"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="93786974"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 07:45:43 -0700
X-CSE-ConnectionGUID: Yvml85BDTPW1zl4vyEvb+Q==
X-CSE-MsgGUID: WdeJ8/LOSdK/mOGMLc37ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="290100360"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 07:45:39 -0700
Date: Mon, 29 Jun 2026 17:45:37 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Dawei Feng <dawei.feng@seu.edu.cn>, hansg@kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com, andy@kernel.org,
	gregkh@linuxfoundation.org, azpijr@gmail.com, kees@kernel.org,
	arnd@arndb.de, pontescpedro@gmail.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	jianhao.xu@seu.edu.cn, zilin@seu.edu.cn
Subject: Re: [PATCH] media: atomisp: fix CAS scaler descriptor leaks
Message-ID: <akKFEf73wisw6Qrn@ashevche-desk.local>
References: <20260627060151.2543613-1-dawei.feng@seu.edu.cn>
 <akItMNqgKTDBCGV0@stanley.mountain>
 <akJUBYUpjIX0dvx7@ashevche-desk.local>
 <akJehriJCKiJNo2I@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akJehriJCKiJNo2I@stanley.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 29, 2026 at 03:01:10PM +0300, Dan Carpenter wrote:
> On Mon, Jun 29, 2026 at 02:16:21PM +0300, Andy Shevchenko wrote:
> > On Mon, Jun 29, 2026 at 11:30:40AM +0300, Dan Carpenter wrote:
> > > On Sat, Jun 27, 2026 at 02:01:51PM +0800, Dawei Feng wrote:

...

> > > free_output_stage:
> > > 	if (need_scalar) {
> > > 		kfree(mycs->is_output_stage);
> > > 		mycs->is_output_stage = NULL;
> > > 	}
> > > free_scalar_binary:
> > > 	if (need_scalar) {
> > > 		kfree(mycs->yuv_scaler_binary);
> > > 		mycs->yuv_scaler_binary = NULL;
> > > 	}
> > 
> > If we go this way, double check that the checks are needed as we have kfree()
> > to be NULL-aware.
> 
> Dawei, Andy is the one reviewing atomisp so his opinion matters more
> than mine here.  So do what he says.
> 
> But I don't really agree...
> 
> In this case, sure, hopefully the caller zeroes the ->yuv_scaler_binary
> pointer, but if we just follow the simple rule of only undoing things
> which we have done then we don't need to check.  The function is
> self contained and self explanatory.
> 
> And more generally, I've always hated patches which delete NULL
> checks before a ionmap() or whatever.  Hiding the NULL check inside the
> free function makes the code less self contained.  The real fix is to
> stop mixing allocated and unallocated pointers.  Then you don't need a
> NULL check because you already know.  (Also I think those iounmap()
> patches were wrong because some arches have a warning when you unmap
> a NULL).

I fully agree with the statement against iounmap(), but for regular memory
freeing it's almost an idiomatic to just call it with valid pointer (note that
NULL *is* valid pointer, just may not be dereferenced). You can also read recent
discussion with Linus with Kees on some other topic where it was explained the
malloc(0) to give a valid pointer (as an "empty" something). Ah, now I remember
what was that, it was about ARRAY_END() macro.

So, having unconditional kfree() for (optional) memory allocations is perfectly
fine.

-- 
With Best Regards,
Andy Shevchenko


