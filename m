Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346DB3C3442
	for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 08:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786955890; cv=none; b=r1KfStQAZPVTJ/PfuUxQ4eQxme2fmqHLIFciN74O+TNvqror99+u8r3S6lOX49m2UDLau5JCZHhcpLYSp0eV9RaIrVYOeO7NFUM1e1k7234rs37emXwnH1emMJcnM/5SPQgIbbASIVxRZf/xCTiYU8ZdOkKOGmrACwbbL1GzCEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786955890; c=relaxed/simple;
	bh=MohaPOYo6YqA//fnjNroE2DN9sEHlbPjKqpujxMt4VQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UTyB+ycEH1B0dsJUj/zk4TFQkurfdJRU0XtrEFel85io5IZ/4vN4S2O9Aluyy4dxFWO/hTw6JWyrAt/ZvB7ne0SnUD/dR1schM/N8GGu+tn5pcpv0Z3nfeMZO1VHjP0AYTEaL72icrHDpgybQs6llzkn7Dl1uo13R47BzGIDm/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AqvP0k2+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AqvP0k2+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786955889; x=1818491889;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MohaPOYo6YqA//fnjNroE2DN9sEHlbPjKqpujxMt4VQ=;
  b=AqvP0k2+wLUEXibPGDSEIx33ScECrPv2u2EO3HeHaxOLcMqhsukjf7W0
   I8fyFxN1vGA2/C1LgTt12COyS/aiUNndmdWE3514uGN9DY9KfqYbDKdva
   vZiW/224l7eouQTQVcmt2FVRwMtJ8WL5WQXigprnTq3a4TqoLfQ6nus0G
   fZOXhLXYA1d1VicTr4gaJ/r5oSlFrnKDSpX40JW7Yepf712+JUwNnNuw0
   IcWd1ezHp60qsMV/soeLCtjl2h99lX5XDyJuR83o897myPP6RKYLBZmLY
   Gy2XvOs7sv8d1YzIWmPa857wJpImzdhlSVm8r8oxr/zPNKs9O175t7OV0
   g==;
X-CSE-ConnectionGUID: vYyYapydTXSmxrnyxehwGg==
X-CSE-MsgGUID: dPPMVsfkRBmfFHDzEwcJgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="98088248"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="98088248"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 01:38:08 -0700
X-CSE-ConnectionGUID: RaQmhmYYSh+zcdcbxZzEUA==
X-CSE-MsgGUID: uy60/iCFRj+WrKMvJgFoEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="268697857"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.67])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 01:38:06 -0700
Date: Mon, 17 Aug 2026 11:38:03 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Raushan Kumar <mitramaurya80@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: remove unnecessary return in
 gdc_reg_store()
Message-ID: <aoLIa8AaICrw_1Jk@ashevche-desk.local>
References: <20260815070105.124813-1-mitramaurya80@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815070105.124813-1-mitramaurya80@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Aug 15, 2026 at 12:31:05PM +0530, Raushan Kumar wrote:
> Remove the return statement at the end of the void function
> gdc_reg_store(), as it's not needed since the function returns
> implicitly, as flagged by checkpatch.pl.

Is it the only a single leftover in the entire driver?

...

Please, read lore.kernel.org linux-media@ archives against this driver to
understand what to do with this patch.

Also, if you are in a group that is mentored, tell to the mentors to stop
looking into this driver by a newbie. This driver has much more urgent tasks
to do and it's not trivial, it also requires a real HW to be at hand to test.

-- 
With Best Regards,
Andy Shevchenko


