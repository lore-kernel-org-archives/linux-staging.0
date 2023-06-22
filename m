Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C51A15AE5
	for <linux-staging@lists.linux.dev>; Thu, 22 Jun 2023 14:11:28 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f9c0abc8b1so19777915e9.1
        for <linux-staging@lists.linux.dev>; Thu, 22 Jun 2023 07:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687443086; x=1690035086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GHxJuqmuhPWFpQhIFC68lKcmCkInE/kiaYAhaHcn0+Y=;
        b=gEz/PAQ1qIP5WZun0LdTuL2gGMzh3DxKsvzmJ6Q0I9nak7WYgFwIua8o4b7DyFjInu
         SH+yb8hYWg8DPwV1viEU6ZlC5W12dzJ0cpS2WhYFT+HXtgViha0pmeDj9pynoswZZOTF
         P/sVO4e/j0gRgSpCoWweryl6LRW3mzxc+ShAtTe6cVPWa+CAxgZSyLrflRN7eA/KAapm
         ub1C0L2rIcRzkgBqnTbcW75iwVmmT8HRAKNXuHDGEi4rT3fGAi2MDTpm1XQbWGrx9Gzd
         RmYbgNRvkmPX0g4ourdc60JrhU8l+mRk/wFWm+1F6nQcKJZEAzhKd8wx7xJunOOfg0nk
         9TzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687443086; x=1690035086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GHxJuqmuhPWFpQhIFC68lKcmCkInE/kiaYAhaHcn0+Y=;
        b=DBBmXOtTSmsJUFZbbzp5flWxFpalobzYP2ThI8ikEKHUNbKLqdpQTK0uSttCq1FOR2
         FukI9V4eVILESbzdfQkbyUA2kp8TzaAiYRNx2ysfaEi23cq2fjM+MN7dyYiFw34ZZFMp
         6/eosjBpjX1Q3I4lBTJGRYFub3ocIaJ1ltgEfTBl+GDOM02uuh+vhungKI2x/9tDfgQ4
         EOEZJ1jI1Oaj+pMPxefF9PNvUqDPKVJ9kQUyXy+WMf7DuaWxK1PNhsp2hLW1GwlWPjR1
         F4N+bvjQ/oqiGBHv798SpwSiR3lYyQrLijZfgNxDXGJTvv/QBF0kdefaERkGtoDiT9lI
         byiA==
X-Gm-Message-State: AC+VfDz2S/dBGZZEXJjX3DDRuyPWJrYf7Q1uL/qdi585AxZx7HtYKftO
	kkiYLNYNxi+L/X7l5CVrOsCJgw==
X-Google-Smtp-Source: ACHHUZ6BmQp3My+dLgyfXTj9FadTnh4ZdU89bg6m7H4+QQzmHulg0AjgY/idmg/TybIPzxG+o/8epA==
X-Received: by 2002:a7b:c3d3:0:b0:3f9:b7cf:262f with SMTP id t19-20020a7bc3d3000000b003f9b7cf262fmr6889086wmj.4.1687443086247;
        Thu, 22 Jun 2023 07:11:26 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p24-20020a1c7418000000b003f9c859894esm3753202wmc.7.2023.06.22.07.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 07:11:24 -0700 (PDT)
Date: Thu, 22 Jun 2023 17:11:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com,
	ming.qian@nxp.com, ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
	kernel@collabora.com
Subject: Re: [PATCH v3 03/11] media: videobuf2: Remove VB2_MAX_FRAME limit on
 buffer storage
Message-ID: <bddd6cb7-cd72-4fb5-8d4a-d02cb9c46dce@kadam.mountain>
References: <20230622131349.144160-1-benjamin.gaignard@collabora.com>
 <20230622131349.144160-4-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622131349.144160-4-benjamin.gaignard@collabora.com>

On Thu, Jun 22, 2023 at 03:13:41PM +0200, Benjamin Gaignard wrote:
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index f1ff7af34a9f..86e1e926fa45 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -455,9 +455,9 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
>  	struct vb2_buffer *vb;
>  	int ret;
>  
> -	/* Ensure that q->num_buffers+num_buffers is below VB2_MAX_FRAME */
> +	/* Ensure that q->num_buffers + num_buffers is UINT_MAX */
>  	num_buffers = min_t(unsigned int, num_buffers,
> -			    VB2_MAX_FRAME - q->num_buffers);
> +			    UINT_MAX - q->num_buffers);
>  
>  	for (buffer = 0; buffer < num_buffers; ++buffer) {
>  		/* Allocate vb2 buffer structures */

Ah...  Here's one of the integer overflow bugs I was talking about.  The
__vb2_queue_alloc() function returns an int so if num_buffers goes over
INT_MAX we are hosed.

regards,
dan carpenter

