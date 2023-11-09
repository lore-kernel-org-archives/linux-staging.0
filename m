Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E71811195
	for <linux-staging@lists.linux.dev>; Thu,  9 Nov 2023 09:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JwQPjKXg"
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5C94E6607410;
	Thu,  9 Nov 2023 09:15:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699521304;
	bh=v6qhMPzD3AxhVLNdjEZEwQC9jr/N3DTQuFfeuL9ykAQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JwQPjKXgXSae+rmdVkYXy9Jb9REL0PVt245rWOXj5AX6uhQegs1Ie+oT+0O3N7XLU
	 tr/iuuM+Ecv/lA+ir8EK0wLUEmjKOYNYo1GEXeY2p3OAN4Z2aM2ME4oWRPvYvbiPGS
	 rCmzMlyyV9Klms6we5pFJ9nAv6DCMj2UblhLOoMoSTWNXX8DVJxOAnFipvhPbjSXEZ
	 Qry09Y3zgauyBMD7vOGN7qTQoTqNbvkD+WjOoxMI8Pct+GC6MyF+ulwXODKU4Y7f4d
	 QNTcn/K1B79HY3vjJMc66wF8TGtsToEYhhksphBidYaf5s43tHWWz3HYky0KjFtpsT
	 3YhoHVPhzQbBg==
Message-ID: <63fcdcfb-83a1-4ca9-af35-be643c02b455@collabora.com>
Date: Thu, 9 Nov 2023 10:15:00 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 12/56] media: mediatek: vdec: Remove useless loop
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
 nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com,
 Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-13-benjamin.gaignard@collabora.com>
Content-Language: en-US
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-13-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

W dniu 31.10.2023 o 17:30, Benjamin Gaignard pisze:
> Simplify code by removing useless loop by using video buffer index.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> CC: Bin Liu <bin.liu@mediatek.com>
> CC: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>   .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c   | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> index e393e3e668f8..69d37b93bd35 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> @@ -1695,13 +1695,8 @@ static int vdec_vp9_slice_setup_core_buffer(struct vdec_vp9_slice_instance *inst
>   		return -EINVAL;
>   
>   	/* update internal buffer's width/height */
> -	for (i = 0; i < vq->num_buffers; i++) {
> -		if (vb == vq->bufs[i]) {
> -			instance->dpb[i].width = w;
> -			instance->dpb[i].height = h;
> -			break;
> -		}
> -	}
> +	instance->dpb[vb->index].width = w;
> +	instance->dpb[vb->index].height = h;
>   
>   	/*
>   	 * get buffer's width/height from instance

