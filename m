Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED1B2C81
	for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 10:29:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 835AA6103B;
	Mon, 18 Oct 2021 10:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1634552981;
	bh=Jcbd/etLUj/HfkH8N0e/t0Az9xZmyi7KDPMq9txQmdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CePeyJnzwLvCgD5QZ+i5f9z05hRqHI6cxEW4cAwCrO7qF3m/0SEk9fF959Jb0KS4K
	 /BmqY9yR84VjPXWaI+9B9fhnzWgIHSOIvKzo6crbdRxq/0/k6UDSoLjfnv+UJdkcWW
	 iH0TI2MiZ3WKWq7qS2MPc/TnrH8igaptyCMwaypk=
Date: Mon, 18 Oct 2021 12:29:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Karolina Drobnik <karolinadrobnik@gmail.com>
Cc: outreachy-kernel@googlegroups.com, forest@alittletooquiet.net,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: vt6655: Rename byPreambleType field
Message-ID: <YW1Mkse3AgUsyvWx@kroah.com>
References: <20211018101713.3599-1-karolinadrobnik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018101713.3599-1-karolinadrobnik@gmail.com>

On Mon, Oct 18, 2021 at 11:17:13AM +0100, Karolina Drobnik wrote:
> Drop Hungarian notation prefix in `byPreambleType` member of
> struct vnt_private. Change it to use snake case.
> 
> Fix issue detected by checkpatch.pl:
>   CHECK: Avoid CamelCase: <byPreambleType>
> 
> Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
> ---
>  drivers/staging/vt6655/baseband.c    |  2 +-
>  drivers/staging/vt6655/device.h      |  2 +-
>  drivers/staging/vt6655/device_main.c |  8 ++---
>  drivers/staging/vt6655/rxtx.c        | 50 ++++++++++++++--------------
>  4 files changed, 31 insertions(+), 31 deletions(-)
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
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
