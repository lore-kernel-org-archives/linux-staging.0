Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5D77C
	for <linux-staging@lists.linux.dev>; Fri, 14 Apr 2023 17:13:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="409720700"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="409720700"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 10:13:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="779249884"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="779249884"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Apr 2023 10:13:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1pnMzC-00HDU9-0N;
	Fri, 14 Apr 2023 20:13:22 +0300
Date: Fri, 14 Apr 2023 20:13:21 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Xiaomeng Tong <xiam0nd.tong@gmail.com>, cocci@inria.fr,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: atomisp: Move a variable assignment behind a null
 pointer check in atomisp_cp_general_isp_parameters()
Message-ID: <ZDmJsemYldOsMMrH@smile.fi.intel.com>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <d8ed4e5d-49d4-ca7e-1283-1ec166bf643d@web.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8ed4e5d-49d4-ca7e-1283-1ec166bf643d@web.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 13, 2023 at 10:20:15PM +0200, Markus Elfring wrote:
> Date: Thu, 13 Apr 2023 22:08:42 +0200
> 
> The address of a data structure member was determined before
> a corresponding null pointer check in the implementation of
> the function “atomisp_cp_general_isp_parameters”.
> 
> Thus avoid the risk for undefined behaviour by moving the assignment
> for the variable “cur_config” behind the null pointer check.

I don't think this is what is happening here. The check might be removed by
optimizer in the compiler.

> This issue was detected by using the Coccinelle software.
> 
> Fixes: ad85094b293e40e7a2f831b0311a389d952ebd5e ("Revert 'media: staging: atomisp: Remove driver'")

Wrong tag format.

Code-wise I'm not against this, but it's up to Hans.

-- 
With Best Regards,
Andy Shevchenko


