Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7BF1A9B4D
	for <linux-staging@lists.linux.dev>; Tue, 28 Jan 2025 15:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738078259; cv=none; b=QQSfjT9wWs3kd/nSsjaszzGhToOQUGGY//cEo4ofAKys+P78/QicgJMSzsCbFTWn6bp5fQ/2neo+dD/RjYyuRarlkmVBwGClbcpRht3SF8Z3tXOuLXNQggWdpUXo/YoAd1ccWlhlQ4k8sDHZxE9uQuhpqZQlbpuLL+RA9HAbTvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738078259; c=relaxed/simple;
	bh=rcTyxeMdeU3Y9KoLMG1z6VlTNGkXV5qA3YydcjP7J9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMWE9Yd1w6AMzlVsZAZE8LLiik7OmEezkHyhZvJq+a3gacP6WXcGlyzjOfsXWNw2cDiM1l2zYVXzvbDS06FqwXwf3Fj1Sf48VFTWMVN0wl6yP2aDawsqEH3VYZ0JMarww+xqEPXOoX5b1VSG3F0IWyAksFogspTXRmuC8UVd/PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YnI3Xw+n; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YnI3Xw+n"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C13CF3A4;
	Tue, 28 Jan 2025 16:29:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738078189;
	bh=rcTyxeMdeU3Y9KoLMG1z6VlTNGkXV5qA3YydcjP7J9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YnI3Xw+nL1RB80V4H4KMiaiiOr9KvkWy3fBvL4Ub85NYPx5aLQ/6D5/NMTRQbDfio
	 eitcmC9/2F11D6TmjKZHjousudV4lRlOtD1sa887LD5rSvjGvB+A8gspXONQXfNjXr
	 tvTrthme6nGw+8MwcVMZGLM+JrRFoT3ALNBN0uoI=
Date: Tue, 28 Jan 2025 17:30:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH] staging: bcm2835-camera: drop vb2_ops_wait_prepare/finish
Message-ID: <20250128153044.GC12673@pendragon.ideasonboard.com>
References: <7df01ba7-5d2e-48fd-91ff-3c0d9973b183@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7df01ba7-5d2e-48fd-91ff-3c0d9973b183@xs4all.nl>

Hi Hans,

Thank you for the patch.

On Tue, Jan 28, 2025 at 04:07:32PM +0100, Hans Verkuil wrote:
> Since commit 88785982a19d ("media: vb2: use lock if wait_prepare/finish
> are NULL") it is no longer needed to set the wait_prepare/finish
> vb2_ops callbacks as long as the lock field in vb2_queue is set.
> 
> Since the vb2_ops_wait_prepare/finish callbacks already rely on that field,
> we can safely drop these callbacks.
> 
> This simplifies the code and this is a step towards the goal of deleting
> these callbacks.
> 
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Note that once we merge a driver for the ISP, this driver will likely be
removed.

> ---
>  drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> index deec33f63bcf..b839b50ac26a 100644
> --- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> +++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> @@ -658,8 +658,6 @@ static const struct vb2_ops bcm2835_mmal_video_qops = {
>  	.buf_queue = buffer_queue,
>  	.start_streaming = start_streaming,
>  	.stop_streaming = stop_streaming,
> -	.wait_prepare = vb2_ops_wait_prepare,
> -	.wait_finish = vb2_ops_wait_finish,
>  };
> 
>  /* ------------------------------------------------------------------

-- 
Regards,

Laurent Pinchart
