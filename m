Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D7B18C21
	for <linux-staging@lists.linux.dev>; Wed,  8 Nov 2023 16:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ESr6pT+f"
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0ADEF6607699;
	Wed,  8 Nov 2023 16:46:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699462012;
	bh=EeyG48ihoO4SEA/8XzhcTQbxRY9L7eiinHyNA69xzNY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ESr6pT+f5UmHQxoH5B2QL2SWWHnZ3IDW3t+g85ghsXjBSK8T1+8jENSXLV7GixsAj
	 BPAyBa40TM2XvyZyx3j3dohE3PERlH12LjHWvZHG7YeKWNNo2csckKlKC4nImAoh35
	 mVHK3UfT0f4ZLj4Bq+BksGnA+bn0TdudzD4MOUmBsOh0UgMenEcXaImIkN3o9qZVps
	 xVrCGMG1mC5FBV/kc9Ky+Fu5aHKRWni0vczlYaMhosT55ux5n7pINuig5s/nCKQ94K
	 TbM4X/KVNP/FxBp46aJntEZZTvCi7rQ245Pv7oQ+cnZsu3zz2i/foJOTsWC/f5LGzD
	 /zMuhB7rJQ1KA==
Message-ID: <03557323-0a03-4833-b2de-6011e3d3acee@collabora.com>
Date: Wed, 8 Nov 2023 17:46:48 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 06/56] media: videobuf2: Remove duplicated index vs
 q->num_buffers check
Content-Language: en-US
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
 nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-7-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-7-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

W dniu 31.10.2023 o 17:30, Benjamin Gaignard pisze:
> vb2_get_buffer() already checks if the requested index is valid.
> Stop duplicating this kind of check everywhere.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> ---
>   drivers/media/common/videobuf2/videobuf2-v4l2.c | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 2ffb097bf00a..c6ebc8d2c537 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -823,10 +823,6 @@ int vb2_qbuf(struct vb2_queue *q, struct media_device *mdev,
>   		return -EBUSY;
>   	}
>   
> -	if (b->index >= q->num_buffers) {
> -		dprintk(q, 1, "buffer index out of range\n");
> -		return -EINVAL;
> -	}
>   	vb = vb2_get_buffer(q, b->index);
>   	if (!vb) {
>   		dprintk(q, 1, "can't find the requested buffer %u\n", b->index);
> @@ -898,10 +894,6 @@ int vb2_expbuf(struct vb2_queue *q, struct v4l2_exportbuffer *eb)
>   {
>   	struct vb2_buffer *vb;
>   
> -	if (eb->index >= q->num_buffers) {
> -		dprintk(q, 1, "buffer index out of range\n");
> -		return -EINVAL;
> -	}
>   	vb = vb2_get_buffer(q, eb->index);
>   	if (!vb) {
>   		dprintk(q, 1, "can't find the requested buffer %u\n", eb->index);

