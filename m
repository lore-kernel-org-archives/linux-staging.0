Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164C7185F
	for <linux-staging@lists.linux.dev>; Tue, 14 Jun 2022 13:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655212344; x=1686748344;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sWRhluXglDF3eEYaOYrblA1shJ/RUcNFMlvk2W3KV2s=;
  b=Q/AlxPPn6sBHqSqLuQarsC12LUCAbQAst2JUI/xHwa3KqbH25kwhca3i
   pOU01glW/69uGWMKIsCbo+d4s5CCNkQpTxwGK0iATc2xv5iwgoqNSqosW
   m1DtmKPsNunIl1okDyF0SVMe8CMabMnsq1JlxzokEnSxHOBfVNAHq3bCz
   B6hOQzoXtztciIRVYd1JNB8ynqOeufh2xTJ3BCnWBKAJD742LIqJPpRVj
   9ogtEgs6vXobY5rcOh/HWe4jeZk/axZnoAK5lU5t4Z7zQuY4KI17L9ya/
   fFgXux7JMlLwkinBjYZXDpqeb2Bi3LMPiOzCtrJ8fNA0qzCQ6dxZKg2rj
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="259063588"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="259063588"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 06:12:23 -0700
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="569968906"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 06:12:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1o16LB-000cNp-KO;
	Tue, 14 Jun 2022 16:12:17 +0300
Date: Tue, 14 Jun 2022 16:12:17 +0300
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
Subject: Re: [PATCH 31/40] media: atomisp: drop HMM_BO_SHARE type
Message-ID: <YqiJMRX6x3A7R/+T@smile.fi.intel.com>
References: <20220613195137.8117-1-hdegoede@redhat.com>
 <20220613195137.8117-32-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220613195137.8117-32-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jun 13, 2022 at 09:51:28PM +0200, Hans de Goede wrote:
> HMM_BO_SHARE is not supported by the hmm_bo code at all, drop it.

...

> - * of memory: HMM_BO_PRIVATE, HMM_BO_USER, HMM_BO_SHARE.
> + * of memory: HMM_BO_PRIVATE, HMM_BO_USER..

Single period is enough?

-- 
With Best Regards,
Andy Shevchenko


