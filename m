Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904C8D2FD
	for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 11:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VFlp+yuJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697889434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8A5YPNn+IwEItuJ1G2OC4z10xXdMM8+6p/08c4lncco=;
	b=VFlp+yuJRX5nJDCVrSOs11MBGS7peuCCCwCwb2mMbcAC/MnN8U/gnl8bXKexBd2LxqLtuJ
	i2CMalBELAho6IN6tCkoeIRLQU/G5xcOD4V8TO+dcv6ZhlNTs8Lh9Y6UsmTYdUfys/A6L3
	gI2KttUeEYtCHXXdMsZaypnM2arBagI=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-EGM2QfLCNo2FND9VYX7Lgw-1; Sat, 21 Oct 2023 07:57:10 -0400
X-MC-Unique: EGM2QfLCNo2FND9VYX7Lgw-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-50483ed1172so1585201e87.2
        for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 04:57:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697889429; x=1698494229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8A5YPNn+IwEItuJ1G2OC4z10xXdMM8+6p/08c4lncco=;
        b=LqWslbcOtqOnZ4LJwESW9qIsDtqQVI3OpOt0JMvfCJ5pvfIhz6yYNyV1m9ndL2nes5
         jxjrpClDA/QAQcpWor41SlPS0Ve2+MwEhmGywIshAersRvQhzei+DO8dgFWvrQzBGKSP
         qPfx4nTlbHpJPeXKT2Zi3IIjOCQVuExWrkgqAA4FLMbF3KGG281Pv4+N1lJminmvNHE+
         1t+l9qdqe4U8YfsuWGG4zZR7//V4cYQzS4Gw6lpNa1bAPSGi0RUXKhah30/bVjnOIxyI
         3ewKmhCsZ4MT4DWrrpXpVm7jpYTqUDiQC1rIpJd5lsyAvEpMp8f+0Cr+H6L5oT04GChK
         mMOw==
X-Gm-Message-State: AOJu0YylYc4jsPy35TqnaXAVGO6luJFD6MBmpj20Wzo1sYDu40cjHPrv
	F6+VVXImj0G6mUS7AyP3pVRNT/GQXp1zBkr6Tj9WEe/WSMOEsJ5eQIuqOTx+PJ6O5QNZO0T9Ax9
	XP/ao7ZN4JNYmv2fCdft5WxYsiU0wPitzpg==
X-Received: by 2002:a19:6742:0:b0:507:9a00:c169 with SMTP id e2-20020a196742000000b005079a00c169mr3461928lfj.5.1697889428944;
        Sat, 21 Oct 2023 04:57:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRg2tiyoJnYcPUczv2CKzX9otDeCiprhYPsEiOsrC6j2ShP6Mn99ICxaoSBra/sl4K9VMnBw==
X-Received: by 2002:a19:6742:0:b0:507:9a00:c169 with SMTP id e2-20020a196742000000b005079a00c169mr3461922lfj.5.1697889428601;
        Sat, 21 Oct 2023 04:57:08 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id w21-20020a50d795000000b0053e4d1cbc6esm3392994edi.55.2023.10.21.04.57.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Oct 2023 04:57:06 -0700 (PDT)
Message-ID: <acf1fade-7693-9332-03b1-626f4949f9ff@redhat.com>
Date: Sat, 21 Oct 2023 13:57:05 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND] staging: media: atomisp: Removed duplicate comment
 and fixed comment format
To: Jonathan Bergh <bergh.jonathan@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20231021110058.85013-1-bergh.jonathan@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231021110058.85013-1-bergh.jonathan@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jonathan,

On 10/21/23 13:00, Jonathan Bergh wrote:
> Fixed the following issues:
>  * Removed a duplicate comment
>  * Fixed up minor comment format issue
> 
> Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>

Thank you for your patch, but please don't resend
it every week.

I did see the original patch and it looks fine but
I have not had any time to work in atomisp support
recently and this does not seem like something
which needs to get merged urgently.

I'll pick this up next time I have time to do
a bunch of atomisp work.

Regards,

Hans


> ---
>  drivers/staging/media/atomisp/i2c/gc2235.h | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/gc2235.h b/drivers/staging/media/atomisp/i2c/gc2235.h
> index 55ea422291ba..ade28950db73 100644
> --- a/drivers/staging/media/atomisp/i2c/gc2235.h
> +++ b/drivers/staging/media/atomisp/i2c/gc2235.h
> @@ -74,9 +74,6 @@
>  #define GC2235_COARSE_INTG_TIME_MIN 1
>  #define GC2235_COARSE_INTG_TIME_MAX_MARGIN 6
>  
> -/*
> - * GC2235 System control registers
> - */
>  /*
>   * GC2235 System control registers
>   */
> @@ -167,7 +164,7 @@ enum gc2235_tok_type {
>  	GC2235_TOK_MASK = 0xfff0
>  };
>  
> -/**
> +/*
>   * struct gc2235_reg - MI sensor  register format
>   * @type: type of the register
>   * @reg: 8-bit offset to register

