Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AAD7F
	for <linux-staging@lists.linux.dev>; Fri, 21 Jul 2023 04:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB34AC433C7;
	Fri, 21 Jul 2023 04:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1689912703;
	bh=r6mbA29dSgjLTK5ZkBYqw/al6NFHb8yCLPniDAa5aso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=teSdvU7fZ21iCoLIEakv35HJaZGC3ROqEbp77jvREfZzGwXWpdKOweIsVbeIHJ6aL
	 Fv7lD4zu2Yi2qeYKx5Pm8OHhNi+rhM2evBfuCrcbNV1kJ4WitB3U8R5CbCgxa31fPf
	 0ZPTtjB3Ygynoyv8g1vrFeBAb37+Uk8TnDyYlup8=
Date: Fri, 21 Jul 2023 06:11:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sergey Rozhnov <rozhnov.sergey.89@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8712: Remove redundant braces in if
 statements
Message-ID: <2023072157-expediter-catalyze-8ecc@gregkh>
References: <ZLnoBYlsTiLixTah@terra>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZLnoBYlsTiLixTah@terra>

On Fri, Jul 21, 2023 at 06:05:57AM +0400, Sergey Rozhnov wrote:
> Extract masked value to improve readability, apply fix suggested by checkpatch.
> ---
>  drivers/staging/rtl8712/ieee80211.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8712/ieee80211.c b/drivers/staging/rtl8712/ieee80211.c
> index 7d8f1a29d18a..fe53453ab9a7 100644
> --- a/drivers/staging/rtl8712/ieee80211.c
> +++ b/drivers/staging/rtl8712/ieee80211.c
> @@ -63,8 +63,9 @@ uint r8712_is_cckrates_included(u8 *rate)
>  	u32 i = 0;
>  
>  	while (rate[i] != 0) {
> -		if ((((rate[i]) & 0x7f) == 2) || (((rate[i]) & 0x7f) == 4) ||
> -		    (((rate[i]) & 0x7f) == 11) || (((rate[i]) & 0x7f) == 22))
> +		u8 val = rate[i] & 0x7f;
> +
> +		if (val == 2 || val == 4 || val == 11 || val == 22)
>  			return true;
>  		i++;
>  	}
> -- 
> 2.40.1
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

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/process/submitting-patches.rst and resend
  it after adding that line.  Note, the line needs to be in the body of
  the email, before the patch, not at the bottom of the patch or in the
  email signature.

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
