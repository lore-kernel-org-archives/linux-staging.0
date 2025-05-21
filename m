Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BC6262FDD
	for <linux-staging@lists.linux.dev>; Wed, 21 May 2025 11:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747826905; cv=none; b=k8Oy9EloiEt1GiAvXkz3CMG/jnlmb1r82XFn45cK83WKmzU5wEdcI2BJwTXcIUM2/DNu5uCqmGpelETDiO9QfzNlCVW7ysVjWKW2fDK8cOEIs2GYXER0TsDCmCnJmjzhksqalBbm6gucrTe5vwSAZ4/aODbcy2R8HrA0f9tVz3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747826905; c=relaxed/simple;
	bh=9ldtAZOjiwBoSV88KvGA6xuaTmbjwRGIREj/XBztDYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j6mISdn4hBDBQNYj1H1KCKpQOAOTvooMyFSweCekp6RLbOm4PGQID2sua0L+gHK6mTMOG1JoWZoWKYggSpabGi2VvbAV6nrbp9IINbCLKMT8JBq7Zho3e6hkFsNksB6EYtJBLDbBdcROCq/XqEBR1umQ1iII8iEUg7GKFV8Qz+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=N2H3Mog7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N2H3Mog7"
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 152926AF;
	Wed, 21 May 2025 13:28:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747826880;
	bh=9ldtAZOjiwBoSV88KvGA6xuaTmbjwRGIREj/XBztDYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N2H3Mog7VyzmtlM/z8giI0CLF2vmMNs7RIYDeU/is1pMALM3VHO/3FdpUhY2EwRoR
	 XFtXEEzohS+fk0Kr4yT1fpFgiPait86avoORJaluvwmAtSgSQXnUWt1w7M3fcpjFrc
	 dS5f0FWYfe5RQQCbriXeksTCOp5bHqkGoTe39IRE=
Date: Wed, 21 May 2025 13:28:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Stefan Wahren <wahrenst@gmx.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com, kernel-list@raspberrypi.com,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH RFC 2/2] staging: vc04_services: Document VCHIQ character
 device
Message-ID: <20250521112815.GA25453@pendragon.ideasonboard.com>
References: <20250509221152.13564-1-wahrenst@gmx.net>
 <20250509221152.13564-3-wahrenst@gmx.net>
 <2025052121-glisten-serpent-8ede@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2025052121-glisten-serpent-8ede@gregkh>

On Wed, May 21, 2025 at 01:20:54PM +0200, Greg KH wrote:
> On Sat, May 10, 2025 at 12:11:52AM +0200, Stefan Wahren wrote:
> > From: Phil Elwell <phil@raspberrypi.com>
> > 
> > Document the IOCTLs for the VCHIQ character device, which provide
> > a userspace interface to access the VideoCore VPU of the
> > Raspberry Pi. Several ARM side libraries make use of it like EGL,
> > MMAL and OpenMAX.
> > 
> > Link: https://github.com/raspberrypi/linux/pull/6801
> > Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> > [wahrenst@gmx.net: Rewrite commit log]
> > Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> > ---
> >  .../vc04_services/Documentation/vchiq-cdev    | 87 +++++++++++++++++++
> >  1 file changed, 87 insertions(+)
> >  create mode 100644 drivers/staging/vc04_services/Documentation/vchiq-cdev
> > 
> > diff --git a/drivers/staging/vc04_services/Documentation/vchiq-cdev b/drivers/staging/vc04_services/Documentation/vchiq-cdev
> > new file mode 100644
> > index 000000000000..99ab2567643e
> > --- /dev/null
> > +++ b/drivers/staging/vc04_services/Documentation/vchiq-cdev
> > @@ -0,0 +1,87 @@
> > +What:		/dev/vchiq
> > +Date:		October 2016
> > +KernelVersion:	4.9
> > +Contact:	kernel-list@raspberrypi.com
> > +Description:
> > +		The ioctl interface for the VCHIQ character device.
> > +		Following actions are supported:
> > +
> > +		* VCHIQ_IOC_CONNECT:
> > +		  Establish/confirm the link to the VPU peer.
> 
> I understand the need, but this does not document the parameters to the
> ioctls, so it's not all that useful.  How about just a normal
> documentation file with this all written out?

That would be my preference too, somewhere in
Documentation/userspace-api/.

-- 
Regards,

Laurent Pinchart
