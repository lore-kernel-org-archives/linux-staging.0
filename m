Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BB52F2E
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 07:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62131C340E7;
	Wed,  9 Feb 2022 07:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644390644;
	bh=rxEgYRgCwh9LFZmjFE4yFU9bmXyedf1uJf5KWKZeimw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pF2VIo0xfzFKaABIHU07EfutScT1WHJ74mvcMYGyeh2ppZzaZuX2OUOFmeRK4vLS5
	 tMGbYPMhqUpkntCw9DDn0LhzGO0hx28dhQ1RC85GvbyZ66meuWY4GN4oGikBi3SKu/
	 i3lQ2D12D2M0o9EMxRfLM+u/PpzxTxvhQhsR0HdfUjF/42rkEbpu+rhCbkRmQ1uU3y
	 0bVc/bkWyOSApdLAg5MlbghHHade1GTfBL8JMy93OCeXXSSTogyoWGLk6VWbWdt/md
	 MifcnN7HRhbzKtyRTlWu2cVdLnx303IpkLU0mXARrqmLkTPIuZhNC5pUAw+o/bun7P
	 PB7/SrSP9lpzA==
Date: Wed, 9 Feb 2022 15:10:37 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Adam Ford <aford173@gmail.com>
Cc: linux-media@vger.kernel.org, aford@beaconembedded.com,
	cphealy@gmail.com, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH V4 01/11] arm64: dts: imx8mq-tqma8mq: Remove redundant
 vpu reference
Message-ID: <20220209071036.GB4909@dragon>
References: <20220125171129.472775-1-aford173@gmail.com>
 <20220125171129.472775-2-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220125171129.472775-2-aford173@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Tue, Jan 25, 2022 at 11:11:18AM -0600, Adam Ford wrote:
> The vpu is enabled by default, so there is no need to manually
> enable it.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>

Applied, thanks!
