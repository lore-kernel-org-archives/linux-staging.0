Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCC7168
	for <linux-staging@lists.linux.dev>; Mon, 27 Dec 2021 09:22:37 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 209933200368;
	Mon, 27 Dec 2021 04:22:36 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 27 Dec 2021 04:22:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm2; bh=q7qiVK00vkfD0L+oTvmr95CBjRl
	uunece72Sfc2xehY=; b=Y8KNWRI4rT+4Z6YDi5KEMt+CrMca32F77uMa0Uniaao
	6PMYqv84LWm+Q3mBVlRq0xnssNT+DYFIlJyVUu7x3XwHF1iFpmIMPpEmno7pAE4c
	YdVlQvOiW6DZym/zrL1irnVEPQZoBEXHjhaqZZ80n4Ii1hlKNP5iX/YTeH6esPlY
	n9POIo664nkbHPDRLF5cxRDNRyZefnvrry+5vXF69ecbKs9qciFDyIj8bNTJ95WG
	9O6ZFJhWrO8OUOG6riAIL3yIoVnjfvyjGURywodQAESBoJwbaEse4q5DisMW3KWK
	eq+BTfWtxksiWqaAj/g8wKgFYeAk8oJezmXpdzAsZVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=q7qiVK
	00vkfD0L+oTvmr95CBjRluunece72Sfc2xehY=; b=DASkhHzOtxX0daB0VlE8Mf
	3Cb6n3A/+fLJETPm5+lSknJH1R0H5fU7km5836hOjzKzIlDOdQJWv5bm1O2d7hOI
	GulvjX3v1FZ7JvhoLxK1Z6I7i111uOseUbox8C4pRNuZNhPjHa4xQwLDNnaLjsac
	6sEAf71UfHudmETDvR1VdQiPMWQL1sjZ65I32jPYReHHR5awYdRSpqCyhAnvV4kt
	XXVSkFQ3IX2rhBoxGNd8TKj/+CxkYPirMoL1F0CZiMMYJW2BcMwrGUIohD9xQ+nL
	MxXtfcjx/5D1BjLhz1sX/Mu7sV8UEukcropLwv28Cn3Qeywayou5BaSwELc+W2cw
	==
X-ME-Sender: <xms:24XJYZDhAvolD6aJwoY8_T4sWCiM4i7bstnw0aX-PRIrKTVhAtiP6Q>
    <xme:24XJYXiGlyLBXPLJYxctbniqKGfgXPQu58yslfYBV-JOLOtCLI9gnuirpi7PGCblB
    dECfcp-2-knJg>
X-ME-Received: <xmr:24XJYUlpVNvlbXeDDPHtGdYu6y7fkX4lEUIwF21na_MCAt1_JKF-38c3qps6X1C5T67oku9az_CGQQl3Ex6jHn770vb0uz4u>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddruddujedgtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
    dttddtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheq
    necuggftrfgrthhtvghrnhepveeuheejgfffgfeivddukedvkedtleelleeghfeljeeiue
    eggeevueduudekvdetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:24XJYTzWt9uk7XKTQUSJbC2koLIPRIvuqPOuzlWNedWZZhqILKW3CQ>
    <xmx:24XJYeTjU3srlJOiLS-c6WAx5cUHd3b_5rXB48dZ_jcYjSkVf1Qlgg>
    <xmx:24XJYWZ8jTCyKxxEpePdCLsoJq-sZ7d-EmQuW0Lur_q5OAS8bFJ1-Q>
    <xmx:24XJYZcJGkkn_NYN1nMPEbBeAJse3SYETHV77FeGSht2mQAmS0_81w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Dec 2021 04:22:35 -0500 (EST)
Date: Mon, 27 Dec 2021 10:22:32 +0100
From: Greg KH <greg@kroah.com>
To: Adam Kandur <sys.arch.adam@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] qlge: replace goto
Message-ID: <YcmF2KRF2exkfeHQ@kroah.com>
References: <CAE28pkPuP-H2A9Q2m3Eu8aOKQQj9uaVBFYX9XNQXu+Dnz38j9Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE28pkPuP-H2A9Q2m3Eu8aOKQQj9uaVBFYX9XNQXu+Dnz38j9Q@mail.gmail.com>

On Mon, Dec 27, 2021 at 10:55:42AM +0300, Adam Kandur wrote:
> I think this goto can be easily replaced. Hope, this is right.
> 
> ---
>  drivers/staging/qlge/qlge_mpi.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/qlge/qlge_mpi.c b/drivers/staging/qlge/qlge_mpi.c
> index 96a4de6d2b34..b739dd051c87 100644
> --- a/drivers/staging/qlge/qlge_mpi.c
> +++ b/drivers/staging/qlge/qlge_mpi.c
> @@ -1122,7 +1122,8 @@ void qlge_mpi_port_cfg_work(struct work_struct *work)
>         if (status) {
>                 netif_err(qdev, drv, qdev->ndev,
>                           "Bug: Failed to get port config data.\n");
> -               goto err;
> +               clear_bit(QL_PORT_CFG, &qdev->flags);
> +               return;
>         }
> 
>         if (qdev->link_config & CFG_JUMBO_FRAME_SIZE &&
> @@ -1135,14 +1136,9 @@ void qlge_mpi_port_cfg_work(struct work_struct *work)
>         if (status) {
>                 netif_err(qdev, drv, qdev->ndev,
>                           "Bug: Failed to set port config data.\n");
> -               goto err;
> +               qlge_queue_fw_error(qdev);
> +               goto end;
>         }
> -end:
> -       clear_bit(QL_PORT_CFG, &qdev->flags);
> -       return;
> -err:
> -       qlge_queue_fw_error(qdev);
> -       goto end;
>  }
> 
>  /* Process an inter-device request.  This is issues by
> -- 
> 2.34.0
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

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/SubmittingPatches and resend it after
  adding that line.  Note, the line needs to be in the body of the
  email, before the patch, not at the bottom of the patch or in the
  email signature.

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
