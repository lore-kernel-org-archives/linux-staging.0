Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF3BA4F
	for <linux-staging@lists.linux.dev>; Mon, 21 Nov 2022 09:01:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="312212341"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="312212341"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 01:01:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="591698052"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="591698052"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 21 Nov 2022 01:01:22 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1ox2g4-00FBs7-2t;
	Mon, 21 Nov 2022 11:01:20 +0200
Date: Mon, 21 Nov 2022 11:01:20 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 10/20] media: atomisp: Drop userptr support from hmm
Message-ID: <Y3s+YOqkvdBrfLy+@smile.fi.intel.com>
References: <20221120224101.746199-1-hdegoede@redhat.com>
 <20221120224101.746199-11-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221120224101.746199-11-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, Nov 20, 2022 at 11:40:51PM +0100, Hans de Goede wrote:
> After the conversion to videobuf2 userptr support is no longer needed,
> drop it.

...

>  	dev_dbg(atomisp_dev,
> -		"%s: pages: 0x%08x (%zu bytes), type: %d, user ptr %p\n",
> -		__func__, bo->start, bytes, type, userptr);
> +		"%s: pages: 0x%08x (%zu bytes), type: %d, vmalloc %p\n",
> +		__func__, bo->start, bytes, type, vmalloc);

I believe we may drop __func__ here as well.

-- 
With Best Regards,
Andy Shevchenko


