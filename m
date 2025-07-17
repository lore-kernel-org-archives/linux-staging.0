Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B4B1FF603
	for <linux-staging@lists.linux.dev>; Thu, 17 Jul 2025 04:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752727504; cv=none; b=Phqe/HePLriscBUi4uQuIr88QWYA5YUc7FcARfiUDesp/eSbWkIbSnoJO8AsRLoGbUVg1A/bGbtw8YT/iCT2tQE7D+D5O5QodeIQfDZI8P43QGIWG6P/7Hs8qS6aYVNos91zw4XIBv2JWMVF/tlOnGwpxO+lppNiUxpM5VvG4cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752727504; c=relaxed/simple;
	bh=xYY88o1HZHO/K9meJ92FwNw3WDacmrol27HB7s9lxng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DLmbQyEqtmTyBM31WfrYusubx0RPCtv5TSpp/OUDUj+B015KJztsqMaAA+mzzcmCsiEJS9J8bWwcGo5bPwvMmsOJ7viWIrpb7y0ud/c6t2gyReV5ChrVcQlKSAhunFkkEhwNwdBvTq/T+xCjVIiEhUazt7q0cZdNO06fvC8Nbvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZKH6FXc+; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZKH6FXc+"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-72c27166ab3so441862a34.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 21:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752727501; x=1753332301; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8BxFpUzbTga+mXNbGQF0qc8Yea8aD1D/kK9ilcak6H4=;
        b=ZKH6FXc+G8MxUtnZy25jfc9xrvsqhT6BszxnLFxAwgq95JBzyluiJ1mfjZtw/6c1+Z
         YpAe+2y9daxoTjNQXCynJTvEvsqrTGx6HyTcPmRW/SRnmk7eUoo+DeaCvJnA9sDKHjWQ
         dq+y/YW5tP6TEWJsn94gVCEigC0vLPMKbHPm3Drf1PaXfMK2hHggor9eGjRMl9CUpPnH
         IJmtw7hkGd229lNolwxH19ME9vRMAU4NLphnFTwutybdWR6zI/ahaiLKpI1+JWPLwvM5
         NzwwTVAZvrzn1QyrLYrtwSmZdPVBMI/X4Zv0SDxxRVxh53HqPaDEHJhQ5ItC75aBIVvL
         cq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752727501; x=1753332301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BxFpUzbTga+mXNbGQF0qc8Yea8aD1D/kK9ilcak6H4=;
        b=g1dzXx9z7Oc0912Tmj68SszbGNnWK2ZYb4rqBzIUGLfsEfjCWVLAWlig+VRaSd2J7M
         q3gCqtlEcOF9rcjSv2Yj8hZ4GIKyHQoi7Wd5FxAGv4FLfDMufS0vaHxgNCj20OEt+mSB
         1Vi+dW9VMC0V3178kAkYfZIoHYayUS4BKB5XunFF5YxUs/NMgU01xzCZl7pdm4DpUw2x
         j6AvYnw6lfARxuhdFrSXDcNQ83FXFKoEjB5Tiq7wGcMhLUFd4pCqCof/AsuODcq+PFBd
         81hKDt5sPnNZl/iyHNhy61FPLIZ1jmxnbU0O7xsEeUiknnYKRM5qG5Z2lnqqfyqXJeRK
         9InA==
X-Forwarded-Encrypted: i=1; AJvYcCUlnyjr9GGFyBqTodEKe/grxLhehwQL90aw/UnwMmm1Y0sL4K8DmMpvCJiXGfILNIHQK+AQih8tQJ+aaNvI@lists.linux.dev
X-Gm-Message-State: AOJu0YzTR4KJeejp8ziEnuEu/9jifXkeMqgtRv6JAkibQ/5YhSX7S/FA
	ArNXxzjk8+A9SC+GxFoRVnuX7h5Mj6LHTL5h+3UYRazYvJ7DhKbRi9o0d3mdgIgx/2o=
X-Gm-Gg: ASbGnctpFVDN+qNnrl/SDyCPF/gQfTGsgcrv0Uc7suTnpe4uzGSbmjlQs73URQxZFBB
	zjZBbcwAgqp9C6JYZDY+yet1XHpAmAnw8EWsfjMkQ5YJdehx+j7TL3oE08DMiEcrSV0e4eiuJct
	rKP7ZOK4FHFhw5AnDHe7ucmNIw07d6crPjaDMZ9WBeWN3sCQYhk84v0oV83MRyDzgLWw1UiXM8T
	0Hg9/YpJppa+WCbcLTnLuMsMVYsm9xnhe7THGNCo2oSkt/ljY4Gs+VMTG9Z6KqLpNEUpMprBwaY
	gGnV7v8m7NAu+rnTxSwbF6E8FpDwdBEsijFxZU57u+u5OJni8dk6kmetcewkJ8ReceNOE0b6s+P
	4MI3AVmLkd3+gZlf0ie0DammGGS7d
X-Google-Smtp-Source: AGHT+IE+DpDEa75xpbSgyLwwke9OcELJPLIznBHV4EgtqVLoSi+kaH/6b3ycchLcJ6wlacIG2Wojvw==
X-Received: by 2002:a05:6830:71a4:b0:72b:98d9:6b1c with SMTP id 46e09a7af769-73e66604fbcmr4375731a34.21.1752727501133;
        Wed, 16 Jul 2025 21:45:01 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:2c38:70d4:43e:b901])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e776b0dc9sm202888a34.26.2025.07.16.21.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 21:45:00 -0700 (PDT)
Date: Thu, 17 Jul 2025 07:44:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v2] staging: media: atomisp: add missing mutex lock in
 atomisp_s_fmt_cap
Message-ID: <06f61db2-da3d-4de0-8ce5-04e135add870@suswa.mountain>
References: <20250717013003.20936-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717013003.20936-1-abdelrahmanfekry375@gmail.com>

On Thu, Jul 17, 2025 at 04:30:03AM +0300, Abdelrahman Fekry wrote:
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> index bb8b2f2213b0..d3b8e480065e 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -9,6 +9,7 @@
>  
>  #include <linux/delay.h>
>  #include <linux/pci.h>
> +#include <linux/cleanup.h>
>  
>  #include <media/v4l2-ioctl.h>
>  #include <media/v4l2-event.h>
> @@ -416,8 +417,15 @@ static int atomisp_s_fmt_cap(struct file *file, void *fh,
>  			     struct v4l2_format *f)
>  {
>  	struct video_device *vdev = video_devdata(file);
> +	struct atomisp_device *isp = video_get_drvdata(vdev);
> +

Delete this blank line.

> +	int ret;
>  
> -	return atomisp_set_fmt(vdev, f);
> +	scoped_guard(mutex, &isp->mutex)
> +	{
This open curly brace should have gone on the line before:

	scoped_guard(mutex, &isp->mutex) {

But actually just use:

	guard(mutex)(&isp->mutex);

It will hold the lock until the end of the function.

regards,
dan carpenter


> +		ret = atomisp_set_fmt(vdev, f);
> +	}
> +	return ret;
>  }

