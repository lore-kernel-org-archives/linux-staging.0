Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8580C7FF
	for <linux-staging@lists.linux.dev>; Fri,  5 Aug 2022 08:36:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4448C433C1;
	Fri,  5 Aug 2022 08:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1659688605;
	bh=996x4MLdOWeDhTT9hrni14uHtO+Hp28DkrLdhwmkeUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=02fXsVlK151lgx6auA0mExQ7V9KY31TP+VyoijWvmrsby94+LXYJUcnXsoRpcmwDc
	 BB1vE19AsiWExN0qOlh3xW23ZVEGj4mcrkKCi4Qx/DxxYVF+Joad/nmbnFUNMjWvEd
	 61r8H1NXvtcyFUFEC0VoD4ybdl55hZI3pUGLXEXc=
Date: Fri, 5 Aug 2022 10:36:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Simone Serra <serrazimone@gmail.com>
Cc: fabioaiuto83@gmail.com, soumya.negi97@gmail.com, hdegoede@redhat.com,
	straube.linux@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fixed checkpatch warnings
Message-ID: <YuzWmlHVioUGIVfP@kroah.com>
References: <20220805080538.230906-1-serrazimone@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220805080538.230906-1-serrazimone@gmail.com>

On Fri, Aug 05, 2022 at 10:05:38AM +0200, Simone Serra wrote:
> Fixed all checkpatch warnings
> 
> Signed-off-by: Simone Serra <serrazimone@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_efuse.c | 25 +++++++++++++++-------
>  1 file changed, 17 insertions(+), 8 deletions(-)
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
