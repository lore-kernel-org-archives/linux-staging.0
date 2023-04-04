Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9E428F3;
	Tue,  4 Apr 2023 16:54:01 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id er13so92269259edb.9;
        Tue, 04 Apr 2023 09:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680627240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGzZwlArkCanfjz3209OKEfk0hXSgBO1tQBC1EAfOQs=;
        b=RtSnDTr1VANEwCyMGM+vEm53Kdt9EoAiFNvRS2f4emGqMqIA7o3Ois6LHXR1pKkb9G
         a7CSUA7lswHy8kM/nTNSDAMRVV6bjG7f8+6RKyYWETlq+PiUU/Gb2Js9uNu0c/gSg+Xj
         dM1SCz1cPMmNOdc+N3jVPfcwjkx7O+vDTt+8WIJKdZzOd3DjwpE7kRVeTSdPF/c3Y0ga
         KO82tzmJaW4G7KOADVI37ICZ6gxdYOZp1Elir/OFa0uXinSne8pQEmu4IzwZy/1wPZcm
         VlJe/8i6chRPUUJnNgs66kPhEAT0kXC0hulAm9ZAqj9+66UZJNLV9M/ySsdgxbvxOGUH
         0vJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680627240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sGzZwlArkCanfjz3209OKEfk0hXSgBO1tQBC1EAfOQs=;
        b=OmlxFbEWSMgBL94zO2MuTognzVW5o+1dpiVEeCHPbeeVkAteE42MKEMlKcRtWOEZGj
         sLm32UaFiZls9sDzrbq2g9seeSb1ayC8xj2ceodUyG130TmES0XHkGeTcTYBgQeOeJSL
         wFCEeXZq6eSDcgxjZNnv29d6uZpTrADFn9TOigQ1OXbe6cxAeQAEPrPHaKkZheQT7yON
         sBNM6UsG3m69C1wuDi0LFjh7MmkyAvMfdqw1veUqmAWiWVs7tFpTUbuAACLb2RIkM2yS
         KEkuLFydICg5Ea00Yauf2qArdyY/6VmcyD3xgqSkr3wxjhpogAdWebhHDb4TiIom8TNR
         Xofw==
X-Gm-Message-State: AAQBX9dIuT6App7Arjdp6mICC5zmsR1Xq0FSp2F3BcYJJksGEf6gNb48
	zaBgLTLa3apxV/8mlAet8Fs=
X-Google-Smtp-Source: AKy350ZKXk3hfK516A/weJLnTJBSMLsovyookq63ehsy6W9OCLNvhirELuhDUofyxwVNkDU2Gor1fQ==
X-Received: by 2002:a17:906:c784:b0:92d:591f:6586 with SMTP id cw4-20020a170906c78400b0092d591f6586mr220041ejb.34.1680627239992;
        Tue, 04 Apr 2023 09:53:59 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id k26-20020a1709062a5a00b009331450d04esm6284487eje.178.2023.04.04.09.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 09:53:59 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 kernel@pengutronix.de
Subject:
 Re: [PATCH 15/24] staging: media: sunxi: cedrus: Convert to platform remove
 callback returning void
Date: Tue, 04 Apr 2023 18:53:58 +0200
Message-ID: <2673737.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230403154014.2564054-16-u.kleine-koenig@pengutronix.de>
References:
 <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
 <20230403154014.2564054-16-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne ponedeljek, 03. april 2023 ob 17:40:05 CEST je Uwe Kleine-K=F6nig=20
napisal(a):
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


