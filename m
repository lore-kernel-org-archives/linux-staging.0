Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6909837DE85
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 07:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776064895; cv=none; b=KOJMXCYDRG9ie9qHQr7y2hje37fcO40jQi3Mk/iF6X7HAXSnPnoY/3l8rqSzgndHGWaECSH8VdQ0BgXjnxqfuDU//npXfKSaLDGqmGsfXCixkCBILv2hcjvPKLg15d4m6Cu7eTXQbkBDD/mK72y4lH24pa7CMYIW4KIrZ8ZkrIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776064895; c=relaxed/simple;
	bh=dPLuupoDLLr+Wx19Z3u7DYxO18a6a48VRDBlxNU+JIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GkAsvWWcXu9I/RvYVJ4brDoO12JCDEO+uOYXIV3f60qdoTYwfATmk2XRvsIAk5745LI18QHSlSeOPG52Gypj8ysnNbZkyzUbbaEyKjhFRRlkTiDejcmt1Uo26ePKY/xKxEhkrcLugzBP9BS7s/pxZn/Hfy7W8jeivzHUK1fa+0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFxbZ/Ey; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFxbZ/Ey"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cf5ad500fso3458622f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 00:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776064893; x=1776669693; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iw4ljpgUqAKzzrRRr5hlS15ea4IPkp99uerSPaTGYwg=;
        b=DFxbZ/EybMUyCxVn8le+AZeDzKjcw3eIKtGQGnP+Zo58F7+Jp8UBj6P/CtfjrmdYL6
         xL20mgCg21F9uf/GmpjwnTU7tVDgzlcd8ULmB+6BuzlXcI087iWTzDTkW3JH79CaS85k
         HZdyOrwtzqwxF9s2QYEy+VnxFDnj5hAP/whJo7strdeUgqffZT38zy286M+Z7/8IHhot
         KTskV6gxK2dqQFhiMUeYhxVT2GCNyUMnml72b5gYAmaMPJ3NxDuWBb6lC/lzSVoafp7Z
         rtBr8mmd58hoPK8E5olVqNZQb2R3hUkS/Ita+MpwVzSza7HmakYC6wju/xIYXj5dkWqf
         1mgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776064893; x=1776669693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iw4ljpgUqAKzzrRRr5hlS15ea4IPkp99uerSPaTGYwg=;
        b=lYdAqX4s80UDEeHDhUKB6bZDH99pv8RElxyEWe91cvUvgFU/JeJBuVz0suB0LjSeXv
         w/88TDORLzTbmRJTulsQvOp9TyVgzjBjthF3weDgnsog08IDDAXy8h9viO1aq41Wk6ol
         lXrLu2A+wjqhhMoVGZVlQ5PQecBjXUqpc6T3S9jjGzGCMcB2gbzk+pjKulCu6LQQcHf4
         QuOrYYHsz+p+4FBM2Ls2gWqcZVTfgBBFMDhS9KdlN1iO7HRICvPbZWFuaCj1c4zK67sR
         lb0GMbQrYv3s+L/X4M1lMkev051H10sfRJQ/HoUehxLRLo7ypHUY9TEhxzDUH6bpEoeI
         bDyA==
X-Forwarded-Encrypted: i=1; AFNElJ8+6NCqjzZ3gE6J2RBIKyPbNb97NAEMPtEcVGuo8UZ43cTkswZ3qYP32btGA3aT4a8s843Sv0YfcqjZBQvy@lists.linux.dev
X-Gm-Message-State: AOJu0YyPTJ6DIi1VL74tGUAVDbfJtf0kvbOXJhl9dTiUmd1oTKJfLg8X
	Nzu50oed08Pw6TpKneBHfZ7w9qOf6k4v5uwGyWBhoSE3kv4dQ6ITo7d3
X-Gm-Gg: AeBDiesgSs8Sstpml9ol8zRAjS87Aq6Cu15ZuE7QIeVTpdMCvqEjEEcBOEtyow9i4Gn
	IK/Yjv1KuYPlCoTgHA+iKkd5FRzIFTJbSss+KQT7BAl/dxhONF0dal9E4/tkNN6ZfjBDsZAIQbL
	0bvY8t5gu444RNLkgGPIbN1mjW2jGJdpnviEHye5YIWZWKIf1kxUAIpIcT17ifuULwsFLKvR2HS
	M7w2dFDjwaczcyYvCOMjqW0/HIuYnJoy8djZfltEc87rw3LSVHwRZmulerL8dJsWyt1Ht/G4Lb0
	ckYZw5rupfZk+vA5eIKWNIrLahye2+ieOwN42jY0bVHkAVw+38Pio72D7x+cw8fuBo4ABJK+piG
	1RpCYjchKGlUljIqHW3VYiuTb1IPGP0+x0EEAE4Di1sDKkag8IWXwzu+t14H68DAmnGnONM5FCf
	TYjprh7S8DMCFPUQrHYRMilwASNG7Vhw==
X-Received: by 2002:a5d:4b05:0:b0:43d:7508:c9c6 with SMTP id ffacd0b85a97d-43d7508ccafmr4141774f8f.28.1776064892744;
        Mon, 13 Apr 2026 00:21:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7c135fd6sm3713097f8f.28.2026.04.13.00.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:21:31 -0700 (PDT)
Date: Mon, 13 Apr 2026 10:21:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: media: tegra-video: add missing error
 checks in vi_tpg_fmts_bitmap_init()
Message-ID: <adyZeOe1aL-0cSB4@stanley.mountain>
References: <20260411211006.150782-1-hossu.alexandru@gmail.com>
 <20260411211006.150782-2-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411211006.150782-2-hossu.alexandru@gmail.com>

On Sat, Apr 11, 2026 at 11:10:05PM +0200, Alexandru Hossu wrote:
> tegra_get_format_idx_by_code() returns -1 when the requested format is
> not found in the SoC format table. vi_tpg_fmts_bitmap_init() does not
> check this return value before passing it to bitmap_set(). A negative
> index converted to unsigned would result in an out-of-bounds memory
> access, corrupting adjacent kernel memory.
> 
> Add WARN_ON() guards so that any future SoC addition or Kconfig change
> that exposes this path fails loudly rather than silently corrupting memory.
> 
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---
>  drivers/staging/media/tegra-video/vi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> index afc7327ef318..e6416ea8503e 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -1025,11 +1025,15 @@ static void vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
>  
>  	index = tegra_get_format_idx_by_code(chan->vi,
>  					     MEDIA_BUS_FMT_SRGGB10_1X10, 0);

This will only fail if we can't find MEDIA_BUS_FMT_SRGGB10_1X10 in
the tegra210_video_formats array.  The commit message makes it sound
like this fixes a memory corruption bug, but it can only happen if
the memory is already corrupted beyond hope.

Please write the commit message to be more clear that this is not
a real issue in existing kernels.

regards,
dan carpenter

