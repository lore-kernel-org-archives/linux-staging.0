Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7191F24A0B
	for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 12:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E4bBJvNr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697112631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e0nmqy59jy/rGMIg2W3+5Ft0g6PXLLlnoefzeVrsrTs=;
	b=E4bBJvNrLQ8rcRBQDn3tNKRj+hm1FH3KnvOlstF06MS9gi4Hz/PPx0VYkLOZ8wKwrVDXuO
	llopD0I9dzXozdtsF8yr/k3slGyElkYLQpKnyICDEnM85KlDJIn5tbQAzaB5lmplRqL1da
	SHt2bEfcYP7xR7KzFpWmisV6y1DynKo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-72QfbSWoN-m0upMFvmzEZg-1; Thu, 12 Oct 2023 08:10:27 -0400
X-MC-Unique: 72QfbSWoN-m0upMFvmzEZg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9ae686dafedso67973566b.3
        for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 05:10:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697112626; x=1697717426;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e0nmqy59jy/rGMIg2W3+5Ft0g6PXLLlnoefzeVrsrTs=;
        b=ugvcOGu1pvtnf5t7dAZwglUNXW8dhdXI+bSDp6RzymdOdvAKZtlIGwhb90RRokaaT6
         CnucFixZNMEG4mz5pLdiBrYoSbGlMsRoxp4XnccbQ3+hOvPM/jCg63MAxbAHAYRX5xFs
         gNgJzw7bDAo5CqOicdXPKVp7qTb+1R/lKFh4iRshWGgT648wsnOi/GUZP9wPRUFNED13
         NOF2Ja0rx9BGVdVc1FlAQ6weI32kqDkiafB7SQT7aUSKiRKLgNZZdjkr5Yh3d/BUU9aD
         Nw+qPE2Zgh5EEmCXPZYo9R/kwqfqLr0lJc4KueEhWS3Zm0k4NasFSVw6UYoASP9YTyHs
         +BOA==
X-Gm-Message-State: AOJu0Yzzl6iFlUC6k31EX6c+mShsf28MdiUlsIct1iKaN5Bs1bSS/8Ec
	c4uoWjnHKHeFYKd21x/YYgLZkky7GLTaLXuC+MxiI+7CwiPBpKUxVxkHGWJd/+wJEJDM+n9nxLX
	jVVlM9sJ4wK581NLE7Qdwte980Q==
X-Received: by 2002:a17:906:cc13:b0:9b6:50d3:2a75 with SMTP id ml19-20020a170906cc1300b009b650d32a75mr19703359ejb.48.1697112625896;
        Thu, 12 Oct 2023 05:10:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjvJVtD0uQR8XMo2cR7XmHJlpYVc+HmbN4viv4pGPb6gmHPLLfBWOiJNvTCRNd4xhqfQomHg==
X-Received: by 2002:a17:906:cc13:b0:9b6:50d3:2a75 with SMTP id ml19-20020a170906cc1300b009b650d32a75mr19703329ejb.48.1697112625566;
        Thu, 12 Oct 2023 05:10:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id x26-20020a170906711a00b0099329b3ab67sm11000199ejj.71.2023.10.12.05.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 05:10:25 -0700 (PDT)
Message-ID: <c9e693a2-845f-9ef1-e3cb-724cece84756@redhat.com>
Date: Thu, 12 Oct 2023 14:10:24 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v11 17/56] media: atomisp: Stop direct calls to queue
 num_buffers field
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
 <20231012114642.19040-18-benjamin.gaignard@collabora.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231012114642.19040-18-benjamin.gaignard@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10/12/23 13:46, Benjamin Gaignard wrote:
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> CC: Hans de Goede <hdegoede@redhat.com>
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
> index a8a964b2f1a8..09c0091b920f 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -1028,7 +1028,7 @@ static int atomisp_qbuf_wrapper(struct file *file, void *fh, struct v4l2_buffer
>  	struct atomisp_device *isp = video_get_drvdata(vdev);
>  	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
>  
> -	if (buf->index >= vdev->queue->num_buffers)
> +	if (buf->index >= vb2_get_num_buffers(vdev->queue))
>  		return -EINVAL;
>  
>  	if (buf->reserved2 & ATOMISP_BUFFER_HAS_PER_FRAME_SETTING) {

