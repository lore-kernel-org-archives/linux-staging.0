Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27133E869A
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 15:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773935162; cv=none; b=DQQL9Z27tdzaPPqp1oRNnNVMLYE/9yJhYw52FXQIYC9eJg/2m4XB2LWYYO4pXwms/p9gmhGKOBn9atJPOQjLAXFczGLg1SiyIbDtPdXK+hAAy0ZKFRvm3hlhbPwBQYyDc0ZfRsLWukyJciO0ZobBVQSnTz1O3FtTbnMz0UPp3o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773935162; c=relaxed/simple;
	bh=pCFTkv1Ku/csYKyILAUOeI6T1dn09foZagdWgw9SkI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dRui2KhQvdcGynti9r+2FT9+FW4tp6Z8J1+s4HHQMhKpSiSbt8IDY+lSG2umIVrbOsJomCc3J+5zzacwRSL+s/+7GWA+wldlmUEf4adLfp8yCp3GPpanNITKZxvwWmIP75aKqZ1OjTarIt4APMWrfQ19UJsPuTWzTy+uLdWNtcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rf/i2fgK; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rf/i2fgK"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4853fd7b59aso4589835e9.2
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 08:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773935160; x=1774539960; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Va6JrB6OOSwxW21r6IE5ejzpZQanwoUukytTkQ2lYmc=;
        b=rf/i2fgKQKTIA07GlzNW76s+AVB/uD179BUktn2bfZEHXXrNUR8Y72EBinz5uUl0P8
         rSNw0QOjHkRzO014YMcNgWnjt9PDxf3yLeKxf7YMkc71nxbd9m4kSRq7woxv3xIXPaJ5
         n4mNYuRsnZmQHB1p+gDIp3Ww+qly8VEjuCk/886sCqMRG8ELRn6/e+MwxUZP8AxfdNTw
         ZlnErVh0PyYdtMDBbe/CDwZC1RfEspWkHl5WhuRd/OPmQsPWxGkA6L8QR2wgyLdIg0dI
         NeB01sN2ha4zBADnZ8+0m3fvVhVDyn8o3YqFchDoCwQoC7b7+gCVRSqbvtt6Jf8lb2cC
         XjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773935160; x=1774539960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Va6JrB6OOSwxW21r6IE5ejzpZQanwoUukytTkQ2lYmc=;
        b=Jlg/1/dumZuWZgUmCZrag7a4lvLz0BcAK7fqSA19iDXAj0DlCvzcVp8+aSZnT0+GNk
         sfcg/x6MDVPmj8dNfhvC+QVOum6SjbvQ1oOvrv07FIHRwblV3OGn7r4MzLdmOhef6qJ3
         XWoRsimEabjQVWum3opApFTQzJ0Rq/bDiKQ1I8yeI6/sJ+FEmld5wzmrkxhWVkkreH+G
         cKSN/2OMNabze3kz/zUOsDL1uRh00K+IbByo2au7znIZOxq1/RYMOrNEvThvwA8p8aTx
         wmx2Bi3NMz38PuPxDiYuPYy2ulZ063MxRj/SOYcijrfg/zfu/4++u466x/K/intHF3Ln
         iW0g==
X-Forwarded-Encrypted: i=1; AJvYcCXlneDK42d+jj16/kfmvmlYHia40oZS/6oxcOxCTkP1vGzX5DL7NUwij2MpNIdjGPSVsjq1/XMyGndZ611z@lists.linux.dev
X-Gm-Message-State: AOJu0YzfJdFffQevgLPsiCZ2ZGsG3hCzfe9jrOoQWYn5UAiXAIlzb3i6
	QPxwBCmgwwGFvC0I/rtG3Wz8NJeBgizrq3Dmr6PxQGaCWa1hdt8p9ZpyAZPUyrgkM0w=
X-Gm-Gg: ATEYQzx+KN4NYFKJEZ0IclMMa0lbERmwDNRK4+Jkxx5kQGhLoZuazwyNhxpk2MKpcX2
	E34HJSuP7C+8PJYytYKR9rgLmiEy89idbQKlY8iO9v+h5alzMw4N8JHHZHkiGQz2hdZxYFIyAXt
	gapzFcy+PDFmc1Ju1BeCGQVwY/eEgLQB6uBWybWLfI9ecls1BkmiEObL+0Fd3/b9Kv96g9p0C80
	OIvUIipfBI2hujz5hFIsb2CK7iVXJhC1StVUGM667lgVXA5A8OhB3khhBAFASlI91zjWhTTxt8j
	W1Fzaop03DgO4jPL9t4P2TMgz2/KTGFSbguCXLOK1gu2Q6tJC2eeCXptTrBmJYImSQKp8t7r3PJ
	BysDn/kArJ4bHFxpESvMOnR4FaYOIHsbN93lct9H6iGxRWoMcjYjnhaSZc/31gT/AKTQZKreynH
	6z5v8FxvVG3J8xsq6wmamRmW1BqYLj
X-Received: by 2002:a05:600c:c8d:b0:47e:e2ec:9947 with SMTP id 5b1f17b1804b1-486f446d8d7mr128184935e9.33.1773935159110;
        Thu, 19 Mar 2026 08:45:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8c53153sm76662745e9.13.2026.03.19.08.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 08:45:58 -0700 (PDT)
Date: Thu, 19 Mar 2026 18:45:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: av7110: remove dead code in av7110.c
Message-ID: <abwaM9N8D34zq53y@stanley.mountain>
References: <20260319-av7110-dead-code-v1-1-da6e76804817.ref@yahoo.pl>
 <20260319-av7110-dead-code-v1-1-da6e76804817@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-av7110-dead-code-v1-1-da6e76804817@yahoo.pl>

On Thu, Mar 19, 2026 at 11:16:37AM +0100, Tomasz Unger wrote:
> Remove two commented-out lines of dead code that serve no purpose.
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
> Checked with scripts/checkpatch.pl - no errors, no warnings.
> ---
>  drivers/staging/media/av7110/av7110.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
> index 607992100baf..490963c0ccce 100644
> --- a/drivers/staging/media/av7110/av7110.c
> +++ b/drivers/staging/media/av7110/av7110.c
> @@ -314,7 +314,6 @@ static int DvbDmxFilterCallback(u8 *buffer1, size_t buffer1_len,
>  	}
>  }
>  
> -//#define DEBUG_TIMING
>  static inline void print_time(char *s)
>  {
>  #ifdef DEBUG_TIMING
   ^^^^^^^^^^^^^^^^^^^
Get rid of this stuff too.

> @@ -762,7 +761,6 @@ static int StartHWFilter(struct dvb_demux_filter *dvbdmxfilter)
>  	u16 buf[20];
>  	int ret, i;
>  	u16 handle;
> -//	u16 mode = 0x0320;

At that point, you'll probably want to split it into two patches.

regards,
dan carpenter

>  	u16 mode = 0xb96a;
>  
>  	dprintk(4, "%p\n", av7110);
> 

