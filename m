Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A033A323B
	for <linux-staging@lists.linux.dev>; Sun, 31 Dec 2023 09:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fIcxzCOn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704016243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UW78e+F1YtmVSX3HESxIca4JE3o6LIXx9/gPDIVdjGs=;
	b=fIcxzCOn5qistNp9rKE+RFKri5sH4TXYHaJco5MTlD8uAdd520ys+uvBIkhKrXJOjxnYaR
	zTcQTywmKxN2kvDFRxtbRxpXBRJQ9vc0IdSCxEXSQyBGv1HbRChj0WNdfZJlZ5td6DdjEY
	mPHOzZIh5Ru56Apu5NA7unITddY34SM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-aaVceDMjO0WjLVWGLS6p1Q-1; Sun, 31 Dec 2023 04:50:40 -0500
X-MC-Unique: aaVceDMjO0WjLVWGLS6p1Q-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-553b6a33a58so9603061a12.1
        for <linux-staging@lists.linux.dev>; Sun, 31 Dec 2023 01:50:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704016239; x=1704621039;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UW78e+F1YtmVSX3HESxIca4JE3o6LIXx9/gPDIVdjGs=;
        b=w0WJMTZWU6nhPnWPElAXUWbty8l1QPSmWpGLKT6ThS4dKR+qpfGB+LQnqJx5maSqs+
         Opi6pk6IhybQLHIp1/iNJEok3OCt7OnfgvwGIHsSWUue4L+hZlWFSN3vLT5kfEnl9iy/
         /F6QnUZR1E9AmXeJwx+Pl0bw5eEvdwmZUqiHl4ayz9okkVibJBiE7ShpwaPlebn87grP
         Di0myqae8tYasBh3QtQ5DX+aoheGFhahjV5pdVOfpZqGk2TxmxVfBAisiIwHXT3RN/RE
         jLtLx6tiY7rpqL/eHwzHOkJg5tJAQSWmG7pZPCYu0Kaj4xfLuT0TTGIPdHt4/0X6th7v
         FijA==
X-Gm-Message-State: AOJu0YynJ/HitSWRQYidJY9wWfEGZ9dx8jwWW5MNlxXEcbVqQDU4Tzpe
	NvC4wkJmMKcHjGgaAksY/3Z0Xym24sc2la0Ym1OlKegU3bsRXlt6/ng69b/6WiS6MfTSSLcQigU
	HQBPo8z23bAwMIY+a8/cSYYL9YiXK9PNufA==
X-Received: by 2002:a50:9f68:0:b0:555:936f:f36 with SMTP id b95-20020a509f68000000b00555936f0f36mr4604194edf.4.1704016238994;
        Sun, 31 Dec 2023 01:50:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAuVkeWzkV4UGpkYWL73BOOO7hj+mxu0DEI4qYXOLBU8Dgrsj+nfHlo9Gaj/b0bNZSUej77Q==
X-Received: by 2002:a50:9f68:0:b0:555:936f:f36 with SMTP id b95-20020a509f68000000b00555936f0f36mr4604191edf.4.1704016238710;
        Sun, 31 Dec 2023 01:50:38 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p12-20020a05640243cc00b0055493aa8905sm9894390edc.63.2023.12.31.01.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Dec 2023 01:50:38 -0800 (PST)
Message-ID: <70dd9eaa-4e41-4f4a-8dc6-a8e987b0c442@redhat.com>
Date: Sun, 31 Dec 2023 10:50:37 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media/atomisp/pci/runtime/binary/src: Fix
 spelling mistake in binary.c
To: Dipendra Khadka <kdipendra88@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, hpa@redhat.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20231223091521.85467-1-kdipendra88@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231223091521.85467-1-kdipendra88@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/23/23 10:15, Dipendra Khadka wrote:
> codespell reported following spelling mistake
> in runtime/binary/src as below:
> 
> '''
> ./runtime/binary/src/binary.c:537: spcification ==> specification
> '''
> This patch fixes thisspelling mistake.
> 
> Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans




> ---
>  drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
> index 0f3729e55e14..130662f8e768 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
> @@ -534,7 +534,7 @@ ia_css_binary_uninit(void) {
>  static int
>  binary_grid_deci_factor_log2(int width, int height)
>  {
> -	/* 3A/Shading decimation factor spcification (at August 2008)
> +	/* 3A/Shading decimation factor specification (at August 2008)
>  	 * ------------------------------------------------------------------
>  	 * [Image Width (BQ)] [Decimation Factor (BQ)] [Resulting grid cells]
>  	 * 1280 ?c             32                       40 ?c

