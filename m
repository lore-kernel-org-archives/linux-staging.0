Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9BE46B8;
	Tue, 18 Oct 2022 17:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=fIaMfcW+f9+cXq6fKIPffjMaApmB4P+tYRthG1mlouk=;
  b=sCawu3zOWzJvdCfCZ0v9/E1Km46t/+BcPpl4OsxLxI70eVyG36zEqeJt
   UBeUW+6h1Lm520SMU59446caZ3904G+P4T5GbGOa+dvwlmVk7dMYS654q
   Hy2wu6YIbcwRg8Unq8sX/GYAtQidBV4Wh7ULeN9dHaSLCHATvD6fArpLo
   w=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.95,193,1661810400"; 
   d="scan'208";a="31793337"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2022 18:59:59 +0200
Date: Tue, 18 Oct 2022 18:59:59 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Deepak R Varma <drv@mailo.com>
cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: most: dim2: correct misleading variable
 name
In-Reply-To: <b8550823920f40c4d02a3a691acca1af18998878.1666105876.git.drv@mailo.com>
Message-ID: <66e6d6f-3574-e317-946e-2c2467726eab@inria.fr>
References: <cover.1666105876.git.drv@mailo.com> <b8550823920f40c4d02a3a691acca1af18998878.1666105876.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 18 Oct 2022, Deepak R Varma wrote:

> Correct misleading struct variable name dim_ch_state_t to dim_ch_state
> since this not a typedef but a normal variable declaration.

Actually, it's not the name of a variable, but the name of a type.

julia

>
> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
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
