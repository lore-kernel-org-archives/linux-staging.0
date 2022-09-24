Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7EF17D0
	for <linux-staging@lists.linux.dev>; Sat, 24 Sep 2022 11:06:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D0DC433D6;
	Sat, 24 Sep 2022 11:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1664017582;
	bh=4k0/WZgh9w9XHoJOduTjRKo9UPsRcXxrGFJ8JwI6mpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UGwAXErZHrnlkryhGmkiJm4mMJ2ZEth1yOqr1OYCQ0N1Kyq7D+yLBJlHBSktGSMUo
	 EmG2W2SOpgaFt/ikFBQemYP2GExpah6G4NMdEjcGriXT/25C05PJDYK8PUkk4mPZyZ
	 mPUGTqCGHSXeAYSW173XAKEHiiOCWS8CaB1hmTe8=
Date: Sat, 24 Sep 2022 13:06:19 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: =?utf-8?B?Zmx5aW5ncGVuZyjlva3mtakp?= <flyingpeng@tencent.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Subject: Re: [PATCH]  clocking-wizard: fix a schedule during spin lock
 acquisition
Message-ID: <Yy7kq3bYqFNAEME/@kroah.com>
References: <B806E272-4615-4027-8CBE-82A651511964@tencent.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <B806E272-4615-4027-8CBE-82A651511964@tencent.com>

On Sun, Sep 18, 2022 at 02:43:20AM +0000, flyingpeng(彭浩) wrote:
> when the interrupt is disabled and the spin lock is acquired,
> calling read_poll_timeout will trigger the schedule, which should
> be replaced by read_poll_timeout_atomic.
> 
> Signed-off-by: Peng Hao <flyingpeng@tencent.com>
> ---
>  drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c b/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
> index 39367712ef54..986af03b31c9 100644
> --- a/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
> +++ b/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
> @@ -157,7 +157,7 @@ static int clk_wzrd_dynamic_reconfig(struct clk_hw *hw, unsigned long rate,
>         writel(0x00, div_addr + WZRD_DR_DIV_TO_PHASE_OFFSET);
> 
>         /* Check status register */
> -       err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
> +       err = readl_poll_timeout_atomic(divider->base + WZRD_DR_STATUS_REG_OFFSET,
>                                  value, value & WZRD_DR_LOCK_BIT_MASK,
>                                  WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
>         if (err)
> @@ -168,7 +168,7 @@ static int clk_wzrd_dynamic_reconfig(struct clk_hw *hw, unsigned long rate,
>                divider->base + WZRD_DR_INIT_REG_OFFSET);
> 
>         /* Check status register */
> -       err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
> +       err = readl_poll_timeout_atomic(divider->base + WZRD_DR_STATUS_REG_OFFSET,
>                                  value, value & WZRD_DR_LOCK_BIT_MASK,
>                                  WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
>  err_reconfig:
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

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
