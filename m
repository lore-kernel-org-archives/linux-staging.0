Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F3D2F2E
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 07:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30544C340ED;
	Wed,  9 Feb 2022 07:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644390881;
	bh=wow7Xba07Wy/tQH9b1uW9S6psIbbtqgP3WTlgP6npog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UD234fovBIkQEnSwuMkPlx89/PjiNEpxdx5go7xy0wpY2oOOMvmLNpfrnJtzwNjuL
	 j3E1jn3BXUidik+yxWF2I2AcCHr2uTHsWpVGujOQtmZM4n7BUfiTKJjylMWn2eS2S1
	 xocTG8orRshUCDHJESNApJvXB+scrm8Ev8347JyJdf+EVtR+DmK+Nl6mql4j59Ki1K
	 Cw2HM93xhjf0EYckTOxaezGE7fb1GSYgv1y/M3BmGxUQM29KerM23MCJtdBs85XHdp
	 LJqbuIqfgNbgv4ZLlG41pjGi5DqD2KIgx2zE0MMqDpOMBQjT50j0X5NRZZ3crGDJFL
	 uVQ+cd/9UFaHg==
Date: Wed, 9 Feb 2022 15:14:34 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Adam Ford <aford173@gmail.com>
Cc: linux-media@vger.kernel.org, aford@beaconembedded.com,
	cphealy@gmail.com, Lucas Stach <l.stach@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH V4 02/11] dt-bindings: power: imx8mq: add defines for VPU
 blk-ctrl domains
Message-ID: <20220209071433.GC4909@dragon>
References: <20220125171129.472775-1-aford173@gmail.com>
 <20220125171129.472775-3-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220125171129.472775-3-aford173@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Tue, Jan 25, 2022 at 11:11:19AM -0600, Adam Ford wrote:
> From: Lucas Stach <l.stach@pengutronix.de>
> 
> This adds the defines for the power domains provided by the VPU
> blk-ctrl on the i.MX8MQ.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Acked-by: Rob Herring <robh@kernel.org>

When forwarding a patch from someone else, you should add your
Signed-off-by.

Applied, thanks!
