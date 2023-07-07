Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AA820E0
	for <linux-staging@lists.linux.dev>; Fri,  7 Jul 2023 10:14:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF270C433C7;
	Fri,  7 Jul 2023 10:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1688724879;
	bh=1/6/E53G0FbGVSz+J7qOoWWYVV5mSFGPSyuXBk0aaBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VzDEEmynFfBywYx8zyr6PcosuwdkOQ7avuwSNiCJmbCXA50UCRxHXBSTeNRHimdOy
	 eEotUqkcjmrRoyxT7KPnWoonJnGxwq6oQm6Jwk4eZ3q0lPr2YxmnW1wYdW62skG6/5
	 Gm+GaYHAQ+Lzf1L95JJN0KwHaMcDj/xul6370LrQ=
Date: Fri, 7 Jul 2023 11:12:23 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Tree Davies <tdavies@darkphysics.net>
Cc: philipp.g.hortmann@gmail.com, dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: Rename variable bRegBW40MHz
Message-ID: <2023070701-construct-suave-81d3@gregkh>
References: <ZKYiwwJJxv6Wk1/8@kimchi.darkphysics>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKYiwwJJxv6Wk1/8@kimchi.darkphysics>

On Wed, Jul 05, 2023 at 07:11:15PM -0700, Tree Davies wrote:
> This patch renames variable bRegBW40MHz to breg_bw_40MHz
> to fix checkpatch warning Avoid CamelCase.
> 
> Signed-off-by: Tree Davies <tdavies@darkphysics.net>
> ---
>  drivers/staging/rtl8192e/rtl819x_HT.h     |  2 +-
>  drivers/staging/rtl8192e/rtl819x_HTProc.c | 16 ++++++++--------
>  2 files changed, 9 insertions(+), 9 deletions(-)

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

- You sent multiple patches, yet no indication of which ones should be
  applied in which order.  Greg could just guess, but if you are
  receiving this email, he guessed wrong and the patches didn't apply.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for a
  description of how to do this so that Greg has a chance to apply these
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
