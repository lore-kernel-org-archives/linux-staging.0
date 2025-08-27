Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E36301010
	for <linux-staging@lists.linux.dev>; Wed, 27 Aug 2025 12:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756298910; cv=none; b=YvXkNpCntYZhiEmLhiaXu/f6ZGiXUCLIFszMaWYJGnvU+qSaKz/yo7/AeAsJJ8OuOZnLJkg4YgyaPr6Ubo1bmCaDKqrsyAG5MmS3l/THsDcW8vhi1vZuZESNheNLTU4083iHx5x7Za+eIT7QbMW0zjbr+VA57/RrjYYicuJw5OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756298910; c=relaxed/simple;
	bh=e5mQpwMdmJzV0x5VzHrH/u+0doQo9DSdnKqJBUqGllE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JmzYEMagerVDiL1hFVOGtlDJ1iaqneCTCpWIKiw2j/DQPfcCh9TKBdGu59Q/IegdAN88WV3L37G+vy90u2vN0WH4LGhaXgof8V/JQ/ZWU4qxxOxm44jrUSh9i7ooat6/giuhN4y/RlqT3jMOFm1WurdcmFLil9kRQHuVfrtiMtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uT7LdAvY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uT7LdAvY"
Received: from pendragon.ideasonboard.com (unknown [213.244.170.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5A2572093;
	Wed, 27 Aug 2025 14:47:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756298842;
	bh=e5mQpwMdmJzV0x5VzHrH/u+0doQo9DSdnKqJBUqGllE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uT7LdAvYUb28rsFJuYBrrAA85xLXirLV6ro2puzhkbTv7rQ4efpTFn1oXLQLw7kBW
	 KtuHFsmuV8HizrLY3VrcXmYcHDC3fEPyp7PN4uEcit36sQnvEHARpkVIKNJNwqdGLL
	 Pb9pDUSfN7JV0dhR6SpvWDwAOTDblsmqdbu6XzE4=
Date: Wed, 27 Aug 2025 14:48:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-list@raspberrypi.com,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 4/5] media: staging: Drop bcm2835-camera driver
Message-ID: <20250827124803.GH5650@pendragon.ideasonboard.com>
References: <20250827-vchiq-destage-v1-0-5052a0d81c42@ideasonboard.com>
 <20250827-vchiq-destage-v1-4-5052a0d81c42@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250827-vchiq-destage-v1-4-5052a0d81c42@ideasonboard.com>

Hi Jai,

Thank you for the patch.

On Wed, Aug 27, 2025 at 11:54:11AM +0530, Jai Luthra wrote:
> The bcm2835-camera driver is replaced by the V4L2 bcm2835-unicam driver
> that is already upstream. So drop it from staging.
> 
> This also simplifies destaging of VCHIQ MMAL, by reducing the users of
> the MMAL API (this driver is one of them).
> 
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/staging/vc04_services/Kconfig              |    2 -
>  drivers/staging/vc04_services/Makefile             |    1 -
>  .../staging/vc04_services/bcm2835-camera/Kconfig   |   13 -
>  .../staging/vc04_services/bcm2835-camera/Makefile  |    6 -
>  drivers/staging/vc04_services/bcm2835-camera/TODO  |   17 -
>  .../vc04_services/bcm2835-camera/bcm2835-camera.c  | 2012 --------------------
>  .../vc04_services/bcm2835-camera/bcm2835-camera.h  |  142 --
>  .../vc04_services/bcm2835-camera/controls.c        | 1399 --------------
>  8 files changed, 3592 deletions(-)

-- 
Regards,

Laurent Pinchart
