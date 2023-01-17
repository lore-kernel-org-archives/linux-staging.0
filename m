Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DB24C9A
	for <linux-staging@lists.linux.dev>; Tue, 17 Jan 2023 15:34:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="389221881"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="389221881"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 07:34:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="609281951"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="609281951"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 17 Jan 2023 07:34:14 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1pHnyW-00Adds-2m;
	Tue, 17 Jan 2023 17:34:12 +0200
Date: Tue, 17 Jan 2023 17:34:12 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Brent Pappas <bpappas@pappasbrent.com>
Cc: hdegoede@redhat.com, mchehab@kernel.org, ailus@linux.intel.com,
	gregkh@linuxfoundation.org, error27@gmail.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: pci: Replace bytes macros with
 functions
Message-ID: <Y8a/9GI+OsSRo+te@smile.fi.intel.com>
References: <20230117150841.18061-1-bpappas@pappasbrent.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117150841.18061-1-bpappas@pappasbrent.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Jan 17, 2023 at 10:08:41AM -0500, Brent Pappas wrote:
> Replace the function-like macros FPNTBL_BYTES, SCTBL_BYTES, and
> MORPH_PLANE_BYTES with static inline functions to comply with Linux coding
> style standards.

Thank you!

But I think what you need, besides dropping unneeded parentheses is to use some
macros from overflow.h.

-- 
With Best Regards,
Andy Shevchenko


