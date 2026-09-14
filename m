Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7791E371D05
	for <linux-staging@lists.linux.dev>; Mon, 14 Sep 2026 08:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373952; cv=none; b=Fzt7l8jaUdP2sU+R4bd8LzhabpGkubErLgODflbFk/cBNPImbHWZMEieWY127lKicKfr4FNNjiQolOLMRu2UwH6+eAMveC6svxioswRNPM6gsmbdfzKt7zUc402bMbDi5LbYJlXvep+GYxY56X2okP6PXLTKjSOw1DejcAzIxf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373952; c=relaxed/simple;
	bh=bSzJO/Gm0VfLyOaG123eiqMw2z6vU1EmYkjOF6AivUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DBO6seAt9Cxvbaphc/uhNrw3OuXzJgLqeIV0TEjQ/2sFO2zdrUx3izpoeI1owTzo1a3N7q+epEDH8cquRnsggy5gTcyxFuwsCeVAtlVkKBK4tU51NgyyVwrM+GZ8zN6kwzo+Ij4uh0H8bVCXkSBpqxIvvWuBZHOPy69iDT2tHBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HjWprQxq; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HjWprQxq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789373950; x=1820909950;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bSzJO/Gm0VfLyOaG123eiqMw2z6vU1EmYkjOF6AivUA=;
  b=HjWprQxqWSt8ZhRXjdQFVScaIaDK5SJaPTNfV+IYJSdfhayOvYaYfyvK
   bXuQv0HqBnohWpFL5LLcxrnx0WbUxkXEPdwrILjtFDMaYisqPkLKjj2M/
   ZsEKuRLUH5NtUYBurdLpEUTv5uBWr0MSHiq8r7LdWojpxBGv5hfXptxzB
   1WutLA/gCema1a2jE65hFqaROi5VyeUjgJeYSpS7G66zq8XSVQyKO2NRq
   JmVidyfMhwV0UwYtk6PAWHXcQjS9LQnyip+t9S7hLsdPHkXBZkO1Gg9/Q
   y8TAKzQz1Q/fhjekEJwuc2mQotQ1HkInRqhbsCBnbWawvw4lcvtMOJb0m
   w==;
X-CSE-ConnectionGUID: tjgjzsgdSMaUwROVSk73Fw==
X-CSE-MsgGUID: XsEFdv7JQfuZE6pCyUsCWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89658671"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89658671"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 01:19:10 -0700
X-CSE-ConnectionGUID: 2X/ZwpQdRxm/qG1A4hoI7Q==
X-CSE-MsgGUID: Xlipky5lTTKk2ubkixgZLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="270778679"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.29])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 01:19:06 -0700
Date: Mon, 14 Sep 2026 11:19:04 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Shehryar Ahmad <shehryar.amd@gmail.com>
Cc: jic23@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
	dlechner@baylibre.com, andy@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org,
	linux@analog.com, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/6] iio: accel: adis16201: add OF device ID table
Message-ID: <aqet-FxqeFzYDBa0@ashevche-desk.local>
References: <20260913085307.13846-1-shehryar.amd@gmail.com>
 <20260913085307.13846-3-shehryar.amd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913085307.13846-3-shehryar.amd@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Sep 13, 2026 at 01:53:03PM +0500, Shehryar Ahmad wrote:
> Add of_device_id table for adis16201 and register it with
> MODULE_DEVICE_TABLE() to enable device tree based matching.

Same comments as per previous patch.

-- 
With Best Regards,
Andy Shevchenko


