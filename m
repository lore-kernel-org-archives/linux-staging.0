Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383A3125D9
	for <linux-staging@lists.linux.dev>; Thu,  9 Nov 2023 09:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="go3xYNfI"
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2BC966607410;
	Thu,  9 Nov 2023 09:56:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699523807;
	bh=c+3XjSeB8HMKNjwLmSS238tYNmxXwbwvveXaB38GSKk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=go3xYNfITHl5diEzptRBnlY36ukC5Xflkzmqf4Rm34E3qLVY2WtNf/vOKNouUwT31
	 XWBrSQ3HFLFpCTkEfKxemlErp/XIbe89+zzSptEE9vmLNTaM+WBBarpt5aEbWlRk+c
	 ze4Q3rJqNKIp64aPproN3VBAZDa3aTZ0gvTmJs0MJ/bV3X7EsS8jfE1TJE4kx0aZJ5
	 EY8MEd/69Tqk9dU1LHT09wR/dJIV5qVsx6kq9tXDPl8ndlMkkzOF6Ol9Gj+cIyoYpK
	 zO1V/WbVmt7qG6FA/Po3JhYDoqvYzkPzgW+zFU9aqRGMf7RNsCVNpYnP8szoGJ945k
	 VM/BOEgVaZLhQ==
Message-ID: <6ff3d1e2-020e-4a50-944f-f8a82aea32fb@collabora.com>
Date: Thu, 9 Nov 2023 10:56:43 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 20/56] media: dvb-frontends: rtl2832: Stop direct
 calls to queue num_buffers field
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
 Antti Palosaari <crope@iki.fi>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-21-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-21-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

W dniu 31.10.2023 o 17:30, Benjamin Gaignard pisze:
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> This allows us to change how the number of buffers is computed in the
> future.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> CC: Antti Palosaari <crope@iki.fi>
> ---
>   drivers/media/dvb-frontends/rtl2832_sdr.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
> index 02c619e51641..023db6e793f8 100644
> --- a/drivers/media/dvb-frontends/rtl2832_sdr.c
> +++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
> @@ -439,12 +439,13 @@ static int rtl2832_sdr_queue_setup(struct vb2_queue *vq,
>   {
>   	struct rtl2832_sdr_dev *dev = vb2_get_drv_priv(vq);
>   	struct platform_device *pdev = dev->pdev;
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>   
>   	dev_dbg(&pdev->dev, "nbuffers=%d\n", *nbuffers);
>   
>   	/* Need at least 8 buffers */
> -	if (vq->num_buffers + *nbuffers < 8)
> -		*nbuffers = 8 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 8)
> +		*nbuffers = 8 - q_num_bufs;
>   	*nplanes = 1;
>   	sizes[0] = PAGE_ALIGN(dev->buffersize);
>   	dev_dbg(&pdev->dev, "nbuffers=%d sizes[0]=%d\n", *nbuffers, sizes[0]);

