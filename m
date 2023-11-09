Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35E8199D3
	for <linux-staging@lists.linux.dev>; Thu,  9 Nov 2023 11:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CXDVyXgI"
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 95C136607421;
	Thu,  9 Nov 2023 11:19:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699528743;
	bh=EHWlF6idsNP4hPb7jAlpbcca/qI2OyTJsZvOkakfOMU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CXDVyXgIV1WXRA256QA8qY2evyCRRMqcxHwZOsFXs8KRCnGrzVgV7AhduNBhUSK7r
	 gpt5XXmgPv0CbOVSs2oay+Mj0qV2PbyqOZ333L+7TlruHuBAKsg9ZWYZqFtjo+I2TP
	 rFLMc1WmGqsdkYh4iJ/xBvx+BeArI8TkCWzrr/YW1WrD8qSaAbP5Jv/s0eAegoOxud
	 ilYIMvjraBWp82fR53n2Od3YTW0/iBQoGFx0QFksv5++v3Z7VLuXGuSus6TPUDpi4h
	 mxq5uRNR+gUweca1wiRPjPW0aks8bqzC96c6H3JBT5jJzxvUjoaJ7jCigydDrIqi81
	 WMvkKxS4Mhf4g==
Message-ID: <4835f2cf-ea3e-4a17-ab3b-c8e6f18b5192@collabora.com>
Date: Thu, 9 Nov 2023 12:19:01 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 33/56] touchscreen: sur40: Stop direct calls to queue
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
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-34-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-34-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

W dniu 31.10.2023 o 17:30, Benjamin Gaignard pisze:
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> This allows us to change how the number of buffers is computed in the
> future.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> ---
>   drivers/input/touchscreen/sur40.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscreen/sur40.c
> index 8ddb3f7d307a..e7d2a52169a0 100644
> --- a/drivers/input/touchscreen/sur40.c
> +++ b/drivers/input/touchscreen/sur40.c
> @@ -847,9 +847,10 @@ static int sur40_queue_setup(struct vb2_queue *q,
>   		       unsigned int sizes[], struct device *alloc_devs[])
>   {
>   	struct sur40_state *sur40 = vb2_get_drv_priv(q);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(q);
>   
> -	if (q->num_buffers + *nbuffers < 3)
> -		*nbuffers = 3 - q->num_buffers;
> +	if (q_num_bufs + *nbuffers < 3)
> +		*nbuffers = 3 - q_num_bufs;
>   
>   	if (*nplanes)
>   		return sizes[0] < sur40->pix_fmt.sizeimage ? -EINVAL : 0;

