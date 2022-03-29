Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B592572
	for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 16:07:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89C2DC3410F;
	Tue, 29 Mar 2022 16:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1648570057;
	bh=2mAImiyju7BSQdfrIPm8kVdDd0aZCmkuZyMEOcwPSSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PUZiuoizGGKnuW2jlFW4wWgllNUKi0tWsWXbMEnNphmpgpaxc3LNcb2BOtPCWnay2
	 whXNtL1a7gOn8fAOpBdqFoWY7S1T1ItqXVPztDXs6mvK8wLUcUpPzJzXM0dBMWBsdv
	 BXaC6rWF2wmOpzuTIgS91KAJkI6g31fB7XYrmK1c=
Date: Tue, 29 Mar 2022 18:07:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nam Cao <namcaov@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750fb: fix CamelCase name style
Message-ID: <YkMuwcM36pkpiLLL@kroah.com>
References: <YjXLp2pdGUQIWcFg@kroah.com>
 <20220319125629.21405-1-namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220319125629.21405-1-namcaov@gmail.com>

On Sat, Mar 19, 2022 at 01:56:30PM +0100, Nam Cao wrote:
> Convert all names in CamelCase style to appropriate styles as suggested
> by checkpatch.pl.
> 
> Signed-off-by: Nam Cao <namcaov@gmail.com>
> ---
> Changes in V2:
>   - Add patch description
> 
>  drivers/staging/sm750fb/ddk750_dvi.c    |  20 +--
>  drivers/staging/sm750fb/ddk750_mode.c   |  90 ++++++-------
>  drivers/staging/sm750fb/ddk750_mode.h   |   2 +-
>  drivers/staging/sm750fb/ddk750_power.h  |  10 +-
>  drivers/staging/sm750fb/ddk750_sii164.c | 172 ++++++++++++------------
>  drivers/staging/sm750fb/ddk750_sii164.h |  40 +++---
>  drivers/staging/sm750fb/sm750.c         | 104 +++++++-------
>  drivers/staging/sm750fb/sm750.h         |  56 ++++----
>  drivers/staging/sm750fb/sm750_accel.c   | 149 ++++++++++----------
>  drivers/staging/sm750fb/sm750_accel.h   |  42 +++---
>  drivers/staging/sm750fb/sm750_cursor.c  |  14 +-
>  drivers/staging/sm750fb/sm750_cursor.h  |  12 +-
>  drivers/staging/sm750fb/sm750_hw.c      |  62 ++++-----
>  13 files changed, 387 insertions(+), 386 deletions(-)
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
