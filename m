Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDAD4416
	for <linux-staging@lists.linux.dev>; Mon,  5 Sep 2022 15:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662391819; x=1693927819;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8mFpiMAF6eHHpFQcvhpWXup3tSDSzv5VQh4Nu0g1c1w=;
  b=B+pQVkybqJ9hN1Z0qMbh3NCfUfVftCRHBDmuO8L2HMk2QZgakVT2FF8k
   OU2JK9fd2PUrj/DO9hyizoTsj3JZeG9IFBKclAIY0/38pcnBtlFmWQmwk
   NNEXK08oFtbGJa8XQ0XVBZkzEJn3nvPaULA7kQaMyspzmga5VFlOWZ1DK
   ygD6PKYr78jA14UoCEJXxLaYqFfqyUe27IuZRvRLn627fBL8HkkVHQCac
   YoXbqxIYP9+2jhQ32jy3ZXY9UBWwqMa9cOJ3NGhWBWBAw3DWBhIZToPK+
   OlbP+be4p3E3tBNPDOhrCmMKWfKCxaOL+Hz8R/2hDeY+u+M/0XeJ1gdlo
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="296414475"
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="296414475"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 08:30:18 -0700
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="756074824"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 08:30:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oVE3C-008jBK-0c;
	Mon, 05 Sep 2022 18:30:14 +0300
Date: Mon, 5 Sep 2022 18:30:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/1] media: atomisp_gmin_platform: Unexport and split
 camera_sensor_csi()
Message-ID: <YxYWBSo+fceHCAOd@smile.fi.intel.com>
References: <20220730162027.1011-1-andriy.shevchenko@linux.intel.com>
 <Yud2cwiCCnq4x50L@paasikivi.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yud2cwiCCnq4x50L@paasikivi.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

+Cc: Hans

On Mon, Aug 01, 2022 at 06:45:07AM +0000, Sakari Ailus wrote:
> On Sat, Jul 30, 2022 at 07:20:27PM +0300, Andy Shevchenko wrote:

...

> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks!

Hans, maybe you want to include this one into your bunch?

-- 
With Best Regards,
Andy Shevchenko


