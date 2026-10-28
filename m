Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793195455;
	b=1HGS6nVVTaaYwzQBnqJ6IzTXXdYnjwCuHxgLCQfZS+xOlVuaU8oQt+e2Aq2qEEiVneob
	 izQQd2hGZmETb16q+Q7+/HAzIwKe7k5uDFYSRYpTHjSDM59Go3fubERWKJzZztaOyUNi/
	 ZgtQmzTAMULVT00VQtMBqlr+JGZ/hN2KZUTEKPgXMkH2jqBkzeBYjDhO+/77ts8rSqlIZ
	 0fi/eCvkYhB18Kl471fpHvq3/5I8yiayKi8VlXIXqhy8nPtZPPX8oiKaerTYE2b7VGDy6
	 NAjaj5geriGjVNle6vPMl6brgALe1SMcSr+37SJEQP8JWNq3dxXAVv7Kn1i3YY0j74g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195455;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=ytmfdLrrLUjit5910My8j6VwU6axce6cK5JuYHw9yuo=;
	b=YgNDn7IQtl870B0vnAfqS/4aOZVz/iUAm2lhD/oQploFXrKqaM+VN5eK/RuXzETmEKK2
	 5WMWk+Q9yg/sWr6m0hoeeaI1O7FH6b2svp6g9GF014Zjssfq8aI+5q7+ES1Q1K/DuThK0
	 VHdjuDFoYn3d1sx8Mb5LlnmAC3BgOow4/XHoXxj3g2u9PDhbKDyeo80YopO0+tD/MdBCS
	 zBijPjwVeFrpAqbfvEGK6TKUjUV99eVonCfQ7We9AxEPfVhPvczF9V1r/+5EntuikYPmQ
	 4lFaByxrI7urI9rQxttqZWukPyu9zchO2uyw44fCygqTsnUokcaVQ8mYn89k9O+nSJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FfVC9OvX;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96D9606A321
	for <linux-staging@lists.linux.dev>; Wed, 28 Oct 2026 13:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A96D9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FfVC9OvX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793195454; x=1824731454;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p1JkUACHdNx5IY27R/TUmcxdST8xoLNNfo7001KKm5k=;
  b=FfVC9OvX8rMNTzBSP0m6DvsZCM3O57JyRTjc+CA+GZTjsqO9pgksm5Nx
   TICBZnySAw2b5mS3XDlK5mUxNRDLpq2fIY6MHXx/l5hYcOYh5HvTV4g5l
   5Gl3FbhMig2PcRlnEtDNeWWPmpR3c/tGOCg31EINn4sGm/qvzG4LhYeLQ
   rpr0G4jtx19btq4Q+ijMmM7GHKsGwMfZ+6ashN50GERZ165da22cKB2xq
   w+BGC+46LzkJ6gERY04cWA0m8x0cNd0bTHXaVhDO9wGyIRmfkWmV56msr
   ijEw8teVAH6A2fWhiK0tmzUxRPxmQw0OYbhupx6hRZRb7WOZujO1KBBuw
   g==;
X-CSE-ConnectionGUID: YccnlmgyQPC2joXndVxhRw==
X-CSE-MsgGUID: eNFAeTMiSemxovhaINGM5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1930325"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1930325"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 06:50:53 -0700
X-CSE-ConnectionGUID: tbj/Sw60SuyXyV/lo3NuvQ==
X-CSE-MsgGUID: W/Jsa/uqStW2efrFVJE6sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4783179"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 06:50:50 -0700
Date: Wed, 28 Oct 2026 15:50:48 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nuno Sa <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux@analog.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: addac: adt7316: clean up and sort headers
Message-ID: <auH9uAxgDIE3AByn@ashevche-desk.local>
References: <20261028094308.27811-1-abdelnasserhussein11@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028094308.27811-1-abdelnasserhussein11@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 28, 2026 at 12:43:07PM +0300, Abdelnasser Hussein wrote:
> Remove unused header files and
> add linux/pm.h and linux/string.h and

This should be a separate patch, it also needs to get rid of "proxy" headers,
such as kernel.h. (The use of device.h needs to be revisited,)

> sort the remaining include directives alphabetically.

-- 
With Best Regards,
Andy Shevchenko


