Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BEB8F48
	for <linux-staging@lists.linux.dev>; Wed, 26 Nov 2025 17:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764177877; cv=none; b=ilSepolnimleLKkGBssBPLU0AaV+3VnMsdDFuQ0fSSoJFfzGXMcRjX2vhXcZaZ0Ya7hUT7g/ydaTPmhqUfDfXfwuotHfBdUmd6IO+GFkv5qCLEMyLTx4o0PdW3Q+4wWluGH0L8xN5IzVRIhPeDMk2PVC0rZDbFV4lXX3hFh983w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764177877; c=relaxed/simple;
	bh=uvNUXKvkhF2sPAXmif15JQYgnKu2DwdPyW/hMhYDELo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f+sBu1I9sHImWONEauxSQE9ulXk/oZ+LIeBfli3ijJtSfzFkQviF49fuaz854vdly/ubS5DSkLvDmQHbr1JTHzqDG31LfWyKkCdKbHXYhgoC0HsO+cbQPwMzW3247BvcjbpJTPgpJa89XMEGd1vo8IsfCKIFsSmQY9EZM0IMu5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LoL8N5Sm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LoL8N5Sm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C8DAC4CEF7;
	Wed, 26 Nov 2025 17:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764177877;
	bh=uvNUXKvkhF2sPAXmif15JQYgnKu2DwdPyW/hMhYDELo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LoL8N5SmXeSrnA4U3x8F8SJww1rjXIvJDAbLs8U1Ns9UDQU9A/fzR4Uspc2MEoDhW
	 1t+6BR3keW+p6/jrRVdK4nXgsUFoKYlN3kfIJN4KfGVHnX1YD7A7JsamQBcUle2Qdk
	 5Pc52/W9F3U81yc4IF0ruzArnJJF6MX8HIRibxM8=
Date: Wed, 26 Nov 2025 18:24:33 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pavan Kumar Yalagada <pavankumaryalagada@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	dan.carpenter@linaro.org, laurent.pinchart+renesas@ideasonboard.com,
	hverkuil+cisco@kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: most: video: prevent probes during component
 exit
Message-ID: <2025112647-satchel-enjoying-f403@gregkh>
References: <20251126155910.32694-1-pavankumaryalagada@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126155910.32694-1-pavankumaryalagada@gmail.com>

On Wed, Nov 26, 2025 at 10:59:10AM -0500, Pavan Kumar Yalagada wrote:
> Previously, comp_probe_channel() would always add a new device to
> video_devices, even if comp_exit() was running. This caused
> BUG_ON(!list_empty(&video_devices)) in comp_exit() because
> the list could be repopulated during teardown.
> 
> This patch adds a global static flag `comp_exiting`:
> 
> - Set `comp_exiting = true` at the start of comp_exit()
>   to signal shutdown.
> - Check `comp_exiting` at the start of comp_probe_channel()
>   and return -EBUSY if set.
> 
> This prevents new devices from being added while the component
> is exiting, ensuring video_devices stays empty and avoiding
> BUG_ON triggers.
> 
> Signed-off-by: Pavan Kumar Yalagada <pavankumaryalagada@gmail.com>
> ---
>  drivers/staging/most/video/video.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
> index 32f71d9a9cf7..96366b7a0e29 100644
> --- a/drivers/staging/most/video/video.c
> +++ b/drivers/staging/most/video/video.c
> @@ -60,6 +60,8 @@ static inline struct comp_fh *to_comp_fh(struct file *filp)
>  static LIST_HEAD(video_devices);
>  static DEFINE_SPINLOCK(list_lock);
>  
> +static bool comp_exiting;
> +
>  static inline bool data_ready(struct most_video_dev *mdev)
>  {
>  	return !list_empty(&mdev->pending_mbos);
> @@ -453,6 +455,9 @@ static int comp_probe_channel(struct most_interface *iface, int channel_idx,
>  			      struct most_channel_config *ccfg, char *name,
>  			      char *args)
>  {
> +	if (comp_exiting)
> +		return -EBUSY;

This will not work at all.

Also, you need to properly document a v2 patch.

thanks,

greg k-h
