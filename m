Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04677382F19
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 09:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773651648; cv=none; b=uzQ98D4e2YQWlvv/SgqK6Hsuf2Ovokpgrl+qtXBHddFNi7ovRCuHix7cN3I6QKOpqnWRVmFkdsAoIPHP73kFhb8OSIbGuI5F8sXXevyvGMrNGWrXfk8Sz2TTSNT/pnnsGE1j/0MJ7oktoThnLwt8nhbdegncUrHEQHXgEebwGtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773651648; c=relaxed/simple;
	bh=ChiTss7cdYlG02srTwNm2YmEqwejd9n8HdjtcaHpSaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bed64OFWU2to/CZSTeGQKEEFsR/FflEx+b1tHm5Damv4S3UbxCaDN0A4vg6Bu7CC3YGTKJQc1rxwjmGnJx2xWxqXm/5Je5SF+h1DLaa0i70OJm+3Td0y7XiqxAeeU1IRCtN8Zddf9H9666UQtHotT78Y8Bpno+p+nSehJ7DS+ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DnlM3dQT; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DnlM3dQT"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852fdb36a8so51559325e9.2
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 02:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773651644; x=1774256444; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m2uQ6cvlypnVHsVAo9AGgQ4YcUxa4jo4S97am47FBUQ=;
        b=DnlM3dQTVPfdNBJlpKyYk1Xu57YRlVRlFKjI4KXuekmzjgiYDPpK9SQulKQZvb1Sjg
         s5zSWJvcWV92NUslTqtjAh4opXoNSHhMeyPXAn8VzPrNh2vJ3HN9GNPSsHxnQtWwLjhW
         jlwh0/AhOqc7DFkL/3N0CikYMyT4Vjw+TBhOqiTgypBBqBuUX4AfR5D48cVAVnB/5Tqh
         c0Dz3doULFZALqqbhppoZPtKGLdAar4Jw20COwdLzlpbAkFPeKY7f5k8/QgPpnUXIT+H
         Pkjc/XaIfxHb+jZmNGt8TgXymSl7+rDCkPDyRFFwfxfYRrOPLOczpVUjPVzVWor7uBJb
         +goA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773651644; x=1774256444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2uQ6cvlypnVHsVAo9AGgQ4YcUxa4jo4S97am47FBUQ=;
        b=rbN5aT77a1JDATpEe351YKzN1+PEbX3IOgDO0wV7kUXOFJgbKjnyyy4t0yX9s3Dde4
         OX1aa2aqIS+oqBNkF71voSnAhX9sm4shSGjTBJnBbTPtSSgjUMxwwEFqHkj61ywRezpk
         QLHQ8NFGXrEgBo69pvn14f6VMTgeIlIiXfJ+2Wg4SLNa7KyijMgXCTbhC2ACt2/IkCaK
         zwx0oWessL+th7DfnEIrRIp4cTCbZC3km6z0FKbj1glsoSysJHisDjXRn/csChpkr1+c
         ACAIJvIPokuPtVfM4uyjLJwbnfl6gnT4OObAtc3wyjOnEM7fnP9GhZjfmU6JVkTKmWA8
         iLpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEkaJGbzBCaWloZRGliDMpbA+ni9D9xNgTzEjFoRu+l1VAMWfbhed6J7epuF0Y2oKEBrmJt1akxPK7ka/H@lists.linux.dev
X-Gm-Message-State: AOJu0YyF55g7zKfmuQOP1y0U2r2gE8yPteWtQCreOh+dDBazy7Rfofh+
	29IPXdVIWyfsQbn2xMzbCT4AGd8yV/ag1oLpeUS/xRZ5cjjboqHA0ZyLudlV4GnZycA=
X-Gm-Gg: ATEYQzysuotXvgWwvMQQ6GC4GcJNJ9kQd9I4gI3GkeF/L2GAZKAbIb9QyYoNVedfizV
	YLOQb974QiylLqEs/R5FeRrXUUsQv9hpH8vzdlnukg0btRP3DPhaOidH5KsInzvrmxF6n3O5Ncq
	eTVuK72xe/bK2NNaayLsSn6BW94HKLusS2knLSlCLU+PlXv1OFtj5mNZC297dKYIsEYA3XeoMs3
	tJuULy9UDgiOWvTxCG/jUkcX4G0SwSlB1ZtVLiOFRNHN7RImTN2RM6YLJtjr1yguRkW3pmA9oXa
	kn1pTHpGRyvMMMTGPjXg8fnTDhsKWBdhj3Jt41TqMeK45JXOvtuRNsbCJO9UEeVNeDyhart/Vhb
	7+McLJrEARLtvMijE1bqKKdYv8GtT5gAqGYyKqd/rmWTDnqkiZeH9xSSNQFxagS7NDTa9F4hh+v
	vBqMfEqOWkj9DCYYNfPEfpRGkHn11C
X-Received: by 2002:a05:600c:3550:b0:483:709e:f238 with SMTP id 5b1f17b1804b1-4855670c971mr216147815e9.29.1773651644178;
        Mon, 16 Mar 2026 02:00:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aa73easm504391785e9.3.2026.03.16.02.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:00:43 -0700 (PDT)
Date: Mon, 16 Mar 2026 12:00:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Oarora Etimis <oaroraetimis@gmail.com>
Cc: vireshk@kernel.org, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] staging: greybus: bootrom: fix potential null
 pointer dereference
Message-ID: <abfGuD0O8iiwHQUn@stanley.mountain>
References: <20260315231949.231320-1-OaroraEtimis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260315231949.231320-1-OaroraEtimis@gmail.com>

On Mon, Mar 16, 2026 at 07:19:49AM +0800, Oarora Etimis wrote:
> In gb_bootrom_get_firmware(), the 'fw' pointer could be NULL if the
> function jumps to the 'unlock' label. The execution flow continues
> into the 'queue_work' block where 'fw->size' is accessed, leading to
> a null pointer dereference.
> 
> Fix this by adding a NULL check for 'fw' before accessing its members.
> 
> Signed-off-by: Oarora Etimis <OaroraEtimis@gmail.com>
> ---
> Changes in v2:
> - Rebased onto the latest staging-next branch to resolve merge conflicts.
> - No logical code changes.
> 
>  drivers/staging/greybus/bootrom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
> index 83921d90c322..50c80475d241 100644
> --- a/drivers/staging/greybus/bootrom.c
> +++ b/drivers/staging/greybus/bootrom.c
> @@ -298,7 +298,7 @@ static int gb_bootrom_get_firmware(struct gb_operation *op)
>  
>  queue_work:
>  	/* Refresh timeout */
> -	if (!ret && (offset + size == fw->size))
> +	if (!ret && fw && (offset + size == fw->size))

This seems like a static checker false positive.

regards,
dan carpenter

