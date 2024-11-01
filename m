Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A867C1D0E14
	for <linux-staging@lists.linux.dev>; Fri,  1 Nov 2024 19:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730490405; cv=none; b=RKs38gfV1LS7OePpSRzwlvy2Ar46WMdEyuan+sdPis2CjeI7FPGAFesHlfs00UPX6xcJvlm+VSrrknSOTqv8frededqUsfENXnhZEa8h20abAa5rEtCK5aQrMvUGxU5cVfSjLeS7Z5gmAsDkCfRZghJ2SBW5sVKJ67Lz0Ai+XaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730490405; c=relaxed/simple;
	bh=1ofa25jN5S0/5jFGMQVKNon9D7tabgX8zoZiE0MGARQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXleCytrpdeeeHFRWNteNjrNrlbnqrxv13ytTrDR1wlnF28BOj7AL3gvHV+GKerngFs4h2gpxa5IV8A1QgyP3YB2E2YPFOcDgwMlahVmRlH6kj1PvE5yANi/HK9DwJ+CrkTGf5y8zcSZcv0gWM3kNCtQjP2ltSAnghcVn1cT2mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qOpkY9Bg; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qOpkY9Bg"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4315baec69eso19661745e9.2
        for <linux-staging@lists.linux.dev>; Fri, 01 Nov 2024 12:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730490401; x=1731095201; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A6CILudmT2OPooc17jg6TSDXbC214+AfvRFA780e2kw=;
        b=qOpkY9BgTGyVdOMxBz7JxRfqR2kil9hCdSMNeLyrzNFpdeuR/j5/+7pE64ao8iax/i
         jK2nRMzcuoKZ7aNO1RHg2+Z+G0CyRC4BxVGxMu5XfjLab3GjtWH/k5fuRBSetNu3WC8i
         d0aFDQrGNgGwOfhXu/CLy2SPFSjGlOHhwPYzAckM7SRIeQAIrUIp0oIh/ERcLHOuo6Sn
         xuSasWOvAhYgXFBK4bcx2Qs+cC7WCG1eMIJM8QFwHDyeZyCRo9V20OMYsX3mwej0KzWe
         kVpeqEm44c+cJ5JTjtQBvZjfDpJcotUkRTBrGhUlmmJr50pIvCVeVm1CKuWZZJQwF0Yf
         Yj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730490401; x=1731095201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6CILudmT2OPooc17jg6TSDXbC214+AfvRFA780e2kw=;
        b=Zg4zsJO/cHkWc4E3/X0hL57FgSpXP9zSmwTB5b6+54gcLYGqUZTIyJRZvXDU6WW+pl
         631UsNvwKaGvhVZSG0/iJDPeXQFeo2hzovpXwg1H7f0BhXtc/3K/W2IwnVqNyWMQpX2r
         S522P/XJIjOZCyujtKKXSoZ7GLqE6byZV1Lp4MGCQltjJLPPlOsNrvxP/wbwTqmq6Y6j
         nJsLkLrY1pEbEqKXzbEnBm6hBvAeH1HbyUAIfeoo971ov0WGvHskfylMErTrR/WMXyIi
         jcDxqoxT9qMCzNEGQP/CfNglJLKbUxze9MNaDZQi0aBJVChhzsF0QmSD4N+0mYoH5v/N
         N37w==
X-Forwarded-Encrypted: i=1; AJvYcCX+4IsWN69QIiJ+zYn2I3gIK3nuA3yRaNrkXLkuaRP5xv9DwkfiEzkDdCw+VcJo8B/G39J9EiGyS0iN6vU/@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0LV/o/hMMy2F9W7ADpMYc35TdjIztfGtpvz4NnKESHP+HWTXG
	LS2E8odt5jUXqigIFarODWaLRfuEbxBQCVOqBDCPt+MuDUquQM0X+uHQ7ZozvVY=
X-Google-Smtp-Source: AGHT+IEYhYUOmuQyVjbDtBBLtbHkZVAdS6CDRVy9twU3Ctv89CCKA3MmA3+rl4sTqEQ9BP8RtdHNBg==
X-Received: by 2002:a05:600c:1909:b0:431:542d:2592 with SMTP id 5b1f17b1804b1-4328327eba3mr38016165e9.27.1730490401007;
        Fri, 01 Nov 2024 12:46:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bb793e51sm101006135e9.1.2024.11.01.12.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 12:46:40 -0700 (PDT)
Date: Fri, 1 Nov 2024 22:46:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	arnd@arndb.de
Subject: Re: [PATCH 1/9] Fix buffer overflow in ni_usb_init
Message-ID: <2cde383b-156f-48f8-a1f5-344561962f37@stanley.mountain>
References: <20241101174705.12682-1-dpenkler@gmail.com>
 <20241101174705.12682-2-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101174705.12682-2-dpenkler@gmail.com>

The subject should have a subsystem prefix:

staging: gpib: Fix buffer overflow in ni_usb_init()

On Fri, Nov 01, 2024 at 06:46:57PM +0100, Dave Penkler wrote:
>   The writes buffer size was taking into accont the number of
>   entries causing random oopses.

Remove the blank lines from the start of the line.

> 
> Signed-off-by: Dave Penkler <dpenkler@gmail.com>

Add a Fixes tag.

> ---
>  drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> index 571f07800c9a..9ff56b063681 100644
> --- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> +++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> @@ -1726,7 +1726,7 @@ static int ni_usb_init(gpib_board_t *board)
>  	unsigned int ibsta;
>  	int writes_len;
>  
> -	writes = kmalloc(sizeof(*writes), GFP_KERNEL);
> +	writes = kmalloc(sizeof(*writes) * NUM_INIT_WRITES, GFP_KERNEL);

Please use kmalloc_array().

regards,
dan carpenter

