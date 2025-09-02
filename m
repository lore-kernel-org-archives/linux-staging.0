Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA8426FA46
	for <linux-staging@lists.linux.dev>; Tue,  2 Sep 2025 09:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756803756; cv=none; b=RnVuwUpElSRE9ik0Gk4jmk1F56VZnJDfTmiSKRS4Ry86zznltyZH4oRG8o8uEnnbvRvsYLPuordrIsefDhDoeGfkjPvt9tpzcrZ52E3Dy8DvhuQ6fXjM09SRy/w0fXrIGtBb+UUFKfOwXpMFbpOSg5pS3vH76pHrlSaERI2VDYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756803756; c=relaxed/simple;
	bh=oOsC2gd09SWVStH3OCZPd0RWU1k+5APOO3/9u+LKdaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OxNss+Ty7hInYbPLZHr8g8zoguQ8JHhhU7Os4HpNkeRI0JO6HrdvaCxgVqbFrjK1ys9SjKwsFSbN1iWF/bncVb19rB495B9vMbgzTP0DgFWhKu/A+qFA7FZZ8OSGXK3Ty4i8FBZ1gOggi76S5jZNyrzMhDyw5XPBfbYGBA7nBZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hR4Luyaq; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hR4Luyaq"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45b89147cfbso18724485e9.3
        for <linux-staging@lists.linux.dev>; Tue, 02 Sep 2025 02:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756803753; x=1757408553; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C1qJLMRO86kBaK32XQGtbUGvCudTpu+XINTSG1qXn1M=;
        b=hR4LuyaqdJm4vfVTuvwdt2o792ABob5Qx9CrWDZ01oGENtZEu6RTCla+XTNYnZKOl4
         6Nne4oG/LbBoHJhDMztQWk7siSblFCLmlplcOHMkoxmlW55p1coCbjKH1r5H5wvf+2Nt
         KkXnS4ytvV/FNOFhIVqN2Le0jRyCktC3OtxkmM2OQCIzRibTNOj1Aj9P0RrTf5CsKJUN
         9q3mQr1WW8x5fGsAx0Fp8ENOKc6BrfIYOoHaNJktylRuN3T0EoJ68+ZaNeBt0cPhN39S
         qRbWVt/OEWQ7BTNcXvsnjafecW8iktJcaDr+efAsH0z5s43blxSCT4DhUCCj6XHlIrzQ
         svmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756803753; x=1757408553;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C1qJLMRO86kBaK32XQGtbUGvCudTpu+XINTSG1qXn1M=;
        b=UpMrouhicwszZ4QkemkwAb9pCx9tJ+Syadco0geBkpJr1nSZihtalsq4ZlKxTEjYu5
         11QDvHx8RBYLrDQMnszX8Z7EfIpB/uDcYocba+x4hKdir+xYAMuItHNFIQFGHj/nR9i0
         12H3PiEeA35beOOyqZa/8uELgQ1Uvg4nKhnWaAUQNkygFCyPOdf4D+NFSzKRg9xeOsxe
         7kn5Y5rdLswOYaLGLvKjkVSXJnoyKi0ORkpknoYLWielWlYQ3U5ExkfzhLkcf/ncUorn
         ITfvMx03dw+HdFndXy/nN/R9MI4xyvc48HNY8SUklZC8f2/7HFmZ23TFaV8WDZZeCsm4
         b5AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVheJXR+aXyfSd0ajPpPwZTgfKGuFTxO37XdC1NwfeX1PkGJ69/m1c0jZmosgudUTIqE0+DF2aN4aoZyW8s@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4V88NAAkJJJ/1c0QnED/DMgn3EkiCve6uOZE6bfh2wD0sfYGc
	BmcXnm78K6774TGY+m9fah47huetGA5qR0PUhzS3odCKOENZO2gXgkQIC2DXQbRSDxw=
X-Gm-Gg: ASbGncvU/+ibKXRDXVTWUXRRvNSCeqnLOWrCndAxWQve3w2CaW72J9sudPHl3FUNlrf
	cNKUtW0r4hEWAA22DoID9rRMRg23tsOnniySk/+4zkD6LvypuAxnfd8fiyR8IehNJEYWChzbqfC
	rCIBxLaIiVgCOlTAkJdtt6FGjoawu5w2xOGG1MaQsGzr0JKfuQNMc49oyqpO5al7AKoYwx0o9PV
	R1jxEf5onFSorikwMlYu/Y1NncdIJAsI0UeF/Buj6Cgg3yNsHgLGT/Pjiiha/aic9vBEe0iN5+1
	5KPHdoYzaOBdaItMjPIqmmwF0vsX5cZpA+145vklOFoLw2jV1Rwy8p7uLS52SNIHPLk2hR6kmsf
	Zz+XTvl1j6fNCfFDQA7WHRd15G/s=
X-Google-Smtp-Source: AGHT+IFuemm//sDn/qj0h4zJPJMFIak6SnCztGlZa9zOLzUoeyHjd+ENyXK8/Xhkk0G9vUcU6KL79A==
X-Received: by 2002:a05:600c:1390:b0:45b:8366:2a1a with SMTP id 5b1f17b1804b1-45b8555ccb3mr90650645e9.11.1756803753361;
        Tue, 02 Sep 2025 02:02:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b6f0c6db6sm287723295e9.2.2025.09.02.02.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 02:02:32 -0700 (PDT)
Date: Tue, 2 Sep 2025 12:02:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [RFC] staging: media: atomisp: Simplyfy masking bit logic
Message-ID: <aLaypTjukJJloGuL@stanley.mountain>
References: <20250902073841.2338568-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250902073841.2338568-1-abarnas@google.com>

On Tue, Sep 02, 2025 at 07:38:40AM +0000, Adrian Barnaś wrote:
> Simplified masking logic in pci/hive_isp_css_common/host/vmem.c.
> 
> ---
> 
> I have tested this change on whole range of *valid* inputs, and it gives
> the same results as before, but this function seems to be little
> counter-intuitive as far as start is a (bit index) but end is
> (bit index + 1).

Yeah.  The "end - 1" is unfortunate.  I guess we accidentally started
counting from 1...  I looked at how to remove it but got lost.

> 
> It is follow up to: https://lore.kernel.org/linux-staging/20250901091050.1935505-1-abarnas@google.com/
> ---
>  .../staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
> index 722b684fbc37..9703e39b7497 100644
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
> @@ -22,14 +22,14 @@ typedef hive_uedge *hive_wide;
>  static inline hive_uedge
>  subword(hive_uedge w, unsigned int start, unsigned int end)
>  {
> -	return (w & (((1ULL << (end - 1)) - 1) << 1 | 1)) >> start;
> +	return (w & __GENMASK_ULL(end-1, 0)) >> start;
>  }
>  
>  /* inverse subword bits move like this: MSB[xxxx____xxxx]LSB -> MSB[xxxx0000xxxx]LSB */
>  static inline hive_uedge
>  inv_subword(hive_uedge w, unsigned int start, unsigned int end)
>  {
> -	return w & (~(((1ULL << (end - 1)) - 1) << 1 | 1) | ((1ULL << start) - 1));
> +	return w & (~__GENMASK_ULL(end-1, start));
>  }

nit: white space.  Add spaces.  Remove parentheses.

These are supposed to be opposites, right?  Subword and inverse Subword.
You could dress them up to make them look more opposite.

	return (w & __GENMASK_ULL(end - 1, start)) >> start;
	return w & ~__GENMASK_ULL(end - 1, start);

regards,
dan carpenter
