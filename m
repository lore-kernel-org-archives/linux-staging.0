Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F14392C46
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 07:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065652; cv=none; b=Hbeei14ml/B2JSd6vOWi16Tz5HSIjEPopZoBUGzH0ueta0+XDiX7as022RveDjytkipnSOXft1YoWh3jmcnodNtPD+gV7zbs/wRz/aaBbMRyVJQGl5okbqTyteZcnO7tHusk00I7VpSTwhonsiLkVrzjYRauusjm7FbpUYERfUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065652; c=relaxed/simple;
	bh=e6BQAZGUgVAkgKcYanzsYKMx63YC+gNCChBKEtZTy5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=af0T9Y7w1Rc0mtrzfm6MrC+h0A369AcqrgX/7Gxk8/Zckywh5D2j0EL+moJ7KnG4m1d/dHnSRcDj1VJFHLVu66lIYCGamz+ACmtews1daw/zz4HxrecVNEbsB1JgMjcRFtGd3MgwjRO8Pwghilf0/HcaELhOcAV6kxcNs3qtiNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/c7qz7Q; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/c7qz7Q"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d04fc3bf2so2407856f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 00:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065650; x=1776670450; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6HEasNH32115c+BoQHyOfy+FArvbq95odOHWQ7HgwtU=;
        b=W/c7qz7Q9AW/JnyGYI4Ip9Xic4NxS+Z0HHwbT5aKN+SdU+UhA8nRxGvXuR3lNFWwlB
         aymY8gaNGaThWJUH5cgD3JJgH/1nHFc0FwUXgqpGZPin2a6rNYlukcJJIiG9nDTNHn/R
         CMK3Hekfp2CyfrYGedmg0242SLBrwlI8QKWqeLKgc/HJcWjX6Tu4b7umPjNVe7ICn4ao
         r/EpNHTjH3HlTmcWxoJvnTGfJAcbf9rFHJ6huAktW0G0daLJWswCuTPGiyFh2irrLcXU
         LMC3l5ucark/YJLpxjKYzhh2XbRvFKyHwtjGViUkw0hz+VT/7VC17ZJ3RRm7rt1NEwXo
         e+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065650; x=1776670450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6HEasNH32115c+BoQHyOfy+FArvbq95odOHWQ7HgwtU=;
        b=T4hCsExx5TVLvnC1OH9d5Mu179m+dOZuxJBRJsG+pR/3pk27PBXFh+t/a9PgF1JHfk
         B+evC7/PpMu5TnUxhza4B7AM8K1nC5AQvyVFJlo8IE/smPT1NDPzMHmvZMohddpKm7aJ
         3LBDLIaZXRkrlAxujCAzg30l3bnkamUOMsFrxVLRxVqdeF6pm+IIJSyn24GNeCT9vPEU
         uRTxW0Xhaci1b7N5LxGdu+DoyOXenF56lDtMN1tjN66m/g/7ngpyG34cZjI9QWpIyf29
         k2mlh1DqlliReo6Vsb8JPaauSo6y8ax7zJiwF4qZcUm5wn2onJK78FXlXJPqWcgQVe3Q
         0IWA==
X-Forwarded-Encrypted: i=1; AFNElJ++8qPGrLh5pzsdVbU5bJDXf0OOuUyibZKLCXesPgg05TWA9vrNYG9GkwKhPhlK8445fRYHQV/rVv0H3jhv@lists.linux.dev
X-Gm-Message-State: AOJu0Yxv+hRCy6/EK4ymd1+ixUtyMWTOAqRzPuwwy3sGW7+hBKrmIXV4
	MlNYR21Gg97UtOpu8koXd/VWgO6i69QmidwOoG8ZD1zA5U5mXQm2j8fU
X-Gm-Gg: AeBDiesgTFVCdlMmugJ/4499kLwZB8Dw8ttYHK2E3wC/C41aRntfPfvhf1gY8wtxi7u
	MkQu3+MMbdYlY2nCdThDJWT7ZaOQ/nlv54Zd4NRAoS5yxo6NCjf+EE/3BiXk7ZfBBL7c4yGW8tk
	BxHi1asQpBPX1+AquwzaqU0EXL4Eypv7ackiBnxcCb2VhARV/OtTu1S5p9PbsLPHAP+z1VhKnDY
	cdrC4odXc31B0D5Dc9sl0IGFGnh+DqOtVbKnGQusVve/4NZlGnEp6DAOKasppsSmfhLXf26OpBO
	B0ktXTAKzRdaguoonWsWZ2E2RkAYHzs2U8HbU2xuptdcEPIp9ueyNCCXuHXbg/EC+5dvoSZC+Y3
	0I6wv8TXlJRYIQWqq075weXgolSl0vV+ZExqFSNuUwv6i5pBimEc01mbff6SnlEc/GO/ZEN/pf2
	b2g5e+fxr+Ggq48Kq+ReI=
X-Received: by 2002:a05:6000:25c6:b0:43d:7cb5:43a6 with SMTP id ffacd0b85a97d-43d7cb5513amr831948f8f.2.1776065649604;
        Mon, 13 Apr 2026 00:34:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d6f4bf2b4sm15189470f8f.20.2026.04.13.00.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:34:08 -0700 (PDT)
Date: Mon, 13 Apr 2026 10:34:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: tegra-video: vi: fix invalid u32 return value in
 format lookup
Message-ID: <adycbQO7qXN5Uq8D@stanley.mountain>
References: <20260412000245.26696-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412000245.26696-1-dennylin0707@gmail.com>

On Sun, Apr 12, 2026 at 12:02:45AM +0000, Hungyu Lin wrote:
> tegra_get_format_fourcc_by_idx() returns a u32 but uses -EINVAL
> to signal an out-of-bounds index. This results in a large unsigned
> value being returned, which may be interpreted as a valid fourcc.
> 
> Return 0 instead to indicate an invalid format.
> 
> Callers assign the return value directly to pixelformat, so returning
> an error code encoded in u32 is unsafe.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/staging/media/tegra-video/vi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> index 9c0b38585d63..966792a6ec19 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -81,7 +81,7 @@ static u32 tegra_get_format_fourcc_by_idx(struct tegra_vi *vi,
>  					  unsigned int index)
>  {
>  	if (index >= vi->soc->nformats)
> -		return -EINVAL;
> +		return 0;

Someone else just sent a patch for this which added error checking to
the caller.  I liked that approach better.  (I haven't checked to see
if your approach works).

But either way this needs further review to see if the bug is actually
real and if so what is the Fixes tag?

regards,
dan carpenter

