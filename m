Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5731D288E6
	for <linux-staging@lists.linux.dev>; Thu, 24 Aug 2023 13:34:44 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 48D7E87F3;
	Thu, 24 Aug 2023 15:33:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1692883996;
	bh=RtNbFIR0XA7+6sM+MvEk7hEJmH/z0Dgzl+g1Q9EPiCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uPuSFwPzsj0pgdNy1El4Td8QW11v72tF62hBjZQ4LWneTpB4KVpChDuOHTgl8V/bK
	 uhyUGLY53+FCzCGv+gCF62uvQBSmSYkKBsCmyj1/j2O2FycUYzG93/5mTZTHo2vqsf
	 PrdWcKk+nbYQt+9VJMnEdX0yV/LlApMTqz01Fo8k=
Date: Thu, 24 Aug 2023 16:34:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jack Zhu <jack.zhu@starfivetech.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	bryan.odonoghue@linaro.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
	changhuang.liang@starfivetech.com
Subject: Re: [PATCH v8 0/8] Add StarFive Camera Subsystem driver
Message-ID: <20230824133441.GC27092@pendragon.ideasonboard.com>
References: <20230824080109.89613-1-jack.zhu@starfivetech.com>
 <2023082436-spendable-reshuffle-878d@gregkh>
 <a6f60dfc-ffbf-da4d-a81c-06caf92955d6@starfivetech.com>
 <2023082416-flanking-requisite-a8ed@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2023082416-flanking-requisite-a8ed@gregkh>

On Thu, Aug 24, 2023 at 03:08:33PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Aug 24, 2023 at 08:23:33PM +0800, Jack Zhu wrote:
> > On 2023/8/24 19:37, Greg Kroah-Hartman wrote:
> > > On Thu, Aug 24, 2023 at 04:01:01PM +0800, Jack Zhu wrote:
> > >> Hi,
> > >> 
> > >> This series is the v8 series that attempts to support the Camera Subsystem
> > >> found on StarFive JH7110 SoC.
> > > 
> > > I don't see anything here about why this is in drivers/staging/media/
> > > now and not just in drivers/media/.  What is preventing this to be put
> > > into the correct place to start with?  What needs to be done to the code
> > > to get it out of drivers/staging/media/ and who is going to do that
> > > work?
> > 
> > The series does not contain 3A interface. According to Laurent's suggestion,
> > we put the driver in the staging directory first. In the next stage, we will
> > continue to submit the 3A interface in the way of incremental development,
> > and finally expect the code to be placed in the drivers/media/.
> 
> Can you please say that in the changelog text for when you are adding
> the driver so that we know this?

It's also customary to add a TODO file in the driver directory to list
the work needed before moving the code to drivers/media/. Jack, could
you please do so ?


-- 
Regards,

Laurent Pinchart
