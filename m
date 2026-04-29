Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D295282F38
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 18:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777487857; cv=none; b=SdsK5qx7K7aYbXQZTVBDf4gl7aVCK1fGt0qaCc4KfDwHuk9FjXrOqd2CRuZdz9stdo7WY+PNEj+PQNdRJPF7nkwSJnf6K3Q9T9LZquF/LNr1CjTDwjWTAcl8zqOAUh4scBKa+jsPpUKPqPqhpmWE7lD4aClapPpQOixw1KzNAlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777487857; c=relaxed/simple;
	bh=fdqydFr6UgwZlUmyu9L7iYW2nMDkUiabLOY4TYmgGAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PizEMZn8k9SpVhJ5UMjkSltoQRqqHsg779zkT1MNmjmVtBg8o36pqyljH+KnUhqUJashFvSZlzvJ0AICEEmx3mOtGskBOnXc6d+/7YGaNfor24JaGPfXNF9SuNEOkeAHMgzWILT1xRYoMUxmEnNLc2gS091+yAoz4m0Yjw0E32E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bxXpW4gr; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bxXpW4gr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777487856; x=1809023856;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fdqydFr6UgwZlUmyu9L7iYW2nMDkUiabLOY4TYmgGAI=;
  b=bxXpW4grkORA2bNiIrAMIPbHMaY+Yj0QEskQgf9xJewi4bofLkJd4YQD
   LCwtntMXfo/RcMmi4n/SkFvP5qyynM11SMEeq9PLhL+B9ZZ2uW74SM/gj
   24zHoIk0t8xzA1r00fwkQmdpjcK93rP2OilyHHcMp1BPFpQ6RFTdQ2QKU
   aCdKIxqFZhC8bY0G16f/59AZP16j8Y9K/zlYeE7Xrp4JaI0wnmWPugC1v
   OsUDvs5ncz6lOEGh4SuvCkV5YdEVpLPUKuH4O/xdt/9COpO2xQnyD06mv
   WPpAeNltWJ9oY3TwVPHR1J/sAH64/uWKKXBllwWt8cCl8P3lez9nmjmJD
   g==;
X-CSE-ConnectionGUID: 0llggu0nS82pRBtJMZn8sQ==
X-CSE-MsgGUID: sPxCkZw1SmCAv3LzAPJF+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89024526"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="89024526"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 11:37:36 -0700
X-CSE-ConnectionGUID: kf3AeNhRSs6SkjgsP8Pb+g==
X-CSE-MsgGUID: zs8heGNrSIeKK5EAoNSGlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="231208079"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.141])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 11:37:33 -0700
Date: Wed, 29 Apr 2026 21:37:31 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: sh_css_mmu: fix typo in sh_css_mmu.c
Message-ID: <afJP6wT3CvIfob5g@ashevche-desk.local>
References: <20260429175509.6306-1-mahamaryamjavaid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429175509.6306-1-mahamaryamjavaid@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Apr 29, 2026 at 01:55:09PM -0400, Maha Maryam Javaid wrote:
> Fix spelling mistake: Suppres -> Suppress

NAK.
Already explained why in the similar patches.

-- 
With Best Regards,
Andy Shevchenko


