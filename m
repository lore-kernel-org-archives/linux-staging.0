Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBEA71
	for <linux-staging@lists.linux.dev>; Thu, 17 Jun 2021 12:55:31 +0000 (UTC)
IronPort-SDR: HJ4tw3jzNjSbXA+FXCEZFQjFXiugbwtUIAklvzzPQ+Ce/CCtG6qpBSa15h876G9bvuUVFVz8vz
 xNB0ym9aIDQQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="204532210"
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; 
   d="scan'208";a="204532210"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2021 05:55:30 -0700
IronPort-SDR: 9hRuB0jGPR1x7UZWUt9VVEzVQJC4wSSuZGxMHE5FzVnxbkwDr9VMb/OsQSk1ji14e+cIbwkOB1
 R7Sss0cYTfpg==
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; 
   d="scan'208";a="637833283"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2021 05:55:27 -0700
Received: from andy by smile with local (Exim 4.94.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ltrYK-003LQb-91; Thu, 17 Jun 2021 15:55:24 +0300
Date: Thu, 17 Jun 2021 15:55:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Baokun Li <libaokun1@huawei.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, kaixuxia@tencent.com,
	gustavoars@kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	weiyongjun1@huawei.com, yuehaibing@huawei.com,
	yangjihong1@huawei.com, yukuai3@huawei.com,
	Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next v4] media: staging: atomisp: use list_splice_init
 in atomisp_compat_css20.c
Message-ID: <YMtGPPgM+zv0iL5u@smile.fi.intel.com>
References: <20210617124709.670936-1-libaokun1@huawei.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617124709.670936-1-libaokun1@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jun 17, 2021 at 08:47:09PM +0800, Baokun Li wrote:
> Using list_splice_init() instead of entire while-loops
> in atomisp_compat_css20.c.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Baokun Li <libaokun1@huawei.com>
> ---

You missed changelog.
And I believe you missed the changes.
So, what's the point?

-- 
With Best Regards,
Andy Shevchenko


