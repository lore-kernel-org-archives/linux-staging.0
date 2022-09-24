Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEF17F
	for <linux-staging@lists.linux.dev>; Sat, 24 Sep 2022 06:42:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2BCC433D6;
	Sat, 24 Sep 2022 06:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1664001732;
	bh=coZVE+sY8LkozkeI87bTfGa03vnwuxp8bDxJZiLQXOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qYmyb6V6mqWH5t0pBFGoH5ZTVAS6tt0zNqsIzD+p4uq4ZYvraLzqhAIKjYWulnUYU
	 z8sW3f+Qk8K3RiPKvR5gkooaVsnUyQUdudcSUZkiwb/TA5DAeMonEn0o4YuRcwWnoe
	 YyHOCxnvHVdpvAeTrP/XFyPiTaI3Wz65/Phm2b9U=
Date: Sat, 24 Sep 2022 08:42:43 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Hao Peng <flyingpenghao@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] clocking-wizard: fix a schedule during spin lock
 acquisition
Message-ID: <Yy6m40zodTlMWPAv@kroah.com>
References: <CAPm50aK8RZHJ1AJzhrFmKWBWAVhkPjcnAv20gGgqEwuwEn054w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPm50aK8RZHJ1AJzhrFmKWBWAVhkPjcnAv20gGgqEwuwEn054w@mail.gmail.com>

On Sat, Sep 24, 2022 at 02:07:14PM +0800, Hao Peng wrote:
> From: Peng Hao <flyingpeng@tencent.com>
> 
> when the interrupt is disabled and the spin lock is acquired,
> calling read_poll_timeout will trigger the schedule, which should
> be replaced by read_poll_timeout_atomic.
> 
> Signed-off-by: Peng Hao <flyingpeng@tencent.com>
> ---
>  .../staging/clocking-wizard/clk-xlnx-clock-wizard.c  | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
> b/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
> index 39367712ef54..e36a97a57f2a 100644
> --- a/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
> +++ b/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
> @@ -157,9 +157,9 @@ static int clk_wzrd_dynamic_reconfig(struct clk_hw
> *hw, unsigned long rate,
>         writel(0x00, div_addr + WZRD_DR_DIV_TO_PHASE_OFFSET);
> 
>         /* Check status register */
> -       err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
> -                                value, value & WZRD_DR_LOCK_BIT_MASK,
> -                                WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
> +       err = readl_poll_timeout_atomic(divider->base +
> WZRD_DR_STATUS_REG_OFFSET,
> +                                       value, value & WZRD_DR_LOCK_BIT_MASK,
> +                                       WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
>         if (err)
>                 goto err_reconfig;
> 
> @@ -168,9 +168,9 @@ static int clk_wzrd_dynamic_reconfig(struct clk_hw
> *hw, unsigned long rate,
>                divider->base + WZRD_DR_INIT_REG_OFFSET);
> 
>         /* Check status register */
> -       err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
> -                                value, value & WZRD_DR_LOCK_BIT_MASK,
> -                                WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
> +       err = readl_poll_timeout_atomic(divider->base +
> WZRD_DR_STATUS_REG_OFFSET,
> +                                       value, value & WZRD_DR_LOCK_BIT_MASK,
> +                                       WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
>  err_reconfig:
>         if (divider->lock)
>                 spin_unlock_irqrestore(divider->lock, flags);
> --
> 2.27.0
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

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/email-clients.txt in order to fix this.

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
