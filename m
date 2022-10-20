Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEEA3D60;
	Thu, 20 Oct 2022 15:04:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A346C433C1;
	Thu, 20 Oct 2022 15:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666278294;
	bh=yzw5QJmACHlFRjzoQ0cMqnPWehes8sW7SHCAFaoE9XY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zyGgpMNfbBW/DX/RuaK5nYsNb6b95d/vWJhWHWRbIxQBa6mOwDfHAZxi06CSluGUK
	 qSaKXL7MU9D1394tkNeLuot0A6psuUBFR+TbLGw52PyRnBV79tvjBE/GaYzjMgZusc
	 mL/0UTLUKaK4ypCCHCETMf+5B2V4WZZ1qsAZk1YQ=
Date: Thu, 20 Oct 2022 17:04:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Cc: Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kumarpraveen@linux.microsoft.com, saurabh.truth@gmail.com
Subject: Re: [PATCH v4 2/2] staging: most: dim2: correct misleading struct
 type name
Message-ID: <Y1FjlInI92hqHF6W@kroah.com>
References: <cover.1666208065.git.drv@mailo.com>
 <6b772a1ac06ae3b0d63e198e7238c1590b14703a.1666208065.git.drv@mailo.com>
 <alpine.DEB.2.22.394.2210192208290.3068@hadrien>
 <Y1BeZYBf/xsW8F4O@debian-BULLSEYE-live-builder-AMD64>
 <Y1E1kv6YSmxVzjkf@debian-BULLSEYE-live-builder-AMD64>
 <404cc67c-efd6-4a70-c3ca-7958db21bcb@inria.fr>
 <Y1FFbB8BWi1IHYgB@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y1FFbB8BWi1IHYgB@debian-BULLSEYE-live-builder-AMD64>

On Thu, Oct 20, 2022 at 06:26:12PM +0530, Deepak R Varma wrote:
> On Thu, Oct 20, 2022 at 02:06:41PM +0200, Julia Lawall wrote:
> >
> >
> > On Thu, 20 Oct 2022, Deepak R Varma wrote:
> >
> > > On Thu, Oct 20, 2022 at 02:00:29AM +0530, Deepak R Varma wrote:
> > > > On Wed, Oct 19, 2022 at 10:08:53PM +0200, Julia Lawall wrote:
> > > > >
> > > > >
> > > > > On Thu, 20 Oct 2022, Deepak R Varma wrote:
> > > > >
> > > > > > Correct misleading struct type name dim_ch_state_t to dim_ch_state
> > > > > > since this not a typedef but a normal structure declaration.
> > > > > >
> > > > > > Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> > > > > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > > > > ---
> > > > > >
> > > > > > Changes in v4:
> > > > > >    1. Correct patch subject and log message. Use struct type name instead of
> > > > > >       variable name for the change description. Feedback from julia.lawall@inria.fr
> > > > > >
> > > > > > Changes in v3:
> > > > > >    1. Patch introduced in the patch set
> > > > > >
> > > > > >  drivers/staging/most/dim2/dim2.c | 2 +-
> > > > > >  drivers/staging/most/dim2/hal.c  | 4 ++--
> > > > > >  drivers/staging/most/dim2/hal.h  | 6 +++---
> > > > > >  3 files changed, 6 insertions(+), 6 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
> > > > > > index 4c1f27898a29..a69a61a69283 100644
> > > > > > --- a/drivers/staging/most/dim2/dim2.c
> > > > > > +++ b/drivers/staging/most/dim2/dim2.c
> > > > > > @@ -161,7 +161,7 @@ static int try_start_dim_transfer(struct hdm_channel *hdm_ch)
> > > > > >  	struct list_head *head = &hdm_ch->pending_list;
> > > > > >  	struct mbo *mbo;
> > > > > >  	unsigned long flags;
> > > > > > -	struct dim_ch_state_t st;
> > > > > > +	struct dim_ch_state st;
> > > > >
> > > > > Is there another use in service_done_flag?
> > > >
> > > > Hi,
> > > > I did not understand your question fully. This is from a different function
> > > > try_start_dim_transfer where the variable st is used down the line in the
> > > > execution. This time the channel state is retrieved by calling
> > > > dim_get_channel_state function. The state is simply computed and set. Should I
> > > > improve this as well?
> > > >
> > > > If you are asking something different, could you please elaborate?
> > >
> > > Hi Julia,
> > > Can you please review and comment on my response?
> >
> > In my kernel there is an occurrence of the type name in service_done_flag.
> > But I have the mainline, not Greg's staging tree, so there could be some
> > differences.
> >
> > When I do git grep dim_ch_state_t, I get two occurrences in
> > drivers/staging/most/dim2/dim2.c
> 
> Okay. Still unclear. Following snip is what I see in my local staging-testing branch.
> 
> <snip>
> 	drv@debian:~/git/kernels/staging$ git grep dim_ch_state_t
> 	drivers/staging/most/dim2/dim2.c:       struct dim_ch_state_t st;
> 	drivers/staging/most/dim2/dim2.c:       struct dim_ch_state_t st;
> 	drivers/staging/most/dim2/hal.c:struct dim_ch_state_t *dim_get_channel_state(struct dim_channel *ch,
> 	drivers/staging/most/dim2/hal.c:                                             struct dim_ch_state_t *state_ptr)
> 	drivers/staging/most/dim2/hal.h:struct dim_ch_state_t {
> 	drivers/staging/most/dim2/hal.h:struct dim_ch_state_t *dim_get_channel_state(struct dim_channel *ch,
> 	drivers/staging/most/dim2/hal.h:                                             struct dim_ch_state_t *state_ptr);
> 	drv@debian:~/git/kernels/staging$
> </snip>
> 
> Does that help?

Not at all, as you did not test with your change applied:

  CC [M]  drivers/gpu/drm/vmwgfx/vmwgfx_drv.o
drivers/staging/most/dim2/dim2.c: In function ‘service_done_flag’:
drivers/staging/most/dim2/dim2.c:262:31: error: storage size of ‘st’ isn’t known
  262 |         struct dim_ch_state_t st;
      |                               ^~
drivers/staging/most/dim2/dim2.c:262:31: error: unused variable ‘st’ [-Werror=unused-variable]

:(

