Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62436207A2E
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 12:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729081777; cv=none; b=e66IKq8C5/Yeq/C4WdOilTNPYVzJv7KbOG7K+0pPs0bVKGNUv15NljVJGdUd4GHmWG98trWY8WPHuTKtjR6Cyo43dX0It9zsFfuu+tGJ+UWglBoLRZdJd07EYTMiAjfG2EsY6yuMVSNw2LBi/slYgmkRNMPppSG9ZVof1vCxqRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729081777; c=relaxed/simple;
	bh=9JFJaOwyE78LFBtrvAEjzPmYBTuXRQE4mU5L7RAx0mY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLDEpO9r/9l0j44Ld/4+WSyqIyJIPnvJVpfU4vLXP1VcrxZo8+eMhdOGVBKJ0QqlQZXNphcmriFcu0PjQJElewO4AddNySdxCqWl6PLvF3l/WoKth3QHqNPVFKVvuF8fhwuxP6L3gjwWiZ8ucQcoy+HUH17tAP2y7LJCX+dYjVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oYv4+CB2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oYv4+CB2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B9F3C4CEC5;
	Wed, 16 Oct 2024 12:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729081776;
	bh=9JFJaOwyE78LFBtrvAEjzPmYBTuXRQE4mU5L7RAx0mY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oYv4+CB2yP1AegeotQtTzNBcG1sXR5lfqWjYFSj1syYEwAuXMSvXvc6d7ksLRffF4
	 xSKLRm1plzeeWF0zt4ySLgAF32YqL8daEQ8qvNG/QgOCJ9TP6yoMS1go+rGZcTNLr9
	 rgsL27wMaWmrb02PuGukx6FmKz7d7n070yInNi78=
Date: Wed, 16 Oct 2024 14:29:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Aymen Khalfa <a.khalfa.1012@gmail.com>
Cc: hdegoede@redhat.com, Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] drivers: staging: rtl8723bs: Replace msleep() with
 usleep_range().
Message-ID: <2024101607-ditzy-magical-5683@gregkh>
References: <20241016111210.2469193-1-a.khalfa.1012@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016111210.2469193-1-a.khalfa.1012@gmail.com>

On Wed, Oct 16, 2024 at 01:12:10PM +0200, Aymen Khalfa wrote:
> -Fix checkpatch.pl warning by replacing msleep() with usleep_range() as
> recommended in the documentation.
> 
> Signed-off-by: Aymen Khalfa <a.khalfa.1012@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> index dbfcbac3d855..26e125f556e9 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> @@ -429,7 +429,7 @@ s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
>  			err = -1;
>  			break;
>  		}
> -		msleep(1);
> +		usleep_range(1000, 2000);
>  	}
>  
>  	return err;
> @@ -591,7 +591,7 @@ void LPS_Leave_check(struct adapter *padapter)
>  		if (jiffies_to_msecs(jiffies - start_time) > 100)
>  			break;
>  
> -		msleep(1);
> +		usleep_range(1000, 2000);
>  	}
>  }
>  
> -- 
> 2.34.1
> 
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

- You sent a patch that has been sent multiple times in the past, and is
  identical to ones that have been rejected.  Please always look at the
  mailing list traffic to determine if you are duplicating other
  people's work.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
