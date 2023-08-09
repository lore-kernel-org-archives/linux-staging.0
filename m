Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FB153B7
	for <linux-staging@lists.linux.dev>; Wed,  9 Aug 2023 09:46:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E67C433C8;
	Wed,  9 Aug 2023 09:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691574394;
	bh=oOlt+ovyRnUTnUysEvSZ+7yMPDKU2CWKrUtdAYUVWCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CP6bwH9+vyQZhRgXlABiu/1G+FsVmds9HjlEcQmKQ6PgCAjEbRJVCfO7OyTY5KxC+
	 oy2+nFCLaHMtL2Kw26pLwjWzuJ0BhGbz6YqyxoNsYvV7UHuNiiWcvY92U1MUInVeOZ
	 WS1jtbhfOYIatYZ139mMwzgEV0HwZefGCvtRQDKc=
Date: Wed, 9 Aug 2023 11:46:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Diogo Silva <diogompaissilva@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: wlan-ng: cfg80211.c: removed unnecessary
 parenthesis to match coding style
Message-ID: <2023080951-escalate-unnamed-e6d4@gregkh>
References: <20230808221339.2667-1-diogompaissilva@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230808221339.2667-1-diogompaissilva@gmail.com>

On Tue, Aug 08, 2023 at 11:12:36PM +0100, Diogo Silva wrote:
> Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
> ---
>  drivers/staging/wlan-ng/cfg80211.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

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
