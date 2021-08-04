Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FF670
	for <linux-staging@lists.linux.dev>; Wed,  4 Aug 2021 09:09:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99A2560240;
	Wed,  4 Aug 2021 09:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628068157;
	bh=creleWvxNSfRIGwbE5dZBI+uVsF0jULHdz/WybQnPmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oJ5tvJijoyGUheX8KdpFoaUeZUUMOkKvHJkaecL7WwooDQLyeKkGKDcZ0nxFjUH5R
	 zACPxg5kwtHACbRqPbBMWMz49XrrtbZoBmzdCI98/vXn/Q1xtHsJ+IyxVJACFjTLBr
	 p82cNmmlBCu/1cFvOkx/iqx94rz2zRwYAzFQr2bS0jBk/5vXMPVygWxFKjVyxl6m0X
	 imhTQOZ2XnhI6KW+vv2hvPOsRehFKkXnZx7a8XbVJr1hZ13qvjhtKVGcFCG3nJmTHb
	 BcrQ+xKYj3OdONXnVuLwpu3AcNc/OtEV47ryO2XTqmBA3Qk4WjrnDimP6zUlxFhfml
	 XdlS/OvaXK7Xw==
Date: Wed, 4 Aug 2021 17:09:11 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Martin Kepplinger <martin.kepplinger@puri.sm>,
	devicetree@vger.kernel.org, festevam@gmail.com,
	kernel@pengutronix.de, kernel@puri.sm, krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, m.felsch@pengutronix.de,
	mchehab@kernel.org, phone-devel@vger.kernel.org, robh@kernel.org,
	slongerbeam@gmail.com
Subject: Re: [PATCH v9 0/3] media: imx: add support for imx8mq MIPI RX
Message-ID: <20210804090910.GC30984@dragon>
References: <20210726082117.2423597-1-martin.kepplinger@puri.sm>
 <YP9aujiWH2Q/ghHK@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YP9aujiWH2Q/ghHK@pendragon.ideasonboard.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Tue, Jul 27, 2021 at 04:00:42AM +0300, Laurent Pinchart wrote:
> Hi Martin,
> 
> On Mon, Jul 26, 2021 at 10:21:14AM +0200, Martin Kepplinger wrote:
> > hi,
> > 
> > This patch series adds a driver for the i.MX8MQ CSI MIPI receiver / controller.
> > 
> > It includes the driver, the dt-bindings and the DT addition to the SoC dtsi.
> > I test it using libcamera. Thanks to Laurent who helped a lot. I'm happy for
> > any feedback,
> 
> No more feedback from me :-) I'll take patches 1/3 and 2/3 in my tree
> and send a pull request.
> 
> Shawn, could you please review 3/3 ?

Yeah, it looks good, and I just picked it up.

Shawn
