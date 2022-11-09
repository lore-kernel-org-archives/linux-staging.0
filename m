Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D21EBF6
	for <linux-staging@lists.linux.dev>; Wed,  9 Nov 2022 16:25:48 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 05DEBC000B;
	Wed,  9 Nov 2022 16:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668011141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=md+3BvVMOqhbT4Mg1/eofVo42NnM0QIADOtucHcIgg4=;
	b=gF6sAue/cSpFVYdCzn6XaeoAMUvRAr/BsmC8fZpflEJ6rq4f51Dmw+AsyA3tEdtFLjGgrj
	tPnOphPVGbtNot0izJb5ZAo1Sf1hW3VhIwbn2e/cZQKg79XWffb6+IGIaejZo/roXifsR2
	Gjcp0vNbtMLQFSNeprS5gc5f0fD+0+RuzrqzJQn92RUAf30+elKjORYPND6L7fiZz8xNmE
	iwEFgC5dbi+ZqX6ppxaEOT6gN6skuFspwDI90hy2rGq2TvbFBAOGIpwJ0IxDUIU8yj4WoX
	U83Zl2D9Gv0tfnRoCaCjtAuSDgllp61yxa8WXAOTDfpRlVrHqOiPCR9CApmHPg==
Date: Wed, 9 Nov 2022 17:25:37 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>, Dmitry Osipenko <digetx@gmail.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Richard Leitner
 <richard.leitner@skidata.com>
Subject: Re: [PATCH 23/23] staging: media: tegra-video: add tegra20 variant
Message-ID: <20221109172537.0c48f66c@booty>
In-Reply-To: <20221109141852.729246-24-luca.ceresoli@bootlin.com>
References: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
	<20221109141852.729246-24-luca.ceresoli@bootlin.com>
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
X-Spam-Flag: yes
X-Spam-Level: **************************
X-GND-Spam-Score: 400
X-GND-Status: SPAM

On Wed,  9 Nov 2022 15:18:52 +0100
luca.ceresoli@bootlin.com wrote:

> +static int tegra20_vi_enable(struct tegra_vi *vi, bool on)
> +{
> +	/* from arch/arm/mach-tegra/iomap.h */
> +	const phys_addr_t TEGRA_APB_MISC_BASE = 0x70000000;
> +	const unsigned long reg_offset = 0x42c;
> +	void __iomem *apb_misc;
> +	u32 val;
> +
> +	apb_misc = ioremap(TEGRA_APB_MISC_BASE, PAGE_SIZE);
> +	if (!apb_misc)
> +		apb_misc = ERR_PTR(-ENOENT);
> +	if (IS_ERR(apb_misc))
> +		return dev_err_probe(vi->dev, PTR_ERR(apb_misc), "cannot access APB_MISC");
> +
> +	val = readl(apb_misc + reg_offset);
> +	writel(val | (!!on), apb_misc + reg_offset);

Sorry, there is a mistake here, the bit should be set to 0 when
on==false, but this code does not do that. This will be fixed in v2.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
