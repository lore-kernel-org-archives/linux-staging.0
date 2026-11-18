Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001745;
	b=fJVw1wNgxU3GEpSDvqrcCyephKSJFyNvUcbM4jqldv1f5h5bG60UvLYjRyEn+idz2BMT
	 swyNoM7qhKN/kevvOnuFcnUQgI4AsZHs/rXEjRYohTzLXF6gmIdKfBY2SUpbUWYE5FkV0
	 WW4Ov22I+OvmDZoWxBwhuEYxDy9KMt4FmK6u+YabKv7IncMKI83vPboDQP8MrkSGSYmDE
	 99wyBT5Wb4SubtC2hBn/vkXBlTmRNrkemKXq8aDXqiAFTchBd9LezzfCCm29Zfv7o1kG9
	 KKFOT9yhgt6goYd0yw8Kwjh0BfiMHOQR1UFdC8jmvTwplsH3+RJIhz59qteYvNn/Hjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001745;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=iUixPGpAmEzOF1PUyAFmudugrxdERzx0JQxsOdYzZKI=;
	b=pHQfzDMF4gfr5FshBip4LlXHlbkt2zWXRZzM6A4oydSmBN0xN9Wkmb5pdQjfixD7qPRe
	 wUbpeTogl+X49+vroYXQBlkkH8UGmBhhwJHTHUSlEmyHg2TGb2HD1NeHNjm/Yzsq+ak/a
	 d4C8TS1jV3044zbmLDIBER6eYLKNfj/OuV+IQKk33o6rHOqGXrpmPtwmOrVbxnS3W1U/I
	 ZBe+YHhl6NAsrQ2o+NU3cUlbBSIuHLGZFErkQHAEs+dVHKlwe2GWazj96u1lgNXbi1e79
	 bp9dLENsSnbOMxW2FJQj7cMvf9yDZA0tnUoedOVhQ/7B1vMaD9X4rdwwxs0UbzCMMdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vs9eGYhF;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50441606A32A
	for <linux-staging@lists.linux.dev>; Wed, 18 Nov 2026 11:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50441606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vs9eGYhF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795001746; x=1826537746;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=scrDDog2yq5vlMU2hHLdLRQ/pxjPo4E+eU8KMZPGGEc=;
  b=Vs9eGYhF1xJbx/h4kW44jtWxeJvar/fU/fGT5/f/dzQ0PZdceL+Xd/ex
   mo8nNFVGHXIMstUMe3+x9EB5RQRZ5bO8lcMU1VXoXijMmjh5MuhUyhtdk
   Q1JI5wtYLVT6Q04609wnPS/PgAmJqR2NSxcVxqmCpz0RjjG3OlMflDJLd
   LlLRhmu6Cet7j4tV/g0C+TnrX8TkjfYXpLdbKKjR4O7/yJQ9j96ihgDlS
   23Ma2siqGCnccvvc0jWm8yUQmjSHAUU5f6FLzgpJrArB3t0KyxxeD2MwL
   p+nwqNb0+9nRENvarBMDqI/1h3rsbG76x5BjG+I3nGxxjZe+rPuEqreG7
   g==;
X-CSE-ConnectionGUID: KPbmRE4nSTmiXrBXtMcY4Q==
X-CSE-MsgGUID: Pc7LtsHZTYqexA8c1jmTFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3693061"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3693061"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 03:35:45 -0800
X-CSE-ConnectionGUID: QnOJrbkrTJWes6hKTaXpUg==
X-CSE-MsgGUID: QOrSfv4CRRmuaP5KzOEavg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10265237"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.157])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 03:35:42 -0800
Date: Wed, 18 Nov 2026 13:35:40 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Volodymyr Chapman <volodymyrchapman@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: ipu-bridge: Add Sony IMX175 (INTCF1A)
Message-ID: <av2NjAA8yTAwwZ7t@ashevche-desk.local>
References: <20261116175151.20150-1-volodymyrchapman@gmail.com>
 <20261116175151.20150-3-volodymyrchapman@gmail.com>
 <avwk93N8D7AYGzDX@ashevche-desk.local>
 <CAN1s30pEE5vN7Yuz9Y5_+4M6-TeTNTmHA_hYLR9KLnXj05RWfQ@mail.gmail.com>
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
In-Reply-To: <CAN1s30pEE5vN7Yuz9Y5_+4M6-TeTNTmHA_hYLR9KLnXj05RWfQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 17, 2026 at 05:50:12PM +0000, Volodymyr Chapman wrote:

...

> > Since the ACPI HID here is broken (it's actually a PNP ID), can you also
> > provide (as a comment) the excerpt from DSDT to show that device description?
> 
> Of course. From the ThinkPad 10 (20C3, BIOS GWET50WW 1.50) DSDT:

Thanks!

> Device (CAM1)
> {
> Name (_ADR, Zero)
> Name (_HID, "INTCF1A")
> Name (_CID, "INTCF1A")
> Name (_SUB, "221B17AA")
> Name (_DDN, "Sony IMX175")
> Name (_UID, One)
> ...
> 
> I will add that as a comment above the INTCF1A entry.

No, in the code just mention the laptop model, DSDT excerpt is only for cover
letter.

> Should the same comment go to the INTCF1A entry in atomisp_csi2_bridge.c
> (patch 3/3)?

If there are already similar comments for other entries, then yes.

-- 
With Best Regards,
Andy Shevchenko


