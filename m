Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593EE12E73
	for <linux-staging@lists.linux.dev>; Thu,  9 Nov 2023 09:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NGxFbYzt"
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5FBBE6607410;
	Thu,  9 Nov 2023 09:46:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699523189;
	bh=sB3FExc5Arb333OuyrWTsqs/CUyH8WZ1l+IRqCa/FcY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NGxFbYztGyKtV1GqtdXqqpUyxheCLuF/tpVRPDx0va8q8ceZifvW64j7zzbwg8eS2
	 pWhvhEB+WJyzrP93tjmVEg6WLkKeI3hh1x/Xj/GGb8Sc3LcdbNlohr9vwqEsx3Ciyo
	 YEF7YiYinZm3cK0sy6oxwJnGDDtR6718AfkHp9t7f3Gri4/hN8XZ+kW2IUQiTG5hom
	 Tz8oRtrS7w5KMN3yu2NU/IbR27AP8a5BsWFsRBifn9KJaor/iqbxQvwFtm9iIvpk2X
	 /0zoEJx8kFKq9f8Oaz8WtqBw8r+y93o5wPuRJYPJ0N3W9RBCsIRASXuqfsPXSK9evh
	 5iINPUoiaZ4Fw==
Message-ID: <29197ec3-e341-4f93-86ef-899bda0d7060@collabora.com>
Date: Thu, 9 Nov 2023 10:46:25 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 18/56] media: dvb-core: Use vb2_get_buffer() instead
 of directly access to buffers array
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
 <20231031163104.112469-19-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-19-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

W dniu 31.10.2023 o 17:30, Benjamin Gaignard pisze:
> Use vb2_get_buffer() instead of direct access to the vb2_queue bufs array.
> This allows us to change the type of the bufs in the future.
> After each call to vb2_get_buffer() we need to be sure that we get
> a valid pointer so check the return value of all of them.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> ---
>   drivers/media/dvb-core/dvb_vb2.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/dvb-core/dvb_vb2.c b/drivers/media/dvb-core/dvb_vb2.c
> index b322ef179f05..3a966fdf814c 100644
> --- a/drivers/media/dvb-core/dvb_vb2.c
> +++ b/drivers/media/dvb-core/dvb_vb2.c
> @@ -355,12 +355,13 @@ int dvb_vb2_reqbufs(struct dvb_vb2_ctx *ctx, struct dmx_requestbuffers *req)
>   int dvb_vb2_querybuf(struct dvb_vb2_ctx *ctx, struct dmx_buffer *b)
>   {
>   	struct vb2_queue *q = &ctx->vb_q;
> +	struct vb2_buffer *vb2 = vb2_get_buffer(q, b->index);
>   
> -	if (b->index >= q->num_buffers) {
> -		dprintk(1, "[%s] buffer index out of range\n", ctx->name);
> +	if (!vb2) {
> +		dprintk(1, "[%s] invalid buffer index\n", ctx->name);
>   		return -EINVAL;
>   	}
> -	vb2_core_querybuf(&ctx->vb_q, q->bufs[b->index], b);
> +	vb2_core_querybuf(&ctx->vb_q, vb2, b);
>   	dprintk(3, "[%s] index=%d\n", ctx->name, b->index);
>   	return 0;
>   }
> @@ -385,13 +386,14 @@ int dvb_vb2_expbuf(struct dvb_vb2_ctx *ctx, struct dmx_exportbuffer *exp)
>   int dvb_vb2_qbuf(struct dvb_vb2_ctx *ctx, struct dmx_buffer *b)
>   {
>   	struct vb2_queue *q = &ctx->vb_q;
> +	struct vb2_buffer *vb2 = vb2_get_buffer(q, b->index);
>   	int ret;
>   
> -	if (b->index >= q->num_buffers) {
> -		dprintk(1, "[%s] buffer index out of range\n", ctx->name);
> +	if (!vb2) {
> +		dprintk(1, "[%s] invalid buffer index\n", ctx->name);
>   		return -EINVAL;
>   	}
> -	ret = vb2_core_qbuf(&ctx->vb_q, q->bufs[b->index], b, NULL);
> +	ret = vb2_core_qbuf(&ctx->vb_q, vb2, b, NULL);
>   	if (ret) {
>   		dprintk(1, "[%s] index=%d errno=%d\n", ctx->name,
>   			b->index, ret);

