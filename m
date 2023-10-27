Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1155B125A2
	for <linux-staging@lists.linux.dev>; Fri, 27 Oct 2023 08:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nUXzB9Wd"
Received: by mail.gandi.net (Postfix) with ESMTPSA id C4D4F24000D;
	Fri, 27 Oct 2023 08:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698394321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wAf0b6HKy71BlxcQ3sZf+ZyHpheDkqTPfqoKqqqphmo=;
	b=nUXzB9Wdv4xia4jZUGGorPnHiW/rFM0GLikloN+as8D4XFpXwlrxTjx6VvXhZLkIoZYRHo
	4TgQOEfy257Fzx34hVpQXqPBRHTNfm16U14HiCDQELgYXOexFJIZ0C1FEhmagcKAqWdhWR
	J6jmYMVX1ZNvm3bHO/Ve+k0uuUf7o/LQEPe1uMfWhp2ml3RHkT1y9A9L7sS0ajsrdivG6M
	3UQRcmxX4M6Rqd37z0nkzqa1ZaWUh6IawWXukxxif75692OoH0iMmbUfWPmL8MTRSJnryN
	cDdrDGsWFX6QokMbs4qM6Nfyu+5IhHG182ZJk172TSBInNpmcNDiRuscATFKcA==
Date: Fri, 27 Oct 2023 10:11:59 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Uwe =?UTF-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
 kernel@pengutronix.de
Subject: Re: [PATCH] staging: media: tegra-video: Convert to platform remove
 callback returning void
Message-ID: <20231027101159.4a4b829a@booty>
In-Reply-To: <20231026214739.2509271-2-u.kleine-koenig@pengutronix.de>
References: <20231026214739.2509271-2-u.kleine-koenig@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Uwe,

On Thu, 26 Oct 2023 23:47:40 +0200
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> wrote:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>=20
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>=20
> Trivially convert the three tegra-video drivers from always returning
> zero in the remove callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
