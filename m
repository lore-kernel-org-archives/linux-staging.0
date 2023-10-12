Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC6724A0B
	for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 12:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RrXWRkNC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697112632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=27M+MIAmpe+L/2HgaOkMQYAzM+WcqJam0R6eMp8zZVc=;
	b=RrXWRkNCZbjAtHwrJL0s9lFUhhNiUxtHT4cKEST1pE3fjFKElP5T0oAAB+ci7amVzIS7LH
	kbJGGTgRK+j0hX50XfVfN6n2WsGPaTD9kfNMtAgkphKCsBQgMwK3dN1XBvzZvFJTjtd41z
	d6Cxzii9oawcQ66AIJEq1dpoNVt6TxA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-knG8HQSEP7iMIoAd683Ivw-1; Thu, 12 Oct 2023 08:10:16 -0400
X-MC-Unique: knG8HQSEP7iMIoAd683Ivw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9ae0bf9c0b4so70633366b.0
        for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 05:10:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697112615; x=1697717415;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=27M+MIAmpe+L/2HgaOkMQYAzM+WcqJam0R6eMp8zZVc=;
        b=Od8dJMMaXmRC7vEomuHS6545t4D7Yyg1mbQChuFtgNA+ycVm4zMLcVKgSH42niRRG/
         Zs2s+YL7GeDqHukAZpuO2IScmAY7FfVYfDQMZSr6xDKv6erfqnve2bdC2NFuVB85bzA7
         0hrzVKRdw2Vzxtr8HEtF9Gu41nfdaFaTp6gTuvjpjzcZ7hN4EiqXmfuCg3NMJoUG91XP
         gMjXVW+DKv92wDfsQVGsO64Dv6ZTlH5Bw6U+kh06OixAt/my4JGHODdMhhMmSL5ZA0+H
         8wEk0Q6vytr7ZHPopilf0fIo28otWKTTakGSSgzP63tqqAZQMwn/IAGInj+0wRoL+3/f
         GLAQ==
X-Gm-Message-State: AOJu0Yw/vByyc7HiYsC2Fa465G36cr8mHCrWaDltnAZ3pY9oUDZUR5Uz
	Y0ydJx19Ck0YR3VYC4jrdPyU0PKAugQd8LsYspYo7dShqv2Dr4ehmSWlpOjzuqwcc4/ctjRSfIN
	P6sxDO39osytw56G4QcQR34P0NA==
X-Received: by 2002:a17:906:1092:b0:9bd:8cfd:e588 with SMTP id u18-20020a170906109200b009bd8cfde588mr1625687eju.27.1697112615684;
        Thu, 12 Oct 2023 05:10:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkVyuhaskOIIVNVit9o80c6O2JAINjoNgAy46RiSAkOYOLUZ42tscH4PSdUZo1OCucR3X4XQ==
X-Received: by 2002:a17:906:1092:b0:9bd:8cfd:e588 with SMTP id u18-20020a170906109200b009bd8cfde588mr1625662eju.27.1697112615307;
        Thu, 12 Oct 2023 05:10:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id la18-20020a170906ad9200b0099cd008c1a4sm11019663ejb.136.2023.10.12.05.10.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 05:10:14 -0700 (PDT)
Message-ID: <7ad450c4-78df-ed5c-a05d-5dca8201d081@redhat.com>
Date: Thu, 12 Oct 2023 14:10:13 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v11 16/56] media: atomisp: Use vb2_get_buffer() instead of
 directly access to buffers array
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
 nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
 <20231012114642.19040-17-benjamin.gaignard@collabora.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231012114642.19040-17-benjamin.gaignard@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10/12/23 13:46, Benjamin Gaignard wrote:
> Use vb2_get_buffer() instead of directly access to vb2_buffer buffer array.
> This could allow to change the type bufs[] field of vb2_buffer structure if
> needed.
> No need to check the result of vb2_get_buffer, vb2_ioctl_dqbuf() already
> checked that it is valid.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> CC: Hans de Goede <hdegoede@redhat.com>
> CC: Mauro Carvalho Chehab <mchehab@kernel.org>
> CC: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> index a8e4779d007f..a8a964b2f1a8 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -1059,7 +1059,7 @@ static int atomisp_dqbuf_wrapper(struct file *file, void *fh, struct v4l2_buffer
>  	if (ret)
>  		return ret;
>  
> -	vb = pipe->vb_queue.bufs[buf->index];
> +	vb = vb2_get_buffer(&pipe->vb_queue, buf->index);
>  	frame = vb_to_frame(vb);
>  
>  	buf->reserved = asd->frame_status[buf->index];

