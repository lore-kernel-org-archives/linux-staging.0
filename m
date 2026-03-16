Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0018382393
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 08:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773651537; cv=none; b=eWX70g+AZ1C6IbkgWU+f/ZLOms+bZ3EECWb465+LH1yJ83peI02McDqbIZt+vR4+j0tLKXhzRdDTFEACjEwA4/vRedbZCl1ROBZ9J9V6Ua0ZgY/+sEB/A/fEgVGX1hxqq6yBiONC+ld88k0aZvplomOB6TOKn11847x/YWEfjMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773651537; c=relaxed/simple;
	bh=1BYliLq2TTPEeDtry+DsopBfwW0/Cn/6nX0TqfQlMh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=InS0V8B9YNP/WbmRJgOrNw91DLkwWssjf+MRlU9R4275Q7ux7e+AIQ4eijH01RD7Dd7uggfK/hLPI6fNptUO1qRzyaGmK1ZiuzE/fS82uuBhO44iQxZY+GqVdG2qPz1ehXVuxGc9ERlit8x1yo7+/HgfdwN0BYXTUGchmCR7LAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mkBAbnaK; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mkBAbnaK"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4853aec185aso35235725e9.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 01:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773651534; x=1774256334; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QBu0+9wxUCwZKF4FY2ZZBfYgZz2RjayUk/bVzSL+weA=;
        b=mkBAbnaKoWwAZ1vKahEMF7kd+SdibdUn0fn74o+MR6yEcelNaKoLnhJWtyBbQ4AxGS
         affu3MyJs0lfqBjYPMxQvmeJommxncL0oqqshA4YBYZs98ygXQPcc4omzuOAb5WRr7dP
         Q18xdpjbXxv2OyvIr3kjVu0S4rxL78BG6Gk6+SFz8oWj+kLeXbimrHv6a/jnVThcEDzE
         HdubfX1ZYZ8PoA8Ii/apUZqsMq6eeOUv/8BzetS+imTIiDk/vftTH8rLmdZC3sXI16IA
         +JCCn2FVlOP57JFL6AubdrQkE6flGJoU5tljQWN2eMBWDKt8mcSfiUM7cK/XXWS/E0WG
         nkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773651534; x=1774256334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QBu0+9wxUCwZKF4FY2ZZBfYgZz2RjayUk/bVzSL+weA=;
        b=dfAEq1OUmQ+oevVdg/jdOJ3xyzKVjwJW/KalZQPLeJQP8dswtWLn1EV7RqiBjnTRX+
         CP6cIBZ9YdtLJSL8EUIHDuoC9uVwiU5INUrW0RuYJESaVWvxPJoml+/IM+1TEiDq6Jcy
         cCc5Qo+EfeBGtGjG6c3pR89ooDZ1cpAJ4zxuU/HKlsHHktrkV7SNaTVigXl385dWT2ht
         A5YrSwFotgkESw9Hvm9yShBzFaeH/aE/sAwfas+DVBtu9zQALT32skKAYitqa4LO7zGe
         Bd3eBb/cwNjhRLSI4RZth5DWDi0hixX27+TMOd2f2Q2r5E/eykXQwJqJKCIlylec2no/
         G46w==
X-Forwarded-Encrypted: i=1; AJvYcCWGPiwOg4DXDjdrwvDBO9vfbewQoSMU3mGBpCzCxir6SqnkDkgwXPxOFxcGngphaNca19FGk0d6R3fragFz@lists.linux.dev
X-Gm-Message-State: AOJu0YxY1t0ZFlHtjsdHTgxVnv57urPRjI5JH+acRjPQtg5Za/CN5YBd
	77tL1WkmteZjfRkv0ePnAEu+1YcwPn6C6A/SV4NO39c7+wQ5fyy307Y3cp1+9oi4/OY=
X-Gm-Gg: ATEYQzxqTW68jT1inxzF08z089hn0p+z1jZKWa83fppnASvY+GcmEU5IF/B2todoFBf
	pQmW5ZtoW86emfEpbJGOj9OyBasIaT7PVt/WzTBwdqxt/dT19gXRoYFODcx6i2KXg93fVnxcDzZ
	BH3+ivcOUpsdrvLBWYJMgsiHlrnmGqmz14Dzb3jWOu83+opzrXkzYTXxZub9p2APm6loDh+qxU7
	Y5qt8R1YYi9vsiRtgrMEVDlO1I5QM/SXtZAA2ZLru9Ujc4gg7PUw7mURY2t/7F4PcZRTZpXxDWl
	TKi/veJ+gIIqVqtT+WdS0ltHasCEaRUaJm5m4F+HfzY/z+7NJaNTGBWLFFCGhX6X2YW8Z+rkqsA
	krmkpphLMJlvFb+xPL8HPoozvMsxn66GsSg/rt3pqJMofzTYKVd50tcAnYXqziry1hwQ8qjDVB+
	kfmIvsPlaynk92ENwK05360RR/VOAW
X-Received: by 2002:a05:600c:4592:b0:485:3dfc:57a with SMTP id 5b1f17b1804b1-4855671044fmr204098785e9.32.1773651533830;
        Mon, 16 Mar 2026 01:58:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1affe9sm42587929f8f.15.2026.03.16.01.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 01:58:53 -0700 (PDT)
Date: Mon, 16 Mar 2026 11:58:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Oarora Etimis <oaroraetimis@gmail.com>
Cc: vireshk@kernel.org, gregkh@linuxfoundation.org, johan@kernel.org,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: bootrom: fix potential null pointer
 dereference
Message-ID: <abfGStu_eSV0xcM6@stanley.mountain>
References: <20260315182028.133028-1-OaroraEtimis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260315182028.133028-1-OaroraEtimis@gmail.com>

On Mon, Mar 16, 2026 at 02:20:28AM +0800, Oarora Etimis wrote:
> In gb_bootrom_get_firmware(), the 'fw' pointer could be NULL if the
> function jumps to the 'unlock' label. The execution flow continues
> into the 'queue_work' block where 'fw->size' is accessed, leading to
> a null pointer dereference.
> 
> Fix this by adding a NULL check for 'fw' before accessing its members.
> 
> Signed-off-by: Oarora Etimis <OaroraEtimis@gmail.com>
> ---
>  drivers/staging/greybus/bootrom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
> index 83921d90c322..50c80475d241 100644
> --- a/drivers/staging/greybus/bootrom.c
> +++ b/drivers/staging/greybus/bootrom.c
> @@ -298,7 +298,7 @@ static int gb_bootrom_get_firmware(struct gb_operation *op)
>  
>  queue_work:
>  	/* Refresh timeout */
> -	if (!ret && (offset + size == fw->size))
> +	if (!ret && fw && (offset + size == fw->size))

Was this a static checker false positive?  Which checker are you using?

If fw is NULL then "ret" is a negative error code so the original code
is fine.

regards,
dan carpenter

>  		next_request = NEXT_REQ_READY_TO_BOOT;
>  	else
>  		next_request = NEXT_REQ_GET_FIRMWARE;
> -- 
> 2.47.3
> 
