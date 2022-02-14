Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4A17D
	for <linux-staging@lists.linux.dev>; Mon, 14 Feb 2022 09:27:00 +0000 (UTC)
Received: from relay12.mail.gandi.net (unknown [217.70.178.232])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 13CB0CD29B
	for <linux-staging@lists.linux.dev>; Mon, 14 Feb 2022 09:23:01 +0000 (UTC)
Received: (Authenticated sender: jacopo@jmondi.org)
	by mail.gandi.net (Postfix) with ESMTPSA id E2B76200003;
	Mon, 14 Feb 2022 09:22:49 +0000 (UTC)
Date: Mon, 14 Feb 2022 10:23:58 +0100
From: Jacopo Mondi <jacopo@jmondi.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Rui Miguel Silva <rmfrfs@gmail.com>, xavier.roumegue@oss.nxp.com,
	Sascha Hauer <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-media <linux-media@vger.kernel.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/3] media: imx: De-stage imx7-mipi-csis
Message-ID: <20220214092358.mu5vvfkzn2zfvokm@uno.localdomain>
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

Hi Fabio

On Fri, Feb 11, 2022 at 03:32:31PM -0300, Fabio Estevam wrote:
> Hi Jacopo,
>
> On Fri, Feb 11, 2022 at 3:01 PM Jacopo Mondi <jacopo@jmondi.org> wrote:
> >
> > The imx7-mipi-csis driver is in a good state and can be staged.
>
> I think you meant de-staged :-)
>

Indeed :)

> > Move the imx7-mipi-csis.c driver to the newly created
> > drivers/media/platform/imx directory and plumb the related
> > options in Kconfig and in Makefile.
>
> What about the comments in drivers/staging/media/imx/TODO?

I found nothing there that applies to this driver.
Have I missed any point ?
