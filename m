Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0FE3AC0F1
	for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 07:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786520989; cv=none; b=DYQTCGr0td8EGWLinnvTWt0pbICxIkj5R8Bh6tu+fCwuGTAQsUlH95oBCf9lvxCbsFxi96Hfm1t+oeufFUMQXF2DAGuhz7lgPtzEFr8jHiSACGgFpNccbQl/PnVvBfsezrcBAVCD31bO2ncBcRHf+1LVlXVoVIwkrfwB39EwC/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786520989; c=relaxed/simple;
	bh=NtlyhnQmBsilZdF7SfmpzDgUVR9HMwVbGau6UW2qlNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+3iHJrzSjYXiQjSX7yuCen50LgSjkXFLfVFZVvNNf0bhpxlQ5vDre522C7mLFzZk0IFWyQnEhhvtwjdnR8ACMQtQtOcb6n+GGiyAJOZ4KV6cpMKbeuos23XTcBE5cSpYPBXNs7vAQYEoHfWi8HGg+nkn/pg9uEty9d4Px3B3YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TfRwoZJR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TfRwoZJR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786520986; x=1818056986;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NtlyhnQmBsilZdF7SfmpzDgUVR9HMwVbGau6UW2qlNY=;
  b=TfRwoZJRj1hVexU/NgGmwBd+Eu1NSiKF8Pw7ADml6SVCyDez8wpx+itY
   j4Q91z2G6qUQUcQKaH8PBQqqD+9AYDHDuIEBSBx0uIlrLMepqpFkN9biv
   yKIrY+BpQJViGP6fRVJw9VETYtxlBre/oHranUVWkEnZFc8C/h9p4wko4
   swmMpQIcr9nCdOzO2yz+AbikrF+prj7DT0grMBoF3JCTQtXzysdPph08q
   cvQRe7ku9+6k7+E8iD3bIix4ymAI/M3wtK96cF6fEXdiXoFlmmrAJPnLv
   o3TeeZZkt6R9dQ8JNG2AWGCWz7SGqI4hFO/7rINwa4dbtw1ghVLgB/8vF
   Q==;
X-CSE-ConnectionGUID: cxmFlFJLTmOIcBy44r/rBA==
X-CSE-MsgGUID: uLLwbRhbQBqR4AnpdKHa/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86916408"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="86916408"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 00:49:44 -0700
X-CSE-ConnectionGUID: DNArFQidRneJ1+LHCYvPRg==
X-CSE-MsgGUID: sKBb+grNSlWyxKfqMAmzRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="263092412"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.92])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 00:49:41 -0700
Date: Wed, 12 Aug 2026 10:49:39 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nikolay Kulikov <nikolayof23@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] staging: media: atomisp: remove unused functions
 from pci/hmm/
Message-ID: <anwlkzfVl2gvLG7r@ashevche-desk.local>
References: <20260723185217.317981-1-nikolayof23@gmail.com>
 <20260723185217.317981-2-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723185217.317981-2-nikolayof23@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 23, 2026 at 09:51:18PM +0300, Nikolay Kulikov wrote:
> These functions are declared and defined but are not called anywhere.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


