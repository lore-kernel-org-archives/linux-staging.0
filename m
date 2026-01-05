Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FE93101A8
	for <linux-staging@lists.linux.dev>; Mon,  5 Jan 2026 16:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767630524; cv=none; b=GwngglJVz1lKm1xZDv5zAny5iKV87hTqRxw0UIoLpmdA8gRj24l0pFLoj8livJXFWDtIQR+qEz00WTco4e1S4sE2jxCnRfC6Nz+N5/fwK0nJyeM9FKWDYMx1b75RMQJ5NPWJimHGWDtFOuKCV0m4C6yYPfscyFtHGfdoAgJqe10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767630524; c=relaxed/simple;
	bh=FsPS/LubOaNTccnvOYz0BxmjeM7vrFfXaA9Rl62TCtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gB5cAn//N3WarSUF2z7kV/NCGuOu3W94XeRhaI4uG+O8unZNMyL8mqkb0QRPywKSg+ffjp66mNaLcoHeKDJjF14jAfc4aamDRQJdrW2rsyC7oNcL2/oavcslZFSVa8Xixzx1ChguTCcn8lQzCfsKL8dUBDYt1JfADOIncYTgW2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HcoIqinR; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HcoIqinR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767630522; x=1799166522;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FsPS/LubOaNTccnvOYz0BxmjeM7vrFfXaA9Rl62TCtg=;
  b=HcoIqinR7+ySvfXw8DkOrydpZ6qWis5p7Nr7KhfglO5HdzhT87hvR++k
   A4oZHc6TLUOywVN+qQPha3E65cLVDbrwFutXCa15iQBuKO7edRUB4a6xy
   FfTITd2InUB/XhFPmO8oGiBPyxQuFMHeN14Gjeav5UnS+dCMbYTxG5U4s
   g4V4xtRf8mX6vVhvKyaOqDKCTDktGwNmslOFIjLpHsap+Wom0Rbnequn+
   1pA9M/ROkfeTCiff3DEdxK1QpdnrhosHrUMjXWc2bATwXtD/0XfoR7/AP
   20HnjX2R55QWOYJfzX8s5SmH8U+tkO6MlIMEcWRCV6WgHGk2a1EaVzaiQ
   Q==;
X-CSE-ConnectionGUID: lFBGuP24TYGyyaRo8UBbJg==
X-CSE-MsgGUID: hBODry5STh2gPzqy6vNo0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="71574084"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="71574084"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 08:28:35 -0800
X-CSE-ConnectionGUID: yjeDY+T2RFOcWKugteKcWw==
X-CSE-MsgGUID: HHb9E8xQQ6CS5mko4iL4fA==
X-ExtLoop1: 1
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.215])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 08:28:33 -0800
Date: Mon, 5 Jan 2026 18:28:31 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1 1/4] staging: fbtft: core: avoid large stack usage in
 DT init parsing
Message-ID: <aVvmr2qOrFvoEKGV@smile.fi.intel.com>
References: <20260104110638.532615-1-sun.jian.kdev@gmail.com>
 <20260104110638.532615-2-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260104110638.532615-2-sun.jian.kdev@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Jan 04, 2026 at 07:06:35PM +0800, Sun Jian wrote:
> Clang reports a large stack frame for fbtft_init_display_from_property()
> (-Wframe-larger-than=1024) when the init sequence is emitted through a
> fixed 64-argument write_register() call.
> 
> write_reg()/write_register() relies on NUMARGS((int[]){...}) and large
> varargs which inflates stack usage. Switch the DT "init" path to send the
> command byte and the payload via fbtft_write_buf_dc() instead.
> 
> No functional change intended: the same register values are sent in the
> same order, only the transport is changed.

How did you test this?

...

>  	struct device *dev = par->info->device;
> -	int buf[64], count, index, i, j, ret;
> +	u8 buf[64];
> +	int count, index, i, j, ret;

Please, try to preserve reversed xmas tree order.

>  	u32 *values;
>  	u32 val;
>  

...

> -				buf[i++] = val;
> +				buf[i++] = val & 0xFF;

Unneeded change, I suppose.

...

> -			par->fbtftops.write_register(par, i,
> -				buf[0], buf[1], buf[2], buf[3],
> -				buf[4], buf[5], buf[6], buf[7],
> -				buf[8], buf[9], buf[10], buf[11],
> -				buf[12], buf[13], buf[14], buf[15],
> -				buf[16], buf[17], buf[18], buf[19],
> -				buf[20], buf[21], buf[22], buf[23],
> -				buf[24], buf[25], buf[26], buf[27],
> -				buf[28], buf[29], buf[30], buf[31],
> -				buf[32], buf[33], buf[34], buf[35],
> -				buf[36], buf[37], buf[38], buf[39],
> -				buf[40], buf[41], buf[42], buf[43],
> -				buf[44], buf[45], buf[46], buf[47],
> -				buf[48], buf[49], buf[50], buf[51],
> -				buf[52], buf[53], buf[54], buf[55],
> -				buf[56], buf[57], buf[58], buf[59],
> -				buf[60], buf[61], buf[62], buf[63]);
> +			/* buf[0] is command, buf[1..i-1] is data */
> +			ret = fbtft_write_buf_dc(par, &buf[0], 1, 0);
> +			if (ret < 0)
> +				goto out_free;
> +
> +			if (i > 1) {
> +				ret = fbtft_write_buf_dc(par, &buf[1], i - 1, 1);
> +				if (ret < 0)
> +					goto out_free;
> +			}

I believe this is incorrect change and has not to be applied. write !=
write_register. Without any evidence of testing, definite NAK to it.
Otherwise, please provide detailed testing pattern and which devices were
tested.

-- 
With Best Regards,
Andy Shevchenko


