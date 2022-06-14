Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50ED185F
	for <linux-staging@lists.linux.dev>; Tue, 14 Jun 2022 13:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655211939; x=1686747939;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G58EvEW+xU2yxr+vTA79vx3Fmm53+RfSYVvtIrW9a4g=;
  b=WeiOmR6sgPkXdFx/VH+/GnnYl9A0FFMjansIAr4XZkQIxc1TT+u7UNVC
   2mIadE+bEPHgdW45ghs3jNLvffIdXWqe/xC8KiYiy/2Mjig+wsLQ1WCt8
   ws6Wgo+jZxBPcGXJlZD3WWqtjpb9nZZYo86HMfwdNDA5IR5jTGuqTr4DY
   +od8fOoydnFMexHTc+75Te4XQcOHnwIO1vo21Pwj+A7rZzqx++/KbQwSa
   gjS/vBU9sVdKBkQLxvfEhNsaO4rXnY10VEbqBsax7EldLD8mZVJJFcrEv
   mA57nbGKIiteVG2z1R1QH3ZS4aal1ettqWE0sY6NzAGyPLV/q+M765hM6
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="279648342"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="279648342"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 06:05:38 -0700
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="761954712"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 06:05:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1o16Ee-000cNM-JI;
	Tue, 14 Jun 2022 16:05:32 +0300
Date: Tue, 14 Jun 2022 16:05:32 +0300
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
Subject: Re: [PATCH 15/40] media: atomisp: drop hmm_page_type
Message-ID: <YqiHnHmzcK/QlpWK@smile.fi.intel.com>
References: <20220613195137.8117-1-hdegoede@redhat.com>
 <20220613195137.8117-16-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220613195137.8117-16-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jun 13, 2022 at 09:51:12PM +0200, Hans de Goede wrote:
> Since the hmm-pool code has been removed this now always gets set
> to HMM_PAGE_TYPE_GENERAL, so just remove it.

...

>  struct hmm_page_object {
>  	struct page		*page;
> -	enum hmm_page_type	type;
>  };

Not sure if you have the same idea after this, i.e. replacing custom data type
by direct use of struct page pointer.


-- 
With Best Regards,
Andy Shevchenko


