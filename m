Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57AC7F
	for <linux-staging@lists.linux.dev>; Thu,  5 Oct 2023 08:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LTz+1BNH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DECBC116A9;
	Thu,  5 Oct 2023 08:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696493137;
	bh=HoLOrIR292OK4LNCHKlQpciqwUF+riXC6qahbbVsLY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LTz+1BNHOgV0lFcjaazPlDTfyaTqmwjXZ/zZp7FcfA8XXEwjfSUYHShpjj2BefInh
	 UDjhAQCauP5lrbl1BakuefOU6Nq38/Rv2zRtjH3xG3RVUUxx0FmUYMfabK1w0rPk9F
	 S2FO8I/SGd6NLOJgfc5UvIr0ryhqcsgmMrdTDwBQ=
Date: Thu, 5 Oct 2023 10:05:35 +0200
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
Subject: Re: [PATCH v12 0/6] staging: vc04_services: vchiq: Register devices
 with a custom bus_type
Message-ID: <2023100502-unwilling-bleach-b5ac@gregkh>
References: <20230923143200.268063-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230923143200.268063-1-umang.jain@ideasonboard.com>

On Sat, Sep 23, 2023 at 08:01:54PM +0530, Umang Jain wrote:
> The patch series added a new bus type vchiq_bus_type and registers
> child devices in order to move them away from using platform
> device/driver.
> 
> Tested on RPi-3-b with media tree master branch.

Thanks for sticking with this through so many different revisions. I
only had minor comments on the series, you can address them in follow-on
patches if needed (one at the least is needed.)  All are now queued up
in my tree.

greg k-h
