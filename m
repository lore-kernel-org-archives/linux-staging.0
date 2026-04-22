Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6559727FB05
	for <linux-staging@lists.linux.dev>; Wed, 22 Apr 2026 10:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776854798; cv=none; b=WcMPTT6uL6KQ0ahvZdxI0UuCRYiKUI27H+bSB5gisVxLc23R1OHdY/U4jN4FosgY+paeTfSx8WlMvyEnNX1CVFFU2nuLLPLX4vvH4zHlLfqT6TAsqYPh5V14Qpw5YJcAoHClXtG/aaZxhrHHE4w7jQT7dGU/Q5YIoh5kdrQgKdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776854798; c=relaxed/simple;
	bh=Y8PFsWmV5NuGZYFfVYqIIrIYGL7pe+ZMH1qBcxO4aiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XUEyzrUqR62QWYGUfdKNrtYknMygBecAKd09Xd63FJeu2Yte4AREVQvFpi9HC0mmxU4k+2F8scfRbQXu5Xvvn7wAkyxGssYaUMStfXK0zyIVH50KvYnBfXj+G0Ys9NYAZmTuB3Wi1fxahSYMdfrpm9CBFTDKsEXCE7kHCI1AG7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OVNV3Q2h; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OVNV3Q2h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776854797; x=1808390797;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y8PFsWmV5NuGZYFfVYqIIrIYGL7pe+ZMH1qBcxO4aiY=;
  b=OVNV3Q2h5CeeEhaZWJkSJNvnhpJDf2+3T+VcP+HkLGAmERwHGf2Co9sm
   lTxsYHTdxSx/OvcyBWn+x8K8z2tCsWsMOdQEGs6xIv7DwiUSixKHQD9Gl
   PZ4VZvFPPDg9qbFhCGt1vcYkNDmTS2uVxxLnkUY8QubD0GpeJe8aahCpi
   jl4VdT3YuxWnGwSoJHaxBJk7/TQg1bDjkRumFXcaL6qcCsZZDYqryHdMs
   u3C/9OrRMe6AAS5UnyBOY8EvwoyOD/FXx49fzlEClsacoxQXtJfBNTfuH
   CTqC4mHhRvRZ1hjDpJq70Gy86oGRzmBK/b8di0p2e5EiBaCN0AtTZmMkT
   Q==;
X-CSE-ConnectionGUID: NvW10RjMRaCNfSBSA5eFMQ==
X-CSE-MsgGUID: vVryTDeNSaG/PFr2hbyP/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="65339457"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="65339457"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 03:46:37 -0700
X-CSE-ConnectionGUID: XCK5nYSDQy6PvdrgZdeQ6g==
X-CSE-MsgGUID: 3EvKjOs/SEmxNCYdxtjdlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="229151721"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.208])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 03:46:35 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BAA98120D05;
	Wed, 22 Apr 2026 13:46:33 +0300 (EEST)
Date: Wed, 22 Apr 2026 13:46:33 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
Cc: andy.shevchenko@gmail.com, hansg@kernel.org, mchehab@kernel.org,
	gregkh@linuxfoundation.org, andy@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] media: atomisp: csi2: Fix DPCM decompression for
 source pad format
Message-ID: <aeinCTZwB871zRAd@kekkonen.localdomain>
References: <CAHp75VfxwFW3nWLjKS6TXPHYJsqPJWB6G_M08t6eTkcodOj7zA@mail.gmail.com>
 <20260421082211.74041-1-debjeetbanerjee48@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421082211.74041-1-debjeetbanerjee48@gmail.com>

Hi Debjeet,

On Tue, Apr 21, 2026 at 01:52:11PM +0530, Debjeet Banerjee wrote:
> The CSI2 source pad format was set by blindly copying the sink pad
> format, regardless of whether the sink pad is receiving a DPCM-compressed
> mbus code. This was marked with a FIXME comment.
> 
> When a sensor transmits DPCM-compressed data over MIPI CSI-2 (e.g.
> MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8), the Atom ISP hardware decompresses it
> before passing it to the ISP pipeline. Therefore the source pad must
> expose the uncompressed format (e.g. MEDIA_BUS_FMT_SGRBG10_1X10), not
> the compressed one.
> 
> atomisp_subdev_uncompressed_code() already implements this mapping via
> the compressed_codes[] table in atomisp_subdev.c, which pairs each
> DPCM mbus code with its uncompressed counterpart. For codes that are not
> DPCM-compressed, the function returns the code unchanged, so this change
> is a no-op for all non-DPCM formats.
> 
> Signed-off-by: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
> ---
> v3:
> - Drop "staging:" prefix in subject (per Andy Shevchenko)
> 
> v2:
> - Rebased onto latest media tree (fix CI apply failure)
> - Fix missing linux-staging recipient (typo in v1)
> - Fix indentation
> ---
>  drivers/staging/media/atomisp/pci/atomisp_csi2.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
> index 95b9113d75e9..e723304bec80 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
> @@ -107,10 +107,17 @@ int atomisp_csi2_set_ffmt(struct v4l2_subdev *sd,
>  					     &tmp_ffmt);
>  	}
>  
> -	/* FIXME: DPCM decompression */
> -	*actual_ffmt = *ffmt = *__csi2_get_format(csi2, sd_state, which,
> -						  CSI2_PAD_SINK);
> -
> +	/*
> +	 * The source pad must expose the uncompressed format even when the sink
> +	 * pad receives DPCM-compressed data. The hardware decompresses DPCM
> +	 * (e.g. SGRBG10_DPCM8_1X8 -> SGRBG10_1X10) between sink and source,
> +	 * so propagate the sink format but map the mbus code to its uncompressed
> +	 * equivalent. atomisp_subdev_uncompressed_code() returns the code
> +	 * unchanged for formats that are not DPCM-compressed.

It may well be but the rest of the driver doesn't appear to support DPCM
uncompression. Rather than trying to pretend it does, I'd instead just
remove any references to it.

> +	 */
> +	*actual_ffmt = *__csi2_get_format(csi2, sd_state, which, CSI2_PAD_SINK);
> +	actual_ffmt->code = atomisp_subdev_uncompressed_code(actual_ffmt->code);
> +	*ffmt = *actual_ffmt;
>  	return 0;
>  }
>  

-- 
Regards,

Sakari Ailus
