Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5577E
	for <linux-staging@lists.linux.dev>; Fri, 11 Feb 2022 20:22:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59D2E93;
	Fri, 11 Feb 2022 21:22:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1644610923;
	bh=2LnkKOD3jbhUUEl0cyR4QD3GMkdu6tdHkHUu7rl5ogU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N8OzI7lZedijKfoJSZ96WK6ObAOpd4a74ZQeuRACzkCxBRbOweNt8uDylZkIHUCpw
	 lyUFYxolj8D5xDY5YnI93Vk1UFu9JH0YQg0/LLBV9iUTcvu/TXOtGf7niNecAvJaBd
	 HyZHT3wipcICkzr0dmL3wNDsYwicFJ97mcB0FuP8=
Date: Fri, 11 Feb 2022 22:21:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Jacopo Mondi <jacopo@jmondi.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Rui Miguel Silva <rmfrfs@gmail.com>, xavier.roumegue@oss.nxp.com,
	Sascha Hauer <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-media <linux-media@vger.kernel.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/3] media: imx: De-stage imx7-mipi-csis
Message-ID: <YgbFZgvB2bvK9WFE@pendragon.ideasonboard.com>
References: <20220211180216.290133-1-jacopo@jmondi.org>
 <20220211180216.290133-2-jacopo@jmondi.org>
 <CAOMZO5A09VWLGTbqggVJOh4LeLotty8s6VZB0Jq9SL2M0+P6rw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAOMZO5A09VWLGTbqggVJOh4LeLotty8s6VZB0Jq9SL2M0+P6rw@mail.gmail.com>

Hi Fabio,

On Fri, Feb 11, 2022 at 03:32:31PM -0300, Fabio Estevam wrote:
> On Fri, Feb 11, 2022 at 3:01 PM Jacopo Mondi wrote:
> >
> > The imx7-mipi-csis driver is in a good state and can be staged.
> 
> I think you meant de-staged :-)
> 
> > Move the imx7-mipi-csis.c driver to the newly created
> > drivers/media/platform/imx directory and plumb the related
> > options in Kconfig and in Makefile.
> 
> What about the comments in drivers/staging/media/imx/TODO?

As far as I can tell, they apply to the other drivers, not this one. Is
there any particular comment you're concerned about ?

-- 
Regards,

Laurent Pinchart
