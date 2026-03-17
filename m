Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9394F3ACEFF
	for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 11:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773747708; cv=none; b=rJxMLMJ3hfJ1yqepC+gvhr7Il1zu/nykijMDVifaj9drQqSavD1Rh7WIZM5Jkah1Tk5jInvvnJY0umIQcF4GyjWTffZYFmZdVmcR0WvXUXY00F7Ugid4Fs6dG2yCKpuzcxHcuX6qjXE46NZKokpH0IH/tUBscUR4Ri/DySCdd4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773747708; c=relaxed/simple;
	bh=nxTHh2hemN8rIJDLC1cY1ghKlXaFauBvoZEhR4UaNG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwdhCU8VKSGnJwqVbdB+9NEGDKxzviMLgim3dbPbs86mkTy2m2JM21gfw4gLIpnij+u8E3rFdUkHLTqScBLxAi1R5kJ4VQz4OOw1SrTFhzyVlmC7I2asz7wsnYWFogQ/AhYZvilLif9GlexwXmy3DIGbNBUlVCyTJwCi7di4nsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tIdhMNE0; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tIdhMNE0"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6634bb959a2so7738589a12.1
        for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 04:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773747705; x=1774352505; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=px+gfHJgDMwJ2udAT1twOsp5nY83B1JZO7Rzq/NpbbM=;
        b=tIdhMNE0q/nTP3XMW5viXWoa01tCZzHU7hptwJnGsoYT2UzTGjae64gxuiOvPzOY04
         kGvbysoy8N8+S0i7OGu+gNLxS9WUbKI05Zq/zCBKv3UcqQxHLWEVnKTIOWcunenqDzw2
         hY9ZObzNBtL2nu+T+GP2SRkNSfNAs2EziA6epoNeGkZAnmR5Ylu1TjKrQJSM6J19lBbO
         QT/iXiarMqWFYVrOEBglC8B0DviMAON1TYbmKPsu86nbn+ITo5RBRzlFKu6SiQIGUNms
         oBbhS4qAUC8QHr4Gx+qfpXu28aUvBm+gMU0PpvcOwFEecbv9B8vvkZIyrSyE2nhoxDvk
         ZNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773747705; x=1774352505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=px+gfHJgDMwJ2udAT1twOsp5nY83B1JZO7Rzq/NpbbM=;
        b=gJiN4F0oKmQxGpZ7g8aUtXweu/IgdzBbVfHs9y3KCAYEHNJaNZhb/ZanbQr0+FcmCZ
         0cLcjl18/IHhYJCJhRuq1lQq4aFy4bqGxa25MGv1sqVSG/sFqfarzx+9WXLl7FX5mqvr
         aHMc8TOCz8SsZ//98rvyC1Q+/Zu6pzBY9ABHJ5RBBv295/Wv91Rq7az2nqSvUOu3wg6y
         X1lWWRj3ViZAaQkng+DQsKCIFGYZkXmywZIAAGrA8IAnvmkWzaTnHfUwvbO1nRPbLHfa
         +jOg0TsTO1UzIUGDirOe11zvGQIsrRl3M/l8FlIQ+Ft3aIn2Uv6QTUEnKutPQ9KeEtTm
         L5qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDR4eZAsI2GVm8zdeobsqS+rcSu9VS5AYA72d1nYkvs1I8MNdlhTFIE2hvFNmmwz8YwOFj+7E6luYqglyF@lists.linux.dev
X-Gm-Message-State: AOJu0Yww7xCAdFY1/iaQPLMZQdwy3J7glV5OWfZtqYrJIZ7KhU1s1AzU
	YJEgnM9unBmXC9irpZKouya27TcwjFKAgtwrG5Fns73yCVn5JHc8Q4SqYhSgq25c1Vc=
X-Gm-Gg: ATEYQzxUJmNQstDHusRRP5/eJV+9EOHLreoD0YZj7OUui99g3pgOfUAQMd+EsOE2ePE
	+BfuT3fgo73j1lvdyXURrlahyxFBo6q6dUKRzJhC240MOTC9WAWohCagkqeYJ0HfzTiEC3mra+f
	m3OVbZDZ7JsQEiWiUEVMkSIRzqL9tg60KiY32OF/mqlus+KemTkgd6+/tsv70yWDhGQNyE/T11/
	UgO1w75jmQUCO0bGlLLXMupX73iYmt+FfhW11nu777eIAPvH99VncftRKod+3Lp9EcH2F3FHE3B
	RVw8UVHPyHUKHg6mmWAGnkyRkfIOUHfmsZd+N11hOxhyTrA+xtd2F1X0kYAL7ZolUi5wns+08nD
	SoP36R0PmGiEGHJ/y+54OZiKX9cyuleNL2T4L/44LoXtsiDZHpjUNweZlkmRLmvL+kIxzSpaxez
	JeK/BWTPRQQ03ja1B8QW4p/vMVy1Wi
X-Received: by 2002:a17:907:8dcd:b0:b93:81e7:845a with SMTP id a640c23a62f3a-b976507ad70mr950062266b.9.1773747704714;
        Tue, 17 Mar 2026 04:41:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97e16e3407sm83125866b.41.2026.03.17.04.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 04:41:44 -0700 (PDT)
Date: Tue, 17 Mar 2026 14:41:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marco Antonio Solis Segura <mshdevv@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: fix missing blank line after
 declarations
Message-ID: <abk99e3UhsuPCwHJ@stanley.mountain>
References: <20260317095453.54843-1-mshdevv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317095453.54843-1-mshdevv@gmail.com>

On Tue, Mar 17, 2026 at 03:54:53AM -0600, Marco Antonio Solis Segura wrote:
> Add a missing blank line after declarations in struct fake_driver
> to satisfy checkpatch.pl warning.
> 
> Signed-off-by: Marco Antonio Solis Segura <mshdevv@gmail.com>
> ---
>  drivers/staging/vme_user/vme_fake.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
> index be4ad47ed..eb918a857 100644
> --- a/drivers/staging/vme_user/vme_fake.c
> +++ b/drivers/staging/vme_user/vme_fake.c
> @@ -67,6 +67,7 @@ struct fake_driver {
>  	unsigned long long lm_base;
>  	u32 lm_aspace;
>  	u32 lm_cycle;
> +
>  	void (*lm_callback[4])(void *);

This is also a declaration so checkpatch is just wrong.  (Ignore
checkpatch mistakes or maybe try your hand at fixing checkpatch.pl).

regards,
dan carpenter

>  	void *lm_data[4];
>  	struct tasklet_struct int_tasklet;

