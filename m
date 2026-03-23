Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8FD3B8BDA
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 16:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774281722; cv=none; b=i5ri/n6wm8wG8LhMGKtrkG812GdOnicPLY5XNSnLpLF8JZXxVZKgxUVGhazYNhjmF4VtzBUszLVS9R7ix1g3JvkrlHLJRMBLbRfpKwVc57R08JIXGdd32tubwe4Z/3ZumTjlAmIm1zjuUVJO4o78MrpcvYXqemE3Mg27cLYjMOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774281722; c=relaxed/simple;
	bh=Q80F4IDJ1r0n2L0Q9+6XdvwhcZQG8QGMDk49YIXY/m0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOlEdkXyjOQuxom+MYBjof/OMrubOdNKHTU9kdg9zlHXf08G+RH8K03c7QdF4n19eIhKeBirYhFcZBBjY1vEz+4L04+98n6MlumzkPzF3Osba4THZtw8wBvuyjOdNEFcO4/zhAtC5V9fz0/R36pxOTkHYf/C9Yv3PBz5oS8nE88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GTaiD7tC; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GTaiD7tC"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43b3f91a7abso241456f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 09:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774281719; x=1774886519; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9r64NEBtm+Yyadr3JGFSt+EeJnvvOthTCQXw/+5HKQ=;
        b=GTaiD7tCDSrFzlDZQKSd9Vld+WOqW/jToSS8sc96lBNR02NfZXZCERyq0ek24RXLlZ
         fZsysZs4gGF7CsNgMyq+vxspySma/HtX1qMjmxxEw3nh9iuLirBx3NIFROawki62QSBv
         n7TMHuzya2ZiNQjCI1wIkEwKIt6fbTC6XF1sInDPSYQCYsJxhklqFabmCH00tsPvkiv+
         8/kCEryhH9Yi97dLrr4t2EmRcLqoeW/Z23xDqJE80kHlN3ml3r4+ZV+WPwetWnuN1FX8
         aK0Ula5d2TK3cpZp1Xmrm+9UNx8qNxq+ImFHvb8Y+dgDB2vUKO15TCKAv6B+gfrzkgIC
         BBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774281719; x=1774886519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y9r64NEBtm+Yyadr3JGFSt+EeJnvvOthTCQXw/+5HKQ=;
        b=tPIGuGsAz2odAkdVHOa6hLstXl/6t4qPwA4xStAn2bRzml+935csNpWkVf5BUzD5hi
         2GQajyE6RhlcmXWSdCDMyBx25owxzJhKHt1DuZMPozTF7CUmHLhGR1C3JI3r5PV06o1d
         cMbwtsWleL9j0FR1oo4UARnG76xCoGIDQS4oEFpfsNggfbCej1wv1Dg1dwgAAMgnKKrf
         LL2AKlduD78VCj4Ndor4/SIKeOCG+e3on7M6qK0+RWJ6DWNIvwcIfnrVY8m1SXSMwSf1
         QvdEdR0FBnQiLzfhmnThx5ZOl/rLIwj6tapr8Ojg+j+9le8F7o8F39sg7BK+se6mSQ4i
         rP0g==
X-Forwarded-Encrypted: i=1; AJvYcCXyMRCZeX36U31k2SYw1YSSifcYR+peHpUaM2q3T+BldZIxCqwCZU+5rUGFTX6Q0PyJ0PWgupsGin4Cimro@lists.linux.dev
X-Gm-Message-State: AOJu0YwRveUjcsIvE82RSLr2BwVgwqKp64yO4jb3hU06ths/kXg3kqnp
	Li+aEMPjEwZZqyESF3qr5h/bU9x0Bs3NlKF9QsPV10FHIAvq4IPYo6dyXCzlx1CNZ3U=
X-Gm-Gg: ATEYQzwmYks0Ip60WacLx2ffDjKcz25Who0ynaYL/j0QRjVrkkbBuQejN8VjtdLYqmR
	F3GDRuF4umI+gqWMGOiJEHqakRNDuPqgXF8YCfAey6OhpL3JO49WQ2b5vFf5XwwFHVeB7fBAOHL
	9GbPBsLG7HDLViErvtffkGifWydJ6OTOEMUNbqdeKq447udwaPqmY5cqQLpLarZdDr6BrvhqKQO
	KJ54lu36eoOjkGTZqzSJ8YU3Vpl4LcdcNZoVYAGe5xvAstGGU+Gl3eiMT8CKzupBIdW9qDq18YB
	+S1f4JAkR7Mesy3UDe1Ypt+I0TOTT2hk2jmgOryeg38+T1xviIe5FxTVz9Pc4q5p3ZkRyC0lKSD
	P7MLQl0uM06XdSXT45zGa6hMaQUwgCTFxqdqxydqERGJPbYFNSVj42ItRgnbCKDdOdbyYHy76vg
	04C/PqJtYIYOrIpXSvba45a0yOShuG
X-Received: by 2002:a05:6000:290b:b0:439:c67d:9fe8 with SMTP id ffacd0b85a97d-43b6424ef8bmr20394777f8f.22.1774281719032;
        Mon, 23 Mar 2026 09:01:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6425eeb4sm26629531f8f.0.2026.03.23.09.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:01:58 -0700 (PDT)
Date: Mon, 23 Mar 2026 19:01:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mohammed EL Kadiri <med08elkadiri@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	andy@kernel.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v3] media: atomisp: fix spelling mistake
Message-ID: <acFj89pWfmhLKzQ4@stanley.mountain>
References: <20260323141143.27280-1-med08elkadiri@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323141143.27280-1-med08elkadiri@gmail.com>

On Mon, Mar 23, 2026 at 03:11:43PM +0100, Mohammed EL Kadiri wrote:
> diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> index 856561e951a5..a6eab5f52b75 100644
> --- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> +++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> @@ -434,7 +434,7 @@ void hmm_bo_release(struct hmm_buffer_object *bo)
>  	/*
>  	 * FIX ME:
>  	 *
> -	 * how to destroy the bo when it is stilled MMAPED?
> +	 * how to destroy the bo when it is stilled MAPPED?


MMAPPED was correct.  It means memory mapped.

>  	 *
>  	 * ideally, this will not happened as hmm_bo_release
>  	 * will only be called when kref reaches 0, and in mmap
> @@ -443,7 +443,7 @@ void hmm_bo_release(struct hmm_buffer_object *bo)
>  	 */
>  	if (bo->status & HMM_BO_MMAPED) {
>  		mutex_unlock(&bdev->rbtree_mutex);
> -		dev_dbg(atomisp_dev, "destroy bo which is MMAPED, do nothing\n");
> +		dev_dbg(atomisp_dev, "destroy bo which is MAPPED, do nothing\n");

Same.

>  		return;
>  	}
>  

(always wait a day between resending a patch in case other people have
feedback).

regards,
dan carpenter

