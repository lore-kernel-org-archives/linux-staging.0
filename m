Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CAE173
	for <linux-staging@lists.linux.dev>; Thu,  6 Jan 2022 13:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98969C36AE3;
	Thu,  6 Jan 2022 13:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1641476992;
	bh=jM5JFZDsIHtlM01Zlo8RxfuhGtY/DSlRs7vaYc5wVAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WPTP5p2jaVbbWlFilf3XgOcnfZMmnCVy3/vZxkwecduLXxS+9RQ4lJycGl9Po0RTm
	 p2LdiCFUgqM5ugdaLd9rLCONWlV6LS1IWe62bYNI87axXN8UqUsdbFtXR4Z34dDYQJ
	 ZuG71LyeoP2PsZX5+nIxNNViN24wa9zYTwb1I0RA=
Date: Thu, 6 Jan 2022 14:49:49 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Gaston Gonzalez <gascoar@gmail.com>
Cc: linux-staging@lists.linux.dev, nsaenz@kernel.org, f.fainelli@gmail.com,
	rjui@broadcom.com, sbranden@broadcom.com,
	juerg.haefliger@canonical.com, rdunlap@infradead.org,
	dave.stevenson@raspberrypi.com, stefan.wahren@i2se.com,
	unixbhaskar@gmail.com, mitaliborkar810@gmail.com,
	phil@raspberrypi.com, len.baker@gmx.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] staging: vc04_services: rename ocurrences of
 'bm2835*' to 'bcm2835*'
Message-ID: <Ydbzfbf+yUgQzVbb@kroah.com>
References: <cover.1641414449.git.gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1641414449.git.gascoar@gmail.com>

On Wed, Jan 05, 2022 at 05:35:41PM -0300, Gaston Gonzalez wrote:
> This patch set renames ocurrences of 'bm2835*' to 'bcm2835*'.
> 
> Gaston Gonzalez (6):
>   staging: vc04_services: rename structures bm2835_mmal_dev and
>     bm2835_mmal_v4l2_ctrl
>   staging: vc04_services: rename functions containing bm2835_* to
>     bcm2835_*
>   staging: vc04_services: rename variables containing bm2835_* to
>     bcm2835_*
>   staging: vc04_services: rename string literal containing bm2835_* to
>     bcm2835*_
>   staging: vc04_services: rename macros BM2835_MMAL_VERSION and
>     BM2835_MMAL_MODULE_NAME
>   staging: vc04_services: rename BM2835 to BCM2835 in headers comments

All but patch 5/6 now queued up, thanks,

greg k-h
