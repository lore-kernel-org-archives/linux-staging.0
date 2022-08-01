Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD537F
	for <linux-staging@lists.linux.dev>; Mon,  1 Aug 2022 06:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659336312; x=1690872312;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cbqXcDjp4IBB8KsWVje8p2Ad+jjJ0kLCJwU06mgi6Z4=;
  b=fGmlDpggU/RqO5fZaMbkEBGGvVQ7zfVjAuIvBWHe9+N5ExH5GMfx3U2I
   NCrQonhroIT7MBCSoIv2TwpfgWuCXaInEGknoHHA6LIPBEHDt584e4VJ1
   fjwHnmdItpH5bs74gjVFhnvVXnNnBq2RpTbi3L2tp4trGIwf6cWU1wl11
   mO8hOVz1mIf7ImpaZU2ROqNvA4nNSrW1CuZBrBhwv/3nRUpvY0yXAL3a+
   NaRbxwWcDB1xY3LKkV7OHiUCt2Q8rvmooUYPDy/GxBostfqebHD4z5/kF
   VTVlGekHllxOWEesr8Jft/jBt0vOTmrITkCIT+FDYeb8QxeqP8a79RvhH
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10425"; a="350784159"
X-IronPort-AV: E=Sophos;i="5.93,206,1654585200"; 
   d="scan'208";a="350784159"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2022 23:45:11 -0700
X-IronPort-AV: E=Sophos;i="5.93,206,1654585200"; 
   d="scan'208";a="552410211"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2022 23:45:10 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id F071A2019B;
	Mon,  1 Aug 2022 09:45:07 +0300 (EEST)
Date: Mon, 1 Aug 2022 06:45:07 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/1] media: atomisp_gmin_platform: Unexport and split
 camera_sensor_csi()
Message-ID: <Yud2cwiCCnq4x50L@paasikivi.fi.intel.com>
References: <20220730162027.1011-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220730162027.1011-1-andriy.shevchenko@linux.intel.com>

On Sat, Jul 30, 2022 at 07:20:27PM +0300, Andy Shevchenko wrote:
> The camera_sensor_csi() is not used outside the module, hence make it
> static. While at it, split it to _alloc() and _free() to clearly show
> the idea behind the last parameter @flag that is passed to
> gmin_csi_cfg().
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks!

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
