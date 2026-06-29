Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108FA43C078
	for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 16:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782750300; cv=none; b=oyg7crJvtNYZg8cde1eJHRRQaGapUlSKJCA7MR/Dp+X30i85POY8TQ40GPp6II6y2WcbfBC6kjh09Q0zEfqL5L529ADvr6qePH5xb695ZTSQqFyIu+JFipHH8BHE0xTKXZGUFEmPa0/nmpG8k5VHs1THq+5w093ToIbExpBGURI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782750300; c=relaxed/simple;
	bh=o5t4J99Ft/B/ByL7TptJC3aZCmUArFeilGEd4v9Czsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQL5VLKHZq1AeDdA/5suZXtp4Gqtd7/itHYaCJx8SZa8dEx6LAKniimWxfmLtE/M8zLHHGbIa3v8LFKC/ksbZzmAetfRE9Np1mYCJU1gnHx2ClT6WNP+/hnuUIp1w8xPd6ED45nXyjUKk1YDgKIMkjg64UOkP+TLDXq1RgkM1dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TCBC+FNT; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TCBC+FNT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782750299; x=1814286299;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o5t4J99Ft/B/ByL7TptJC3aZCmUArFeilGEd4v9Czsk=;
  b=TCBC+FNTA5zNbT9lqAWn3aRgHFjJ8zjxrPGq+L29zjrYbZtM1czSTNOB
   RZZ2/vtIG4GQ58lwwoWzYQYUL2OaMVDhwZAWkJdLiZG/qExbfHMtIatiW
   H0IAUHfOvFXdwad5bDd+e0BYFFtKgfbggiIvt7cCNoBVzjZYOLHMsHSqo
   ih8xoFBhCZDHksb2JJnMCnLLM/b1i8vUYIC3ppA2jd5MJhMUMF0ABj59G
   D0/aBMKBN5EeHvGx5BJEh7XMNKNogzcbScxv1U/F/VJ50W+Rv/p0F2INe
   xEot1Yr56ElEjqIJ0/EusAEwU3tcP2pJOIDS8bYLFRaiUSuLcpf/BmPHt
   w==;
X-CSE-ConnectionGUID: AjrtglWqTpCZfYkk7aSkdA==
X-CSE-MsgGUID: oI0qxqKsS5ijgMGjYherWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="94037119"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="94037119"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 09:24:58 -0700
X-CSE-ConnectionGUID: HwLbCL2STuaekElzD4r5Fg==
X-CSE-MsgGUID: hSueI52aQAik0VNE7/UIuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="276272790"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 09:24:56 -0700
Date: Mon, 29 Jun 2026 19:24:54 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Doruk Tan Ozturk <doruk@0sec.ai>
Cc: hansg@kernel.org, andy@kernel.org, mchehab@kernel.org,
	gregkh@linuxfoundation.org, error27@gmail.com,
	sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] media: atomisp: validate sizeimage against the
 allocated frame in framebuffer-to-CSS
Message-ID: <akKcVudM8hj5Germ@ashevche-desk.local>
References: <20260627100119.97650-1-doruk@0sec.ai>
 <20260627100119.97650-2-doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627100119.97650-2-doruk@0sec.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Jun 27, 2026 at 12:01:18PM +0200, Doruk Tan Ozturk wrote:
> atomisp_v4l2_framebuffer_to_css_frame() allocates the CSS frame from
> arg->fmt.{width,height,pixelformat}, but then copies and stores
> arg->fmt.sizeimage bytes into it. sizeimage is an independent,
> user-controlled v4l2_pix_format field, and nothing checks it against the
> allocated frame, so a sizeimage larger than width*height*bpp overflows
> res->data in hmm_store().
> 
> Reject a sizeimage that exceeds the allocated frame (res->data_bytes)
> before the copy/store.
> 
> Note this ioctl path (S_ISP_FPN_TABLE) is currently gated off by
> 2b7eb2c5dc72 ("staging: media: atomisp: Disallow all private IOCTLs"),
> so it is not reachable from userspace today; this hardens the
> disabled-but-revivable path.

> Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
> Found by static analysis; not yet runtime-reproduced (Intel
> Baytrail/Cherrytrail ISP hardware required).

This can go to the comment block. Otherwise you have a tag below already.
Same for other patches in the series.

> Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
> Assisted-by: 0sec:claude-opus-4.8
> Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>

-- 
With Best Regards,
Andy Shevchenko


