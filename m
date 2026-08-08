Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3BE38BF81
	for <linux-staging@lists.linux.dev>; Sat,  8 Aug 2026 20:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786219964; cv=none; b=QGAbUlRRPH8KCz2GqLDRozOxUoHpGuEzZGpqrXTjYZM2EK7b6BTbzbYGXtP5HzP6aZiJbNmllydmvILMo+MThoL+4S9cIwGTcChivcX1WTk/a7pPUhTIhsFX6L/vt2/Zn4XzrfPT0MEbHYOqymr2Mk2yU0s16mjHdnqygqsw3s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786219964; c=relaxed/simple;
	bh=AM1Tb1OylvXbJreir7NeXrSsS8YJgenYu6SmiEiPh0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X1qktX7VMjeb7mcBzzsETfyBkFTvrvthzEJFmfuB2Qy4hB6+DCmoK3dYzGID5QsOX0xbLo27eMg8ei/K/MAcbszXrDb9lLuFzA6v2ylXMqO3AZe6bko/AKYbeHERqc5VWWi443dKHG+++VLrV9odd58ZcehgxncIGcJB7VUT0eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iFctcFiA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iFctcFiA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786219963; x=1817755963;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AM1Tb1OylvXbJreir7NeXrSsS8YJgenYu6SmiEiPh0Y=;
  b=iFctcFiApCOAqbrBX8p4SA+ySOXyQiRCCmosvRBfZ6AAKPaZzKMpB85J
   NSCD3YpJ8qbXVwr8VcIbmI9iDs+X/qMG3ODNIKbEWpf2S+NlrbjO4WrBZ
   C7ozPS0GA9fuW7t1MAaOEux8xS+DGAZTq28QLcriwZK2ROonmZtolqb7R
   zh+cIA05wa73fPN54NjtpYVXxWne2Qp2tIih7oN/4ZAZ5i6H3AWirnUEa
   EcDMm3PT/0lPhQlCvx9NE6Z5WX+m4AsFsEZQvkLnZMwPDQUAeqrYFDPea
   dZXDTHv0BWoe1I5LmXAdjTm/zmSB03yw6pMSVMMHEL9HcaOZ0fs4rSFbN
   g==;
X-CSE-ConnectionGUID: fC7OYsGORwan/TI4EM9mPQ==
X-CSE-MsgGUID: y3cBrd1eRTKoc1LQ3JILzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="86646569"
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="86646569"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 13:12:42 -0700
X-CSE-ConnectionGUID: is/d15nXTTqUB3mporthjg==
X-CSE-MsgGUID: thKKXUJWSn63wRlkdMPwYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="292583402"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 13:12:39 -0700
Date: Sat, 8 Aug 2026 23:12:37 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, andy@kernel.org,
	nuno.sa@analog.com, gregkh@linuxfoundation.org,
	joshua.crofts1@gmail.com, skhan@linuxfoundation.org,
	me@brighamcampbell.com, jkoolstra@xs4all.nl,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: iio: frequency: ad9832/ad9834: add comment
 explaining do_div usage
Message-ID: <aneNtcyLLQjMmPA7@ashevche-desk.local>
References: <20260807094704.5371-1-raizudeen.kerneldev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807094704.5371-1-raizudeen.kerneldev@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 07, 2026 at 03:17:03PM +0530, Mohamad Raizudeen wrote:
> Previous attempts to change do_div() to div64_ul were rejected because
> mclk will always fit within 32 fits for this hardware, making do_div()
> safe to use.
> 
> However, Coccinelle continues to flag this as a false positive. To
> prevent future developers from submitting unnecessary fixes, add a
> comment explaining why do_div() is intentionally kept.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


