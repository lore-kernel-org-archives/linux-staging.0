Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2FE1B21A0
	for <linux-staging@lists.linux.dev>; Mon,  4 Nov 2024 12:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730721707; cv=none; b=fWxWLlXHtbiEFf+km3z3nlUuagP3ek61I+BzAbvBUU26lZE1rO55iXzxMKx3Y/SltqXQZQ1Q3ODLrMfiyicR7N+wwmlAvBVekJ/tcEuJB77k8s587+YueEIsdvCMkEx4UyHDbpvhLiaQWjoeZ2DJkO1rt/fqqlJUcTjJDNX+5E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730721707; c=relaxed/simple;
	bh=qSdyZ2s9B5cARaoKsuwvCuT3hG3tvvz7d7IN6nt4dn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B/AMYwpC/H0uloRajZNI77vzoZO7AmTbRTi6NX0jE2OchsS6atIsx3i72awCyA6pGp9YQztwuGUF4hjfwI93xT10O89L9z246jChyV90JyVmEe135li5Ahi7I/gjxl0jxXo8BPcNUhRqDQDiMK1rDJbSf/y7rfk7haIdKO617Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gHRdZNpl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gHRdZNpl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730721704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kZjGJ8hV/x/q11ugCunF6S0uI4EeGKZp0XSGAnU91A0=;
	b=gHRdZNplcxovpGvHqssH/wUlpo9BnUQaWcq3qTr1u1m2vUQZ72O8osETcEcIGnz2Jz0nf+
	DYeF0yWADmXXpLT3h1MtcmZSzCaK/BBzMGzK3CcCoPPjuoLY3lCHwOR1DGbWuNW0DlRrDX
	z78lNf+tPZzc+wJlEciHpkTxi7XagT8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-7tqe__fWMDmsJo-OuBbYRg-1; Mon, 04 Nov 2024 07:01:43 -0500
X-MC-Unique: 7tqe__fWMDmsJo-OuBbYRg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a9a1be34c68so338040466b.1
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 04:01:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730721702; x=1731326502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kZjGJ8hV/x/q11ugCunF6S0uI4EeGKZp0XSGAnU91A0=;
        b=CIsls6DPYfXJN5APuxL7bvKMC0mN8SGrQNU9qJCfIj4jOqq8S/8LBcgd9sv8Zk+NkV
         hN2jOX+ulkmgwrSLR4iWqhbWrfuidbHEHH4iVg+O+qMV69XhsajJHBQOF7Rp0Pmlim1+
         /RdcUbiqilL1K1pZNZVFY20M/0sKLnwCMk7WHayPwx779d1OaxGBIrFlyHSJKNedH7R5
         HDgCJxUi3zw91IuCtcGT3ka1hdWmnJadZ7mvtg9LtnePFe88Twqk7qQ3hO3oZ0/vWOlG
         JCPrZY+B12QVE24LonE8YbmjNAnToH99vi2cwcJUmvTeyU/qULCHQkmjsmA35W4w01k0
         DA7A==
X-Forwarded-Encrypted: i=1; AJvYcCXrVbKRl82KdZwiQ/F+TTe/cMg+wcYrMNF0/w9kKVZ8nNrj02KTFj+GRP5hIGtSyNjZwzuuzuuRiUL18Zem@lists.linux.dev
X-Gm-Message-State: AOJu0YzS+CEr2rtchnpYlAHD6Uyk/n31C6gOi/uhjd2ffJfnJ9csfl7g
	mFFV6jeNyGoFp78DkzgW3AK+wWKkwJeDc0GIs91miY5XI/OCl9e0STO565GIMgONL6qMb/TEf3O
	FTJODbaMF5iPshjyMa+yNLDItk40sR2badDgQSPVxtXady+hPnGMxz/92oUL7a+Y=
X-Received: by 2002:a17:906:c14b:b0:a9a:1b32:5aa8 with SMTP id a640c23a62f3a-a9e3a5739demr2118207066b.4.1730721702178;
        Mon, 04 Nov 2024 04:01:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEI+dMfsJ1bB1NHBzblIbjvGUdy5Hh2SEjrlZoRzKI+72rOu6N3AO1yDnXa1sfJg51HrWX1JQ==
X-Received: by 2002:a17:906:c14b:b0:a9a:1b32:5aa8 with SMTP id a640c23a62f3a-a9e3a5739demr2118202966b.4.1730721701790;
        Mon, 04 Nov 2024 04:01:41 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e566442easm542115966b.166.2024.11.04.04.01.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 04:01:41 -0800 (PST)
Message-ID: <c220507f-5701-4602-9627-82728dccfb33@redhat.com>
Date: Mon, 4 Nov 2024 13:01:40 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: atomisp: remove redundant re-checking of err
To: Colin Ian King <colin.i.king@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-staging@lists.linux.dev
References: <20241012141403.1558513-1-colin.i.king@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241012141403.1558513-1-colin.i.king@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12-Oct-24 4:14 PM, Colin Ian King wrote:
> The check to see if err is non-zero is always false because err has
> been previously checked on whenever err has been assigned in previous
> code paths. The check is redundant and can be removed.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thank you for your patch(es).

I have merged this/these in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this/these will be included in my next pull-request to
Mauro (to media subsystem maintainer)

Regards,

Hans



> ---
>  drivers/staging/media/atomisp/pci/sh_css.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
> index ca97ea082cf4..7cee4dc35427 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css.c
> @@ -6308,9 +6308,6 @@ load_yuvpp_binaries(struct ia_css_pipe *pipe)
>  		}
>  	}
>  
> -	if (err)
> -		goto ERR;
> -
>  ERR:
>  	if (need_scaler)
>  		ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);

