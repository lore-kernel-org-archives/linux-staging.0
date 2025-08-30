Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968D213774D
	for <linux-staging@lists.linux.dev>; Sat, 30 Aug 2025 21:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756589391; cv=none; b=pLDUlPzkyL+fbiwyzJf1d4wS8lubjsjebKLuwyLsaVxL9fBnele2h/PTGwYjOLy9C3669EciA4wiuSahfwwVm/CvxY/oAjLMPLbwS57q0FLBqkbHcIjfouAgxc9aCoCj3bhu8As/PanHATV0MJVvdp1ghowu1Cgz3eydWCNnNxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756589391; c=relaxed/simple;
	bh=nazjNil7c6YoIWTwvr8MF0GJzNNzswGy21FyNw0czQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lRR8oOqVUS7UEhA+G9WshIecTpRqW0khxLQKDKYeW+LvqsEXGPeduGjH50XDcIRJT4f0uaEdig6pwBDsapKc71PrNo/Yt5PACcHPdNseTIG4wiZe42Rvk4IfnWaaSk9Y8RLxxrQi/3E9rX+5VaOI4fboD/DmglinCg8Ctye/AbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=coZsIh5J; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="coZsIh5J"
Received: from pendragon.ideasonboard.com (237.69-130-109.adsl-dyn.isp.belgacom.be [109.130.69.237])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 16DE4337C;
	Sat, 30 Aug 2025 23:28:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756589319;
	bh=nazjNil7c6YoIWTwvr8MF0GJzNNzswGy21FyNw0czQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=coZsIh5JzjfqVisAaGMLyp5r3GM20OUCq708856ovzdu6b8NgKEA/LDIg//jBFcP0
	 mfOCQ3HFvKWfn0LCAMQshiidRtUEWNvZKqdkD+7VF7GwY4qdCh2aWCVsVdy7ikrctI
	 NLu8VHtXbco5TeC5FJpaGl1jWjf8LrXEKYIObNN8=
Date: Sat, 30 Aug 2025 23:29:23 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Masaharu Noguchi <nogunix@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	florian.fainelli@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	dave.stevenson@raspberrypi.com, hverkuil@kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: vc04_services: bcm2835-camera: avoid
 -Wformat-truncation
Message-ID: <20250830212923.GB16364@pendragon.ideasonboard.com>
References: <20250830173850.323897-1-nogunix@gmail.com>
 <20250830173850.323897-3-nogunix@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250830173850.323897-3-nogunix@gmail.com>

On Sun, Aug 31, 2025 at 02:38:50AM +0900, Masaharu Noguchi wrote:
>     - Fix -Wformat-truncation in vidioc_querycap() when composing bus_info.
>     - Use scnprintf() for the prefix and strscpy() for the remainder.
> 
> Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
> ---
>  .../staging/vc04_services/bcm2835-camera/bcm2835-camera.c    | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> index fa7ea4ca4c36..c2788659af12 100644
> --- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> +++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> @@ -874,13 +874,14 @@ static int vidioc_querycap(struct file *file, void *priv,
>  	struct bcm2835_mmal_dev *dev = video_drvdata(file);
>  	u32 major;
>  	u32 minor;
> +	int n;
>  
>  	vchiq_mmal_version(dev->instance, &major, &minor);
>  
>  	strscpy(cap->driver, "bcm2835 mmal", sizeof(cap->driver));
>  	snprintf((char *)cap->card, sizeof(cap->card), "mmal service %d.%d", major, minor);
> -
> -	snprintf((char *)cap->bus_info, sizeof(cap->bus_info), "platform:%s", dev->v4l2_dev.name);
> +	n = scnprintf((char *)cap->bus_info, sizeof(cap->bus_info), "platform:");
> +	strscpy((char *)cap->bus_info + n, dev->v4l2_dev.name, sizeof(cap->bus_info) - n);

The fact that we need such a complicated construct is a sign that
there's something wrong in our APIs. The above code is too complicated
for what it does, making it less readable, more difficult to maintain,
and more bug-prone. I don't know if we need yet another sprintf variant
in the kernel, or something else, but this doens't seem to be what we
need.

>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart
