Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0A95C84
	for <linux-staging@lists.linux.dev>; Sun,  9 Oct 2022 18:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C39AC433D6;
	Sun,  9 Oct 2022 18:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1665339550;
	bh=E+37OfAeNq/v4ORcUPd/QiwJp00FAZ197jEtoG9UWDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jG12PMZaSakpUAjPtgFtzcxWOYDy3CfU2+nKndAi6vdRgjJUXb5/XuZw/EmmphTcH
	 ALuSZaT59HP+aZfsbzqDq2Ti1X/xF1Z8uHbrSNTodSgZ8i/UGuMG5tnbK8IRqj/OoD
	 HepWvzabZD5JTNsm5WPZgrfBKJLg+O4/cz9n7kZE=
Date: Sun, 9 Oct 2022 20:19:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Valentin Vidic <vvidic@valentin-vidic.from.hr>
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8192e: cleanup if statements
Message-ID: <Y0MQyCBItOcMvjh/@kroah.com>
References: <20221009160534.922592-1-vvidic@valentin-vidic.from.hr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221009160534.922592-1-vvidic@valentin-vidic.from.hr>

On Sun, Oct 09, 2022 at 06:05:34PM +0200, Valentin Vidic wrote:
> Fix checkpatch warnings for if statements in rtl_wx.c:
> 
> CHECK: Comparison to NULL could be written "!expr"
> CHECK: Using comparison to true is error prone
> CHECK: braces {} should be used on all arms of this statement
> CHECK: Unbalanced braces around else statement
> CHECK: Alignment should match open parenthesis
> 
> Signed-off-by: Valentin Vidic <vvidic@valentin-vidic.from.hr>
> ---
> v2: rebase and update description
> 
>  drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)

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
