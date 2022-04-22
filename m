Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A665B2901
	for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 14:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A66EDC385A4;
	Fri, 22 Apr 2022 14:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1650638445;
	bh=MYOgwWbfG5bkafDdMryKHBx4bZzP6zWaU7pqVa4fSeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2cqtaxk446CcosqemMNM2QZCQrAWhOe4SetSJj8PSVEekW2A6l/qwYlHo0Og+hrcR
	 GjzpEwIs6WT4jzG2l/owuBWRsgqvxIvwC0e/TFmdhDocTI8pyMeDt5Vz3NetqOcxdl
	 FGgyCm/rddtlLUpAlPoBhRcHU1NZAgk693ADHsbk=
Date: Fri, 22 Apr 2022 16:40:42 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Adrien Thierry <athierry@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] staging: bcm2835-audio: delete TODO
Message-ID: <YmK+aiaaVLtadGVT@kroah.com>
References: <20220420174401.305964-1-athierry@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220420174401.305964-1-athierry@redhat.com>

On Wed, Apr 20, 2022 at 01:44:00PM -0400, Adrien Thierry wrote:
> Delete TODO since all tasks were completed:
> 
> 1 - fixed here:
> https://lore.kernel.org/all/20220408150359.26661-1-athierry@redhat.com/
> 
> 2 - there are no remaining checkpatch.pl errors or warnings
> 
> Signed-off-by: Adrien Thierry <athierry@redhat.com>
> ---
>  drivers/staging/vc04_services/bcm2835-audio/TODO | 10 ----------
>  1 file changed, 10 deletions(-)
>  delete mode 100644 drivers/staging/vc04_services/bcm2835-audio/TODO
> 
> diff --git a/drivers/staging/vc04_services/bcm2835-audio/TODO b/drivers/staging/vc04_services/bcm2835-audio/TODO
> deleted file mode 100644
> index b85451255db0..000000000000
> --- a/drivers/staging/vc04_services/bcm2835-audio/TODO
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -*****************************************************************************
> -*                                                                           *
> -*                           TODO: BCM2835-AUDIO                             *
> -*                                                                           *
> -*****************************************************************************
> -
> -1) Revisit multi-cards options and PCM route mixer control (as per comment
> -https://lore.kernel.org/lkml/s5hd0to5598.wl-tiwai@suse.de)
> -
> -2) Fix the remaining checkpatch.pl errors and warnings.
> -- 
> 2.35.1
> 
> 

Great, so now it can be merged to the real part of the kernel?  If not,
what's left for that to happen?

thanks,

greg k-h
