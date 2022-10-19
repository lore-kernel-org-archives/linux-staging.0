Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94F353A3;
	Wed, 19 Oct 2022 20:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=xLUOFYSzTwcdJD1bSDpGV62OSIArCZrsREk8+4s+Uec=;
  b=ETfFsSnSDw1qGno5kvmuyV/L8zLQmEPEcks43pQSSS7rE4PmxtXT6lrB
   CdBFamHn890jRyrqDvoJ+x9lXf6nKYTnoI223vgDSvOT/iE00zYnG1L/j
   y//Vsbim6f+8y1s+C5YGS7ZJOn/O8v/+JJBgmHzv2iaO/vmprmVCtEqLh
   U=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.95,196,1661810400"; 
   d="scan'208";a="66044576"
Received: from 51.123.68.85.rev.sfr.net (HELO hadrien) ([85.68.123.51])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2022 22:08:54 +0200
Date: Wed, 19 Oct 2022 22:08:53 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Deepak R Varma <drv@mailo.com>
cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
    kumarpraveen@linux.microsoft.com, saurabh.truth@gmail.com
Subject: Re: [PATCH v4 2/2] staging: most: dim2: correct misleading struct
 type name
In-Reply-To: <6b772a1ac06ae3b0d63e198e7238c1590b14703a.1666208065.git.drv@mailo.com>
Message-ID: <alpine.DEB.2.22.394.2210192208290.3068@hadrien>
References: <cover.1666208065.git.drv@mailo.com> <6b772a1ac06ae3b0d63e198e7238c1590b14703a.1666208065.git.drv@mailo.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Thu, 20 Oct 2022, Deepak R Varma wrote:

> Correct misleading struct type name dim_ch_state_t to dim_ch_state
> since this not a typedef but a normal structure declaration.
>
> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>
> Changes in v4:
>    1. Correct patch subject and log message. Use struct type name instead of
>       variable name for the change description. Feedback from julia.lawall@inria.fr
>
> Changes in v3:
>    1. Patch introduced in the patch set
>
>  drivers/staging/most/dim2/dim2.c | 2 +-
>  drivers/staging/most/dim2/hal.c  | 4 ++--
>  drivers/staging/most/dim2/hal.h  | 6 +++---
>  3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
> index 4c1f27898a29..a69a61a69283 100644
> --- a/drivers/staging/most/dim2/dim2.c
> +++ b/drivers/staging/most/dim2/dim2.c
> @@ -161,7 +161,7 @@ static int try_start_dim_transfer(struct hdm_channel *hdm_ch)
>  	struct list_head *head = &hdm_ch->pending_list;
>  	struct mbo *mbo;
>  	unsigned long flags;
> -	struct dim_ch_state_t st;
> +	struct dim_ch_state st;

Is there another use in service_done_flag?

julia

>
>  	BUG_ON(!hdm_ch);
>  	BUG_ON(!hdm_ch->is_initialized);
> diff --git a/drivers/staging/most/dim2/hal.c b/drivers/staging/most/dim2/hal.c
> index 65282c276862..a5d40b5b138a 100644
> --- a/drivers/staging/most/dim2/hal.c
> +++ b/drivers/staging/most/dim2/hal.c
> @@ -943,8 +943,8 @@ u8 dim_service_channel(struct dim_channel *ch)
>  	return channel_service(ch);
>  }
>
> -struct dim_ch_state_t *dim_get_channel_state(struct dim_channel *ch,
> -					     struct dim_ch_state_t *state_ptr)
> +struct dim_ch_state *dim_get_channel_state(struct dim_channel *ch,
> +					   struct dim_ch_state *state_ptr)
>  {
>  	if (!ch || !state_ptr)
>  		return NULL;
> diff --git a/drivers/staging/most/dim2/hal.h b/drivers/staging/most/dim2/hal.h
> index 20531449acab..ef10a8741c10 100644
> --- a/drivers/staging/most/dim2/hal.h
> +++ b/drivers/staging/most/dim2/hal.h
> @@ -27,7 +27,7 @@ enum mlb_clk_speed {
>  	CLK_8192FS = 7,
>  };
>
> -struct dim_ch_state_t {
> +struct dim_ch_state {
>  	bool ready; /* Shows readiness to enqueue next buffer */
>  	u16 done_buffers; /* Number of completed buffers */
>  };
> @@ -87,8 +87,8 @@ void dim_service_ahb_int_irq(struct dim_channel *const *channels);
>
>  u8 dim_service_channel(struct dim_channel *ch);
>
> -struct dim_ch_state_t *dim_get_channel_state(struct dim_channel *ch,
> -					     struct dim_ch_state_t *state_ptr);
> +struct dim_ch_state *dim_get_channel_state(struct dim_channel *ch,
> +					   struct dim_ch_state *state_ptr);
>
>  u16 dim_dbr_space(struct dim_channel *ch);
>
> --
> 2.30.2
>
>
>
>
>
