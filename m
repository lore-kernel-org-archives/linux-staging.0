Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346922F2E
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 07:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D64C340E7;
	Wed,  9 Feb 2022 07:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644391153;
	bh=bV1suCOlTh6KO9wlo9F1fSD0ym9tsftnqUQOzGts2tE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GrnQU/kBbBDXMnpom8wMOZqk/RecGdO/MYrY2WrJZAMnhQMZ1ZNsKwiZIU+bhkHJO
	 9U68KcjoZW5ycfR9FrdzIJ/wRamRoI4DQ18fItEZroRcj25/VEWoGFDuVyCGe/YOpR
	 6Wb5CLFNrG7/M6FarvHiUbffE5zRQEFnJ6WaGGepxqORyGoOaFltuCjOfUFWBUalRk
	 zlwNhnU7C8LtdeD72TauwOvPWBSkxSxeeiFClSKlqbq/uai9AGnzQZhCdRV/m+iwVL
	 am2YNj9YAKusLtQw5ngbR3kUsF6EIhx21aLtWtjzSjeqN0e20geWKy7m4fli7BJweZ
	 QxeCHvizZ6w5A==
Date: Wed, 9 Feb 2022 15:19:06 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Adam Ford <aford173@gmail.com>
Cc: linux-media@vger.kernel.org, aford@beaconembedded.com,
	cphealy@gmail.com, Lucas Stach <l.stach@pengutronix.de>,
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
Subject: Re: [PATCH V4 04/11] soc: imx: imx8m-blk-ctrl: add i.MX8MQ VPU
 blk-ctrl
Message-ID: <20220209071906.GE4909@dragon>
References: <20220125171129.472775-1-aford173@gmail.com>
 <20220125171129.472775-5-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220125171129.472775-5-aford173@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Tue, Jan 25, 2022 at 11:11:21AM -0600, Adam Ford wrote:
> From: Lucas Stach <l.stach@pengutronix.de>
> 
> This adds the necessary bits to drive the VPU blk-ctrl on the i.MX8MQ, to
> avoid putting more of this functionality into the decoder driver.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Applied, thanks!
