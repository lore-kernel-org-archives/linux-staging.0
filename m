Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4212117EA
	for <linux-staging@lists.linux.dev>; Mon,  3 Apr 2023 07:21:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EBAAC433EF;
	Mon,  3 Apr 2023 07:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1680506510;
	bh=jYYQrfyfwF4ldZBvYJGRWqLHFtgAgWU3/+bwdD3kqFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=caWhFVlxmWNdQ+ehy3O/F3pmSuUCMvdKU0utT4GFdZr+4GMnUuhO2MHzqXTHEnNmx
	 lfVeFe9z8gGs1B9N44zRgZIZ7xyO+CAPxgR+9qW0qeBxva4TreNP7ObhME6JemTd8i
	 zK1CI7NAQFk2fAyE4HV2I3U++OpE8uUJO18uPVRE=
Date: Mon, 3 Apr 2023 09:21:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dan Carpenter <error27@gmail.com>
Cc: =?iso-8859-1?Q?=C1ngel?= Alberto Carretero <angelalbertoc.r@gmail.com>,
	Bryan O'Donoghue <pure.logic@nexus-software.ie>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: loopback: fix up checkpath macro do
 while error.
Message-ID: <2023040301-tapping-umbilical-f7b4@gregkh>
References: <20230402122550.70682-1-angelalbertoc.r@gmail.com>
 <2023040252-racoon-daintily-3589@gregkh>
 <0af15115-9641-a1c8-f398-c4e8e77379a3@gmail.com>
 <2cb170e2-3551-4f2a-9cd3-065d9bd4504b@kili.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2cb170e2-3551-4f2a-9cd3-065d9bd4504b@kili.mountain>

On Mon, Apr 03, 2023 at 09:23:55AM +0300, Dan Carpenter wrote:
> On Sun, Apr 02, 2023 at 08:22:35PM +0200, Ángel Alberto Carretero wrote:
> > 
> > 
> > On 02/04/2023 15:16, Greg Kroah-Hartman wrote:
> > > On Sun, Apr 02, 2023 at 02:25:51PM +0200, Angel Alberto Carretero wrote:
> > > > Wrap macro in a do-while statement.
> > > > 
> > > > Signed-off-by: Angel Alberto Carretero <angelalbertoc.r@gmail.com>
> > > > ---
> > > >   drivers/staging/greybus/loopback.c | 8 +++++---
> > > >   1 file changed, 5 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> > > > index d7b39f3bb652..371809770ed0 100644
> > > > --- a/drivers/staging/greybus/loopback.c
> > > > +++ b/drivers/staging/greybus/loopback.c
> > > > @@ -162,9 +162,11 @@ static ssize_t name##_avg_show(struct device *dev,		\
> > > >   static DEVICE_ATTR_RO(name##_avg)
> > > >   #define gb_loopback_stats_attrs(field)				\
> > > > -	gb_loopback_ro_stats_attr(field, min, u);		\
> > > > -	gb_loopback_ro_stats_attr(field, max, u);		\
> > > > -	gb_loopback_ro_avg_attr(field)
> > > > +	do {		\
> > > > +		gb_loopback_ro_stats_attr(field, min, u);		\
> > > > +		gb_loopback_ro_stats_attr(field, max, u);		\
> > > > +		gb_loopback_ro_avg_attr(field);		\
> > > > +	} while (0)
> > > >   #define gb_loopback_attr(field, type)					\
> > > >   static ssize_t field##_show(struct device *dev,				\
> > > > -- 
> > > > 2.40.0
> > > > 
> > > > 
> > > 
> > > Any specific reason why you did not test build your change before
> > > submitting it?
> > > 
> > > thanks,
> > > 
> > > greg k-h
> > 
> > Apologies, we can drop the patch. I was trying to find an error as part
> > of the eudyptula challenge and thought I was compiling the driver
> > correctly. Upon further examination, the macro cannot be written with a
> > do-while because it is defining functions.
> 
> The "eudyptula challenge" and other first patch guides should be updated
> to tell people to search for their code on lore.kernel.org before
> sending a patch.

The "eudyptula challenge" is not currently running and has not been for
many years now so I do not know where the original poster got their
information from.

thanks,

greg k-h
