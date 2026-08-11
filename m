Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91DE446852
	for <linux-staging@lists.linux.dev>; Tue, 11 Aug 2026 14:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786456973; cv=none; b=fpy/cThshmZf42ls0Tl+Coksg7mG5Natp9fSEkzCrxf/Vew7Kvj7dYW22ZXFrrbZFj41z0zmrgm4qza/D0lMwpurVcmKLsaQnfscKPYMiwn5zTVuSWzYAFVMGuDuF8dZvxl2Hmvsrod/IkiWtGRPq/dSJbxBx3sFXaeqhhFhrGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786456973; c=relaxed/simple;
	bh=3ZpZixnjUCIl8v3HZw+rg8iqs6DdWihBGHwICj9ejmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QVFQa/DsXf9COpO9e9ZFp8Fp3LLbKrXw2pruv8fLnUyoWILrkQP32DawyBbYZEel76iJxOpEl3ZjnRJaPlnoiLqcvSYyTUisv0Wnpjqu+G9SiskzWMnc+5x9dauqq+979BaFcQpZ/IQEz+3pgpcdDGZcukvRGqW4VnRPp+CoCn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=elSrdu62; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="elSrdu62"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786456972; x=1817992972;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3ZpZixnjUCIl8v3HZw+rg8iqs6DdWihBGHwICj9ejmQ=;
  b=elSrdu62W1Ei/9+ISjeSG7l4rBWjKcL+2ddQX0RRiR+5je6TP/lTzSxz
   Ti4L0yZZ7s2p4P+d/QJDQiSpYmYeHIVV6BmT1vpEwuLcxHe1p4Hg1/J2R
   YIWybEe6edNs6L+4GLPJAJhAon3gU8vERqEZFcMcrsXDOGgeO0gaIAp4C
   zB2IDibAAUiVJmRE7OqIJ/prPBPMA+QmzlI0NMoQn8SADh8rP31Mc0CDa
   mzUKnUDYf3Z4E/V8xLdb6EuFPCZVYonzmOIsQjcYxvb+LyZDKLJF3M7Wl
   yVDgCNMm6S1VZqoLg8z7m+tFyzRpLpq1h2Dn07o/qmfK5+aF7RJnZJnzD
   Q==;
X-CSE-ConnectionGUID: l7pW+dNmT5e9s5Nk5e9lOA==
X-CSE-MsgGUID: 5Sa2x/VRQk+7jRTUGjJLxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="89514292"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="89514292"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 07:02:51 -0700
X-CSE-ConnectionGUID: b5DS1ZtDRjmsiSa7wGbbSQ==
X-CSE-MsgGUID: XU4uEPRiTK+POq76qTTv9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="262031118"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 07:02:49 -0700
Date: Tue, 11 Aug 2026 17:02:46 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Cc: hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sakari.ailios@linux.intel.com, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v5 0/2] This series cleans up unused module parameters
 from the atomisp driver.
Message-ID: <ansrhooPovRKlz3v@ashevche-desk.local>
References: <YOUR_ANDY_EMAIL_MESSAGE_ID_HERE>
 <20260722054615.21492-1-prajvalchaudhari733@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722054615.21492-1-prajvalchaudhari733@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 22, 2026 at 11:16:13AM +0530, Prajval Chaudhary wrote:
> Patch 1 converts 'pad_w' and 'pad_h' module parameters into internal
> driver defines (ATOMISP_PAD_W and ATOMISP_PAD_H).
> Patch 2 removes 'dbg_level' and 'dbg_func' module parameters and updates
> ia_css_debug_vdtrace() to filter trace logging to IA_CSS_DEBUG_WARNING
> level or below to avoid potential dmesg log flooding.
> 
> Output Behavior Difference:
> - Before: Trace logging depended on setting dbg_level via module
>   parameters. Higher values flooded dmesg with verbose low-level trace
>   messages.
> - After: Trace logging is filtered at IA_CSS_DEBUG_WARNING via standard
>   vprintk facilities, avoiding dmesg flooding while maintaining
>   critical warnings.

Why do you think this is good enough? I already pointed out that this
needs the report from the field, id est showing the before and after on
real hardware. Also I mentioned that printk() is not good for low-level
traces and we _have_ the mechanisms for that kind of messages, exempli
gratia trace events and trace points.

-- 
With Best Regards,
Andy Shevchenko


