Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995495;
	b=TfgM2w/Ww0tVJNFNymjTn3BP6n+anr9pKi/1bAO3URi6EnPubAAWgTHpSZ4QastchHq4
	 p7e4Y/vCDzNPdhJJwedT5rFTR8fldwGHyRTPKJWvPrx/WOQzpUwAwVWtuiCQsDAiy+eCv
	 60HXxT32HsXRYdvyg8PoR8JTgI3XGRV4puSPt7w0KmnCg7pZQn/3cuUmyjGQyhaRqHMfk
	 IoG66h/lNkTF8T6VLL1kIOekyAuIsG3BZW/z1XuymIYFRrOKx0cacSgFMpvWdsmEp2FSi
	 FaFiKZAqU6uhE0E9HqP+0spGI6FldXfDmmLGAJseI7lZb/fmbzBeWr2/0H5xs0qzgJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995495;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=SPLZHyzGwmyB6tV53wdX0nn0Xe6yutwY92+CwxQ6WDo=;
	b=nE/gZnWlnVIGWjOZv8hMxTApcoinl+6HYMiDRWF8S0/6OtdQUx5CBwNmBEstmyQQRWkG
	 b7wJXwDV2Ykf5lq1YhQzA39M3qUIhO2PGd0OYKoVnYc9ugidtL7f6A3z0Gq9n4fnuYeOq
	 NrlyVCXx3wESwYak/c8huakfOWlUaaylb/Of/HMBe+Zl4HWlBezCu90lWF1S8L0C4R+GA
	 mL0XoGmo8ad+WCYkxLkRzLfbfkec9Xw33GPW2hibJTQk93ujxg1Zs9BMmHYYfXYpH6B6Q
	 33DQ2DW7dlOkv3Z9yf+yS6AVse2k5GwyV3McDyYIXpwXLDsM90z2uBQ0m3El7b2OeTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bKOezr+u;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E30B606A31C
	for <linux-staging@lists.linux.dev>; Wed, 18 Nov 2026 09:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E30B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bKOezr+u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794995494; x=1826531494;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3QrsWSza1jym5uWm0xeQ341okiDTHtK0dfzeNi10C7c=;
  b=bKOezr+uKIlG7IdIipWFaLm2svO+tUz0DiSxKtMgU+dSf+E8sIzUocZ3
   QGaRR0EefbDxuhC3xysP3MVXVNO54I4YI6TEuKy+tZpTE5JmClpMgtZ0g
   Bxo2YzFElK8Z2Aq33XHolgp4FU+gwEehI2TOf5MewSFLtU57KCAmOYxXr
   0+5ZiJTiuUxE/+Kn2WzKLKLtSepA799YV/aMCHm3/ordTVN52Ov6eaeCB
   f6xYUC+sfBhDhNCdo+9kOpnoJBtLxmde4Z17L1i/8QwEEypALgO8T1o5s
   5yfzZdSbBZbWrtOm6pBV7auU1yKheZhdlHAOuiseTeFPY0ahBlgUUgn5N
   A==;
X-CSE-ConnectionGUID: B1CLzLBJQDq/BLVofBLjrw==
X-CSE-MsgGUID: 7ssW6waCQWWutSKXR0yb0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3837849"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3837849"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 01:51:16 -0800
X-CSE-ConnectionGUID: P2XiFKnKTFOq/jKWbzMQhA==
X-CSE-MsgGUID: YfBoIbK+QnShwm3bFaRYzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10434684"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.157])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 01:51:14 -0800
Date: Wed, 18 Nov 2026 11:51:11 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Volodymyr Chapman <volodymyrchapman@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: atomisp: Don't enumerate frame sizes the
 preview pipe can't output
Message-ID: <av11D183z21CosFd@ashevche-desk.local>
References: <20261116175750.21905-1-volodymyrchapman@gmail.com>
 <20261116175750.21905-2-volodymyrchapman@gmail.com>
 <avwtA3b3XMkGXPfZ@ashevche-desk.local>
 <20261117175635.11790-1-volodymyrchapman@gmail.com>
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
In-Reply-To: <20261117175635.11790-1-volodymyrchapman@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 17, 2026 at 05:56:35PM +0000, Volodymyr Chapman wrote:
> On Tue, Nov 17, 2026 at 12:31:31PM +0200, Andy Shevchenko wrote:
> > So, what makes us stop implementing the crop support there?
> 
> atomisp only uses its crop path for sensors whose driver supports the
> NATIVE_SIZE, CROP_DEFAULT and CROP selection targets
> (atomisp_init_sensor()). The IMX175 driver does not yet: in his review of
> it, Dave Stevenson suggested that binning, and possibly cropping, should
> wait for the Common Raw Sensor Model. Once the sensor supports cropping,
> atomisp takes the atomisp_enum_framesizes_crop() path and this code
> is not used for it.

Personally to me the above sounds like "we don't accept more raw sensors until
CRSM will be implemented". Because I don't see the point in implementing this
hack just because something is pending. Perhaps we need to push people to tell
what the estimations are for that to appear?

> Even with crop support, preview mode would list nothing larger than
> 1920x1440: that is the largest entry in the frame_sizes table of
> atomisp_enum_framesizes_crop_inner(). This patch applies the same limit
> to the non-crop path.

This confuses me. Would this code be still in use after CRSM be implemented?

> > No need to repeat these two paragraphs, make sure they are in the cover letter.
> 
> Of course. I will keep them in the cover letter only in v2.
> 
> > TBH, this feels like a hack, but I'm not v4l2/media reviewer/maintainer,
> > so I don't know if this approach is legit.
> 
> The intent is to make VIDIOC_ENUM_FRAMESIZES match what
> atomisp_try_fmt() returns, which already clamps the size to 1920x1440 in
> preview mode. Without this patch the IMX175 lists 3264x2448 and
> 1624x1216, and TRY_FMT for 3264x2448 returns 1624x1216. With it, the
> IMX175 lists only 1624x1216 and the OV2722 lists 1916x1076, 1616x1076
> and 1436x1076. Every listed size is returned unchanged by TRY_FMT, and
> for the other sizes I tried (640x480 up to 3264x2448) TRY_FMT
> returned only listed sizes.
> 
> Hans, Sakari, would you prefer this, or a different approach for the
> non-crop path?

-- 
With Best Regards,
Andy Shevchenko


