Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40587A
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 16:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA412C385A5;
	Thu, 14 Apr 2022 16:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649953285;
	bh=VfHrJD3Nz0ZjdlZiEWgIt64kysymj8lJEi2ZpJKeQCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zIGcEsJHdFirNEXRfXkkgsn8xZbYHTC80OtiTRTWC8b8h9fB5udNZAqlHRkYFfgTm
	 9rPCM0hVyJyhyJNlreNvcHGTH20eybGzQ2EUzNN9I7efMngHmJDDnWIPmg+tCQuW/B
	 6LFZ5DdXC9+hg30esoB+KTtDiS0X6r4g/2MQSvi8=
Date: Thu, 14 Apr 2022 18:21:22 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Adrien Thierry <athierry@redhat.com>
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Maxime Ripard <mripard@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: bcm2835-audio: fully describe config symbol
Message-ID: <YlhKAoWCdAKMqIht@kroah.com>
References: <20220414152340.68932-1-athierry@redhat.com>
 <20220414152340.68932-2-athierry@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220414152340.68932-2-athierry@redhat.com>

On Thu, Apr 14, 2022 at 11:23:39AM -0400, Adrien Thierry wrote:
> Explain SND_BCM2835 config option in more detail, especially the
> implications of using the bcm2835-audio driver in conjunction with vc4
> for HDMI audio.
> 
> Reported by checkpatch:
> 
> WARNING: please write a help paragraph that fully describes the config
> symbol
> FILE: drivers/staging/vc04_services/bcm2835-audio/Kconfig:2
> 
> Signed-off-by: Adrien Thierry <athierry@redhat.com>
> ---
>  drivers/staging/vc04_services/bcm2835-audio/Kconfig | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vc04_services/bcm2835-audio/Kconfig b/drivers/staging/vc04_services/bcm2835-audio/Kconfig
> index d32ea348e846..7cd0b3c0cae4 100644
> --- a/drivers/staging/vc04_services/bcm2835-audio/Kconfig
> +++ b/drivers/staging/vc04_services/bcm2835-audio/Kconfig
> @@ -5,5 +5,8 @@ config SND_BCM2835
>  	select SND_PCM
>  	select BCM2835_VCHIQ
>  	help
> -	  Say Y or M if you want to support BCM2835 built in audio
> +	  Say Y or M if you want to support BCM2835 built in audio.
> +	  This driver handles both 3.5mm and HDMI audio. However, please
> +	  note that when HDMI audio is enabled with this driver, the vc4
> +	  driver cannot be used simultaneously, otherwise HDMI will break.

"will break"?  What exactly do you mean by this?  What will fail?  How
will it fail?  Why does this matter in a Kconfig help text?

thanks,

greg k-h
