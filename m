Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71B04C72;
	Tue, 18 Oct 2022 17:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666114898; bh=6nlFqTQIDFJBZON/b1YWt8WoagF5LhXfRTGzet31JT8=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=dIuSi6cL/PyF0+MakRmAc5t7j6YXHYmGlwpcXPmLfEDU02IrZ1/t0lYNDQ/h70sTs
	 xT6coU5Xqg/RW0fcRMAqK3p3gJ8i2FudZAoNZsqabY8ztgDQULd4waFiku4P9dX2ZS
	 q19peJyg7N3pr+L1gv0XmS31btxkI6p+9AFc5a/M=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
	via [213.182.55.206]
	Tue, 18 Oct 2022 19:41:37 +0200 (CEST)
X-EA-Auth: 2K/3isRMWv89QB7+MFBNbojKPj0XdVa9VUsChrj+h2BOrKk05czs9l7TjgbZB7J9X6ly9TolhKJxq0Y83K7EPpUhwFMrNMdS
Date: Tue, 18 Oct 2022 23:11:34 +0530
From: Deepak R Varma <drv@mailo.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: most: dim2: correct misleading variable name
Message-ID: <Y07lTucIpLgohi0J@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1666105876.git.drv@mailo.com>
 <b8550823920f40c4d02a3a691acca1af18998878.1666105876.git.drv@mailo.com>
 <66e6d6f-3574-e317-946e-2c2467726eab@inria.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66e6d6f-3574-e317-946e-2c2467726eab@inria.fr>

On Tue, Oct 18, 2022 at 06:59:59PM +0200, Julia Lawall wrote:
>
>
> On Tue, 18 Oct 2022, Deepak R Varma wrote:
>
> > Correct misleading struct variable name dim_ch_state_t to dim_ch_state
> > since this not a typedef but a normal variable declaration.
>
> Actually, it's not the name of a variable, but the name of a type.

oops.. my bad. I will wait for any other feedback on this patch set and
accordingly send in the revision.

Thank you,
./drv

>
> julia
>
> >
> > Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > ---
> >  drivers/staging/most/dim2/dim2.c | 2 +-
> >  drivers/staging/most/dim2/hal.c  | 4 ++--
> >  drivers/staging/most/dim2/hal.h  | 6 +++---
> >  3 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
> > index 4c1f27898a29..a69a61a69283 100644
> > --- a/drivers/staging/most/dim2/dim2.c
> > +++ b/drivers/staging/most/dim2/dim2.c
> > @@ -161,7 +161,7 @@ static int try_start_dim_transfer(struct hdm_channel *hdm_ch)
> >  	struct list_head *head = &hdm_ch->pending_list;
> >  	struct mbo *mbo;
> >  	unsigned long flags;
> > -	struct dim_ch_state_t st;
> > +	struct dim_ch_state st;
> >
> >  	BUG_ON(!hdm_ch);
> >  	BUG_ON(!hdm_ch->is_initialized);
> > diff --git a/drivers/staging/most/dim2/hal.c b/drivers/staging/most/dim2/hal.c
> > index 65282c276862..a5d40b5b138a 100644
> > --- a/drivers/staging/most/dim2/hal.c
> > +++ b/drivers/staging/most/dim2/hal.c
> > @@ -943,8 +943,8 @@ u8 dim_service_channel(struct dim_channel *ch)
> >  	return channel_service(ch);
> >  }
> >
> > -struct dim_ch_state_t *dim_get_channel_state(struct dim_channel *ch,
> > -					     struct dim_ch_state_t *state_ptr)
> > +struct dim_ch_state *dim_get_channel_state(struct dim_channel *ch,
> > +					   struct dim_ch_state *state_ptr)
> >  {
> >  	if (!ch || !state_ptr)
> >  		return NULL;
> > diff --git a/drivers/staging/most/dim2/hal.h b/drivers/staging/most/dim2/hal.h
> > index 20531449acab..ef10a8741c10 100644
> > --- a/drivers/staging/most/dim2/hal.h
> > +++ b/drivers/staging/most/dim2/hal.h
> > @@ -27,7 +27,7 @@ enum mlb_clk_speed {
> >  	CLK_8192FS = 7,
> >  };
> >
> > -struct dim_ch_state_t {
> > +struct dim_ch_state {
> >  	bool ready; /* Shows readiness to enqueue next buffer */
> >  	u16 done_buffers; /* Number of completed buffers */
> >  };
> > @@ -87,8 +87,8 @@ void dim_service_ahb_int_irq(struct dim_channel *const *channels);
> >
> >  u8 dim_service_channel(struct dim_channel *ch);
> >
> > -struct dim_ch_state_t *dim_get_channel_state(struct dim_channel *ch,
> > -					     struct dim_ch_state_t *state_ptr);
> > +struct dim_ch_state *dim_get_channel_state(struct dim_channel *ch,
> > +					   struct dim_ch_state *state_ptr);
> >
> >  u16 dim_dbr_space(struct dim_channel *ch);
> >
> > --
> > 2.30.2
> >
> >
> >
> >
> >
>


