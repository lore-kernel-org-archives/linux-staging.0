Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABACC19BA6
	for <linux-staging@lists.linux.dev>; Mon, 23 Sep 2024 08:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727080253; cv=none; b=WGsWhGm8Dr+TnUHhN1fokqUMz9qqkdRde7FSSJ1XdzQuCDo5UsVu/gFdwk1AG7VxlosBGMATU8DUoyiLZBNRUl+Q2D6+plG8inqfpxa+qQrAf7tcc+muoMVchWBmV+rnacFH+0sirMUE88pMXoi4dx1pFBMXkFPzYPsjJfABVwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727080253; c=relaxed/simple;
	bh=hBkmiKO56GSLzeHh5tObT3WSpCFOeVe3N/No72Lx6Pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eWYMiJ2bipzM/gvyrbMrPyliietFlajPU5mNXuI3+CrbHMFzsBotCZo6F9lVe0wvGAdS0Hbsr2Yu7mHbHsNkBauYhWpgT/ZlhE5u/FUlx55iM69PKvBx6DXbkjg5UqWx7r/ZlGQ5C4w5ZiiLXr9Qt7ESQGQ2kOxNJe3Xr4TV5gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: mxzKBgoUSrKDuMA9s20+rA==
X-CSE-MsgGUID: mwFlknPJSPK7uBDdi7PNqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="26108605"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="26108605"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 01:30:52 -0700
X-CSE-ConnectionGUID: 9ar9/5IQQ/Gy+RDyv+CTyA==
X-CSE-MsgGUID: lN3nIR6rTWmtH4IocQH0KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="71017545"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 01:30:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1sseSz-0000000BtRR-28Hk;
	Mon, 23 Sep 2024 11:30:45 +0300
Date: Mon, 23 Sep 2024 11:30:45 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Yu Jiaoliang <yujiaoliang@vivo.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jonathan Bergh <bergh.jonathan@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Dipendra Khadka <kdipendra88@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, opensource.kernel@vivo.com
Subject: Re: [PATCH v1] media: atomisp: Fix typos in comment
Message-ID: <ZvEnNXHV9ZnnQswd@smile.fi.intel.com>
References: <20240923033032.2420839-1-yujiaoliang@vivo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923033032.2420839-1-yujiaoliang@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 23, 2024 at 11:30:23AM +0800, Yu Jiaoliang wrote:
> Corrected typos:
> componnet->component,
> cofiguration->configuration,
> doubtfull->doubtful,
> consisit->consist,
> coppied->copied.
> 
> These changes fix the typos in the comment,
> without affecting the functionality.

...

>  	//config.acq_allocated_ib_mem_words		 = 0;
>  
> -	// Set the start of the session cofiguration.
> +	// Set the start of the session configuration.

While at it, the comment style can be changed to C-like

	/* Set the start of the session configuration */

(no need to resend unless Hans asks for that, otherwise he might fix whilst
 applying).

-- 
With Best Regards,
Andy Shevchenko


