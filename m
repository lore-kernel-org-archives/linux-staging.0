Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17BF48BE
	for <linux-staging@lists.linux.dev>; Tue,  8 Mar 2022 12:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646741682; x=1678277682;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pj07O+oiBpvt9RG+DMy/vaA6wCldd0Kb1X9+1g+qKKk=;
  b=ZYiSsnAXuNktEFZ5Y5TA7KgqsgBGRLEuxN1B/NDik+PCTJjwXbcPR6+y
   zneatAKig5z6EOujeJu0mzD75961ZAHQPgDPGb+rM4xfDbopGQJIJdF65
   ticUVL3NJFiKcQFWlURLhKgWsaLsLdnp+HHI8PDV5K8oN54wCu3kgtVz/
   wWUG0QAJS1GG5CpfTjgLXcx8Ftxl/y44PetWl3BDupfkbkRAqU8/KjTqw
   xYxSf1kSzmaD6G4gzlg3K0Mz2IfYuruKXcf63baT69/zBDgES4LNpW5Zk
   E2K0fHkHAfJut9dCFhxE4f583wix2CJ2yX3YjJ45Z1u8DsvyEY7UTFp9P
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="317898529"
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; 
   d="scan'208";a="317898529"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 04:14:41 -0800
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; 
   d="scan'208";a="537546642"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 04:14:38 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1nRYiw-00DLej-Di;
	Tue, 08 Mar 2022 14:13:54 +0200
Date: Tue, 8 Mar 2022 14:13:54 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v1 1/1] staging: fbtft: Consider type of init sequence
 values in fbtft_init_display()
Message-ID: <YidIgkiv7B8g14RD@smile.fi.intel.com>
References: <20220304193414.88006-1-andriy.shevchenko@linux.intel.com>
 <Yictcf0BCvveVT+V@smile.fi.intel.com>
 <Yic0CN+qSvDtSiEz@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yic0CN+qSvDtSiEz@kroah.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Mar 08, 2022 at 11:46:32AM +0100, Greg Kroah-Hartman wrote:
> On Tue, Mar 08, 2022 at 12:18:25PM +0200, Andy Shevchenko wrote:
> > +Cc: Helge
> > 
> > Maybe you can pick this up?
> > 
> > On Fri, Mar 04, 2022 at 09:34:14PM +0200, Andy Shevchenko wrote:
> 
> You sent this less than a week ago!  Please relax, staging driver
> patches are way down my list of priorities at the moment.  Wait at least
> 2 weeks before trying to get someone else to take patches for this
> subsystem.
> 
> relax...

Ah, okay. Sorry, I was browsing my long mailbox and haven't paid attention on
the date I had sent this one on.

-- 
With Best Regards,
Andy Shevchenko


