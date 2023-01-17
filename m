Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93F51C13
	for <linux-staging@lists.linux.dev>; Tue, 17 Jan 2023 18:37:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="389279279"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="389279279"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 10:37:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="748138394"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="748138394"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Jan 2023 10:37:17 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1pHqpf-00Aj8m-3D;
	Tue, 17 Jan 2023 20:37:15 +0200
Date: Tue, 17 Jan 2023 20:37:15 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Brent Pappas <bpappas@pappasbrent.com>
Cc: ailus@linux.intel.com, error27@gmail.com, gregkh@linuxfoundation.org,
	hdegoede@redhat.com, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	mchehab@kernel.org
Subject: Re: [PATCH v3] media: atomisp: pci: Replace bytes macros with
 functions
Message-ID: <Y8bq25jjRdgTTd7/@smile.fi.intel.com>
References: <CAHp75VcxaSXeMNmkPoMnA+zjp+JWmHp5aE+2yPhXaqxMC6QWEQ@mail.gmail.com>
 <20230117183152.6521-1-bpappas@pappasbrent.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117183152.6521-1-bpappas@pappasbrent.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Jan 17, 2023 at 01:31:52PM -0500, Brent Pappas wrote:

Read to the end this message, please!

> Replace the function-like macros FPNTBL_BYTES, SCTBL_BYTES, and
> MORPH_PLANE_BYTES with static inline functions to comply with Linux coding
> style standards.
> Replace multiplication with calls to size_mul to prevent accidental
> arithmetic overflow.

We refer to MACRO() and func() as depicted.
Otherwise looks good.

...

> Changelog:
> V1 -> V2: Use size_mul to perform size_t multiplication without risk of
> 		  overflow.
> 		  Remove the inline keyword from function definitions.
> 
> V2 -> V3: Add commit message.

You missed my other comments. Please, read reply in full and address all
reviewer's comments.

-- 
With Best Regards,
Andy Shevchenko


