Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B849440;
	Tue, 21 Mar 2023 20:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=I2S5b3dzYyNzYT0wd2040dnIXDiUQEurUwJKuN7lh+o=;
  b=HGFN43BDtdxu3FlTEYY7cGieyOWY1T5WeNb6JH716TubMaF026M+QVGD
   BD2mKMKVXSVDp68iYzTKT/kA8HRoH2MryxqCK5TbLUGt5uzwulk+xrGdM
   t7CEFhfjoCYsTI5Zfjx7sZgp6kpJuHdWXMG3JNygkEwo+PXbL7KIOYVmi
   0=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,279,1673910000"; 
   d="scan'208";a="50853598"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 21:43:43 +0100
Date: Tue, 21 Mar 2023 21:43:42 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Alex Elder <elder@ieee.org>
cc: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>, gregkh@linuxfoundation.org, 
    outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, 
    linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: greybus: use inline function for macros
In-Reply-To: <2e869677-2693-6419-ea25-f0cc2efcf3dd@ieee.org>
Message-ID: <alpine.DEB.2.22.394.2303212140480.2919@hadrien>
References: <20230321183456.10385-1-eng.mennamahmoud.mm@gmail.com> <2e869677-2693-6419-ea25-f0cc2efcf3dd@ieee.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 21 Mar 2023, Alex Elder wrote:

> On 3/21/23 1:34 PM, Menna Mahmoud wrote:
> > Convert `to_gbphy_dev` and `to_gbphy_driver` macros into a
> > static inline function.
> >
> > It is not great to have macros that use the `container_of` macro,
> > because from looking at the definition one cannot tell what type
> > it applies to.
> >
> > One can get the same benefit from an efficiency point of view
> > by making an inline function.
> >
> > Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> > Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
>
> I'm sorry if this conflicts with what others have said.
>
> But the use of a macro (with a container_of() right-hand
> side) to get at the structure containing a field pointer
> is a widely-used idiom throughout the kernel.
>
> What you propose achieves the same result but I would
> lean toward keeping it as a macro, mainly because it
> is so common.

Common is not necessarily good.  Macros are less safe and less
informative.

julia


>
> 					-Alex
> > ---
> > changes in v2:
> > 	-send patch as a single patch.
> > 	-edit the name of struct object.
> > 	-edit commit message.
> > ---
> >   drivers/staging/greybus/gbphy.h | 10 ++++++++--
> >   1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/greybus/gbphy.h
> > b/drivers/staging/greybus/gbphy.h
> > index d4a225b76338..e7ba232bada1 100644
> > --- a/drivers/staging/greybus/gbphy.h
> > +++ b/drivers/staging/greybus/gbphy.h
> > @@ -15,7 +15,10 @@ struct gbphy_device {
> >   	struct list_head list;
> >   	struct device dev;
> >   };
> > -#define to_gbphy_dev(d) container_of(d, struct gbphy_device, dev)
> > +static inline struct gbphy_device *to_gbphy_dev(const struct device *_dev)
> > +{
> > +	return container_of(_dev, struct gbphy_device, dev);
> > +}
> >     static inline void *gb_gbphy_get_data(struct gbphy_device *gdev)
> >   {
> > @@ -43,7 +46,10 @@ struct gbphy_driver {
> >     	struct device_driver driver;
> >   };
> > -#define to_gbphy_driver(d) container_of(d, struct gbphy_driver, driver)
> > +static inline struct gbphy_driver *to_gbphy_driver(struct device_driver
> > *drv)
> > +{
> > +	return container_of(drv, struct gbphy_driver, driver);
> > +}
> >     int gb_gbphy_register_driver(struct gbphy_driver *driver,
> >   			     struct module *owner, const char *mod_name);
>
>
