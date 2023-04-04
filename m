Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5918D28F3;
	Tue,  4 Apr 2023 16:54:28 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id t10so133112227edd.12;
        Tue, 04 Apr 2023 09:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680627266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uv4LtfQw5vCBHk7SGSRKaduotTpobct6ipFsuhK2Lng=;
        b=oxHLTRLjT4/SdrADiXdbzX7O/ZIOtfZ27WdrhB32gkydWP9TkXjxBCBxdX8lIEFY/V
         iS4fWJSNLRwm8niSSJ3bOMMG6USQeTAEDk6D3pgR5a699HOX5aMzluCecY1XTqxcen7K
         D3CizZBnue62J/BUMNixLSR0oXpb1OGRe75g2p7WRz3MrWPewrYhyVZ4unuRMX2j2yyi
         p8yZutg2VsZDKvzmGf28yrOf1Jv2oqMaUej9u3hcd1h3J0QJRiDwIebkn2pkENDX9iT/
         9Rcqw1GLqJmFMgfUtvD2kueeI8PBxQjSEHUBNuIvQYxVX0XXbAnGtO/6pJ1/K00zhNyB
         S0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680627266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uv4LtfQw5vCBHk7SGSRKaduotTpobct6ipFsuhK2Lng=;
        b=nPsJWsaN5VtQ/ay1vNquGmmFbALiHOQXMGmAC018kLOD8Ib1NlFUx4HXaPTU1+wQcB
         zSoYYDzgU/bzmMrKZWrCCAGYOtKkrBlaWS73bjha+EHf2/hHI2YPMbK4u71XGU7WT8QV
         RBetINU4f4XIX6Th1FfiFEPCGF5kUMdP/JZ67Q0FDWM3l8QXQMbPQfejv/x9OddXyl3Z
         zt2e5YATjx0EP5PBe9i613GsfSL824+Z/dBkiAVeEmPdx7x2ClZ+GfxNv7mShaZy/ayf
         uuq+PB3jBlHBct0DJpbyzr1GyCGL4k2qXypMHvvBGzE3V50C//DBSBBHB/nEYyB4r+JK
         UWdg==
X-Gm-Message-State: AAQBX9cL7TlCsHHGZ7pS9eeMQT3XbvbKzpQnQ6YNQv/h18pEx0rhdELW
	C2SWOJ4tanPJWWd+o5/gMJE=
X-Google-Smtp-Source: AKy350bRqeteWcjnkTIcurqTl1oWKZYh9KZ+a4XXfT1yVbnoTXZe3+iRFNM2lEjTXmNJJHf8PoUGRg==
X-Received: by 2002:a17:906:430a:b0:947:5bd8:9523 with SMTP id j10-20020a170906430a00b009475bd89523mr284233ejm.31.1680627266507;
        Tue, 04 Apr 2023 09:54:26 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id 16-20020a170906329000b0093137b1f23fsm6151226ejw.37.2023.04.04.09.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 09:54:26 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 kernel@pengutronix.de
Subject:
 Re: [PATCH 16/24] staging: media: sun6i-isp: Convert to platform remove
 callback returning void
Date: Tue, 04 Apr 2023 18:54:24 +0200
Message-ID: <5660511.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20230403154014.2564054-17-u.kleine-koenig@pengutronix.de>
References:
 <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
 <20230403154014.2564054-17-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne ponedeljek, 03. april 2023 ob 17:40:06 CEST je Uwe Kleine-K=F6nig=20
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


