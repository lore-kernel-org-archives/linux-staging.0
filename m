Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F4F199DD
	for <linux-staging@lists.linux.dev>; Thu,  9 Nov 2023 11:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XTzMyPLG"
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A43096607421;
	Thu,  9 Nov 2023 11:30:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699529415;
	bh=SVwWJoku0b2gF9Msm+qmkDJT0wgIhMp4EHQn46CbvKQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XTzMyPLGtG7ot69/B3qnKksFGi+wYvy2qUIZq9vDHeuBWwPSjFg1waygDHk/Z1f9w
	 rf0aJ52auDd2kRdzE/OOhydhIUIFk3SI78eHztTvaV4RqLcyvnce1H+eA62F8d9jyI
	 Iljv87MInMY3+AZbaJjU9YvTaLWqcgBxg1J4Y77B1ErzvoAgwL0pq7czm+l+3DkuSt
	 bjtH3cbsM3owmsjkUJz60pujw+dBQuWmJYh4/E9CyEUcHuMwmbAel786rAsy6qNkmE
	 G98AJOCk6Xck6lutnSll6wNnsXxS5JO2XENUrkiHvQ/c1hBLalrDlWwMCofbiKOaH8
	 eiP+XvuXiAVjA==
Message-ID: <c8788939-15e2-44ee-b478-c377a7964f0e@collabora.com>
Date: Thu, 9 Nov 2023 12:30:13 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 37/56] media: renesas: Stop direct calls to queue
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
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-38-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-38-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

W dniu 31.10.2023 o 17:30, Benjamin Gaignard pisze:
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> This allows us to change how the number of buffers is computed in the
> future.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> CC: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>   drivers/media/platform/renesas/rcar_drif.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/platform/renesas/rcar_drif.c
> index 292c5bf9e50c..f21d05054341 100644
> --- a/drivers/media/platform/renesas/rcar_drif.c
> +++ b/drivers/media/platform/renesas/rcar_drif.c
> @@ -424,10 +424,11 @@ static int rcar_drif_queue_setup(struct vb2_queue *vq,
>   			unsigned int sizes[], struct device *alloc_devs[])
>   {
>   	struct rcar_drif_sdr *sdr = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>   
>   	/* Need at least 16 buffers */
> -	if (vq->num_buffers + *num_buffers < 16)
> -		*num_buffers = 16 - vq->num_buffers;
> +	if (q_num_bufs + *num_buffers < 16)
> +		*num_buffers = 16 - q_num_bufs;
>   
>   	*num_planes = 1;
>   	sizes[0] = PAGE_ALIGN(sdr->fmt->buffersize);

