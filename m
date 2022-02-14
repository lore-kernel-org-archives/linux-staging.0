Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C386E7E1;
	Mon, 14 Feb 2022 18:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644863421; x=1676399421;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2SuiWkTsCmL0kmekpSa89GaVmY8ni1VlZC8DxtgnZ6g=;
  b=ZPKVpU8Nwj+yMbEsnsCSCTplGrgi+VIJiml+ICx850FD0WA41OtBWndF
   md4J4GGDajQ1K0tcByd8CJB88E/I8PvycbVfesXEiPBTehlE3JM2ByRc4
   7LEq6kc7o5o78ZY4mrHXPJDny4wpq7rs+Yb/ruB0nQXILQueMtRNwVHfk
   KAgNHl2WSSRjgUc+SbYibTeMKpx9nXs/xPB5RtB13HXu27zQLFXk9d8hU
   CwT2X5YFBrjsZOTP681BpNsjO1nXYa3sE9yZXx+FXYgEsBvWyL6S8pOtb
   Xu0+rUMiv88gyonyZXMWUAViq8M0T9E2D2bflUNuKGSlgKEzjzvsHbURo
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="336582919"
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="336582919"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 10:30:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="624372837"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 10:30:15 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 0993C202D5;
	Mon, 14 Feb 2022 20:30:13 +0200 (EET)
Date: Mon, 14 Feb 2022 20:30:13 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
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
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 37/66] media: sun6i-csi: Move power management to
 runtime pm in capture
Message-ID: <YgqftcDgfrsZfTdF@paasikivi.fi.intel.com>
References: <20220205185429.2278860-1-paul.kocialkowski@bootlin.com>
 <20220205185429.2278860-38-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220205185429.2278860-38-paul.kocialkowski@bootlin.com>

Hi Paul,

On Sat, Feb 05, 2022 at 07:54:00PM +0100, Paul Kocialkowski wrote:
> Let's just enable the module when we start using it (at stream on)
> and benefit from runtime pm instead of enabling it at first open.
> 
> Also reorder the call to v4l2_pipeline_pm_get.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Nice patch!

Do you still need v4l2_pipeline_pm_put()? Removing it would be a separate
patch of course.

-- 
Kind regards,

Sakari Ailus
