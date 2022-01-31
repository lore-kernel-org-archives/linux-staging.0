Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9451629CA
	for <linux-staging@lists.linux.dev>; Mon, 31 Jan 2022 13:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F90C340E8;
	Mon, 31 Jan 2022 13:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1643634119;
	bh=r0W8Gj/VL3LXX5y5QJNhuybggxhVx0F7D/TQcGOrsn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iCqMjBWhHVpaHTpMpKzjTAxPNswIfnV+8/OlzNjb1ItJsuA4E0kYTEZ49uCTv+Ssj
	 uVSW/yvSU42kCZI2V1FizRq5xlVl/D7Cn1nDrTlvkrwGYxrbTjYB3bBI5DFIvXv9aP
	 KUp99RujR+d9+IvTpLsuP6pywarLQK8hrFKSOpQU=
Date: Mon, 31 Jan 2022 14:01:56 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Subject: Re: [PATCH] staging: r8188eu: clean up phy_BB8188E_Config_ParaFile
Message-ID: <YffdxLhsijWz957M@kroah.com>
References: <20220130182249.712034-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220130182249.712034-1-martin@kaiser.cx>

On Sun, Jan 30, 2022 at 07:22:49PM +0100, Martin Kaiser wrote:
> Clean up the code of the phy_BB8188E_Config_ParaFile function.
> 
> Replace a TAB with a space in the function definition.
> 
> Put the HAL_STATUS_FAILURE on the right-hand side of the comparisons.
> 
> Simplify the error handling. Exit directly if we detect an error.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
> This should be applied on top of
> [PATCH] staging: rt8188eu: Remove dead code.
> 
>  drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 20 ++++++-------------
>  1 file changed, 6 insertions(+), 14 deletions(-)

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

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
