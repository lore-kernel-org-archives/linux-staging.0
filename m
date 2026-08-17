Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE9A24E4AF
	for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 07:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786952218; cv=none; b=VQTQIDDEe4Zr26FL+JmpiJRYyi7GbnA8FusdcCKa344imusPt1EZ3sY7BV/Lm+PbAwHdSwqUtKQAgOYFGIShpGSKLY/UH8GANVdaDay0j3OsWYFIDiCfkoYlzK7TH8yCACPthWn2ZkDMAc5YvdROdBBsPQegt1VtzeitE1bvVFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786952218; c=relaxed/simple;
	bh=qWKKqdIfuWeRKxCYXt/fCFAwVAR33Q7CTFRZIRLKafw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZkqvB+lZhy8kQvJdzJS7/csDbVHpgSxos+6P8v90k92/pcpYC7Et1WL5S2xNMmAoopqSxtkXiW5FxkywUeGeiOAxR9bcKodcqIiHK0POwhKbnjIKQ/jczydhkGJ+nidZ3fT2iLghJ0DhU1n51c1Mwf8sA/hJkySF+3Uash6Amgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IsQAOe1w; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IsQAOe1w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786952217; x=1818488217;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qWKKqdIfuWeRKxCYXt/fCFAwVAR33Q7CTFRZIRLKafw=;
  b=IsQAOe1wV48w57gNcn9Q2grgu5vXr9lMeyOPvFfDGH50qlu10doAUlFD
   4rbp6VrNEBSLt2R8xEu0Yc2a8FcDaSjCD91it78Q8pTpT3ohrCSlmjQdE
   tnurHsOOsBkFtAXhhGnHniWk4Dh7nqrlXx6PcZbeCII0FS1w1tvPpwKjw
   ck3EyrWyrOwpm3Sf+4aZmCoWMMCng91dftgm5kt1mv7dke+tIYm49DhDB
   XWG41HoyAT4GQwySXdZckA1ulsDPtqx/ubBdBKAtvIY7rDMJCBgIgovmg
   ubxW76tq3GzRWp822FsPhiemtaevIyrrLsXgmHkH3AMcGI9A0WMnS4jl9
   g==;
X-CSE-ConnectionGUID: zd/zAFEFS/OLcDQgIDiBFQ==
X-CSE-MsgGUID: 7lU0c+EJSRmbeWNEsVfqaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87437716"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="87437716"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 00:36:56 -0700
X-CSE-ConnectionGUID: kiTIXR0qQeSgDEffe1212A==
X-CSE-MsgGUID: YRWyijFbRQOPgOdjQEe42Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="261100873"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.67])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 00:36:54 -0700
Date: Mon, 17 Aug 2026 10:36:51 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nikolay Kulikov <nikolayof23@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v4 0/5] staging: media: atomisp: cleanup pci/hmm/ code
Message-ID: <aoK6E58VGAVRKuSZ@ashevche-desk.local>
References: <20260814-atomisp_remove_hmm-v4-0-c3c954a12b51@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-atomisp_remove_hmm-v4-0-c3c954a12b51@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 14, 2026 at 06:10:07PM +0300, Nikolay Kulikov wrote:
> This series removes unused functions and replaces obscure
> variable-checking macros with clear conditional statements.

> Nikolay Kulikov (5):
>       staging: media: atomisp: remove unused functions from pci/hmm/
>       staging: media: atomisp: inline macros for checking the bo/bodev pointer
>       staging: media: atomisp: inline the check_bo_status_*() macros
>       staging: media: atomisp: inline the var_equal_return*() macros
>       staging: media: atomisp: remove hmm/hmm_common.h file

I don't know what the problem is, but in all four versions of this series
I have never get patch 5 in my mailbox (yes, I can retrieve it from
lore.kernel.org, but the thing is that either corporate spam-filter or
something else gates the message to me).

Overall, LGTM, thanks for pursuing this!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
for the entire series.

-- 
With Best Regards,
Andy Shevchenko


