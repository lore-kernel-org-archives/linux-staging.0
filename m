Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F492F2E
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 07:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB3AC340E7;
	Wed,  9 Feb 2022 07:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644391659;
	bh=OJvm1A6pDfiZ/Vq3R8cpstnj4FnW2flkaQ6gkEpC+CU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EzIcFnpKOHLF0hCQXS68sK9fBYL1sA56ob89NKnhCVtTL6fVaZrlD8PO9n6vxqfyQ
	 8kFfLoc1IEoaO+984K1zUWN6jKjX0QYJBwgoOj3/1yc45I0mbmCRmD5JcCXlAqEBAo
	 v6s+PZHWykCJC44W6Iq7Zk8gzs945MnOj7IilCd+DCrFGtBYWlWIoe0fKkRHan+3hp
	 MxJ2CuilFfHlix2K843FmQAyTjqKF3jD4l6cYCA1h4tL8+9YW2LvjCW0yyVGdWsoxK
	 EKWWL4veNUIX7gQn6z8wkYMifpV1Y6xzP3dZkBtb+4Eu5mmomt7HlCCmyP8aRUmwTP
	 u++yOXbYflMkQ==
Date: Wed, 9 Feb 2022 15:27:31 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Adam Ford <aford173@gmail.com>, linux-media@vger.kernel.org,
	aford@beaconembedded.com, cphealy@gmail.com,
	kernel test robot <lkp@intel.com>,
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
Subject: Re: [PATCH V4 07/11] arm64: dts: imx8mq: Enable both G1 and G2 VPU's
 with vpu-blk-ctrl
Message-ID: <20220209072730.GF4909@dragon>
References: <20220125171129.472775-1-aford173@gmail.com>
 <20220125171129.472775-8-aford173@gmail.com>
 <YfBJxmgwLGbVqGba@eze-laptop>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfBJxmgwLGbVqGba@eze-laptop>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Tue, Jan 25, 2022 at 04:04:38PM -0300, Ezequiel Garcia wrote:
> On Tue, Jan 25, 2022 at 11:11:24AM -0600, Adam Ford wrote:
> > With the Hantro G1 and G2 now setup to run independently, update
> > the device tree to allow both to operate.  This requires the
> > vpu-blk-ctrl node to be configured.  Since vpu-blk-ctrl needs
> > certain clock enabled to handle the gating of the G1 and G2
> > fuses, the clock-parents and clock-rates for the various VPU's
> > to be moved into the pgc_vpu because they cannot get re-parented
> > once enabled, and the pgc_vpu is the highest in the chain.
> > 
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> 
> It doesn't seem correct to have the Reported-by on this commit.

Applied with Reported-by tag dropped, thanks!
