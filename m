Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC13D47124E
	for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 13:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480057; cv=none; b=h6YjDEfwdj8Z1K7HSBoZzYVbWry49nAC7GkUgbFswD2/Glo1C4cIQJp3KXeZPCPms8dgf8CpDzbq8M6XqvbIRr8gIE155nI8sTg6YfZ3w2SU/BEQYmcK0iOjiER5Ivmb55vCfWzbwk+BWJJz1ts29T87dR34KTfYq2w0tWBCYfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480057; c=relaxed/simple;
	bh=av0lgor5Cg046CEuwDXRsvCISYUzls8C5RMRjdAXTEM=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:
	 References:In-Reply-To; b=F6lpkRze3DMDfSyMLtC2SjXc9Xs5lgIjSMKtI8bEJNcQWfVTyFyGbmPOS2r579nkm2IGT5jpDgNgeiDzbUAmY4j+YKzY3LwMHposlR+9OvRCgJu3OkD6UAMC0zuZTqICIuwffnQB9JwKX1wlOtvRig51fKj1Mzpx+IbwcedzeDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F2aRYEev; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F2aRYEev"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so2373245e9.3
        for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 06:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789480054; x=1790084854; darn=lists.linux.dev;
        h=in-reply-to:references:to:subject:cc:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LnO/RFtPTLTuh551bJsP9vEYVlo8+tuse5zqKBb/5X4=;
        b=F2aRYEevT4elaFy9QFAlFJd5LDr9Kf+h2/4bp1czYhOCOEX04SEhmq27OU+LZnrBWl
         wJizryNU2aI5q645sYeifmkz674f6IgOyfvJLmh5qicfmGLpLfheeALsc2LJC8TbxiJa
         ZO68GknbQETAKjtvGShLUen+Ufm1WOUmgLyYbEoV1P5L/ekmZdoYOJ3Er92f9UYI9uKO
         DeBfAopPn/p91XkqOLAzuOW1pP3Q5xs63/l+wUGbjfxuyhJvmLEJDINoVcmL7CTLEAGy
         cRj3OpjzH0av0+OJlLEkDIi30seAOQrBnkeaiZAPdfdBhtFoe/J4vgi+RlQkZn8p+kLW
         hHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789480054; x=1790084854;
        h=in-reply-to:references:to:subject:cc:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LnO/RFtPTLTuh551bJsP9vEYVlo8+tuse5zqKBb/5X4=;
        b=eW0M4T6xLmDKohPqOiQOqOKEYxHkJ7Z2nCDDBY2IgNh5eMBZ/tQC3A1vctKKUM1Q+R
         pSuKEMNxDmRTxFdzvqvOcrWL8jVzhWZZgJQpqxCU7+Nl5PZvEOtx8f0t7PimeIs6osqR
         O3a/m4vqcyUETL0j+8LkaxUz9kfI48sk3fMQn95oYoP1SfAJYhWemlk38Y6Uy38ZuXIc
         QfTve0cKZiwXD3A75q6xuPWQmi23ybACSPJJNmBxXoK44uzcoCwqQs7uo71+46plbFnV
         NahbotimWrB82tnqri7ko8P8BCgZUoLOhn+4mqIlTcr7L067GgdEO0U7UP6Fr921nsfz
         DYVA==
X-Forwarded-Encrypted: i=1; AKwUvBz787+InbManCRXoIV8aKJCI796xKEh22y3unxHJ6n/ULxLTd7WMRKUXOuJwKQA6DYr2wm4whyr99GswBFA@lists.linux.dev
X-Gm-Message-State: AFuF++kvV+KnH3KQQjEPhuG/Dlf1EzHs5sNxuuLJGfPAwUnoG8GCMkNI
	8z1nFifQ3nqPq62SwkPZRuJ2tYxlGJZuM4cpu0/bXBZX6faAPkwhcMWxjlafF6wwPlQ=
X-Gm-Gg: AYBFou13a4S2no/XpOBQ8zpa29qXnTXKWqJHRsAiHvK50HgWRGSEfqJJdrji07MmpUh
	xMlXtQ2LGtn5IUDI6CJiy4uVLDEirT27nniNJ/qt17KJgxymACfYm9XX+ILrBidZny4x9u8HrtJ
	8Mtr9mxsNJaGQIDbxUl3J9Em1fv6leGsYZ5CSB286LWNy/UxXslSa73IulZv+c90hWqEJOUmxdw
	umW1f1KzlsKSOvynJYxdnB3oICkSbiknVUzcffEL4lov54BuC6CtTw+IGfqQrk9Gpy6uCoS4kWY
	uX2c1BS/58zAV3PJizhy4KtDuOe/r0Fwr9i/0+3POiSAOjPivTZS89q5w/TJ/tb1a8pw20fgfQT
	pixGHv4fWRcfdbi2PB7bc8oyEk1bKl7wnSC+9vQF2RjXMBn+yO2lasvqxby4Ojz3gjBTSyvflwN
	yPwKW42xEf3p40wQUgbgVn3HZDYYYrcOHmWaLkcGft1j1t0/7tdv97T3k10QhrDsw1TndVlDNbL
	bhDi7Hf8w==
X-Received: by 2002:a05:600c:b85:b0:49e:6bce:b0f9 with SMTP id 5b1f17b1804b1-49e8228f49fmr15817015e9.16.1789480053858;
        Tue, 15 Sep 2026 06:47:33 -0700 (PDT)
Received: from localhost ([2a01:11:8f11:bb70:17d2:d825:e2b8:2e8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef6bc50sm67382035e9.3.2026.09.15.06.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:47:32 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Sep 2026 14:47:31 +0100
Message-Id: <DLFXQIQX6Y6W.13CBS3NB0BTI4@linaro.com>
Cc: "Rui Miguel Silva" <rmfrfs@gmail.com>, "Johan Hovold"
 <johan@kernel.org>, "Alex Elder" <elder@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, <greybus-dev@lists.linaro.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] staging: greybus: sdio: Convert to
 devm_mmc_alloc_host()
To: "Ulf Hansson" <ulf.hansson@oss.qualcomm.com>,
 <linux-mmc@vger.kernel.org>, "Ulf Hansson" <ulfh@kernel.org>
References: <20260915132052.273212-1-ulf.hansson@oss.qualcomm.com>
 <20260915132052.273212-2-ulf.hansson@oss.qualcomm.com>
In-Reply-To: <20260915132052.273212-2-ulf.hansson@oss.qualcomm.com>

Hey Ulf,
Thanks for the patch.

On Tue Sep 15, 2026 at 2:20 PM WEST, Ulf Hansson wrote:

> From: Ulf Hansson <ulfh@kernel.org>
>
> Simplify the code by converting from mmc_alloc_host() to the resource
> managed devm_mmc_alloc_host().
>
> Signed-off-by: Ulf Hansson <ulfh@kernel.org>

LGTM,

Acked-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
    Rui
> ---
>  drivers/staging/greybus/sdio.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/staging/greybus/sdio.c b/drivers/staging/greybus/sdi=
o.c
> index 3952f3d225db..642d785fe918 100644
> --- a/drivers/staging/greybus/sdio.c
> +++ b/drivers/staging/greybus/sdio.c
> @@ -767,17 +767,15 @@ static int gb_sdio_probe(struct gbphy_device *gbphy=
_dev,
>  	struct gb_sdio_host *host;
>  	int ret =3D 0;
> =20
> -	mmc =3D mmc_alloc_host(sizeof(*host), &gbphy_dev->dev);
> +	mmc =3D devm_mmc_alloc_host(&gbphy_dev->dev, sizeof(*host));
>  	if (!mmc)
>  		return -ENOMEM;
> =20
>  	connection =3D gb_connection_create(gbphy_dev->bundle,
>  					  le16_to_cpu(gbphy_dev->cport_desc->id),
>  					  gb_sdio_request_handler);
> -	if (IS_ERR(connection)) {
> -		ret =3D PTR_ERR(connection);
> -		goto exit_mmc_free;
> -	}
> +	if (IS_ERR(connection))
> +		return PTR_ERR(connection);
> =20
>  	host =3D mmc_priv(mmc);
>  	host->mmc =3D mmc;
> @@ -835,8 +833,6 @@ static int gb_sdio_probe(struct gbphy_device *gbphy_d=
ev,
>  	gb_connection_disable(connection);
>  exit_connection_destroy:
>  	gb_connection_destroy(connection);
> -exit_mmc_free:
> -	mmc_free_host(mmc);
> =20
>  	return ret;
>  }
> @@ -863,7 +859,6 @@ static void gb_sdio_remove(struct gbphy_device *gbphy=
_dev)
>  	mmc_remove_host(mmc);
>  	gb_connection_disable(connection);
>  	gb_connection_destroy(connection);
> -	mmc_free_host(mmc);
>  }
> =20
>  static const struct gbphy_device_id gb_sdio_id_table[] =3D {
> --=20
> 2.43.0



