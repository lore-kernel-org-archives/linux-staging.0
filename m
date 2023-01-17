Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6B44C9A
	for <linux-staging@lists.linux.dev>; Tue, 17 Jan 2023 15:35:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="323419841"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="323419841"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 07:35:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="801779057"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="801779057"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 17 Jan 2023 07:35:34 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1pHnzo-00Adfu-26;
	Tue, 17 Jan 2023 17:35:32 +0200
Date: Tue, 17 Jan 2023 17:35:32 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Brent Pappas <bpappas@pappasbrent.com>
Cc: hdegoede@redhat.com, mchehab@kernel.org, ailus@linux.intel.com,
	gregkh@linuxfoundation.org, error27@gmail.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: pci: Replace bytes macros with
 functions
Message-ID: <Y8bARLuFubMVILIN@smile.fi.intel.com>
References: <20230117150841.18061-1-bpappas@pappasbrent.com>
 <Y8a/9GI+OsSRo+te@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8a/9GI+OsSRo+te@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Jan 17, 2023 at 05:34:12PM +0200, Andy Shevchenko wrote:
> On Tue, Jan 17, 2023 at 10:08:41AM -0500, Brent Pappas wrote:
> > Replace the function-like macros FPNTBL_BYTES, SCTBL_BYTES, and
> > MORPH_PLANE_BYTES with static inline functions to comply with Linux coding
> > style standards.
> 
> Thank you!
> 
> But I think what you need, besides dropping unneeded parentheses, is to use some
> macros from overflow.h.

And drop "staging:" prefix from the patch since media maintainer uses (dumb)
script that adds "media:" if it doesn't lead the Subject.

-- 
With Best Regards,
Andy Shevchenko


