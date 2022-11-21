Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDFEA4F
	for <linux-staging@lists.linux.dev>; Mon, 21 Nov 2022 08:55:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="375654157"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="375654157"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 00:55:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="640947292"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="640947292"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 21 Nov 2022 00:54:59 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1ox2Zt-00FBjt-2k;
	Mon, 21 Nov 2022 10:54:57 +0200
Date: Mon, 21 Nov 2022 10:54:57 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 01/20] media: atomisp: Silence:
 'atomisp_q_one_s3a_buffer: drop one s3a stat which has exp_id xx' log
 messages
Message-ID: <Y3s84dzxX3ARSZPb@smile.fi.intel.com>
References: <20221120224101.746199-1-hdegoede@redhat.com>
 <20221120224101.746199-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221120224101.746199-2-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, Nov 20, 2022 at 11:40:42PM +0100, Hans de Goede wrote:
> Standard v4l2 userspace apps do not consume the s3a statistics block
> data. Until we have a userspace consumer for this (libcamera), which
> might also involve changing the API for this, lower the log level
> of these messages to dev_dbg() to avoid them filling up the logs.

...

> -			dev_warn(asd->isp->dev, "%s: drop one s3a stat which has exp_id %d!\n",
> -				 __func__, exp_id);
> +			dev_dbg(asd->isp->dev, "%s: drop one s3a stat which has exp_id %d!\n",
> +				__func__, exp_id);

Please, drop __func__ as well. Most probably this can be run on the systems
with Dynamic Debug enabled, meaning that __func__ and __LINE__ can be enabled
at runtime.

-- 
With Best Regards,
Andy Shevchenko


