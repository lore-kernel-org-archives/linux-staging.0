Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2863B3FC7
	for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 05:22:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E0D6E61131;
	Thu, 23 Sep 2021 05:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1632374569;
	bh=RlescTfklhkblJzVAvHDx/N54PE3ryTXb0xroiNyryE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rx1sympk/3euyzBFFPaSzrQgeUYkqfkU40Cq1+W2SK5fBa642He8OVpqqr8QP/8Wj
	 Zy23P6v8Xmr+nYLNmiWhcS5JCySusMA6TduNvcZCYLvGQONbIJXN4LHHThgyMDG3eM
	 B8X5Bhm3FJckehz/Pg3vpHWlInED//KoK/RnCFz8=
Date: Thu, 23 Sep 2021 07:22:20 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>,
	Yujia Qiao <rapiz@foxmail.com>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	Madhumitha Prabakaran <madhumithabiw@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vt6655: Replace camel case variables
Message-ID: <YUwPDP2EeyfG6R6/@kroah.com>
References: <20210922215026.572424-1-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210922215026.572424-1-tomm.merciai@gmail.com>

On Wed, Sep 22, 2021 at 11:50:24PM +0200, Tommaso Merciai wrote:
> Work in progress: replace camel case variables.
> 
> Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> ---
>  drivers/staging/vt6655/baseband.c | 50 +++++++++++++++----------------
>  1 file changed, 25 insertions(+), 25 deletions(-)

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
  kernel file, Documentation/SubmittingPatches for a description of how
  to do this so that Greg has a chance to apply these correctly.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what is needed in order to
  properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what a proper Subject: line should
  look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
