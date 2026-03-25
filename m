Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3C23D1CB3
	for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 12:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774440512; cv=none; b=ZqOcmT94Ulf2S2n3PlhzA/cBS/qXZGENQtkZgIhUqhZ6uCVFkEagsSuVyu8xcvU5iLGe4P9NS5X/HSjM9+qFJsC1xAYtNoLv+wnKosXoGJVEToOlOcz7LAwEcPJ/fDs6D3IR6IOTkm5DCT53CygojetHisvCGdvHntjDsrvZwOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774440512; c=relaxed/simple;
	bh=5yuJSLQ7z5NpTLLdJi81NteytuRZpaVCcXKOaqqjLyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4G4UImIMB2tP6sXvHgOCcefrtedrQKnM267/5860X3sSEAtSRLFH5WDlJ+m5mIMEPrHG0sQubIj5BQbbsJP5ta+SufP+9GtkqIKr7DCxckpF1g9ZZZA8Bv5RpqRxYr68nMuG6W+c0nOlRaufBezcegel+4DNPr84UMjjDnRHs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jpnxEcm2; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jpnxEcm2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774440511; x=1805976511;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5yuJSLQ7z5NpTLLdJi81NteytuRZpaVCcXKOaqqjLyo=;
  b=jpnxEcm23jF5oezRH6ywPFrDwcb6Z/j1uM9nEsbzhicQnJBt6GpJbXjO
   tRNYKqgc9FfvBByeLPUWr7q+giNuLekCt/cOv5za/yUIjJRqJq6rip5cU
   79FpNCGu+UuYLKmNt50bgpgCDRV2EHHladrkF7efVurkXqB+sUkwpt7PD
   wCi8GcdP1dKhuI6Q42pnbm0Oj8YMmrhG9w4+LfSZWrdZUk4UPVi+WAjhP
   NUw609dk+medlGTtBIbmKk2AKaoHbdeSTVvRij3l7xj9LIJH4v84q0kQg
   rEnvw5ZT8jhb5KC1BBO5k4xPh9yH2bNoLULsAN1tCdfBFkPrlbp1R5MzE
   A==;
X-CSE-ConnectionGUID: UOTYe3HaTg2raeYVE6D6YA==
X-CSE-MsgGUID: HgeHyPznQPa/epVDH95XKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="79381720"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="79381720"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:08:31 -0700
X-CSE-ConnectionGUID: CDBfxRZtT/uoMei0Ecq7VQ==
X-CSE-MsgGUID: LV2mQTE9SsmMnJ3+Cv1/QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="255161078"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.32])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:08:28 -0700
Date: Wed, 25 Mar 2026 14:08:26 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Anushka Badhe <anushkabadhe@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, hansg@kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Re: [PATCH v3] staging: media: atomisp: pci: fix block comment style
 and merge split declaration
Message-ID: <acPQOplQWD_-saf9@ashevche-desk.local>
References: <20260324180821.42084-1-anushkabadhe@gmail.com>
 <20260324194356.49090-1-anushkabadhe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324194356.49090-1-anushkabadhe@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Mar 25, 2026 at 01:13:56AM +0530, Anushka Badhe wrote:
> The closing */ of a block comment is on the same line as the comment
> text, violating kernel coding style. GP_TIMER_BASE declaration is also
> unnecessarily split across two lines. Fix both issues.

You are doing two things in one change. And doing first half-way...
NAK.

-- 
With Best Regards,
Andy Shevchenko


