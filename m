Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510922222CB
	for <linux-staging@lists.linux.dev>; Thu, 21 Aug 2025 09:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755768406; cv=none; b=Yz0U2cDBDaW6Q+Kdy/OiC+1pa2SjbpR5b5eJS6gkjDTA4cCHW8+t7L4HAueNcqwm6LAF+Ke5YICtw9KQHYNKkHzZPQpbLYzXdhoRvQM91rUR01j+SYJYS4uFCTIHDyLnfVJsYjL/9UySEdKIexb+4euVt9XB8rfyCcRJNuMa8uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755768406; c=relaxed/simple;
	bh=PQOJTBPJoyQfCaJKlfGKvW3sZq/+GNu3eo+031+ohKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c9qM+WFAntM9VD1ORI0gJYuiIWhgxRjlJmIy5Bk/2uCy9q0cb56/TkuUa4BNgIv04iiJHUnOOrrav+o3Zzdz8PH4hAahzdREg8TuzvgZvdzfNI+c5IQOOO7G9gvKaC7Ju5w7ojKvxLGD8g860gs6D0glkm/Pdubi3kr+srUEBR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+um4o4l; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+um4o4l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755768405; x=1787304405;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PQOJTBPJoyQfCaJKlfGKvW3sZq/+GNu3eo+031+ohKc=;
  b=S+um4o4l+ifUaAtICHGi/EZly4Skq1TChWSu4UD8v37N2Hr4shew7Bhr
   yZxkfYzYYKrxvUFiZ3eALNvnN6ShBjPUM/uMMWvIBJzYVpcSboNA/+CMC
   8GXeSi+R+7vCqNuSS+nnNV0LhWn9sA7FehSsepSlKH3TgNfvh9ciuGWVD
   IZGYJUXwKCZlErIlu2Kf5hWktPr/vdUv62siWBDe13gHoQxeMGSVVUOxt
   pZjrC8JxLkPiLTKcK/JniHhTtTCttmdrzSzNkTJsjoIJTQkThOJBDgvxh
   roSECmsYWrRiQZAF94aBh6rfTryDhg6SlLVx7uGR9l9XYQNplzQH/F7Nn
   g==;
X-CSE-ConnectionGUID: XnYGiwRBQxyZ4YAhKtvtsw==
X-CSE-MsgGUID: yGM6KvSmR3q6FeftEhV6mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="75636924"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="75636924"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 02:26:45 -0700
X-CSE-ConnectionGUID: qD3OKUNpQ7+Uusx0LXqupA==
X-CSE-MsgGUID: MjeHRN/DSyG0Of+9Wq0q4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="168274682"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 02:26:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1up1Z9-00000007BUH-2QpV;
	Thu, 21 Aug 2025 12:26:39 +0300
Date: Thu, 21 Aug 2025 12:26:39 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Colin Ian King <colin.i.king@gmail.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] media: atomisp: use kmalloc_array() for array space
 allocation
Message-ID: <aKbmTz3bd2dq_i3X@smile.fi.intel.com>
References: <20250821081746.528018-1-rongqianfeng@vivo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821081746.528018-1-rongqianfeng@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Aug 21, 2025 at 04:17:42PM +0800, Qianfeng Rong wrote:
> Replace kmalloc(count * sizeof(type)) with kmalloc_array() for safer memory
> allocation and overflow prevention. Additionally, replace sizeof(type) with
> sizeof(*ptr) to improve code robustness.

LGTM, thanks.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


