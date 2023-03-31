Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6812A322B
	for <linux-staging@lists.linux.dev>; Fri, 31 Mar 2023 14:11:14 +0000 (UTC)
Received: from hillosipuli.retiisi.eu (dkzcv-3yyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4505:1fdc::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4Pp2Jb0q9nzyRB;
	Fri, 31 Mar 2023 17:11:10 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1680271871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=76x9RY7k80HBHgGXY6QHuQUkcZ9uXPV8ncisW+lo/KA=;
	b=GqNdR4h2eRLt1+fDX9EFxSgsQig5yxEL+yXWrjgOYuZCeOIxmGhe+zzfNit2jfJbyFBbLA
	+/WMJ/Mq1RT7ZHcEBAMW+eCFQ4MwkceF7mp65itMe8NybtYsCkVrdqhMh0UMm0Z4o5KYmC
	jQC3ztM+QKa4eescDGEvV8StNSxogCI=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1680271871; a=rsa-sha256; cv=none;
	b=Y5JPdjhjyA4/rKcUx1QwUVJciuathd1iHa7ohcn9OwNYDm5WEkt7jjOtNTBvTGU5nCx6Zc
	Q8x525mT+jFqlfYtaUnNnIXBd1CH2AMmi9a7QjCioesux1FBT5ebTrh6ibfI4hfsGNO69F
	X45JhV6QCrix2SsGzjINH9+Oed3kS4k=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1680271871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=76x9RY7k80HBHgGXY6QHuQUkcZ9uXPV8ncisW+lo/KA=;
	b=yeDHk+MqifQT+y24S1gLg/lBr5vRGPjGtZ/qywkjc0URV7HDVEZc8WeiAmFIhBLITEVSR3
	We8G/G/HmQY8maxqp2wNq7wTwkCKkwSwFHfvsRQ7/okDs5+l/qknBIvHi/OWxYgQCrMXqQ
	aTMiS6Q5yj4MWwuDW/EUagKgpneQYh4=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 3955F634C99;
	Fri, 31 Mar 2023 17:08:54 +0300 (EEST)
Date: Fri, 31 Mar 2023 17:08:53 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: staging: max96712: Add support for 3-lane C-PHY
Message-ID: <ZCbpdboZZop7pJXn@valkosipuli.retiisi.eu>
References: <20230211144614.3816247-1-niklas.soderlund+renesas@ragnatech.se>
 <ZCbQTjL+Gy+Poeu/@valkosipuli.retiisi.eu>
 <ZCbe9D+LxbWveekE@oden.dyn.berto.se>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCbe9D+LxbWveekE@oden.dyn.berto.se>

Hejssan, Niklas!

On Fri, Mar 31, 2023 at 03:24:04PM +0200, Niklas Söderlund wrote:
> Hej Sakari,
> 
> Tack för din feedback.
> 
> On 2023-03-31 15:21:34 +0300, Sakari Ailus wrote:
> 
> ...
> 
> > > @@ -332,8 +341,9 @@ static int max96712_parse_dt(struct 
> > > max96712_priv *priv)
> > >  {
> > >  	struct fwnode_handle *ep;
> > >  	struct v4l2_fwnode_endpoint v4l2_ep = {
> > > -		.bus_type = V4L2_MBUS_CSI2_DPHY
> > > +		.bus_type = V4L2_MBUS_UNKNOWN,
> > 
> > The bindings don't require setting bus-type. Please change the bindings as
> > well. And assume D-PHY in the driver if bus-type isn't set.
> 
> Thanks for spotting this, I will send out an update to update the 
> binding to require setting bus-type.
> 
> About updating the driver to assume D-PHY if bus-type is not set. I 
> wonder if we can avoid that and keep the driver change as is? The only 
> in-tree user of this binding is in r8a779a0-falcon-csi-dsi.dtsi, and I 
> intend to send out a patch to set the bus-type for that together with 
> the updated bindings.
> 
> I have tested this driver change on the Falcon board and if bus-type is 
> not explicitly set in the DTS it is reported as D-PHY and everything 
> works as expected. So if I
> 
> - Send out a patch to update the bindings to require bus-type being set.
> - Send out patch to update the only in-tree use of the driver to set 
>   bus-type.
> 
> Can't we avoid issues in the future by not assuming no bus-type is D-PHY 
> in the driver while still being backward compatible with the old DTS?

If you want to keep supporting D-PHY as a default, you should instead try
parsing with V4L2_MBUS_CSI2_DPHY as bus_type. Then CPHY if that fails.

Although if bus_type is mandatory, then this patch is fine.

-- 
Trevliga hälsningar,

Sakari Ailus
