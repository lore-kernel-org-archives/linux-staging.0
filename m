Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41D4125AD
	for <linux-staging@lists.linux.dev>; Fri, 10 Nov 2023 09:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cigBLQcq"
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1F05666073E2;
	Fri, 10 Nov 2023 09:26:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699608401;
	bh=gi6eNiomHAGLi9GNKFJFP416UqYP7sKqgmX+FgclTY0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cigBLQcqBV90Hl5smGHz3i4Y2bQxHN/jELj7hTq9pCLQ3sNMgNuesh3AoF8Y2cTRk
	 W9lsEN72BiG8BgVnHSI+3u2A+IajCQpbesSsebnN14n778NAcIzGvl2Kdcw6fhkS5X
	 eZ123YfG+N9hVXfDiCh4ZxepXq5oiZhJ7ykNKj+TpllpWHY0KxjDuOKRUcj9lyp8PA
	 U/9MosoXdS1fEHo+Bp2g04o7o05tLhiEnW4nrEtmg+KX3FbydeZp7djQ9gpJX9b7et
	 HWhBkYsPjoD6ltQV/jrZ1MlvLW3DDegDkDfHb/omTqzD7umVUcN7vjlLaaEGWxgSxN
	 ss45pzKhVG6Zg==
Message-ID: <7224be00-99cb-4134-b45f-98b92c1fb4da@collabora.com>
Date: Fri, 10 Nov 2023 10:26:40 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 25/56] media: pci: tw68: Stop direct calls to queue
 num_buffers field
Content-Language: en-US
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
 nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>
References: <20231109163512.179524-14-benjamin.gaignard@collabora.com>
 <20231109163512.179524-26-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231109163512.179524-26-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

W dniu 9.11.2023 o 17:34, Benjamin Gaignard pisze:
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> This allows us to change how the number of buffers is computed in the
> future.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> CC: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>   drivers/media/pci/tw68/tw68-video.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/tw68/tw68-video.c b/drivers/media/pci/tw68/tw68-video.c
> index 773a18702d36..79b627ebc92a 100644
> --- a/drivers/media/pci/tw68/tw68-video.c
> +++ b/drivers/media/pci/tw68/tw68-video.c
> @@ -360,13 +360,14 @@ static int tw68_queue_setup(struct vb2_queue *q,
>   			   unsigned int sizes[], struct device *alloc_devs[])
>   {
>   	struct tw68_dev *dev = vb2_get_drv_priv(q);
> -	unsigned tot_bufs = q->num_buffers + *num_buffers;
> +	unsigned int q_num_bufs = vb2_get_num_buffers(q);
> +	unsigned int tot_bufs = q_num_bufs + *num_buffers;
>   	unsigned size = (dev->fmt->depth * dev->width * dev->height) >> 3;
>   
>   	if (tot_bufs < 2)
>   		tot_bufs = 2;
>   	tot_bufs = tw68_buffer_count(size, tot_bufs);
> -	*num_buffers = tot_bufs - q->num_buffers;
> +	*num_buffers = tot_bufs - q_num_bufs;
>   	/*
>   	 * We allow create_bufs, but only if the sizeimage is >= as the
>   	 * current sizeimage. The tw68_buffer_count calculation becomes quite

