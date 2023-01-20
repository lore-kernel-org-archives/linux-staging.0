Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9674915C1
	for <linux-staging@lists.linux.dev>; Fri, 20 Jan 2023 01:00:53 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09667514;
	Fri, 20 Jan 2023 02:00:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1674176451;
	bh=tUHR1lm0/GiTPaTojG05os0odntRdSE/TwVOXS1mhn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dF+3LpDxK/DyIVL3yWXfMQDpoa2AGbvzYy3oWKEbDRjx+Y2RXq5r9DCxSIu+68QTh
	 2Vlseywog6UJIKMSkZlADSlYg8pEQu0HIHMV4tKpdmN/ETM1zlH1oKzD63h5pTYBqF
	 VZOt9sWYmFMWVtyLwPO9h24f+2zUmQThHtR12qz0=
Date: Fri, 20 Jan 2023 03:00:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Phil Elwell <phil@raspberrypi.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Adrien Thierry <athierry@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/4] Drop custom logging
Message-ID: <Y8nnwIqah3O9QfIU@pendragon.ideasonboard.com>
References: <20230118115810.21979-1-umang.jain@ideasonboard.com>
 <b1a26368-3753-0d32-434b-e220dd9c06b4@i2se.com>
 <CAMEGJJ1=dix7gWvV3Jxef-M-ExFZRTASQCr+6sn_dGsEQ=deYQ@mail.gmail.com>
 <Y8lHqd9FlxiXTLuW@kroah.com>
 <CAMEGJJ1oZ9XFw0609PrEABAgDwvapbc3hG4hJ=vBekUOepdiWw@mail.gmail.com>
 <Y8lS5eBliYw5EHBb@kadam>
 <CAMEGJJ2b1KFQY1m1eTcvf8_kGBBTjzrBD2i_M2uR+6v4gEcbVQ@mail.gmail.com>
 <Y8lVvHMIYeSOLM5q@kadam>
 <Y8nl++1Mjd7xLqZe@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y8nl++1Mjd7xLqZe@pendragon.ideasonboard.com>

On Fri, Jan 20, 2023 at 02:53:17AM +0200, Laurent Pinchart wrote:
> On Thu, Jan 19, 2023 at 05:37:48PM +0300, Dan Carpenter wrote:
> > On Thu, Jan 19, 2023 at 02:31:50PM +0000, Phil Elwell wrote:
> > > On Thu, 19 Jan 2023 at 14:25, Dan Carpenter wrote:
> > > > On Thu, Jan 19, 2023 at 01:47:44PM +0000, Phil Elwell wrote:
> > > > > > > I understand the desire to remove the custom logging. I don't welcome
> > > > > > > the loss of flexibility that comes with such a strategy
> > > > > >
> > > > > > What "loss of flexibility"?  You now have access to the full dynamic
> > > > > > debugging facilities that all of the rest of the kernel has.  What is
> > > > > > lacking?
> > > > >
> > > > > Perhaps I've missed something, either in this patch set or the kernel
> > > > > as a whole, but how is one supposed to set different logging levels on
> > > > > different facilities within a driver/module, or even for the module as
> > > > > a whole?
> > > >
> > > > Yeah.  You will be still able to do that and more besides after the
> > > > transition.  Cleaning this up makes the code better in every way.
> > > >
> > > > Documentation/admin-guide/dynamic-debug-howto.rst
> > > 
> > > Are you saying this patch set gets us to that point?
> > 
> > Yes.  The patch has some issues, but yes.
> 
> I think I'm missing something too then. Dynamic debug provides the
> ability to easily switch dev_dbg() messages on and off at runtime, but
> it doesn't provide, as far as I'm aware, log levels or log categories.
> 
> Log levels are currently used by the vchiq code to suppress messages
> below a certain level. Kernel log levels are not an exact replacement,
> as the messages still end up in the kernel log (except for debug
> messages).
> 
> Log categories are used to group messages in categories and control
> their log level per category. As far as I know, dynamic debug doesn't
> provide any such feature.

After a bit more research (which I should have done before replying,
sorry), it looks like dynamic debug has support for classes, which are
used by, for instance, the DRM logging infrastructure (see
include/drm/drm_print.h). I don't see that being wired up to dev_*()
print macros though, am I missing something, or would vchiq need to keep
using custom logging macros (with dynamic debug used as a backend,
replacing the current custom implementation) to make use of this feature
?

-- 
Regards,

Laurent Pinchart
