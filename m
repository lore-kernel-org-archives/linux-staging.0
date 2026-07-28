Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7B12D8378;
	Tue, 28 Jul 2026 07:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785224021; cv=none; b=oxcKme2AO71nXAGwt1w6hvTyq5Emrc0oxoCAnNnOr2CSVROuhedbLgLYyETD+fH7kgM/ZnDYNLhi5GE0Za1V9oYpSZcKrraRHb52fmE6ShAVSdXa947jz1+Xr2DUPrfW9GQr/3mg38BgtkN2BE8vAkO5RNzpc6rx7rhd7gsWLDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785224021; c=relaxed/simple;
	bh=YTiI/5eEUMLgnygBWAZM9iWQIPNLnRkCDUAT/gXZ26M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0QKblVSaymVDsUDdOjS9JdWwPTG3beBcgOS4PtBvcIVuN7cyqc1UgXC4IhMlGXKun8w2zQj4OhaEiTO91FFnTKyAAaHpQEsTe3DTWFKsBS+NvS3iKDXQcwqk/Ifn41kFJJBcE39jdwiiXe2F19PM0GuyG1FFje+iOaFjVv6JBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GFbLkarK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GFbLkarK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2261F000E9;
	Tue, 28 Jul 2026 07:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785224020;
	bh=+XRwqzs3kYlc9d8MqELzq30bRfCm/VyOvrox1rbFMkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GFbLkarKEEMpBq6HvxM5z1lAKiC2cpPmIDElYyGJPOxU/V4EXNre0svBNJPiUdb+6
	 RQbW6ntwN4hNIJVxoY8AcNCcMsR5he6lZ4x6rc1xTy3fa2Af7MuXwkaeUFgqYOzcKj
	 hlYGOdfKfBkiWesv2sybH9Ger5diu1LGlEik5X+k=
Date: Tue, 28 Jul 2026 09:33:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Gerrit Diersmann <gerrit@diersmann.eu>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: video: remove unnecessary blank line
 before closing brace
Message-ID: <2026072807-humvee-amplifier-5b1b@gregkh>
References: <20260723213522.86962-1-gerrit@diersmann.eu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723213522.86962-1-gerrit@diersmann.eu>

On Thu, Jul 23, 2026 at 11:35:22PM +0200, Gerrit Diersmann wrote:
> Signed-off-by: Gerrit Diersmann <gerrit@diersmann.eu>
> ---
>  drivers/staging/most/video/video.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
> index 78234620d..5c34f93a0 100644
> --- a/drivers/staging/most/video/video.c
> +++ b/drivers/staging/most/video/video.c
> @@ -439,7 +439,6 @@ static int comp_register_videodev(struct most_video_dev *mdev)
>  	mdev->vdev->release = video_device_release;
>  
>  	return 0;
> -
>  }
>  
>  static void comp_unregister_videodev(struct most_video_dev *mdev)
> -- 
> 2.55.0
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
