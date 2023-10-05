Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B27E7F
	for <linux-staging@lists.linux.dev>; Thu,  5 Oct 2023 08:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZCfl+kBA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D891C116A8;
	Thu,  5 Oct 2023 08:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696493083;
	bh=n0iBSjPCJkTWykMjXg2IpQ/zpWh4QfV3NqOyRltJBhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZCfl+kBAeFYIZUswnR8uZMzh5QaIJPbx13BP7AgAhJj9nSlwojL7hm97zgFR+Yxm5
	 7/oFKTMm3x9km0Lwzc0wP8DTaW0x1ExhMFUQSaP0H9MdSTmVzeaD/awJ0BZawcZOeG
	 hjVoG3S3lyssDem651xtmzWvVyey+eIoIQcBc7p4=
Date: Thu, 5 Oct 2023 10:04:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Adrien Thierry <athierry@redhat.com>,
	Dan Carpenter <error27@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v12 6/6] staging: bcm2835-audio: Register bcm2835-audio
 with vchiq_bus_type
Message-ID: <2023100523-comprised-eggnog-bd20@gregkh>
References: <20230923143200.268063-1-umang.jain@ideasonboard.com>
 <20230923143200.268063-7-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230923143200.268063-7-umang.jain@ideasonboard.com>

On Sat, Sep 23, 2023 at 08:02:00PM +0530, Umang Jain wrote:
> Similar to how bcm2385-camera device is registered, register the
> bcm2835-audio with vchiq_bus_type as well.
> 
> Since we moved away bcm2835-audio from platform driver/device,
> we have to set the DMA mask explicitly. Set the DMA mask at probe
> time.
> 
> Meanwhile at it, change the name and module alias from "bcm2835_audio"
> to "bcm2835-audio" to be consistent with bcm2835-camera device. This
> does not brings any functional change as '-' and '_' are
> interchangeable as per modprobe man pages.

Again, why is the module alias still needed?

thanks,

greg k-h
