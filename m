Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2157D79C8;
	Mon, 17 Jul 2023 12:38:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 63003C0003;
	Mon, 17 Jul 2023 12:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689597489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MM/PEyd181tJuLy8r7nqOJOdJv9WHZixT7LUP2KhY9Q=;
	b=CJSdJUIaJOmzbN/Tj4KhsGBnpIzKmLKXw5kMnjexwbj9y7Ge/VVgXKfpiv6eq5W9wcF9dp
	sd/2U7mXflRPXLpVjusstuLTPt8N2SZlDeNsujy0iHcJE4iLv5gRuMhTwZ4mMmBMGjAF64
	qwHz/AKECHcd0xWxb2+V+Up/oxY2hWG0KeU8blU452HvKU9iMKB3HedvxklLcwyMVE+Zy+
	50B1rWMTI8ltBn0//4FfpRbnkzFIA2rEYf3Gj3lDjF+D+cJiPdTwvuCcfsiimP3e+v2LdY
	EDKN/bYZ9JBD3oCSej3UhQM4VknrSyUzHk4r49YevmLr/q96PziK3BkSVQTHhA==
Date: Mon, 17 Jul 2023 14:38:04 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vaibhav Hiremath
 <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder
 <elder@kernel.org>, Steve Longerbeam <slongerbeam@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Maxime Ripard <mripard@kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan
 Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni
 <skomatineni@nvidia.com>, Parthiban Veerasooran
 <parthiban.veerasooran@microchip.com>, Christian Gromm
 <christian.gromm@microchip.com>, devicetree@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] staging: Explicitly include correct DT includes
Message-ID: <20230717143804.4e82bcc1@booty>
In-Reply-To: <20230714175002.4064428-1-robh@kernel.org>
References: <20230714175002.4064428-1-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com

On Fri, 14 Jul 2023 11:50:01 -0600
Rob Herring <robh@kernel.org> wrote:

>  drivers/staging/media/tegra-video/csi.c           | 1 -
>  drivers/staging/media/tegra-video/vi.c            | 2 +-
>  drivers/staging/media/tegra-video/vip.c           | 1 -

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra-video

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
