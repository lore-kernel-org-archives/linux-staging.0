Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93543333730
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 14:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777905400; cv=none; b=WZPhBW+/VXITT5Qus1MNWsNmpj6uNasA62Ghb+yj+thDySUC+pkpR7ujrenHKkrUgeO9R+J5WKsU6eF1GRiCgJSmo/F0RTdXSKE94IUz6hjDAElMq81IfkZqwc3InPdV3UlQ9y1RoZddmfnBr0BgfWUYSS3PepmFMITaqDuq3xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777905400; c=relaxed/simple;
	bh=vQURBi2zGUBc/OA/dc9cSh8XhaVACnsFfcHy6CCBX7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l8q71v8ALnzughbjJCrIIN+QxWeCrd0fea0+412WrVVHymyts2jFUUX2FchJ6gCDgY2jinqcFqaHi+YV/h2FuSu1YbJzyHn0VTpsTDmAAss2yO+cxe5mVk4THPhMTsV47MxZV7cH4QGtU4CJ5fNe63xsLh5DY/8CrKAsKaAPM3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NicN69wG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NicN69wG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777905400; x=1809441400;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vQURBi2zGUBc/OA/dc9cSh8XhaVACnsFfcHy6CCBX7Q=;
  b=NicN69wGtEJD0VkFBpy40H4qW90CumgGXnbLunKTlD4J3c6JmwkCUvCE
   vNRn5hXqXOD+zW7/AmI4xASjjI52QgX2SPpn+aO7sRYRI2kaUp6b1fqL+
   Jcj9JQTAl+CE8131anZmkgMvIShdWHLGy04NIe24D78RVY+iP2sPGDQy9
   m7Oz8w5Vlxk2y0m16qhk5OLm79dprbgSd6bH6YlgcZPsbD1QUQXZFJLEb
   NBGKSSVKukqn75auM4wrmES+2z5WYkXntA9KatvLfX2ZbRZtxXN9B8YC+
   LyDNDkPJ+az+Yuq71wGdrP8/FsuJHBTLkx2homyEGh0AzjbfEsoXYxKs+
   Q==;
X-CSE-ConnectionGUID: cLqKHZ+cTsmjX6jG6xOOvg==
X-CSE-MsgGUID: raA/WQZLQt2yxpCYZI/Z5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="101428605"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="101428605"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 07:36:39 -0700
X-CSE-ConnectionGUID: HUZ5QlHQTEmaoiHsfh9Bqg==
X-CSE-MsgGUID: u+bFkSX4SyKmRjti2PeyPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="273646847"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.198])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 07:36:37 -0700
Date: Mon, 4 May 2026 17:36:34 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: media: atomisp: drop unnecessary else block
 after return/break
Message-ID: <afiu8j_S_nDsWmiB@ashevche-desk.local>
References: <20260504103656.32945-1-shyamsunderreddypadira@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504103656.32945-1-shyamsunderreddypadira@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, May 04, 2026 at 04:06:56PM +0530, Shyam Sunder Reddy Padira wrote:
> Remove redundant else blocks following return or break statements.
> As control flow exits in these cases, the else branch is
> unnecessary. Dropping it improves code readability.
> 
> No functional change.

There is still a lot of room to improve in these pieces of code, but it is
out of scope of this simple change, FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


