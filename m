Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B77322B
	for <linux-staging@lists.linux.dev>; Fri, 31 Mar 2023 14:19:37 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id x20so23159742ljq.9
        for <linux-staging@lists.linux.dev>; Fri, 31 Mar 2023 07:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112; t=1680272375;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oUJ+qBKLuK4cF452Tfh7+WuuAXX5liwUqTQK4K/M/v0=;
        b=KxPkG18XtFbNmbT2++GXdS6DzkgHOSxryh2eTV0wZBDjYHiSedL6kKzt8zmeJzR2z2
         AX9XPUaG6ZVeZKVAe6qZLkwimMDBY64s+tPrGLxeYPri6r/ZP3iRynCDVilvRNbJhc4I
         XjLWyxG5JS/wlYYEzEdKyS3m7HgbO08R8aWvdcncpai6R6+SQb3JJWPbTBz8rKKDB+JU
         nr9OMmue4nLNDTRSNtG+BUE18aT0+hLy0UsUOdWRqtytdbi1BeDyLqm2doI2s6q2DsyA
         Xrpfqh/ngsQgu52JFh9edWbe1I4+cuQ18erKgXbsBq3xtsH7qITVdtMJPOgPPealR3Bi
         6YIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680272375;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oUJ+qBKLuK4cF452Tfh7+WuuAXX5liwUqTQK4K/M/v0=;
        b=3yJWqfNz24PT38DAaGX3bXNlqirAMZh2taLNQCIxHdgkfWFfiKcfBkhWUoXalBhRGV
         hGdaPTVDNOUUo3yHh7IH+0YN5QUu/x0LTIbWbcb29qoJVsRNW4kjRxBFS82DFtfYeCft
         Ib7wlgj3pEcBgQcVUOo623wvlLehAmCYWwggO1LtlkMkPxRnSiZENiaMmK5Te5k9Mdi3
         W6q/toX3QTofT49qxIHiSyN+4kaMajiJYEmh39TOcU3g1iHRq3esPYHh1GoR74cmfIs5
         kJCF6f5UmPGnEc2zPWoHAWgm5bl1YlRz7M2EohaJZYzZwq+UeXT5AbjsXVzqVZOyZpHQ
         hoAw==
X-Gm-Message-State: AAQBX9c0SJtvFVvyHB8KeWLUMtEddLzq+Tw26bLVrpqS+OrU/94PYswh
	XwGON/RBEmEWB6TWYWGHredVxg==
X-Google-Smtp-Source: AKy350aq5IJ5JJhxZGhH+hsLXdHv8Jt7aKKbYEq2q08y4H+HLM0pvrn8MmLz1+H4RVwEp+U17WUxng==
X-Received: by 2002:a2e:730b:0:b0:2a6:16b5:2fc0 with SMTP id o11-20020a2e730b000000b002a616b52fc0mr1998504ljc.16.1680272375330;
        Fri, 31 Mar 2023 07:19:35 -0700 (PDT)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id v14-20020a2e990e000000b00295b59fba40sm376118lji.25.2023.03.31.07.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 07:19:34 -0700 (PDT)
Date: Fri, 31 Mar 2023 16:19:34 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: staging: max96712: Add support for 3-lane C-PHY
Message-ID: <ZCbr9n4pT6ycYXpC@oden.dyn.berto.se>
References: <20230211144614.3816247-1-niklas.soderlund+renesas@ragnatech.se>
 <ZCbQTjL+Gy+Poeu/@valkosipuli.retiisi.eu>
 <ZCbe9D+LxbWveekE@oden.dyn.berto.se>
 <ZCbpdboZZop7pJXn@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCbpdboZZop7pJXn@valkosipuli.retiisi.eu>

Hej Sakari,

On 2023-03-31 17:08:53 +0300, Sakari Ailus wrote:
> Hejssan, Niklas!
> 
> On Fri, Mar 31, 2023 at 03:24:04PM +0200, Niklas Söderlund wrote:
> > Hej Sakari,
> > 
> > Tack för din feedback.
> > 
> > On 2023-03-31 15:21:34 +0300, Sakari Ailus wrote:
> > 
> > ...
> > 
> > > > @@ -332,8 +341,9 @@ static int max96712_parse_dt(struct 
> > > > max96712_priv *priv)
> > > >  {
> > > >  	struct fwnode_handle *ep;
> > > >  	struct v4l2_fwnode_endpoint v4l2_ep = {
> > > > -		.bus_type = V4L2_MBUS_CSI2_DPHY
> > > > +		.bus_type = V4L2_MBUS_UNKNOWN,
> > > 
> > > The bindings don't require setting bus-type. Please change the bindings as
> > > well. And assume D-PHY in the driver if bus-type isn't set.
> > 
> > Thanks for spotting this, I will send out an update to update the 
> > binding to require setting bus-type.
> > 
> > About updating the driver to assume D-PHY if bus-type is not set. I 
> > wonder if we can avoid that and keep the driver change as is? The only 
> > in-tree user of this binding is in r8a779a0-falcon-csi-dsi.dtsi, and I 
> > intend to send out a patch to set the bus-type for that together with 
> > the updated bindings.
> > 
> > I have tested this driver change on the Falcon board and if bus-type is 
> > not explicitly set in the DTS it is reported as D-PHY and everything 
> > works as expected. So if I
> > 
> > - Send out a patch to update the bindings to require bus-type being set.
> > - Send out patch to update the only in-tree use of the driver to set 
> >   bus-type.
> > 
> > Can't we avoid issues in the future by not assuming no bus-type is D-PHY 
> > in the driver while still being backward compatible with the old DTS?
> 
> If you want to keep supporting D-PHY as a default, you should instead try
> parsing with V4L2_MBUS_CSI2_DPHY as bus_type. Then CPHY if that fails.
> 
> Although if bus_type is mandatory, then this patch is fine.

Thanks. I prefers to make bus-type a mandatory property, it feels like 
being explicit in the bindings is the best way going forward. I have 
posted the patches to make this change and to update the only user.

There is only one user in-tree, and making the change now would still be 
backward compatible with it. So better bite the bullet now before the 
binding spreads.

Trevlig helg!

> 
> -- 
> Trevliga hälsningar,
> 
> Sakari Ailus

-- 
Kind Regards,
Niklas Söderlund
