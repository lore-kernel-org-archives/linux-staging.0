Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED24384242
	for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 08:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786522500; cv=none; b=hqaQs4VJMQSHuD/1v/ge9cTcyLRqCiGOW3H67KfSlvc+3yWOwYMjPvLIc15OY2TsDSDraXseNyr/bdE1nT1pgnza4omFZns7DhWxXlOy5ntedA7inp5QOQzNVfZcKtWouFZdGhQzvLxqmbW999HKEKiQtNI9ObSAyhfwTTNa3Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786522500; c=relaxed/simple;
	bh=cI4MwoDUNIzqJmxUCVu/K3a75kjlFo7pduCun2xbFfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ToUmK3PDUFknXoGDUeAOB3/dM/NvfvFBsdCGV+8IKbKS8hT+ntIDzIAJe/sRVftLI14HRFu9qot6t5R2iqyFLMPiO13nq3Gko/nP+FBhqM+UJObiJu//oRdBvc776dWWicZBsZeBm690ZyxlC3qYV7pvIaf9SLubjtTeUih5p3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=abt9gbt5; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="abt9gbt5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786522499; x=1818058499;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cI4MwoDUNIzqJmxUCVu/K3a75kjlFo7pduCun2xbFfM=;
  b=abt9gbt5AeOL6gGeU0pu34ZmQfDXOF85Fji3r5Ryh/BdLwpXBuFgtVpp
   FkctE973K54lvjP0xcvRbUre7Vx5xuU/7ZwKmnguUBKS6ikwz7g0PHO8X
   zBKCHb4VaVmfXWK9kRICmIUriqZ7q/nsRYWqQdrDC56A/ERRVJ+tQV7Iv
   ZzDozS2+3WWR9bPbYYRPtROFnyvWLVb2NXy2Hb74utevZcqScsYhJYiOk
   YGOsvrCCACdm7kfGy0DNoajdqzaUXTloyfzXlVns+jLFgAL5VyBSH+uCn
   RfFun4PBPEacHAVqudYOlPjA7z116isca8JsoqsqG6v4w3P4EOjk0+M0O
   g==;
X-CSE-ConnectionGUID: 57hTACCYSbWlkpyDKOlXyg==
X-CSE-MsgGUID: T7Oh/J1zQamkRf1++oI5Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86919172"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="86919172"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 01:14:58 -0700
X-CSE-ConnectionGUID: l2ZzzvFURUi5CtNyG/q+jQ==
X-CSE-MsgGUID: Er2/xjV0Twi3trBxr5ZI3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="267430419"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.92])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 01:14:56 -0700
Date: Wed, 12 Aug 2026 11:14:53 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Diego Schild Smiths <diegossmiths@fastmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org, matt@mattwardle.net,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com
Subject: Re: [PATCH]     staging: media: atomisp: Remove spaces at the start
 of a line
Message-ID: <anwrfd6dvlSS1970@ashevche-desk.local>
References: <20260727010826.91459-1-diegossmiths@fastmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727010826.91459-1-diegossmiths@fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Jul 26, 2026 at 10:08:10PM -0300, Diego Schild Smiths wrote:
>     Fix checkpatch.pl warnings:
>     WARNING: please, no spaces at the start of a line

Describe the problem in plain English. Do not dump some tool output to the face
of the reader of this.

> Signed-off-by: Diego Schild Smiths <diegossmiths@fastmail.com>

While fixing indentation in the code, the Subject is wrong.

...

>  void
> -ia_css_eed1_8_vmem_encode(
> -    struct eed1_8_vmem_params *to,
> -    const struct ia_css_eed1_8_config *from,
> -    size_t size)
> +ia_css_eed1_8_vmem_encode(struct eed1_8_vmem_params *to,
> +			  const struct ia_css_eed1_8_config *from,
> +			  size_t size)

I believe there are much more of the cases.

...

Please, read lore.kernel.org linux-media@ archives against this driver to
understand why this patch is no-go.

Also, if you are in a group that is mentored, tell to the mentors to stop
looking into this driver by a newbie. This driver has much more urgent tasks
to do and it's not trivial, it also requires a real HW to be at hand to test.

-- 
With Best Regards,
Andy Shevchenko


