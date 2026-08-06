Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9689D3F20F4
	for <linux-staging@lists.linux.dev>; Thu,  6 Aug 2026 20:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786049834; cv=none; b=YeJIFwKXRxayRofgeJ/4l4byplvivTzGEHQbfaxcm8uYD/qYhKjPmZzeYjThNfbNyiqTy16M7C0QEoo9xZgWU/L4LMznHn2UsjQuOSE4aC2slJPoiwKc/RSriLQZrnoA3/cLESCBXwX0SbpCsFaE6/QQie7r+oJR+wtA+qDls08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786049834; c=relaxed/simple;
	bh=5VHHRFvGkmLObQWQw0BUeitBTfxe2qzuvS/8Id+Z8Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U0rT0cc2vZYptObl+D8xYgKWc4A1HZqZPbNezT4622d6VcSVaWjDLo5NyRxpb/RhScvE33sjcvJ2dMHwrzc+gMQfJiOcwktBxF1Axhhill05cOgafLIARG3VIzqwmVoEhjE63Z3BEMCuv83LtmhvUNrmEzaBoaKGhT8ZE8Ypoys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gFmGIUMZ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gFmGIUMZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786049830; x=1817585830;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5VHHRFvGkmLObQWQw0BUeitBTfxe2qzuvS/8Id+Z8Jw=;
  b=gFmGIUMZ2whzaV9LW0Q0UC/dwRnJeGrfvI2yMetnhNsgIlRX/OC4ex0Z
   Sak7bCAsOOt/vtYq+uxvSqRdAK8fAcNfkl8aWXmInEG7FLtc7QeCONKTT
   HeAbd2Oo+BtDugF667T3b0EWQ6i6bC6VpjPj2A0Rf8K1A3iUc6nnLrRER
   2LI44kHanAWEYS+aaVQu7Pfg9U+3y76HhtSbVgir2IbUPHHnRf8adN6li
   fDrWUD72PfIWwzQ6GaBMaV7/htMr48OoMTXA7qp2BkxjVtmi6qNT15b6t
   uZIVAZ+WnhKx67csl9oIcWqzTuCkVDjWYc9cjz9kePlD3JMG10swCWaTf
   w==;
X-CSE-ConnectionGUID: l6m7vp93TDe44q3NKQrkPA==
X-CSE-MsgGUID: sVFXmTV8QoeNVI/4KIRZ/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="85627639"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="85627639"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 13:57:03 -0700
X-CSE-ConnectionGUID: shSRpJhIQdCaFnkIsj36Sw==
X-CSE-MsgGUID: g9lUd6qdRaanxc1EucnNPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="264204745"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.50])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 13:57:00 -0700
Date: Thu, 6 Aug 2026 23:56:58 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>, jic23@kernel.org,
	dlechner@baylibre.com, andy@kernel.org, nuno.sa@analog.com,
	gregkh@linuxfoundation.org, skhan@linuxfoundation.org,
	me@brighamcampbell.com, jkoolstra@xs4all.nl,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: iio: frequency: ad9832/ad9834: add comment
 explaining do_div usage
Message-ID: <anT1Gl_zWWYrKG5Q@ashevche-desk.local>
References: <20260630032322.5805-1-raizudeen.kerneldev@gmail.com>
 <20260722082227.18768-1-raizudeen.kerneldev@gmail.com>
 <20260722104617.000050fa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722104617.000050fa@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 22, 2026 at 10:46:17AM +0200, Joshua Crofts wrote:
> On Wed, 22 Jul 2026 13:52:27 +0530
> Mohamad Raizudeen <raizudeen.kerneldev@gmail.com> wrote:

...

> As for the comment, I think it's good, however I'm not sure whether
> this should be split into two patches, given that this is a small
> change. Andy, what do you think?

This is simple case and I think that Jonathan and others are okay with a single
patch. But, up to you if you feel like splitting is better.

-- 
With Best Regards,
Andy Shevchenko


