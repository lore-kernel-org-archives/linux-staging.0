Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002151C01;
	Sun, 16 Oct 2022 15:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1665934054; bh=idphqeTWigMQZuxHgdQxb95C3J+mkr7ydRxjaUo2v58=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=m7ktjrzw+kdMSMJSSq5r7nxPtiOyL7Y3Oq+sqcOzOl+mnS3AadRiMKTz2v1eIOFqM
	 yVM8/RPGYeYaEoLSSiG7BrERSqfz0qXcND6gPtJAibo8s77XfmNrxBeZB0bX1ynBIe
	 rhNqechEshiNvUg0/ZrBWJrY4H39qNFiQbFzPwCg=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
	via [213.182.55.206]
	Sun, 16 Oct 2022 17:27:34 +0200 (CEST)
X-EA-Auth: TAQoDZSVK1o2VN0sLBUdUgl53zSZIISs75W0QBybmcPF3auhezmRA4KZCynaH0DQyXoDguusPNZNd3wRRszMy2YJjc3SKeyk
Date: Sun, 16 Oct 2022 11:27:30 -0400
From: Deepak R Varma <drv@mailo.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev, pure.logic@nexus-software.ie,
	johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: loopback: enclose macro statements in
 do-while loop
Message-ID: <Y0wi4itS3d8aExFc@debian-BULLSEYE-live-builder-AMD64>
References: <Y0wS4HQo9m/W/TrQ@debian-BULLSEYE-live-builder-AMD64>
 <alpine.DEB.2.22.394.2210161649400.2876@hadrien>
 <Y0wdDTUBrUT/cr9w@lion2204>
 <alpine.DEB.2.22.394.2210161709440.2876@hadrien>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2210161709440.2876@hadrien>

On Sun, Oct 16, 2022 at 05:10:17PM +0200, Julia Lawall wrote:
>
>
> On Sun, 16 Oct 2022, Deepak R Varma wrote:
>
> > On Sun, Oct 16, 2022 at 04:51:09PM +0200, Julia Lawall wrote:
> > >
> > >
> > > On Sun, 16 Oct 2022, Deepak R Varma wrote:
> > >
> > > > Include multiple statements of macro definition inside do-while{0} loop
> > > > to avoid possible partial program execution. Issue reported by
> > > > checkpatch script:
> > > >
> > > > ERROR: Macros with multiple statements should be enclosed in a do - while loop
> > >
> > > I don't think this change will compile.  See if you can figure out why
> > > not.
> >
> > It did compile. I built the greybus driver and loaded it as well with the
> > modinfo tool. Can you please tell why you think it won't compile?
>
> Do you have a .o file for the .c file that you changed?

I see many .o files and a greybus.ko as well, but not the loopback.o
Am I missing anything with my configuration? I did set Greybus Support to (M) in
the menuconfig.

Thank you,
./drv

>
> julia
>
> >
> > ./drv
> >
> > >
> > > julia
> > >
> > > >
> > > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > > ---
> > > >  drivers/staging/greybus/loopback.c | 4 +++-
> > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> > > > index 1a61fce98056..37214cb43937 100644
> > > > --- a/drivers/staging/greybus/loopback.c
> > > > +++ b/drivers/staging/greybus/loopback.c
> > > > @@ -163,9 +163,11 @@ static ssize_t name##_avg_show(struct device *dev,		\
> > > >  static DEVICE_ATTR_RO(name##_avg)
> > > >
> > > >  #define gb_loopback_stats_attrs(field)				\
> > > > +do {								\
> > > >  	gb_loopback_ro_stats_attr(field, min, u);		\
> > > >  	gb_loopback_ro_stats_attr(field, max, u);		\
> > > > -	gb_loopback_ro_avg_attr(field)
> > > > +	gb_loopback_ro_avg_attr(field);				\
> > > > +} while (0)
> > > >
> > > >  #define gb_loopback_attr(field, type)					\
> > > >  static ssize_t field##_show(struct device *dev,				\
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


