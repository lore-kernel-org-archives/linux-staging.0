Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CE629BD8C
	for <linux-staging@lists.linux.dev>; Mon,  6 Jul 2026 05:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783314720; cv=none; b=NfBohD00Y5gb6m7FVt000VkW9RvmGUE4l7cKr40sYM+ibZAgr4QTaCqntORneSpXo05MUd3IaM2yu9zwaxmCqNA5F4rpvSuaELgA9Xxu9TuR4Zn+lRpESdReQl/O5eaFaFCpbE05F0xADN7c7tAsWvjXYaZMiG52JrPRd/vrHJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783314720; c=relaxed/simple;
	bh=MwHdV/M7HULwMGu6QgbyN8o/rLL5/OZBAo1FdxlJGHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ujxNHkZiGLRAKgGVTxycYW2k6zD2R+mwhla3uM8uAc/nSvKJNBA33aGT3cm2bp8ZRtD2LBsIG+wwEFlXSOcmSAnM3Lp8+0EvZbvxPjfpxoNuYploA3rWmV+hsTWcsBm/IQXPx96wecz1CgQlyihCzGHRfIBEZ2dZNMhh8rGPzps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lwx1IheN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lwx1IheN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783314718; x=1814850718;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=MwHdV/M7HULwMGu6QgbyN8o/rLL5/OZBAo1FdxlJGHs=;
  b=lwx1IheNfx/dQnVhDH7xCKVNPHQt8TV/ViBZW1StX8WSZ9e8JeECANRL
   KnaJ3V7j7EpNUoV7lMLq5zm1Rhxy8SVKSz3a5TEDm0L9NzgXwsPPyYPVK
   tg97vzIvOiueRJFW7fqCmDQ+eilAgoE/CNxVSjxTsbQIJ0DcdhlpH0649
   L+gYyp2j3udn/a4RX8mabyjMGCuJFQ3OznubLIXnAAbFyD5IzS7BnGDvY
   tNCXNpkFNZ8XeTMhit/Rfd/UpsBmUHb7q4Rh+AgJJEdZRSdQrTbwM2mB0
   B/NQ2f0ofyR2f3o9Cn2c8GcA8/DiImmGxPkRLuch10LuWXyW6z03lfb/7
   Q==;
X-CSE-ConnectionGUID: 2hhZCN06T+q00SiDOj6haw==
X-CSE-MsgGUID: wPt8c2wzSEuf/9EFBMXYbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="95446169"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="95446169"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 22:11:57 -0700
X-CSE-ConnectionGUID: JopTICciSpq8oA+jcxuYTQ==
X-CSE-MsgGUID: NsxLPvtjRDuuw8fVTJu6cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="254261321"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.48])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 22:11:54 -0700
Date: Mon, 6 Jul 2026 08:11:51 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Neal Patalay <nealpatalay0@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mugrinphoto@gmail.com,
	matt@mattwardle.net
Subject: Re: [PATCH v3] staging: media: atomisp: refactor pipe graph dump
 stage formatting
Message-ID: <aks5F-_nQmf6JelW@ashevche-desk.local>
References: <20260705073844.146578-1-nealpatalay0@gmail.com>
 <akpopoFZyWW2e9En@ashevche-desk.local>
 <CAGjuiT_WMkYOJJ40AJPcF_mbyZv+0pvgMOv8fp6hxPN29N_2Wg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGjuiT_WMkYOJJ40AJPcF_mbyZv+0pvgMOv8fp6hxPN29N_2Wg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Jul 05, 2026 at 04:56:36PM -0700, Neal Patalay wrote:
> On Sun, Jul 5, 2026 at 7:22 AM Andy Shevchenko wrote:

...

> > If for some reason len is > 0 and offset is 0, this will write beyond
> > the boundaries.
> 
> I'll add a check to make sure the offset is greater than 0.

Please, do not remove context when it's related to the discussion.

I don't think it is that simple. One should think of flexibility.
Can we have (potentially) the case mentioned above? Can you first
investigate that? If it's confirmed that len > 0 and offset == 0
is not possible, no need to change the code, just add a comment.

...

> > This will continue writing even if there are more than 3 lines.
> 
> The original code completely removes the third line from the output
> by writing the third line into enable_info3, and then overwriting that
> buffer with everything after the third line. I'll assume the author meant
> to remove all flags after the third line.

It removes the flags that make the 3rd (and last possible) line too long.

-- 
With Best Regards,
Andy Shevchenko


