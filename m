Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D253FC2
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 07:52:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="281635403"
X-IronPort-AV: E=Sophos;i="5.84,356,1620716400"; 
   d="scan'208";a="281635403"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2021 00:52:02 -0700
X-IronPort-AV: E=Sophos;i="5.84,356,1620716400"; 
   d="scan'208";a="457447060"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2021 00:51:59 -0700
Received: from andy by smile with local (Exim 4.94.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1mJWeV-00EFZG-TS; Fri, 27 Aug 2021 10:51:51 +0300
Date: Fri, 27 Aug 2021 10:51:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Joe Perches <joe@perches.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-scsi@vger.kernel.org,
	storagedev@microchip.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/5] vsprintf and uses: Add upper case output to %*ph
 extension
Message-ID: <YSiZlyQzgW8umsjj@smile.fi.intel.com>
References: <cover.1630003183.git.joe@perches.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1630003183.git.joe@perches.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Aug 26, 2021 at 11:43:00AM -0700, Joe Perches wrote:
> Several sysfs uses that could use %*ph are upper case hex output.
> Add a flag to the short hex formatting routine in vsprintf to support them.
> Add documentation too.

Thanks!

Unfortunately I have got only first patch and this cover letter. Can you,
please, Cc entire series?

-- 
With Best Regards,
Andy Shevchenko


