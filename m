Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584D3396596
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 07:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065863; cv=none; b=pU+v2ZnplHUWmxjRKMar1Dvdqlwu25Px0NmYnRyYevmHqtI9dniSDPIC7NFB3FcnWEybcfqWzIjsOvbQdDr6HLKOzHwS4jP9d2HsMKBFOa8cqAbICRu0i9cqX+gJqqWoWMdCIP7IB7iqTJSRhNRHcNTbg0pY52rBGR3K1Elwk8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065863; c=relaxed/simple;
	bh=SC3qj+zSPrXC7x148ssSlAOSsrLh6sGlRiQ6lldj1q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i122ThhTFgGrCSB1gYyoaxa0eptTYOmZn8NqRKOBRQdn4HBVMB9RVC1HD4OzkTJ9CTAYv7KWzF3Pgr8FzHOcsltZS7d39ZhUuFVnR/QfuijNAhX1eBKpJFg4gibmCemiYSot6qG1uk+UhlO/YD13SPMjZPu7xcCSQF3VhDUxHkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BCEO74X8; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BCEO74X8"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d70c30767so666812f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 00:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065861; x=1776670661; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i0t7dfofWTApgTDHYz2jvCuOmi04UnlECznc19h2Ol4=;
        b=BCEO74X87sAeW9+biqco/DtRkuRnICcPHq3QyeJeIe4HVPdYjsG6+HQW7uBnNNJV/w
         k3hvNwVwW3OF2toKEnFgyIWbh+NJ7RZEdgq7A5rzGCagJUuNkWlGNtyib7DUh2G3TUIZ
         9PCjfBnLVQVT/lnRfvhq+8bjDKjE5Mxo2qFufQ/lm4Ep661ju1dQ5t2p8xbk7aiHO7Nf
         oCVqbY5cBwr0Ceb+0upc5g4slbTK9TJrvxbxf0Zv+bUPhNt3gtvsBPpYZrUePgFyRsDH
         OKdj2aSTRXu+iDb7IP+elCddD6REHRSx1HejDQp+MhhkVBTSxgB9Jl6gYR7+XatMYBhf
         Z4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065861; x=1776670661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i0t7dfofWTApgTDHYz2jvCuOmi04UnlECznc19h2Ol4=;
        b=Yjw/+Wq37tNMVnPVYfsgKf5YjBcTDNBnB63Et3Kr54A7pwST5OMdKW7XH1ZCGq3DC0
         zl2fm+99acjK1/S7g//4z7F0c2n67+V6xtCP7vjGRB3bUINCpm77Ain1dawpjSDg46+G
         dENqAnzT90IU2hsPjFXPXqnEQ+qBDPyIJ9XFp6S/opKFTtIVTJhPE31hN71vAsGkxO7E
         gZ4kIjtI55/c2f2Jg2QxTBq5S8/65834Jsr05AK1GiYqh5CxGy29iaU/scQXzhlGgxe9
         A5tIJhAm6F5dfOc7VVnXLx5l87Pbd9ZRFelLLGPOmk6oPcETE9wZp6kJ68U7BJJcODWi
         deew==
X-Forwarded-Encrypted: i=1; AFNElJ8jEePmzf58Cknc98rKEDZMgKgsQW6W+cbrvTe2OBB/c9plyQw0vnGwYSNhosEBYvxGz/xu2Bcf7ZArY74W@lists.linux.dev
X-Gm-Message-State: AOJu0YzQSRlcLrc+RGVn0lwEacKzjlscqgCzMWxJKpG3h85bYlYdmQYR
	wFHYS3mKCAu2in8oIcgYJ/aMlG3n/rYp07TJQmLazbzb1t0CN8BnjCaF
X-Gm-Gg: AeBDieuM8l4oHMlsrVgzD0Ggy96qwWO7Lll8JuMKXBDG9yO4n+aJfvccMaF+w3qxIEb
	RWrQX9OHP/GYi0F+ZzHE5rLwONdIMzZvrA1dR9/jJeoLXLBocxgxdm9a3VeefOERxTN9YStyBmT
	1bZQDmu2AvsJzuExbmdH9b/TsxBNe1agBv2HtVgo6OnwJlGrpQzY/TvLbOsnOAd0mSkuOM78Fdb
	TfoHkTqLreZFm4gQiC+CoiNQY9y6mOu09H2hm5jlRxQM5U6OwCigRyw935L/k+utp4BHsqOMZea
	4I0D/jLuypf5CMngND+xpabkAekibf3a9J8f9VvA12ZDzNT5QYAMZnPNP5wPX6p/Dvr/Y/hjRn2
	d8h1kOBrOiNJ9BvplrPxEvvhe6ZXr6RPQGz2c0VJLnBOOyyqJxgST2FcR/2THfpxffjsRvRuRx2
	i0GQyhfWlPoli4uaxID2g=
X-Received: by 2002:a05:6000:25ca:b0:43b:5091:39db with SMTP id ffacd0b85a97d-43d649740c0mr18904434f8f.13.1776065860668;
        Mon, 13 Apr 2026 00:37:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d6f4bf2b4sm15213667f8f.20.2026.04.13.00.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:37:40 -0700 (PDT)
Date: Mon, 13 Apr 2026 10:37:37 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: media: tegra-video: add missing error
 checks in vi_tpg_fmts_bitmap_init()
Message-ID: <adydQWbkY7X68yVy@stanley.mountain>
References: <20260412045245.GA2019381@kroah.com>
 <20260412084808.232010-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412084808.232010-1-hossu.alexandru@gmail.com>

On Sun, Apr 12, 2026 at 10:48:08AM +0200, Alexandru Hossu wrote:
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

patch 1 is missing.  Also the little change log under the --- is missing.
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/
And I want you do change the commit message to say that it's not a real
life bugfix.

>  drivers/staging/media/tegra-video/vi.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> index afc7327ef318..d1d934e361f7 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -1017,7 +1017,7 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
>  }
>  
>  /* VI only support 2 formats in TPG mode */
> -static void vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
> +static int vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
>  {
>  	int index;
>  
> @@ -1025,12 +1025,22 @@ static void vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
>  
>  	index = tegra_get_format_idx_by_code(chan->vi,
>  					     MEDIA_BUS_FMT_SRGGB10_1X10, 0);
> +	if (index < 0) {
> +		dev_err(chan->vi->dev, "format SRGGB10_1X10 not found\n");
> +		return -EINVAL;

Change tegra_get_format_idx_by_code() to return -EINVAL instead.

regards,
dan carpenter

