Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F404477E8
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 12:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787832792; cv=none; b=kZg3ERYrlAPIZY2nXlGWjBR5et0UtRoZ6qVBHKbUaHa5sZNQ8uJMOfJcDQykRfaPVpcebY/SFYOhiieT8YpphD6znmIu7zQAIZkzKldVHL9MYeEJ16qvigRRjpNWKO0/8bj2H8eLo+MtnuJdalAHvdeScNGo56zCETSg4lAgDnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787832792; c=relaxed/simple;
	bh=fdo2s9XGyXvtpwE9ycsOJ89ZJGa5LDXmxDbSXQ/Ly3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A12xJErrn/WH+q9NBYnV0Xg7IidEglTjtxNe6VtNfmG5aGiTVqfdeAj2ZnI8nO4lFQAxDdXyMRiwfrx0mzTMpjHFw6ltPYy3vROhlG9k4GMjJnLdWc5v2T1FWGIyknN2X5ABrbYaOpo8KFMsPcQmNZWFfJrmpN/A533gtdBg4ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fwb8maPS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fwb8maPS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787832790; x=1819368790;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fdo2s9XGyXvtpwE9ycsOJ89ZJGa5LDXmxDbSXQ/Ly3I=;
  b=Fwb8maPSHI35ij7mf2uPsFF59CDPIPKiODY5LjshJvTbkZUdcbVjJyWF
   IIu6k+QwB+n2OGdTWwCzCRmkksKnfr+a53gmspjM5ivP5XCjdmXvrzOSo
   G6FqKTyUYM9hMXi5hfXJXMz5vYOjzCz/AW090UvVhfPvsfqTQFzea6/Qr
   INPcHAf22L25+SDbDz3E09jht4Zh+pfJrAie/iYWZuxsMMzR9vAtW37Cc
   AsZt1NTfnDBwgCl16WcXKAGyeNAwt/pN26ziqYIFzMZDMyQ59wZ4nt58H
   SsB9E5/zjtwZpdW78Qn7ULSdw9+IeIc2TwNNjaU2hzqGLma0g1zXTNO4B
   w==;
X-CSE-ConnectionGUID: 63CBa1aTT02/1grCs6tsnQ==
X-CSE-MsgGUID: rNBshxOmSSedPy1k3+jt8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="111113637"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="111113637"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:13:09 -0700
X-CSE-ConnectionGUID: IINibmaPSI+uWTXXLODgrw==
X-CSE-MsgGUID: kYbk+smzSI6pA0J1YAe0Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="292694497"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.174])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:13:05 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C6C83120DF1;
	Thu, 27 Aug 2026 15:13:02 +0300 (EEST)
Date: Thu, 27 Aug 2026 15:13:02 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] media: i2c: Add Yoga Book camera ACPI IDs
Message-ID: <apApzsTjVmiWWc-w@kekkonen.localdomain>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260826132256.3343451-3-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826132256.3343451-3-mauriziocasciano7@gmail.com>

Hi Maurizio,

Thank you for the set.

On Wed, Aug 26, 2026 at 03:22:50PM +0200, Maurizio Casciano wrote:
> The Lenovo Yoga Book YB1-X91 firmware enumerates the front OV2740 as
> OVTI2740 and the rear OV8858 as INT3477. Neither ID currently matches
> its sensor driver, so both I2C devices remain unbound.
> 
> Add the IDs to the corresponding ACPI match tables. Sensor
> configuration and CSI lane quirks are kept in later patches.
> 
> Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
> Assisted-by: Codex:gpt-5.6-sol sparse

Please split this into two, a patch per driver.

What is relevant here that ACPI IDs are added, not so much where these IDs
are being used (that goes to the cover letter).

-- 
Regards,

Sakari Ailus
