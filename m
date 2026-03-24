Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DDD3F7AB0
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 12:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774356298; cv=none; b=O936OcqXyOSA3vYTdW791pPLAUZNbsJjHXvs1/ejRsCCu43kqPrbhkqZf+l8WnVATOBnIetKvejWonQPKgD3jHfTJ6my5ZyR+ko+ZyR005QFAFrHKGQI5qMetuwRzKi8shnRRDn7biBHfka65KHGJGCPOQex8O4NQdGupZSoXvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774356298; c=relaxed/simple;
	bh=Ff6td5BWChn9SemXJBCGmXDUqCicMpOxSGn9zrY7220=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ln7Sh2WiT5Ps7gpMqlAqbf55N7AXMBCK5BIInmt4ZD9Q9d3m9xfRn7DUfguAd6y5zv8H1rUOK+2StD23fpqSkefAjLg8jEMxmfx8vm5bZcyDra4FrRrozgZirpkSxKcEOAEOR2W2l366IF6oM+FaCOYMdUrDmEFNN1N4s3zFtgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bfb8MUcw; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bfb8MUcw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774356297; x=1805892297;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ff6td5BWChn9SemXJBCGmXDUqCicMpOxSGn9zrY7220=;
  b=Bfb8MUcwLH/cQTheOhi/XFCz7aPOYMeLu8VWtC80hIOqw/CyfCywUQvL
   npTauevNFGgeXiaDIVXztVdPX4hCcIMzhyEXKIyNHxH5/RkD9rBW8iMLr
   LZSVi++iyEvoG2vQm8KPNv9OD3uHnhw7RNYkQXAgHe9MAy8Sl1tjM1Siu
   CWKr+OnvhlZ98H0XriuPb2J2Vm5cmFw02BBQvThj5FG9eVZ3rOvcjT9AS
   hk1ofL7bvKzNrU63XRXjQ+LNZr02zbFwEFDsK+Y9PPygwkOHumtn2bxYM
   KDY+S89EiJ3FXCJvbaBMcJnXSN4DjCE5s+Oh5dZpHiMBF4Y7gmWLC9SIK
   g==;
X-CSE-ConnectionGUID: 4HPWLXOIRaOYSVgFvl2Iqg==
X-CSE-MsgGUID: 3hBgqkUEQOaZOWK17+WmQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="100813920"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="100813920"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 05:44:56 -0700
X-CSE-ConnectionGUID: jxgFoJVpSoSf9MZ6D1zfIg==
X-CSE-MsgGUID: f6SGAPjHT/SXd+Cxg3MEkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="221451305"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 05:44:55 -0700
Date: Tue, 24 Mar 2026 14:44:53 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sajal Gupta <sajal2005gupta@gmail.com>
Cc: gregkh@linuxfoundation.org, s9430939@naver.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix logical continuations in
 xmit_linux.c
Message-ID: <acKHRZ7Y9fVFRLff@ashevche-desk.local>
References: <20260324121828.14675-1-sajal2005gupta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324121828.14675-1-sajal2005gupta@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Mar 24, 2026 at 05:47:47PM +0530, Sajal Gupta wrote:
> Simplify the conditional by removing redundant boolean
> comparisons and fixing the continuation line indentation.

In case maintainers are happy to take,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


