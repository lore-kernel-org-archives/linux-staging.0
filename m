Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E55B15B4
	for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 10:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bsSAxL/K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455BAC433C9;
	Wed, 25 Oct 2023 10:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698230512;
	bh=uSZTmaMWwi3YxyWUS0SaODVfbUXi/a6n+qV3uVp/UT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bsSAxL/KrkdfgK4H21T6hH24Ip+jxFjDmYFmqii8/hJpJAbu4FlK9y2c2ndwcBTAQ
	 1UFLZ6NOvVB7q90/HEB5ld26QERouPMYxAlpXSZvDMulhu84ViiiwmK4SauAIf06h7
	 2wj/mpv+CF7uPO/OfFhqCjDL0A/Hz1xYMc5f9osE=
Date: Wed, 25 Oct 2023 12:41:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Wiktor Grzywacz <wiktor.grzywacz@3mdeb.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Signed-off-by: Wiktor Grzywacz
 <wiktor.grzywacz@3mdeb.com>
Message-ID: <2023102522-eggplant-elm-fabd@gregkh>
References: <20231025102614.125291-1-wiktor.grzywacz@3mdeb.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025102614.125291-1-wiktor.grzywacz@3mdeb.com>

On Wed, Oct 25, 2023 at 12:24:20PM +0200, Wiktor Grzywacz wrote:
> staging: rtl8723bs: fix checkpatch space before tab warning
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_dm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

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

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
