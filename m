Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB0725A344
	for <linux-staging@lists.linux.dev>; Wed, 21 May 2025 11:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747826458; cv=none; b=uhttQMTPI+ubjN2QC4iwqN9yjBZBsFLcZ+9adWKzn6WBigwTLyb4gtYORYPbpx/nIU7WIi32jPxgMiQl0QUvoLI7MF2Kkut3jclj39t8p3JJnbhKIanXcgaQDVoflxa4CgaHZiq/mYSLkFUceNEdq2FTCRBq9N+Qx3X7RqGlCQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747826458; c=relaxed/simple;
	bh=u7vr35/b6Z4rimsIPB7+DevWJCfwHCoiHs6tR4unzJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mj/tLUSDigHYhCc1OrUPvR903Lt9Imj4BStStFfff9zWh8CSOdabOts2tBovP1GpY/e2OVj6R1Rf2HDUiM5UMEhd9FZSkChzLogpprDpmGceDMMk3kEYaftXCu8SVLSxjwfowG0zLaVpiX0InfO6DmmzsdUWShNuGu4Kd4NTrMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2p1VLrxU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2p1VLrxU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 068F2C4CEE4;
	Wed, 21 May 2025 11:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747826457;
	bh=u7vr35/b6Z4rimsIPB7+DevWJCfwHCoiHs6tR4unzJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2p1VLrxUwfqyMbBoUwQvFyzTw1U5bigGBzmzSskNfGo3lXKt04N1oDp5+uW5Jy0TB
	 9Ne3mdK9cA155l06g9Uv7GzHiORLbDJViJfu4cudZamHhWoXnMTgpPfzJ7qXw+si1e
	 f/kC+hHFhHfYkHbLyLJgI74CKxGvPaKXKaFAaNSc=
Date: Wed, 21 May 2025 13:20:54 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com, kernel-list@raspberrypi.com,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH RFC 2/2] staging: vc04_services: Document VCHIQ character
 device
Message-ID: <2025052121-glisten-serpent-8ede@gregkh>
References: <20250509221152.13564-1-wahrenst@gmx.net>
 <20250509221152.13564-3-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509221152.13564-3-wahrenst@gmx.net>

On Sat, May 10, 2025 at 12:11:52AM +0200, Stefan Wahren wrote:
> From: Phil Elwell <phil@raspberrypi.com>
> 
> Document the IOCTLs for the VCHIQ character device, which provide
> a userspace interface to access the VideoCore VPU of the
> Raspberry Pi. Several ARM side libraries make use of it like EGL,
> MMAL and OpenMAX.
> 
> Link: https://github.com/raspberrypi/linux/pull/6801
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> [wahrenst@gmx.net: Rewrite commit log]
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  .../vc04_services/Documentation/vchiq-cdev    | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 drivers/staging/vc04_services/Documentation/vchiq-cdev
> 
> diff --git a/drivers/staging/vc04_services/Documentation/vchiq-cdev b/drivers/staging/vc04_services/Documentation/vchiq-cdev
> new file mode 100644
> index 000000000000..99ab2567643e
> --- /dev/null
> +++ b/drivers/staging/vc04_services/Documentation/vchiq-cdev
> @@ -0,0 +1,87 @@
> +What:		/dev/vchiq
> +Date:		October 2016
> +KernelVersion:	4.9
> +Contact:	kernel-list@raspberrypi.com
> +Description:
> +		The ioctl interface for the VCHIQ character device.
> +		Following actions are supported:
> +
> +		* VCHIQ_IOC_CONNECT:
> +		  Establish/confirm the link to the VPU peer.

I understand the need, but this does not document the parameters to the
ioctls, so it's not all that useful.  How about just a normal
documentation file with this all written out?

thanks,

greg k-h
