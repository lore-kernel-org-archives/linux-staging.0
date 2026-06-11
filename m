Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED469220F49
	for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 16:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781196794; cv=none; b=k2yXeoqNzVLis/SQ/BQdO7+F2V5z4vqDcW3l7UsfmPfodI5/x704rAsRSB5hEjOZNQvgjZFG4s5CGInPkZZAsFtHgyTZDLD96CQxgcJt20IeQqsd+e2o5IDNFVZVtOmrRfhUlS66qdvJdzs7p5j81/e3TIVUyV8QzZezC9bHNak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781196794; c=relaxed/simple;
	bh=8wci7/N0u4Xc2RuzyL1qx5gOM4EnwUbAhd22ltgIVC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z/Bo1ZARlQf/TRpAnZJEd2NaipftrBpaBhYA+5ZRuKg3bL4VSWLr3bl6Z8WWERFmdwDQv7v7tj5kpfTccSqqrf2KV4BL3CR90aR/oTVObed5TZZ3UOt50LTOAIKYnDlZL+HuwmhA1pq1gzeV52hPErOWU6oU+uoCoVmxL5jHYAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=czArVIWG; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="czArVIWG"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8ce9d444173so1503036d6.2
        for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 09:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781196792; x=1781801592; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=28mlQzzZjFPgv3HHXqHdnWz6DsvURsJWGT1srbf9ScU=;
        b=czArVIWGyRjPXZx9NzI7fZ8dY752Kf9v94ZKHezb8w5iwWl1pbsUZlAUH/Za/eHRqU
         JtKyOJ7fuM8AolNbIYV1i24E25KaVhdLdHzuWEJYDWguah2KYG/6okUXT22G+EnKB66y
         4PstEXnNIQ5wsauQfHr5RDTkBMUgQmVUqFW+qpX5dinSO5QRB2lAkDTtZjClD+bOKaac
         2G8/f7p4ClVNxtZfSdalzsirHxy4Z8CuUQHtgtWUQG3DLh3WZAA/+FnXa2HAOsW/aZcB
         GSD80Qu98HvdRkbquP6mANH0kiWXgUB+kGAVbfdjAFhIskzJoPGU9S1al+qbvLm/4cg9
         l5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781196792; x=1781801592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28mlQzzZjFPgv3HHXqHdnWz6DsvURsJWGT1srbf9ScU=;
        b=d86SfFFqFbqx14M7GqXCCJe66PEo8JUUwVVsEerD581NQSwSbpkmsz7reCRT18mrxE
         ok/aMOHgk4DdXkwaB7cQ1ZZOgt/mRbgyLnwFPzIYivEEaRnGJEq9lX/LCcxiRd60uXfB
         oLaYKKleZ6MbSatgIcQ67QW2lJxGK41K+ggkh28IQqxZmivxt28P8UtrWpX1eIzYAdtP
         G0pzWZfS8PpJYcSH0ccZ+Wq1og4GQwljhqljkx5jU3OhtUsgsM0I8mIOI4Ne8A/VXk7e
         2lECaBa9BtEWoNGEqokUa50ms0w2QvVq5zabvzQDlBj/P5a5f6xdXtxgTTpCOnL9ohpQ
         kT+g==
X-Forwarded-Encrypted: i=1; AFNElJ8TKgHDaxcFtFxUFeQ2F98QYm/1LnQZZQH5MsI4Hvl4Zqj6ThJI+xVzDKwX7xUJwIKYSh09KFMr3Ez70xeJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1QC7MVtQCNtXlaLpHiIp2CfvEmoSDcBpCmxzF4PVKG4DCUA2s
	mZSeayTZEfDvZJPY25oq1kMIoVcviooZFIZ/+R9N/K8eEUkfJIPT9Su5
X-Gm-Gg: Acq92OGR5MalGC0z51/VbrZcPyxfTfNf1tAMX+FuSx6MU/1SKimWqq+m3vI2cBCuHI6
	fF3o/VuN9Zub348Un4PIYANnyX+SY2EGtC+zXyY1i3kvlydRt8qQZw3dpRGpSuBSDtJF3RgJGq3
	oD+bdyiQhjm6dXfQftSYh2fJLvppaE8Ei3MNcp1Xnh8AmSju7tKbE1crBEZ0gY5x7hOPPgZF4eM
	TaQxRMCJ+3GJtYnGNWniXpgP5Miow49q+eDI+Eb2VTzc5q8mRIdVw0ypTjG9nmEfqpHSxMibVPz
	u7ZJFd7HG2jObP3jxmVjRAVT7seXtDn14+/eJVmeQSgM1/dNW1HfjIkY4Sju9vQLJU8wHEsbJXm
	1+9oEKoBNGmibm/hCaom/88Ygj8ot/q+YgfsqfwDaa6pef0hewiZ9VzAazrANvYbSd9SzxXIvpk
	41gnvBvPMR1ziR6gZwQlp1WaxxGFc=
X-Received: by 2002:a05:6214:20a5:b0:8ce:ba1c:eb74 with SMTP id 6a1803df08f44-8d1d8726e2emr53692056d6.14.1781196791837;
        Thu, 11 Jun 2026 09:53:11 -0700 (PDT)
Received: from localhost ([149.40.50.215])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d1ea7bff06sm22722736d6.32.2026.06.11.09.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 09:53:11 -0700 (PDT)
Date: Thu, 11 Jun 2026 19:53:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: Quentin Strydom <qstrydom0@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] staging: rtl8723bs: hal: fix whitespace in
 sdio_halinit.c
Message-ID: <airn8qdTbAYFWLuz@stanley.mountain>
References: <20260611162128.57870-1-qstrydom0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611162128.57870-1-qstrydom0@gmail.com>

On Thu, Jun 11, 2026 at 05:21:20PM +0100, Quentin Strydom wrote:
> Remove spaces before tabs in comments to match kernel coding style.
> 
> Signed-off-by: Quentin Strydom <qstrydom0@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c | 54 ++++++++++----------
>  1 file changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> index f2f73c65a636..694cd4eca970 100644
> --- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> +++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> @@ -46,7 +46,7 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
>  	u16 value16;
>  	u32 value32;
>  	u8 ret;
> -/* 	u8 bMacPwrCtrlOn; */
> +/*	u8 bMacPwrCtrlOn; */

You're not working against current code.  Use linux-next or staging-next.

We don't reformat commented out code, we just delete it.

regards,
dan carpenter

