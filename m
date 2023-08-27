Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C33111D
	for <linux-staging@lists.linux.dev>; Sun, 27 Aug 2023 18:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C07D6C433C7;
	Sun, 27 Aug 2023 18:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1693162796;
	bh=JZkw1g6LL/Pl/Mcae3aUBoUUkDqbWUD4FUhrL/4kkF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vn/XPuALsoYO4TokQCPK8SfHSXvfPfZl2aVxmc3zECXh9vHuzcO3Zw/j3Q03F64s7
	 SYI/a0LK7wtDrsmxKdHRyQWmvXqO8ZMP73yZ/O6DrUuiZqm/KSdLeT9+ojUViu2c1+
	 HaObhM5DS/cxvWdarIpykwaEEXvrFue0jLjpdco8=
Date: Sun, 27 Aug 2023 20:59:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexon Oliveira <alexondunkan@gmail.com>
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/4] staging: vme_user: fix checks reported in vme_fake.c
Message-ID: <2023082741-presume-aluminum-588c@gregkh>
References: <cover.1693082101.git.alexondunkan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1693082101.git.alexondunkan@gmail.com>

On Sat, Aug 26, 2023 at 06:05:14PM -0300, Alexon Oliveira wrote:
> The goal of this series is to fix all warnings related to
> aligment of open parenthesis, lines not ending with '(',
> unnecessary blank lines and unnecessary space after a cast
> in the vme_fake.c file, as reported by checkpatch to adhere
> to the Linux kernel coding-style guidelines.
> 
> Alexon Oliveira (4):
>   staging: vme_user: fix check alignment of open parenthesis in
>     vme_fake.c
>   staging: vme_user: fix check lines not ending with '(' in vme_fake.c
>   staging: vme_user: fix check unnecessary blank lines in vme_fake.c
>   staging: vme_user: fix check unnecessary space after a cast in
>     vme_fake.c
> 
>  drivers/staging/vme_user/vme_fake.c | 72 ++++++++++++++---------------
>  1 file changed, 35 insertions(+), 37 deletions(-)
> 
> -- 
> 2.41.0
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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
