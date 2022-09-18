Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E7E7C
	for <linux-staging@lists.linux.dev>; Sun, 18 Sep 2022 10:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50BA2C433C1;
	Sun, 18 Sep 2022 10:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1663495882;
	bh=UlR5dBix/IuCjGxnhgTmNBRfAJ+7qdujzaxYcQry+ZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iSmoDIBqrB2MEBO2dQJ5BbtpvqQXpH4Td1GvoOuLPcjEIvLBVNaYya8rbQKQBoVj+
	 dv13HQy8Va8ESM1Vg5w7E7G6y2QwNk9mq0PL6eshXN+v56Ah0a5hBGVOS1L24UiX9g
	 hYbNQpw8lyS6xn/3i+Hrotw2nTPnZKE3xwJi8Vd0=
Date: Sun, 18 Sep 2022 12:11:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Joash Naidoo <joash.n09@gmail.com>
Cc: larry.finger@lwfinger.net, phil@philpotter.co.uk, paskripkin@gmail.com,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: r8188eu: fix too many leading tabs
Message-ID: <Yybu5ntT7uySBXsE@kroah.com>
References: <20220918050728.3746-1-joash.n09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220918050728.3746-1-joash.n09@gmail.com>

On Sun, Sep 18, 2022 at 07:07:28AM +0200, Joash Naidoo wrote:
> Coding style fix. Fix too many leading tabs and line length. Convert
> __constant_htons to htons
> 
> Signed-off-by: Joash Naidoo <joash.n09@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_br_ext.c | 66 ++++++++++++-----------
>  1 file changed, 35 insertions(+), 31 deletions(-)

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
