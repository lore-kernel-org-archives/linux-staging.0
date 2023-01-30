Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836C93C13
	for <linux-staging@lists.linux.dev>; Mon, 30 Jan 2023 16:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B45C433D2;
	Mon, 30 Jan 2023 16:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675095952;
	bh=2algA3To7DS6kKYjYO+O+2oaJYiq9Ps5Mt4pAyK0+Sg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g5CCXh09MepBHm624Eyvsfb6IC8eieB9rnX9MAi4NIIQQRjUqyyG9pdN8BIF97JlF
	 nK9WToOrVU8hNq6zdUfEj3FRzEZfoGevezPAdpdHgWdq4lzZA+Wzrz813YTQrOA+AY
	 t4gHku4091MemWcNLGtsOwOQ6KZZar4xai5Ky10c=
Date: Mon, 30 Jan 2023 17:25:49 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jongwoo Han <jongwooo.han@gmail.com>
Cc: f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vc04_services: mmal-vchiq: fix typo in comment
Message-ID: <Y9fvjd2fntMIRCEA@kroah.com>
References: <20230130160548.45879-1-jongwooo.han@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130160548.45879-1-jongwooo.han@gmail.com>

On Tue, Jan 31, 2023 at 01:05:48AM +0900, Jongwoo Han wrote:
> Correct typo from 'witin' to 'within' in comment.
> 
> Signed-off-by: Jongwoo Han <jongwooo.han@gmail.com>
> ---
>  drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> index 294b184d4..e318f3609 100644
> --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> @@ -245,7 +245,7 @@ static void event_to_host_cb(struct vchiq_mmal_instance *instance,
>  /* workqueue scheduled callback
>   *
>   * we do this because it is important we do not call any other vchiq
> - * sync calls from witin the message delivery thread
> + * sync calls from within the message delivery thread
>   */
>  static void buffer_work_cb(struct work_struct *work)
>  {
> -- 
> 2.34.1
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
