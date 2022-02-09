Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4CD2F2E
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 07:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2928C340ED;
	Wed,  9 Feb 2022 07:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644390982;
	bh=DReAQp+QqHzrEB5qGcTuwyqcPYfSigCNnvRF5cN6be8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=juHw1gKCLF/oLka4lwOY4t4xWNquKti8kFLTsiW6Wz3fwhAmY51dLG0cBII85uYGd
	 3U13C8IdQeU9hsp0TcmMj+AMk7/LWwL26kSdWsisCg2yNgztMK+2PTSURbTU5IkWYv
	 2C7+bzg/QdeU/4h6uBgCb1mPNjOoYeFOlrHMniuvWX7MToF8GNeSW6koXk8cNfBn+t
	 9xCEZPU1VcP9RKF1PBYrzrVyzb7M1/WkvGHuy3kNDHwlmDosqVUCcqPNZNI0XHTOKw
	 nbotjLdRRf6gTq3jxEZkGvli8KDbmx0dsy9MGX5D1jMKZybApy8cFiTBcS6s3qb6/G
	 uz5irB2xh+SUw==
Date: Wed, 9 Feb 2022 15:16:15 +0800
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
Subject: Re: [PATCH V4 03/11] dt-bindings: soc: add binding for i.MX8MQ VPU
 blk-ctrl
Message-ID: <20220209071614.GD4909@dragon>
References: <20220125171129.472775-1-aford173@gmail.com>
 <20220125171129.472775-4-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220125171129.472775-4-aford173@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Tue, Jan 25, 2022 at 11:11:20AM -0600, Adam Ford wrote:
> From: Lucas Stach <l.stach@pengutronix.de>
> 
> This adds the DT binding for the i.MX8MQ VPU blk-ctrl.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied, thanks!
