Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56E038F245
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 19:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770751035; cv=none; b=S7U7Tx9NCbTrI6nmhQ4oNB2nlNQCmI0GZDCTcaQFRQKeFP7qTIobtD54JiJsz6gdayiE9Rd4mVOsHDQW8xUM4zQF/+h5jGNmtca9/sBZOLLzTuUxVNBWxG/MZR0gVBrcyR1MvePvq1CQvvD/DRbMm6igesbk3a6h2jkgoW+ItPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770751035; c=relaxed/simple;
	bh=hBJHtD8HDHBPEKvrxc8ySivGPPEaPdyjMIRWCfRKRAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gl/nHPqPfP7/FpzrhbVnXcfjZCDEv0DXmsVLgjnfu09LnyqUx9wsXun+tk4+VdB41EnjHYFuNuT0vtjTvCS3TM+Uccr96MTP2MIV1U2+h3CqSwjw2Bc97Wi9x7gi5TVey7lyjf0UuqAxuAszha/tyei+ufLimOR3yJwP79WMnbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cPcME/nv; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cPcME/nv"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59e4993e008so1200525e87.1
        for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 11:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770751032; x=1771355832; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CbdeXeYkGfQrdK7cvFYTQYZOzT4cC3kWWpOeCYAdhvE=;
        b=cPcME/nvWIicAKE3N6I1C/daGG03egC2eSRQg6PibTuVrge1dnuTXipJ1L60sjB4vD
         1NumhCwxaUuNDUugL+mud9ATGKNkZlLvlGKvja731LDVvrwYp1eYrEcuEltqIQ3+DX/3
         RKdkAJzs/c+yH64jfAXoe2ql0apxgqOIYNvLNpDBQSBS8Tti9xmPq2AAheDPAt7ztAMA
         u85V92Zp2RpJW7n0VHsg+L8+DecFkFROyPgqFZdB183jy3t8AFiDdqIhQQYopHDNXeuq
         bmfhmi5ay2f2D8z8Gt946UybEkDihxM1ezg/3plKGwwr2aJHoSWl6RijD4vN2shpzQo2
         aaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770751032; x=1771355832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CbdeXeYkGfQrdK7cvFYTQYZOzT4cC3kWWpOeCYAdhvE=;
        b=VOqws3SlcqYOQJ8gQ435FLNbKPMA5N9cmQKr8BDW/GfQRctZYxzU/Cs/gyghFMU9oU
         CHWuQW4cPqdKmk1aDmNfko9tSrpYkRPL61r/W3d9tjTi1IWHb7mXJhe5FFcJUpvQzIUw
         787fWdYKFihLlWM5+/pQ/r0c3e6p46jNMnxjz1cDFEu5i2QD+X+piE+iWts0UPcsG01/
         wvAGj4UuJatSqBQeNEVrnjTPXHh8pduCBzU03Qg/Nc8AreYMPZ/u6le9dSmRgHIjyyRl
         5O5PJxmrwU+WDhaAv0jKMTLj+UC3Hv2N2/PnWFEiEZCdLNdhWrCeUoqCDewLqZ7C2Io5
         7kZg==
X-Forwarded-Encrypted: i=1; AJvYcCWOb+EjRyOcBExULpaGmsujrKZLZppOvrIm6LeZJ2eyptLTuDwL1PoCrz3Ta6Vq35RlsT/rlLnywGw+8Qu8@lists.linux.dev
X-Gm-Message-State: AOJu0Yzf6Bh0UYxdf9XHKdTNU3A9e7Y2l3vVeq1ftxmEULbySQ9g9FOa
	iVVW2tXxWsZq6zQm6bkqu/v/gH5azY8pX4i5N5ATDH+wmijZOxTdwiHEa4bKDMYHYsuyc5xsRfz
	q6iAV
X-Gm-Gg: AZuq6aJCaiO1Jq6T2alM/9gGZjXzNTtsWVL+A+37Ekmq4ho0lJoSmwMswYL2wnvfuCu
	vwXiqLmkJA5mCoiKQB2jvVfMCF3725QY1Azxs84E8Lctf8MUDN/tBDQeufBgmNPWDTQWwl+qRmM
	mYzblfHC7iiN2JDpCYuAgx3O8ra7yQpCIBUDT13jL8Hh0p+sYNdf928Xo7Re/fdKycUgzejEuuT
	A+vKv/5ESEHvXa2Kg4BFj99PKvNEtdCTH7JA6nqKQiZgMBtDszGFsAqw2MGH7lKAapRfEnZMeoD
	LjsTbO/9GPGenMtJpWni/grR6lIMz9NZo/HKq6x/qaVRPs0HrwwXGpL+0UxPvK2veB14xudUQew
	ZuGo3Zs5qzqE1CJWUVdk3B0CvxgEmIYeVBPJ7Atpvkjjlou1qkD6ocNEcxp2tuu/zYT0gHE/Co4
	qP/lTsIiVylIe4Vp8jDcm1s17yj44s
X-Received: by 2002:a5d:5887:0:b0:437:6ec2:b110 with SMTP id ffacd0b85a97d-4376ec2b331mr12405939f8f.52.1770749634595;
        Tue, 10 Feb 2026 10:53:54 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296b2110sm36447742f8f.3.2026.02.10.10.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 10:53:54 -0800 (PST)
Date: Tue, 10 Feb 2026 21:53:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: soufianeda@tutanota.com
Cc: sakari.ailus@linux.intel.com, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: atomisp: fix heap buffer overflow in
 framebuffer conversion
Message-ID: <aYt-vrc7h7CJOmSu@stanley.mountain>
References: <20260210-atomisp-fix-v1-1-024429cbff31@tutanota.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210-atomisp-fix-v1-1-024429cbff31@tutanota.com>

On Tue, Feb 10, 2026 at 04:26:31PM +0100, Soufiane via B4 Relay wrote:
> From: Soufiane <soufianeda@tutanota.com>
> 
> Validate sizeimage against the allocated frame buffer size before
> hmm_store() to prevent out-of-bounds write.
> 
> Signed-off-by: Soufiane <soufianeda@tutanota.com>

We need a Fixes tag if the bug is real.

> ---
>  drivers/staging/media/atomisp/pci/atomisp_cmd.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index 3a4eb4f6d3be..ca7ffc7855ac 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -3326,6 +3326,11 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
>  		goto err;
>  	}
>  

There is some sketchy stuff happening in this code but I'm not sure I
understand the issue.  The code looks like this:

  3317          /* Note: the padded width on an ia_css_frame is in elements, not in
  3318             bytes. The RAW frame we use here should always be a 16bit RAW
  3319             frame. This is why we bytesperline/2 is equal to the padded with */
  3320          if (ia_css_frame_allocate(&res, arg->fmt.width, arg->fmt.height,
  3321                                         sh_format, padded_width, 0)) {

This allocates res.  Why would it allocate something smaller than
arg->fmt.sizeimage?  How did you find this bug?  By testing or reading
the code?  Do you have a reproducer?

  3322                  ret = -ENOMEM;
  3323                  goto err;
  3324          }

> +	if (arg->fmt.sizeimage > res->data_bytes) {
> +		ret = -EINVAL;
> +		goto err;
> +	}
> +

  3325  
  3326          tmp_buf = vmalloc(arg->fmt.sizeimage);
  3327          if (!tmp_buf) {
  3328                  ret = -ENOMEM;
  3329                  goto err;
  3330          }
  3331          if (copy_from_user(tmp_buf, (void __user __force *)arg->base,
  3332                             arg->fmt.sizeimage)) {
  3333                  ret = -EFAULT;
  3334                  goto err;
  3335          }
  3336  
  3337          if (hmm_store(res->data, tmp_buf, arg->fmt.sizeimage)) {
                              ^^^^^^^^^
The worry is that the buffer this references is too small.  I would
prefer instead if there were some bounds checking before the memcpy()
calls in hmm_store().  They would use a different, smaller limit if
only part of the buffer could be used.  I don't know if that bounds
checking is really required though...

  3338                  ret = -EINVAL;
  3339                  goto err;
  3340          }
  3341  

regards,
dan carpenter

