Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C00B3C26
	for <linux-staging@lists.linux.dev>; Thu, 19 Jan 2023 09:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4365DC433EF;
	Thu, 19 Jan 2023 09:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1674120986;
	bh=rj8uvnYLkE+EnCB5eZEiSrC6akGxUsBb4C7W2iCn5YE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ui8GtCdoJDN2oHSD5wvW8X6LyF+6o8YVJQoV5pA3atXR+UUnFg781IS4fLC6jIhrh
	 gQMwSkegN0oXrGtR13HPrWcfFfh7VBdpJxXAf9CToICXk1Q1qGuO+bpwLRRQT2tVh9
	 MXCZEW19S1i2kGOj1KblPeTxjFow9S784i0ZNjoM=
Date: Thu, 19 Jan 2023 10:36:23 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Adrien Thierry <athierry@redhat.com>,
	Dan Carpenter <error27@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4 0/6] staging: vc04_services: vchiq: Register devices
 with a custom bus_type
Message-ID: <Y8kPF56tqgSnfj6i@kroah.com>
References: <20230118191811.208552-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118191811.208552-1-umang.jain@ideasonboard.com>

On Thu, Jan 19, 2023 at 12:48:05AM +0530, Umang Jain wrote:
> The main patch (6/6) is laregly unchanged from v3.
> Specific details are elaborated in its commit message.
> 
> This series just introduces five extra patches for dropping include
> directives from Makefiles (suggested by Greg KH) and rebased.
> 
> Changes in v4: 
> - Introduce patches to drop include directives from Makefile
> 
> Changes in v3:
> - Rework entirely to replace platform devices/driver model
> 
> -v2:
> https://lore.kernel.org/all/20221222191500.515795-1-umang.jain@ideasonboard.com/
> 
> -v1:
> https://lore.kernel.org/all/20221220084404.19280-1-umang.jain@ideasonboard.com/
> 
> Umang Jain (6):
>   staging: vc04_services: Drop __VCCOREVER__ remnants
>   vc04_services: bcm2835-audio: Drop include Makefile directive
>   vc04_services: bcm2835-camera: Drop include Makefile directive
>   vc04_services: vchiq-mmal: Drop include Makefile directive
>   vc04_services: interface: Drop include Makefile directive
>   staging: vc04_services: vchiq: Register devices with a custom bus_type

Your patch subject lines are odd here, many drop the "staging: " prefix.
Please fix up.

thanks,

greg k-h
