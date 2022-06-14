Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739D8185F
	for <linux-staging@lists.linux.dev>; Tue, 14 Jun 2022 13:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655212389; x=1686748389;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aHef+7/u0+xLgNDgDfOcIfe1/pGQja1IhhoY/gdLLyw=;
  b=nzI9WGmzNUjaS3tH1FsGXLqeJu0M6Ww0mnJtoCYIkv2vePrWxPSB29JJ
   PXW17M+IetxAnGycpqeZPCrhiShMRyqRwTJS2R+ZDfhkAXUo+W2T8oMLJ
   shaoaaYN/9u1Qd9Cp+qm6q8lbHroe2asm1aGJ5440w6bM3lgeEpX4FpFz
   cz3tqtj8vwR61eYNqBSKcQ+SX9pIuPxXWN3EqHYKSwe+qJ0OHJDYVAY/H
   ZLSeoPtflNwzRDLz9wCoZfX31RbEk8pV+cspqVUiKa1DAM0rhiBdLBe2t
   Mms6YboFSAVvWIaq5ecDBXA0p0djMXfkvd1aPSVDG04xR+0l6n0Zh0Xz0
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="279329238"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="279329238"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 06:13:08 -0700
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="652029357"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 06:13:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1o16Lu-000cNw-Vj;
	Tue, 14 Jun 2022 16:13:02 +0300
Date: Tue, 14 Jun 2022 16:13:02 +0300
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
Subject: Re: [PATCH 32/40] media: atomisp: remove hmm_page_object
Message-ID: <YqiJXgSoET8vTIDM@smile.fi.intel.com>
References: <20220613195137.8117-1-hdegoede@redhat.com>
 <20220613195137.8117-33-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220613195137.8117-33-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jun 13, 2022 at 09:51:29PM +0200, Hans de Goede wrote:
> hmm_page_object only stores a struct page pointer, so we can just use
> the hmm_bo.pages page pointer array everywhere.

Right!

-- 
With Best Regards,
Andy Shevchenko


