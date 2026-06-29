Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F44936DA04
	for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 11:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782731788; cv=none; b=WPSgSVvbTpA3Ndy+fznAgbtTJWt0oF0J8qIOPsVRsN7CT/0yo0MBt9OdTt/kh5b/AHzQCXmzNboh5XNUXcLuzDeeD56bfTSyryar+AzcY/Ol/MSvwD3cyWW9DnF4XRdt08bYQzmOMEvGuqB5mOTyjCHPBztAe1dyX1VvTqP7uLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782731788; c=relaxed/simple;
	bh=huqplC5tXzrHDNH78d4acpzt6EpbIyJkwstEQsjeJqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYTLagzNua/MeDWQbzl5GleMC/lgrKsvZqNhJdPWpnRtg/gdA84zJvvJhyKwcyvTiO5ZlhJA+IBT+VwHaq4orYBeWbfx5MPYthr9OsRqRTIHcRdClOOIeyLBVB6AzGMv/cZypFA4vSm6Se6mLc0Jg3rYd31W/6ZL9QFXIwc2R3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+tfWaMh; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+tfWaMh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782731787; x=1814267787;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=huqplC5tXzrHDNH78d4acpzt6EpbIyJkwstEQsjeJqU=;
  b=f+tfWaMh3eDUzzGGGsGsFHzr79UlIDfNCC+B+9kenNHupdDShe9ZLo6T
   osmQpwM4gWWacNRmMe5lr9/W5BUnVZWAo3cGt3ZNCAmihanSNKOM6uG6S
   tmrY4suGHUMYhA17wyh405rXcfV+Z2htBRy+0zxCo3MGLxJv6Gka+01T/
   ed1n/gaHYTtq/KqrdIgJ5Xq19r7rrS0EpnH3hX5/srOJ93UWV9YK5lcV9
   lDa5ygXlUP0KDpWRdW+hQpz1w8FfKBVnPQ9IwNirS5HqUriGtJNFj4mQO
   WT7wJijkCJN+0/+7O3WtoNLxI35XNSELUyJSlVbeNjxG3e1Fdwtis83y/
   Q==;
X-CSE-ConnectionGUID: H7hdrozCTLugaO0QOZt5yQ==
X-CSE-MsgGUID: YNN2L9CbQTqDV1W+YCovCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="83554400"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="83554400"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 04:16:26 -0700
X-CSE-ConnectionGUID: w8E+t1XXTnySPc9VDI0rdA==
X-CSE-MsgGUID: bPf8VgK/SXmncBqwQ7MJCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="247950336"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 04:16:23 -0700
Date: Mon, 29 Jun 2026 14:16:21 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Dawei Feng <dawei.feng@seu.edu.cn>, hansg@kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com, andy@kernel.org,
	gregkh@linuxfoundation.org, azpijr@gmail.com, kees@kernel.org,
	arnd@arndb.de, pontescpedro@gmail.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	jianhao.xu@seu.edu.cn, zilin@seu.edu.cn
Subject: Re: [PATCH] media: atomisp: fix CAS scaler descriptor leaks
Message-ID: <akJUBYUpjIX0dvx7@ashevche-desk.local>
References: <20260627060151.2543613-1-dawei.feng@seu.edu.cn>
 <akItMNqgKTDBCGV0@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akItMNqgKTDBCGV0@stanley.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 29, 2026 at 11:30:40AM +0300, Dan Carpenter wrote:
> On Sat, Jun 27, 2026 at 02:01:51PM +0800, Dawei Feng wrote:

...

> free_output_stage:
> 	if (need_scalar) {
> 		kfree(mycs->is_output_stage);
> 		mycs->is_output_stage = NULL;
> 	}
> free_scalar_binary:
> 	if (need_scalar) {
> 		kfree(mycs->yuv_scaler_binary);
> 		mycs->yuv_scaler_binary = NULL;
> 	}

If we go this way, double check that the checks are needed as we have kfree()
to be NULL-aware.

-- 
With Best Regards,
Andy Shevchenko


