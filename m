Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC5D7F;
	Tue, 18 Oct 2022 06:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666072909; bh=AeUxUQ4b7wAYjiY/Rh3f+xXdqR55omtWyPcvf4gmu0w=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=k2D2WGLRxiePTscPtTbQjdE9An/+KVvO34ckXcijZCxcojCc5NOVmaMv7hlBtW4JD
	 IqLmWsdyjyJnNa3RCUHM6fh915pxIh1r7Ipc9R/IvvbDbrD1PRGMuU6Q/RWyuauysu
	 aBwtOKoocyvWGy20HxRa9A4l94mcJqKZX5dI6kQ0=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
	via [213.182.55.206]
	Tue, 18 Oct 2022 08:01:49 +0200 (CEST)
X-EA-Auth: Xcbl+bBi6Mx+qJ6s1Cu7jyTPOJhxTSKI967CG+nK++akF59MYyLcj+2BSdNJD9kf6AZX0jiAQpYYOeuPTuyM+Q7ZY/d7yWzQ
Date: Tue, 18 Oct 2022 11:31:44 +0530
From: Deepak R Varma <drv@mailo.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kumarpraveen@linux.microsoft.com, saurabh.truth@gmail.com
Subject: Re: [PATCH] staging: most: dim2: read done_buffers count locally
 from HDM channel
Message-ID: <Y05BSNKl5NiaBt7N@debian-BULLSEYE-live-builder-AMD64>
References: <Y022wjdPGYwyx7lB@debian-BULLSEYE-live-builder-AMD64>
 <alpine.DEB.2.22.394.2210172255250.16433@hadrien>
 <Y03DpMMiOsedm6Dl@lion2204>
 <alpine.DEB.2.22.394.2210180733330.2938@hadrien>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2210180733330.2938@hadrien>

On Tue, Oct 18, 2022 at 07:35:29AM +0200, Julia Lawall wrote:
>
>
> On Tue, 18 Oct 2022, Deepak R Varma wrote:
>
> > On Mon, Oct 17, 2022 at 10:56:03PM +0200, Julia Lawall wrote:
> > >
> > >
> > > On Tue, 18 Oct 2022, Deepak R Varma wrote:
> > >
> > > > The done_buffer count can be directly read from HDM channel instead of
> > > > calling the dim_get_channel_state function. This change also results in
> > > > obsoleting the dim_channel_state local structure variable.
> > > >
> > > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > > ---
> > > >
> > > > PLEASE NOTE: I have only built the module on my machine, but have not tested it.
> > > > I am not sure how to test this change. I am willing to test it with appropriate
> > > > guidance provided I have the necessary hardware.
> > >
> > > For non experts, maybe it would be helpful to explain what motivated you
> > > to do this?
> >
> > I was actually trying to understand the implementation of this module to
> > determine if I can replace BUG_ON calls by WARN_ON_ONCE. A "ctrl+]" navigation
> > took me to this function and I started wondering about why the function call
> > would be necessary. Hence the change.
>
> OK, I agree with you that this story might not be super interesting.
>
> But the log message still seems too concise.  You have acquired some
> knowledge about why this changeis correct, but that knowledge is not at
> all reflected in the log message.  Try to explain in more detail why the
> function call is not necessary.

Sounds good. I will update the patch log and resubmit the patch.
Thank you,

./drv

>
> julia
>
> >
> > While reading the Documentation under dim2 directory, I realised this module may
> > need a specialised hardware for testing [automotive???]. Hence I was not sure
> > how to test the same.
> >
> > Are you suggesting I mention this in the patch description (the motivation)?
> >
> > Thank you,
> > ./drv
> >
> > >
> > > julia
> > >
> > > >
> > > >  drivers/staging/most/dim2/dim2.c | 3 +--
> > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
> > > > index ab72e11ac5ab..4c1f27898a29 100644
> > > > --- a/drivers/staging/most/dim2/dim2.c
> > > > +++ b/drivers/staging/most/dim2/dim2.c
> > > > @@ -259,7 +259,6 @@ static void retrieve_netinfo(struct dim2_hdm *dev, struct mbo *mbo)
> > > >  static void service_done_flag(struct dim2_hdm *dev, int ch_idx)
> > > >  {
> > > >  	struct hdm_channel *hdm_ch = dev->hch + ch_idx;
> > > > -	struct dim_ch_state_t st;
> > > >  	struct list_head *head;
> > > >  	struct mbo *mbo;
> > > >  	int done_buffers;
> > > > @@ -271,7 +270,7 @@ static void service_done_flag(struct dim2_hdm *dev, int ch_idx)
> > > >
> > > >  	spin_lock_irqsave(&dim_lock, flags);
> > > >
> > > > -	done_buffers = dim_get_channel_state(&hdm_ch->ch, &st)->done_buffers;
> > > > +	done_buffers = hdm_ch->ch.done_sw_buffers_number;
> > > >  	if (!done_buffers) {
> > > >  		spin_unlock_irqrestore(&dim_lock, flags);
> > > >  		return;
> > > > --
> > > > 2.30.2
> > > >
> > > >
> > > >
> > > >
> > > >
> >
> >
> >
>


