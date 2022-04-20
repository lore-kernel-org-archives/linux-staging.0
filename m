Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE85B1867
	for <linux-staging@lists.linux.dev>; Wed, 20 Apr 2022 16:47:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ED7DC385A0;
	Wed, 20 Apr 2022 16:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1650473223;
	bh=4fRcsXUhyVGIx/AjQuBcKxjrSKJPAxMI3mcZszc6S1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ns/VOAU3hEltoED5s7v6fzhSb0W6hQRhd/5yUdx1pv7ZV8nNNrxsmkd9gpybhTW4A
	 HD0TBIT5tMO+z2aDZIf0Vh/YsMTOWynaCjKWT1cmI3Hrxbx+D0CLzMl2Y1UNWd++fK
	 5NE2BJu1ULUgMZ9OGwE1Pz1GgJQU33dtloYIxbQg=
Date: Wed, 20 Apr 2022 18:47:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Artur Bujdoso <artur.bujdoso@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>
Subject: Re: [PATCH v2] staging: rtl8723bs: remove leftover code for other
 chips
Message-ID: <YmA5BM2Fkie5xMk/@kroah.com>
References: <Yl8bCE8Rjh/w4Ogz@crux>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yl8bCE8Rjh/w4Ogz@crux>

On Tue, Apr 19, 2022 at 10:26:48PM +0200, Artur Bujdoso wrote:
> Clean up unreferenced definitions in hal headers and code.
> 
> Signed-off-by: Artur Bujdoso <artur.bujdoso@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h  |  11 -
>  drivers/staging/rtl8723bs/hal/hal_btcoex.c    |   8 -
>  drivers/staging/rtl8723bs/include/HalVerDef.h |  10 -
>  .../staging/rtl8723bs/include/hal_com_reg.h   | 295 ------------------
>  4 files changed, 324 deletions(-)
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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
