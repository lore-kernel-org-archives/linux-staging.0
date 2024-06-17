Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10022194C64
	for <linux-staging@lists.linux.dev>; Mon, 17 Jun 2024 12:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718625784; cv=none; b=SiFxnzmv+n1zgyX/p0yXWyqKUxgnka+evtroYPXFe+FyqDZMAThHdsiqDEsVyF1VzGQRUzjKZGKLHap5xKO4JGeEuNeyugHp+HAbST4udhrWBNQfSAUjhZ997+K2nubxqiRsQI8D1d8br15JzK5YndGDi7MIrZfYbbJ2sZ0oRts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718625784; c=relaxed/simple;
	bh=Rr5iGFqpSNRXB+KBYwcPoY3tWHo2mwxMfOhiOo09gUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6LqYzqHEW9LdmE+XbINwE6cnHfkhnNUCzbOxxOTjk3Kh5mTeY6zIiT9jPiWDwReoUEOrTUwbrdfO60/+0/erqySi0HvdJt0v0vSxUrG/W/jAqI/GT0mEyq0gfhqm+GTGdGlS/hRxZ0posv6jOC8aGCp98lNL1WyeWzXxRv7I1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uFZ2cn3K; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uFZ2cn3K"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42172ab4b60so37568415e9.0
        for <linux-staging@lists.linux.dev>; Mon, 17 Jun 2024 05:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718625781; x=1719230581; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d8Fhf4JOX+eQHmfKJgo0VL59I075x6PJI/pMFa803UQ=;
        b=uFZ2cn3KvhXocS9hoPQqFNOp/shh/TUij/p8uSGPxXQlratmU4ZRG+gfOz3Q0D7/cg
         6qyPJHXhsOKn2lihYD+3hJhOwER3xpkc3aHicnG7Zv4n4VHmwkbVcBwbZPR3g5ll9mLm
         rY7+aaljrBh42xy8TBGzwSkTJL6gYAXxrasC3XH2iHFpQcN2PHoQwRx/OsJOgx+PIhgC
         UALWcrtc8e8AjYtZNOyf+Ak+dpKC6qdpsdIFAKTSCzgX02VCfu8+kG40cXSumFRJm9l8
         /Zl9MJVTPg1wD2zdwqIBFUWdQwkHzwDPnd8W8+st8iJufxJjpkNoORDsgfDKT4dYSSMy
         B5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718625781; x=1719230581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8Fhf4JOX+eQHmfKJgo0VL59I075x6PJI/pMFa803UQ=;
        b=GGvrp+RGVw5DQXoxOON+BuAjH+x/g78Sw1XCA/OvXeamB/IzOMw5GTVi6BaFo5HuSF
         vg+JoVmfALTclrc0R+q9CLWmxbydc1tct1Fap9yvizdZk1K0f4oaYGR4wg1DWIoovRye
         CFAkrDBwrr3/jn5IwQSXtgVLMc/emjAIm9ncMZQupyMb1/hyyl3T/4L6r1psCGEZjAc7
         Z4mF+Tt4j1wmWw15B/H/mPvFgkkIVwEZKbfaz9Dr7ad4g6hRQl43JI07nftVGI3QHZIT
         YXQjE9JjjEu0Vgfn8izjtGbSXYvRrAeVTkOK/eDRnifiWFq/B+hVXp6F9BqhpqzT5L6z
         W98g==
X-Forwarded-Encrypted: i=1; AJvYcCWp9BvsnyTA7R+dYq940tNGinqs2mx9/EyEx95u2pLQcLkHBHkWG8/7w8GYi83bDYC1EQQGsvIFBU+WgFwg6y/BgXJMWOHf/oT3NpMSLg==
X-Gm-Message-State: AOJu0YzflquxgclLKZmrt9mxj2j+nvsYaiu8KkuCuxCP9Mh3BCKyxDcF
	O+0HcHFAWDSZ4gXZgvR2tqJgHenwuXrqNXXS9AiHukKI7W8w2UocQ7Twh7YC6QE=
X-Google-Smtp-Source: AGHT+IETqjtVw4vm/BaAXb+7+BMz4Su+YcAJ5zJwSTOWHGTDcdm9ORyc65IHd9xEKGG8oTMrigZ+jg==
X-Received: by 2002:a05:600c:1d0f:b0:423:4c2:7a43 with SMTP id 5b1f17b1804b1-42304c27b17mr80244375e9.0.1718625781238;
        Mon, 17 Jun 2024 05:03:01 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f6127c1esm156486645e9.23.2024.06.17.05.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 05:03:00 -0700 (PDT)
Date: Mon, 17 Jun 2024 15:02:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Alexey Charkov <alchark@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Andy Yan <andy.yan@rock-chips.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
Message-ID: <94b9e0fd-2f4f-4d75-ae39-7d780a4e6374@moroto.mountain>
References: <20240615015734.1612108-1-detlev.casanova@collabora.com>
 <20240615015734.1612108-2-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240615015734.1612108-2-detlev.casanova@collabora.com>

On Fri, Jun 14, 2024 at 09:56:27PM -0400, Detlev Casanova wrote:
> +static int rkvdec2_start_streaming(struct vb2_queue *q, unsigned int count)
> +{
> +	struct rkvdec2_ctx *ctx = vb2_get_drv_priv(q);
> +	const struct rkvdec2_coded_fmt_desc *desc;
> +	int ret, i;
> +	u32 width, height;
> +
> +	if (V4L2_TYPE_IS_CAPTURE(q->type))
> +		return 0;
> +
> +	desc = ctx->coded_fmt_desc;
> +	if (WARN_ON(!desc))
> +		return -EINVAL;
> +
> +	width = ctx->decoded_fmt.fmt.pix_mp.width;
> +	height = ctx->decoded_fmt.fmt.pix_mp.height;
> +	for (i = 0; i < RKVDEC2_RCB_COUNT; i++) {
> +		ctx->rcb_bufs[i].cpu =
> +			dma_alloc_coherent(ctx->dev->dev,
> +					   RCB_SIZE(i),
> +					   &ctx->rcb_bufs[i].dma,
> +					   GFP_KERNEL);
> +		if (!ctx->rcb_bufs[i].cpu) {
> +			ret = -ENOMEM;
> +			goto err_rcb;
> +		}
> +	}
> +
> +	if (desc->ops->start) {
> +		ret = desc->ops->start(ctx);
> +		if (ret)
> +			goto err_ops_start;
> +	}
> +
> +	return 0;
> +
> +err_ops_start:
> +err_rcb:
> +	i--;
> +	while (i) {
> +		dma_free_coherent(ctx->dev->dev,
> +				  RCB_SIZE(i),
> +				  ctx->rcb_bufs[i].cpu,
> +				  ctx->rcb_bufs[i].dma);
> +		i--;
> +	}

This will leak the first element of the ctx->rcb_bufs[i] array.  The
traditional way to write this is either while (--i >= 0) or for unsigned
int i iterators it would be while (i--).

> +
> +	return ret;
> +}

regards,
dan carpenter
