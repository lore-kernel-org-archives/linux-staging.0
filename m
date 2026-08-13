Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1F93AEF3B
	for <linux-staging@lists.linux.dev>; Thu, 13 Aug 2026 18:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786647570; cv=none; b=Pg+2UbVg8N5XqKBKpE+oOTf3gjAp+R3VCG7256TcuGI4QngTIWfTKrthByforCHNdETVMl46MCKbeiJGZyzu4AjUZGmfAkNq0rzoMmKJ8n4LE2ywy0lzPDj4SGvbtZBWqHQniY3jnZyYij/6l1UBcZTTafwWlavUq3aENQ0QJDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786647570; c=relaxed/simple;
	bh=lOnAaOaGVVFiK4mt8CBhfHxNuvToM4xuQKb07SccwKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXroDNGhxlrHrAYgkelhc1G8nxltHsa0znNarDSlRfXItDnNQhcZ3XVQwJEGDzCejybtTVTvi3eBgyR927gMIOteuJPyRM17XmtdSjIqS6rTCG5t0hoGA+H74z8rQn/g3qh56fGSdANE4O6pqjTLWGWdl6bWjrlgBFFfIlbw03g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OU7kXYJ7; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OU7kXYJ7"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so135533f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 13 Aug 2026 11:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786647567; x=1787252367; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uh/APiVl0POIqyc3Yw8orY55em9X0NLBdmnuLhihqeU=;
        b=OU7kXYJ7hbY3Vt8fQdghfzZAIfHBLPaEAT3E9/afe2o2t4IKN1M4j2x52djpenfqrm
         HZIj2FOF2HRo8uukMd2BwxgxDsuzGsZYD1Qw2SAJNCBD3tvdgkFzO7mN7bnmqtaV8I7O
         uKczoFWU6OQbTcoPm8YE4F5h2XpGcWmsnT5HYOqex8wqffVEyplywEFQOXen36jyNquY
         34h7t5P7YTnbeWUOHkAb+ptuXWLiN+NIjxD24mbsCo1/RzoQjprik7lOxtU9CFQUihs3
         HLmUh3oFFuebY1lsF7JHY/BIw/BWWdV1PMjQpjr0l7Jo+pr1oL/aEdMObDKE/veBZVEf
         WKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786647567; x=1787252367;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uh/APiVl0POIqyc3Yw8orY55em9X0NLBdmnuLhihqeU=;
        b=oHQ4GURMlxTrCmBeyizfy8G/7r9uBfTdCV4+B3PrlTmmuVwiF/C8t0XOMqZ/8JwJn8
         nWBkafGHB+kr5gvYDJu/G8djDyM56sL2gQ0wOs4jj+ogdcEv4uP0oaD44HzFE8G5I09p
         zYDXIYmZtBN5Jfqxrb3y6PgU5c4Jwi5p7XK//RTHZcTsKkFi50ckjLF5gMD2TglRpnmJ
         Q3kOIRLSYRlJg0Wg9H3XGwBmbzgVYMkiJ4SyAhcs1ssouCU4RE54JF/oblF11WlwQI0P
         9pV4BdQ0eoYjXQxJyT8FflTOa9Xg5T9p/T9Cf2qmjGth55YzOTEfSdXiWpbZCkXO5z2p
         QeCw==
X-Forwarded-Encrypted: i=1; AHgh+RrnLTD2dcncPn1LcBF6YPfMmOiAV8z+0r0j4Ucs/Uz8wpiM5FFE4zhnWNYq8Ld1kjs+TNL2ViCvxFiwPiHW@lists.linux.dev
X-Gm-Message-State: AOJu0YwDXSkqWzz9CGJmSPnbBRCA1mx9ScHUFJHTQpsibOVAKTp3o0tt
	Y6XnNLl1rOqU69hwZooEYRqkB5MtFoyrBqBvc4PBdWbw/AiMhh90OZ1R
X-Gm-Gg: AR+sD132G2bons8fWI01zCC3GuvZwvC6jexTT870OJnwFDH7AvlJqnDDj5EskYQ+ZAr
	EOMKWc6zLZlo9VKex8axYjzuHDEQe3GtlcMeaTp6YHcd94I5ndobc4LZCGrhUVaF2afeswibGZw
	JYdE9+RTBMyisK5L8aaBiAeCiaf+qX2w4Mrskus9ckMFhoQI8Dob1D74WehI/EYyEf4VKRrH3V6
	3DBJk+cdutg1oK3vbQbIY1JVGjgPjHsnGV6U0Jeo2V7i5l/qWBq3tZMRjIS9C9H7rqV32o6mUn9
	u3N6qOmbZTbZWw4cBetpT804gNTlqo3BdN4D0FNC19myCvWF3Wm1vm2Ge0s8CV7ujsedA37oOav
	9TVrApK/U6Jd9TN1I1D6xtiLJWEiwmGkXGfBvedLkOOC6mjVh/3X4kZSPx8RqAIiNmx8mjqdn/p
	6P24jd2gElFgyigrZZoI63hhLtR4mmdh9vktcBwO16ONfyQHo7rJLU26aE
X-Received: by 2002:adf:e744:0:b0:47f:81c4:36a5 with SMTP id ffacd0b85a97d-481607575e8mr426220f8f.15.1786647566850;
        Thu, 13 Aug 2026 11:59:26 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a31dsm1592554f8f.9.2026.08.13.11.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 11:59:26 -0700 (PDT)
Date: Thu, 13 Aug 2026 21:59:22 +0300
From: Dan Carpenter <error27@gmail.com>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix XXX placeholder in os_intfs.c
 comment
Message-ID: <an4UCgjPjuxfCEuv@stanley.mountain>
References: <20260813-rtl8723bs-fix-xxx-placeholder-v2-v1-1-a9be805ac0e5.ref@yahoo.pl>
 <20260813-rtl8723bs-fix-xxx-placeholder-v2-v1-1-a9be805ac0e5@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813-rtl8723bs-fix-xxx-placeholder-v2-v1-1-a9be805ac0e5@yahoo.pl>

On Thu, Aug 13, 2026 at 07:26:52PM +0200, Tomasz Unger wrote:
> Replace the 'XXX' placeholder with 'securitypriv', the actual
> field name referenced by the commented-out memset() call on the
> following line.
> 
> Using the real field name pushes the line past 100 columns, so
> the comment is reflowed to multi-line style in the same change
> to keep it clean. This combines a content fix with a formatting
> change; I considered splitting it into two patches (content
> first, reflow second) but felt the reflow is a direct and
> unavoidable consequence of the content fix rather than an
> unrelated cleanup. Happy to split into two patches if preferred.

Put this kind of meta commentary under the --- cut off line

> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
  ^^^
here.

>  drivers/staging/rtl8723bs/os_dep/os_intfs.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> index f31196f54b3e..873e00a04bcb 100644
> --- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> +++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> @@ -664,7 +664,10 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
>  	/*  add for CONFIG_IEEE80211W, none 11w also can use */
>  	spin_lock_init(&padapter->security_key_mutex);
>  
> -	/*  We don't need to memset padapter->XXX to zero, because adapter is allocated by vzalloc(). */
> +	/*
> +	 * We don't need to memset padapter->securitypriv to zero,
> +	 * because adapter is allocated by vzalloc().
> +	 */
>  	/* memset((unsigned char *)&padapter->securitypriv, 0, sizeof (struct security_priv)); */

Just delete the comment and the commented out code.

regards,
dan carpenter

