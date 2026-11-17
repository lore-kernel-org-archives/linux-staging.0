Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911498;
	b=yxVnAIRN9oCGweFJhVSZFFWDb0NWJ+EZc26mdSvqYZh6xdJbBvJ+oxlNDd7sPLyvTrjX
	 zwltgvY5wILxVZdFpf69jJpIurPteTO6gPlBLJvR/naIkzWXc4nY3tHTHyFBCPHrAT6a5
	 cxCoZY1RpNTNWx+Lz6n7H5cHTbY+LFnPXFEOJGhwm1hginXa18WIvbUQ1pSzc/ws0ZUho
	 zso3tuYuK0p3KVhlNlCRIi9KYjgTyydGK7L80PStkY6sG1kbe22oM3vh2MmhyP5ixePUE
	 wRuWHVXC1odmpGBY0O7P4I1F4qhONjLpTFvjpG328y+rx4Y7dMgIEufrDesCdPWyB6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911498;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=EddmOL6V2fpWsXMOqAfaUzAXhV2KsCU6oOdeZ0ufqcs=;
	b=gFfn8xnNcCnrwbKCV6k3dDtXtocWy9YsIKGMjbT8olawaK3tT0MckVpun8XmoLcZaZ5V
	 tval8QmT7Nw3PuLGhZ7ZBo+pJDQ0V/cVv0nVTPMP+Vp/dYIFzSoHBGchgZ/FdGLZLg8Nd
	 Eez1EotYm5+s/BykbF2lCk9v5Q4ImBlPb3kj8GEUs5DhQdgffLPljv62cwdlDt444iaad
	 0BcxxCBzJXqICdZkkCZs6eQfnq3024hWafWiwb+YQFPq2UOqYKzOzrr5DMPz/7oxl2IqG
	 QohqVMBJc+YgZJ3qWGrETDo/Zie3S0l9AFGXNf8hIUSu2md+xSlxWXBLyRYz7YjOwow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OhokEslu;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8E3606A893
	for <linux-staging@lists.linux.dev>; Tue, 17 Nov 2026 10:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D8E3606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OhokEslu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794911497; x=1826447497;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5zKd62oKBlWqWvrXza2gjoQFU4NWSYyOjL4Bde79keA=;
  b=OhokEsluhrPb7MDE7UATv4OkVueQV1RcD4LLADCx/QcaT1Fy3PDhk2Lm
   +06kUQ2haJQJkLU8/akOLIbKHPP4z+uVSX57KpuKN5DKNC3WvaPw4+clK
   8agPymnPv/kEUPJ79XF5r+2KlT+UgJ8SYc3jESvFVTGzwliIADwMfi3F6
   2hrkIX3Y9KOb/u8oKmxWiXhXZ6vwYQQdiSV8eJMm9vase+D3JcOgC9P1W
   jRviUJy0REj0QMyq3PTbhnAEYLDoFgZ0h2Ws3pMGAHH/+QcXAaurRwef9
   x2XpA8qao1eAjQxoKMB6i7vOWqHVpGWQ5tlO1bHdJ8Q57E/r1eCsW3Xb3
   g==;
X-CSE-ConnectionGUID: 1FWuSIgSSwiPt6oH/FT2MA==
X-CSE-MsgGUID: oJ0oUWZjSp+m/CY8bg30Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3599802"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3599802"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 02:31:36 -0800
X-CSE-ConnectionGUID: 4nXW4w7tTkq5cA/XeF6ALg==
X-CSE-MsgGUID: cdu+uXn6RLCzg+lkV7sh2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9739221"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.254])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 02:31:34 -0800
Date: Tue, 17 Nov 2026 12:31:31 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Volodymyr Chapman <volodymyrchapman@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: atomisp: Don't enumerate frame sizes the
 preview pipe can't output
Message-ID: <avwtA3b3XMkGXPfZ@ashevche-desk.local>
References: <20261116175750.21905-1-volodymyrchapman@gmail.com>
 <20261116175750.21905-2-volodymyrchapman@gmail.com>
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
In-Reply-To: <20261116175750.21905-2-volodymyrchapman@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 16, 2026 at 05:57:49PM +0000, Volodymyr Chapman wrote:
> In preview mode atomisp_try_fmt() limits the size to 1920x1440, since the
> preview pipeline cannot output anything larger. For sensors without crop support

So, what makes us stop implementing the crop support there?

> atomisp_enum_framesizes() however passes on all sensor sizes,
> minus the padding, so VIDIOC_ENUM_FRAMESIZES lists sizes for which
> VIDIOC_S_FMT returns a different, smaller size.
> 
> Userspace which picks the largest enumerated size and then checks that
> S_FMT gave it that size fails. For example PipeWire's V4L2 source cannot
> negotiate a format with Firefox for the IMX175 rear sensor of a Lenovo
> ThinkPad 10, which lists 3264x2448 and 1624x1216: Firefox picks
> 3264x2448, S_FMT returns 1624x1216 and the stream fails with "error set
> output format: -22 (Invalid argument)".
> 
> Skip the sizes which do not fit the preview pipeline when in preview mode,
> so that only sizes which S_FMT can set are enumerated.

> Tested on a Lenovo ThinkPad 10 (20C3, Atom Z3795) with this file built out
> of tree against a 7.2.15 kernel: ENUM_FRAMESIZES for the IMX175 now lists
> only 1624x1216, and Firefox 160 streams from both the IMX175 and the
> OV2722 front sensor through PipeWire. This was build-tested on top of
> media.git next.
> 
> The problem was investigated and this patch drafted with the help of an
> AI coding assistant (Claude); the testing was done on the hardware by the
> submitter.

No need to repeat these two paragraphs, make sure they are in the cover letter.

...

> -	ret = v4l2_subdev_call(input->sensor, pad, enum_frame_size,
> -			       act_sd_state, &fse);
> +	for (fse.index = 0; ; fse.index++) {
> +		ret = v4l2_subdev_call(input->sensor, pad, enum_frame_size,
> +				       act_sd_state, &fse);
> +		if (ret)
> +			break;
> +
> +		/*
> +		 * Skip sizes the preview pipeline cannot output, for which
> +		 * atomisp_try_fmt() would return a smaller size.
> +		 */
> +		if (asd->run_mode->val == ATOMISP_RUN_MODE_PREVIEW &&
> +		    (fse.max_width - pad_w > 1920 ||
> +		     fse.max_height - pad_h > 1440))
> +			continue;
> +
> +		if (valid_sizes++ == fsize->index)
> +			break;
> +	}

TBH, this feels like a hack, but I'm not v4l2/media reviewer/maintainer,
so I don't know if this approach is legit.

-- 
With Best Regards,
Andy Shevchenko


