Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E4F746C
	for <linux-staging@lists.linux.dev>; Thu,  1 Sep 2022 19:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662062374; x=1693598374;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IxX0c/uDFyBM0ioa05lwfp0rWLGexYJhYM4gYbbZmA8=;
  b=SeK4NvHDZut3xBHj/u8icL9NMe+CaaY1vGLWHe0Lt8EuyU07TQCWSjO6
   WbxQRXj9MQFz7woymDpuAFXnhM1xuIwiKFWXoU1baBrfGGbDZSV8gtuTU
   drwEuzNkqTNMphQST6t1z40wXqMK+geEUfcHK+krTacJvhc4HD2vO3xps
   4FkUBvhTM0WAWJjJS8cHgNCQZ4Yo1BuKrZHIDEEgweMtuQeuEfcSYNv45
   rX5c1egW4RinXFr3OeNlKeE3Ywg/kHqCIGSpBUpSVuZnDPxg0+Nwty+Ub
   GHBJai2a7fnswKxXEJBKZMqoWS7zV8S9J4ZJ0LbTN1QyVJXUtyFi+DbZc
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="275562302"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="275562302"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2022 12:59:34 -0700
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="612639640"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2022 12:59:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1oTqLY-0071cw-0s;
	Thu, 01 Sep 2022 22:59:28 +0300
Date: Thu, 1 Sep 2022 22:59:28 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 00/14] media: atomisp: More cleanups / code removal
Message-ID: <YxEPIAv2oNO3VV3p@smile.fi.intel.com>
References: <20220901094626.11513-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901094626.11513-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Sep 01, 2022 at 11:46:12AM +0200, Hans de Goede wrote:
> Hi Mauro,
> 
> Here is a second set of atomisp cleanups / code removal.
> This applies on top of my previous v2 series from here:
> https://lore.kernel.org/linux-media/20220822150610.45186-1-hdegoede@redhat.com/

I looked into the code (mostly commit message and patches that not only delete
the stuff) and it LGTM, hence
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

> I plan to do more atomisp work the coming few weeks. So I'm thinking
> it might be better / easier for you if I just send you a pull-req based
> on 6.0-rc1 with all atomisp patches bundled around rc5/rc6 time.
> 
> Would that work for you ?
> 
> I do plan to keep sending out (incremental) patch-sets with my work
> (like this one) for review / comments.

Perhaps it's a time you add yourself as AtomISP2 (co-?)maintainer?

-- 
With Best Regards,
Andy Shevchenko


