Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC90223A4
	for <linux-staging@lists.linux.dev>; Tue, 12 Jul 2022 18:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE75EC3411C;
	Tue, 12 Jul 2022 18:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657650614;
	bh=anlDKDka6DFB/QifmAHbo9FqGSG5XlLAabqil1wRujg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fID7Rpz+CtcSJB9DB8/KK28EAXEvGw6DaphbrLvUU8fq0R94JM5jqEpkf1rNX634o
	 W8ojRefX5TR+IGaPn5m+YeI+MIX5hSvslDoiUcuiLJAiaBdLUQuE7N8sHsv5KUCIKo
	 0QIkZy5qKDyRdCmeB0oxWWIph/Eaec729s38KfIk=
Date: Tue, 12 Jul 2022 20:30:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Joel Slebodnick <jslebodn@redhat.com>
Cc: linux-kernel@vger.kernel.org, f.fainelli@gmail.com, rjui@broadcom.com,
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	nsaenz@kernel.org, athierry@redhat.com, gustavoars@kernel.org,
	keescook@chromium.org, stefan.wahren@i2se.com, gascoar@gmail.com,
	ojaswin98@gmail.com, len.baker@gmx.com, jakobkoschel@gmail.com,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, jsavitz@redhat.com
Subject: Re: [PATCH] remove custom return values in vc04_services
Message-ID: <Ys29s/02Km/FQwUv@kroah.com>
References: <20220712181928.17547-1-jslebodn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220712181928.17547-1-jslebodn@redhat.com>

On Tue, Jul 12, 2022 at 02:19:28PM -0400, Joel Slebodnick wrote:
> Remove all instances of enum vchiq_status from vc04_services and replace
> them with regular linux error values.
> 
> VCHIQ_SUCCESS replaced with 0, VCHIQ_ERROR replaced with -EINVAL, and
> VCHIQ_RETRY replaced (for the most part) with -EINTR as VCHIQ_RETRY
> often is returned from an interruptable function call.
> 
> The exceptions to this are vchiq_send_remote_use() and
> vchiq_send_remote_use_active() as they return a VCHIQ_RETRY but have
> been changed to return -EINVAL instead of -EINTR. This is because when
> the conn_state is VCHIQ_CONNSTATE_DISCONNECTED, the state is not valid
> to continue on in the function
> 
> Signed-off-by: Joel Slebodnick <jslebodn@redhat.com>
> ---
>  .../bcm2835-audio/bcm2835-vchiq.c             |  10 +-
>  .../include/linux/raspberrypi/vchiq.h         |  67 +++---
>  drivers/staging/vc04_services/interface/TODO  |   5 -
>  .../interface/vchiq_arm/vchiq_arm.c           | 122 +++++-----
>  .../interface/vchiq_arm/vchiq_arm.h           |  12 +-
>  .../interface/vchiq_arm/vchiq_core.c          | 220 +++++++++---------
>  .../interface/vchiq_arm/vchiq_core.h          |  18 +-
>  .../interface/vchiq_arm/vchiq_dev.c           |  38 ++-
>  .../interface/vchiq_arm/vchiq_ioctl.h         |   8 +-
>  9 files changed, 238 insertions(+), 262 deletions(-)
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
