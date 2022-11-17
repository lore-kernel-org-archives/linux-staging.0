Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709FA291F
	for <linux-staging@lists.linux.dev>; Thu, 17 Nov 2022 13:13:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC6CC433C1;
	Thu, 17 Nov 2022 13:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1668690802;
	bh=ON/iJ0r7mmy13poBgds2rLmOC5PP54ve7q6KT0jbzSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bqVOtAv4TQxFMxivBSRUniWjd0JGJpLCFwLl154hjTRz27wSQ/k8+XSPHf9WGb8aI
	 iJOJQlqqU5fSXmTcm+QFptaqcq1U4CiTKmNL4eqzWF78hOLP9Syfxq8ZQNp8kHMP7g
	 ZcgOwpMK6xdKo2fj3E3fBiS5h+oURr8YQ4LPvbWA=
Date: Thu, 17 Nov 2022 14:13:17 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 2/2] staging: vc04_services: mmal-common: Do not use bool
 in structures
Message-ID: <Y3YzbVNNP64jL+iF@kroah.com>
References: <20221117125953.88441-1-umang.jain@ideasonboard.com>
 <20221117125953.88441-3-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117125953.88441-3-umang.jain@ideasonboard.com>

On Thu, Nov 17, 2022 at 06:29:53PM +0530, Umang Jain wrote:
> Do not use bool in structures, it already gets flagged by checkpatch:
> 
> "Avoid using bool structure members because of possible alignment issues"
> 
> Hence, modify struct mmal_fmt.remove_padding to use u32. No change in
> assignments as 0/1 are already being used with mmal_fmt.remove_padding.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  drivers/staging/vc04_services/vchiq-mmal/mmal-common.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-common.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-common.h
> index b33129403a30..fd02440f41b2 100644
> --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-common.h
> +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-common.h
> @@ -32,9 +32,9 @@ struct mmal_fmt {
>  	int depth;
>  	u32 mmal_component;  /* MMAL component index to be used to encode */
>  	u32 ybbp;            /* depth of first Y plane for planar formats */
> -	bool remove_padding;   /* Does the GPU have to remove padding,
> -				* or can we do hide padding via bytesperline.
> -				*/
> +	u32 remove_padding;  /* Does the GPU have to remove padding,
> +			      * or can we do hide padding via bytesperline.
> +			      */

checkpatch is wrong here, bool is correct to use and is just fine.

thanks,

greg k-h
