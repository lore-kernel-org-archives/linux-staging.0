Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56D46D1D2
	for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 14:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714313014; cv=none; b=o579K6sBUojwY0EoS5DyFGWWKWngZxZqxeYqFsHHAsuNJ6vbL/F1aiPyG94Y5KyG5+Ch+pUfvxC/33nAgxLrFT26Qnj0rep3Q4XXBb37MvyFgufkAwikSSrJsL2ODl4bdn+CfLgUXnfb5/+677Dn6yZzPb8qcYFWGn8igrUqz08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714313014; c=relaxed/simple;
	bh=W4Rekvj5rjMQEMyrvrDguiibMfMdswqmFgzCJjSBkmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t6Mjd4Rl78UH7bs4l3/1OHisUKJvUMJnr5GoAGbdmlCrjkMktf63K4uLyf93XCynOt2FsEb8bPutGhuLQof6DFL2mLJMRzm18r6FRIgd7JwhFBM0sKpZBVHqaOf+q883jp99XSMx8DZN7Zm8mJyKfDV/pEFPsok40F9KDXmK/MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XtfFFwSa; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XtfFFwSa"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5727c009fe4so625778a12.3
        for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 07:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714313011; x=1714917811; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4LkwHkM4YstZ7I6Hr8RDgjhYJhml/L2D5NhBnPSk8m0=;
        b=XtfFFwSaXUneKRwHk0q0if+OCe901UJcx8UZD27aCVA+r74CMVMjjYpDrYJYhZYRoz
         b21FVb0RXgQNjAGijxGyKUO+MdHaRAHXIs7WC9vljgOySUe08i6CfYFTCGAOwyuroopA
         dChVUkpODKn840IiYRdpVMrBGJmT43jZo47dT44gcb85sLw0c7Y5OSxMchA/UiODJQHK
         YRAKa2s5QFzkFjhyNnE5yIKWBUXo8vpMXoBy4os8wrZpxYFrD8jmSwHGtxSJDx3+7YHy
         jnF8v/0Y0lfVp+ShMKjVvQ2phOpnLZMvjJoDhyuph+ihzSrLiPW7/Y/CuCeDwL5/Pfwo
         vSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714313011; x=1714917811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LkwHkM4YstZ7I6Hr8RDgjhYJhml/L2D5NhBnPSk8m0=;
        b=RG+5O503zV43M45FtgHXB6PcBzFgvQo5UpXNyP+d1xG4o4lW4+FgvLw/oGimfl0T33
         ssEHF/2XygBD7oz02F0vLcnEWKTWxoVIbV8LU4XStG4OasxrWiR/VEzxUpa9aVqVEWBu
         TpPKUdOyBuAYiZrS6QQA0L5+5Rl73YQ6fZFZlVyynhoP3zSHpvnAvzvXCC5Qg+XTTR4u
         Rht0POiDRp8M56giwoMyItJ4/xEzssEcmGVmemxihy0zbpmVZZMl2bxosJxwvHm1wixu
         5a8TBWnWQPm5r2JDwMMyi681TeS1+1qRRtujrtZPEymIIoHNoHrgTTIm/CYB0iUH0fBO
         Rm0Q==
X-Forwarded-Encrypted: i=1; AJvYcCW9xea+8injwAGm3bd272+GlGzd8WF1shX7iixXFsZlbJ1CL1s9DULljDrNsBhJwKzaHP4Nu4Y5YH6aTTRUQlqBcBgCucpse6XN9wCBkw==
X-Gm-Message-State: AOJu0YwyHwMyu+CMjIjziLBfn/XYF6+UjXwtBGQjya7FiB4XPajavT1C
	sTh7KYlmCOk7TazGHpT5yALA3gAFcSbgxMVihukFuAs3SSnT0oZ/iYYdK2o71OoBlPVQcN12Gvs
	J
X-Google-Smtp-Source: AGHT+IEsYnfmO00nQBKypL68lPb0+Y9MZyh6Sub86JRNTqRLbUZ2ckphZO76Q5wRWKp2auF76BFgvA==
X-Received: by 2002:a05:6402:26cc:b0:572:57d8:4542 with SMTP id x12-20020a05640226cc00b0057257d84542mr4475106edd.8.1714313010990;
        Sun, 28 Apr 2024 07:03:30 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id j2-20020aa7de82000000b005720e083878sm7545949edv.49.2024.04.28.07.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 07:03:30 -0700 (PDT)
Date: Sun, 28 Apr 2024 17:03:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: pipishuo <1289151713@qq.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft:fixes unnecessary parentheses
Message-ID: <ec7398c5-2bed-4121-bf95-44a7fe3438cf@moroto.mountain>
References: <tencent_FDF9E162435F21368C39AB61255D2F2C8D08@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_FDF9E162435F21368C39AB61255D2F2C8D08@qq.com>

On Sun, Apr 28, 2024 at 08:19:08PM +0800, pipishuo wrote:
> This patch fixes the checks reported by checkpatch.pl
> for unnecessary parentheses
> 
> Signed-off-by: pipishuo <1289151713@qq.com>
> ---
>  drivers/staging/fbtft/fb_ili9320.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/fbtft/fb_ili9320.c b/drivers/staging/fbtft/fb_ili9320.c
> index 0be7c2d51548..045275a9bc0b 100644
> --- a/drivers/staging/fbtft/fb_ili9320.c
> +++ b/drivers/staging/fbtft/fb_ili9320.c
> @@ -37,7 +37,8 @@ static int init_display(struct fbtft_par *par)
>  	devcode = read_devicecode(par);
>  	fbtft_par_dbg(DEBUG_INIT_DISPLAY, par, "Device code: 0x%04X\n",
>  		      devcode);
> -	if ((devcode != 0x0000) && (devcode != 0x9320))
> +	if (devcode != 0x0000 &&
> +	    devcode != 0x9320)


Nah, just leave it.  It's a personal preference for Greg.

https://lore.kernel.org/all/?q=init_display%20devcode

regards,
dan carpenter

