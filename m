Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05873186C;
	Tue, 15 Feb 2022 21:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644960076; x=1676496076;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D3mH1ZQYnUmDyHebTFiaM1aX+zULtvkheCq0LawoiFk=;
  b=nbghmcmdjN1meaD/DF6yNAjdADShA7w/EHfG/nlaAxadAFxz55VRIUOD
   FO8y21TrRnna0MTajlVv2c5RB8U4iCGqCDsilh1f7pvX5joi9UOLikL5a
   UQDfZNKtVD7RcxpG3RpKIVwCgxzQOn5yvpki+i6yD9gqzRL5d+PY2Os/2
   nA+joW1Ft85MALKSOKfMm4Yjku3E5h8u6NFhUjZevdoGnpd8mqu9dcVvW
   KpUKVanY97klpCJQSZgWC/3EsKd74k90YR76SS3dBzGEgISpcOya6AnG1
   oWPlPZjH3yjpJty6jzahDRW5BIRfoIn3AzRBsdFMrcc+XAruwesw7O6qF
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="250197094"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="250197094"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 13:21:10 -0800
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="625027203"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 13:21:05 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 723FA200F1;
	Tue, 15 Feb 2022 23:21:03 +0200 (EET)
Date: Tue, 15 Feb 2022 23:21:03 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev,
	Yong Deng <yong.deng@magewell.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helen Koike <helen.koike@collabora.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 37/66] media: sun6i-csi: Move power management to
 runtime pm in capture
Message-ID: <YgwZP4CS26FCOOqc@paasikivi.fi.intel.com>
References: <20220205185429.2278860-1-paul.kocialkowski@bootlin.com>
 <20220205185429.2278860-38-paul.kocialkowski@bootlin.com>
 <YgqftcDgfrsZfTdF@paasikivi.fi.intel.com>
 <Ygt4xh2Mq0qStyKs@aptenodytes>
 <Ygt6vwydxg9/WuDH@pendragon.ideasonboard.com>
 <Ygt+nZJrZMNXV4Cl@aptenodytes>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ygt+nZJrZMNXV4Cl@aptenodytes>

Hi Paul,

On Tue, Feb 15, 2022 at 11:21:17AM +0100, Paul Kocialkowski wrote:
> Hi Laurent,
> 
> On Tue 15 Feb 22, 12:04, Laurent Pinchart wrote:
> > Hi Paul,
> > 
> > On Tue, Feb 15, 2022 at 10:56:22AM +0100, Paul Kocialkowski wrote:
> > > On Mon 14 Feb 22, 20:30, Sakari Ailus wrote:
> > > > On Sat, Feb 05, 2022 at 07:54:00PM +0100, Paul Kocialkowski wrote:
> > > > > Let's just enable the module when we start using it (at stream on)
> > > > > and benefit from runtime pm instead of enabling it at first open.
> > > > > 
> > > > > Also reorder the call to v4l2_pipeline_pm_get.
> > > > > 
> > > > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > > 
> > > > Nice patch!
> > > 
> > > Thanks!
> > > 
> > > > Do you still need v4l2_pipeline_pm_put()? Removing it would be a separate
> > > > patch of course.
> > > 
> > > My understanding is that this is still useful if there are drivers in the
> > > pipeline that rely on s_power instead of rpm (a typical case could be an
> > > old sensor driver). So that's why this is kept around, but all other components
> > > of the pipeline (isp/csi/mipi csi-2) are using rpm now.
> > 
> > If that's not the case on your test platforms, I think it would be
> > better to drop support for this old API, and convert drivers that still
> > use .s_power() if someone needs to use one on an Allwinner platform.
> 
> I agree this is the path to follow but it feels like we're not quite there
> yet and a bunch of driver were not converted at this point, including some
> popular ones like ov5640, which I know for sure is used with Allwinner devices.
> 
> Honestly I'd be happy to get rid of these legacy functions as soon as the
> transition is done, but doing it now would mean breaking a significant number
> of use cases (which I'm trying to avoid here despite all the changes).
> 
> I definitely wouldn't be confident making that transition here and it
> probably wouldn't be a good idea to make that a requirement to merge this
> (already quite big) series.
> 
> What do you think?

Feel free to keep it if you prefer that.

All sensor drivers that implement s_power are old but there are quite a few
of them. Converting them isn't trivial so best done by someone who has
access to the hardware.

-- 
Regards,

Sakari Ailus
