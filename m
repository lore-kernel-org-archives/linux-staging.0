Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4096925DD0B
	for <linux-staging@lists.linux.dev>; Wed, 21 May 2025 11:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747828369; cv=none; b=VaeW1DcKcIA/ong1dMvvEi3bu6cHD9nVnrraZM7Ps01SbtkfCei8FU2p5QZtsK1qiQEmfYl3tDctoXCl1wG+YiNa7Ar04iW160LbXwIeEmrykc2w84R6jGrnxBZEoWsHiiQIViLmvXPcalS8bhL/yQJ56Sf/Phx0b8N5WJ1faOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747828369; c=relaxed/simple;
	bh=1lIpQjeZWM4B9/XmD81iy/IEh/WiTrtNntrczpbhpoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AJJbueNFqrW1b15qNEEFljMExeB+BTdj616i7xu4Gvc9E38gZs8Lu5J7t9iELvRFkmHNnwcBFMyKpJ+T4S24LdUzfHa4m0gpXXRzbDbXzV47rkY7g0Vj+/Pzi/5KGYfMEEfYekQZ7CR/wsnF2GVWRG/I9iiD/U530Q5VVrYmEE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hm4IfOYr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hm4IfOYr"
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA70F6AF;
	Wed, 21 May 2025 13:52:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747828343;
	bh=1lIpQjeZWM4B9/XmD81iy/IEh/WiTrtNntrczpbhpoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hm4IfOYrhHp6JXpwuzKAnBrmQUO7WP7cZNSiyOc+Hg7tHFzZg007Q3hUcH/qEBJQq
	 NbITT004qqSDRlaZtWqFId+aM//kCbBT6OkLm8MUKXH1BL3HB0NR5aavDJrwL4JF/l
	 CzRzezaXpeAnAUStyKWW3yVhYil0hHAHNAvkQ/f8=
Date: Wed, 21 May 2025 13:52:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com, kernel-list@raspberrypi.com,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH RFC 2/2] staging: vc04_services: Document VCHIQ character
 device
Message-ID: <20250521115239.GI12514@pendragon.ideasonboard.com>
References: <20250509221152.13564-1-wahrenst@gmx.net>
 <20250509221152.13564-3-wahrenst@gmx.net>
 <2025052121-glisten-serpent-8ede@gregkh>
 <20250521112815.GA25453@pendragon.ideasonboard.com>
 <4cac2c68-a975-4b68-92c4-91e90ffe8041@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4cac2c68-a975-4b68-92c4-91e90ffe8041@gmx.net>

On Wed, May 21, 2025 at 01:39:15PM +0200, Stefan Wahren wrote:
> Am 21.05.25 um 13:28 schrieb Laurent Pinchart:
> > On Wed, May 21, 2025 at 01:20:54PM +0200, Greg KH wrote:
> >> On Sat, May 10, 2025 at 12:11:52AM +0200, Stefan Wahren wrote:
> >>> From: Phil Elwell <phil@raspberrypi.com>
> >>>
> >>> Document the IOCTLs for the VCHIQ character device, which provide
> >>> a userspace interface to access the VideoCore VPU of the
> >>> Raspberry Pi. Several ARM side libraries make use of it like EGL,
> >>> MMAL and OpenMAX.
> >>>
> >>> Link: https://github.com/raspberrypi/linux/pull/6801
> >>> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> >>> [wahrenst@gmx.net: Rewrite commit log]
> >>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> >>> ---
> >>>   .../vc04_services/Documentation/vchiq-cdev    | 87 +++++++++++++++++++
> >>>   1 file changed, 87 insertions(+)
> >>>   create mode 100644 drivers/staging/vc04_services/Documentation/vchiq-cdev
> >>>
> >>> diff --git a/drivers/staging/vc04_services/Documentation/vchiq-cdev b/drivers/staging/vc04_services/Documentation/vchiq-cdev
> >>> new file mode 100644
> >>> index 000000000000..99ab2567643e
> >>> --- /dev/null
> >>> +++ b/drivers/staging/vc04_services/Documentation/vchiq-cdev
> >>> @@ -0,0 +1,87 @@
> >>> +What:		/dev/vchiq
> >>> +Date:		October 2016
> >>> +KernelVersion:	4.9
> >>> +Contact:	kernel-list@raspberrypi.com
> >>> +Description:
> >>> +		The ioctl interface for the VCHIQ character device.
> >>> +		Following actions are supported:
> >>> +
> >>> +		* VCHIQ_IOC_CONNECT:
> >>> +		  Establish/confirm the link to the VPU peer.
> >>
> >> I understand the need, but this does not document the parameters to the
> >> ioctls, so it's not all that useful.  How about just a normal
> >> documentation file with this all written out?
> >
> > That would be my preference too, somewhere in
> > Documentation/userspace-api/.
>
> could you please point me to a comparable IOCTL documenation to better 
> understand your expectations?

Documentation/userspace-api/gpio/ seems to be a good example. You can
split ioctls in different files, see gpio-get-chipinfo-ioctl.rst for
instance. If several ioctls are closely related they can also be
documented in the same file, see for instance
Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst.

-- 
Regards,

Laurent Pinchart
