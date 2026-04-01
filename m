Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64DB31064B
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 06:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775026504; cv=none; b=nPt6eLFAAsf9OxCvI/dPT6b8XedkJqU21/+HGPEcsbYi4qijXnLpiYwuu3aDWgYFvcLmAAerruuIykuJEuGSViaoR4pH4hdUE+okpbQcOa2scQqNlVLfcfAKgcWiKHJvilaMGNlB1Sxxp3uYOc5oL7u0rsq/yEgqGaS1YzMqWno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775026504; c=relaxed/simple;
	bh=QnDUi1TNc0V+P3FaapvlHetlwKU826/wGm7WQc3ZmvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gwSOBaYl9suin1BMrdmwvBGYkDZMbTCs/RNVxlCJfIAc35YSvbJrUBtTiLJWM0laAtxLPc/GQBSqIWcsQplTyhS2S8tI67zR2APZsdX+16BEq7kdSxHkHmUW29+/8xc4K4oQsL/BwDleqnQnYMrChxiG0DZBKOzcXnwdHS2Rirk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=izBqki97; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="izBqki97"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775026503; x=1806562503;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QnDUi1TNc0V+P3FaapvlHetlwKU826/wGm7WQc3ZmvI=;
  b=izBqki97h00J55BI9jjT5YMAfUWp9MiveL7ODQSqRlTwNyktMN0E76eF
   JOYkEl4Zz+iEadcErL64i5yvvH4H/tT32A+C9UHpC9wkmgvyJqFphe6Hg
   nk/FWIai1TEQEzkQBycTLlC5xFVgq8SA7qrcLKTDp+UE4YbevWDUXvXsE
   o1X5s2ciGdqeCeukToFTfKPhyNXKrtKWc69qY6ZiOSBmQxcocFz9NEFaw
   uflegELcG0a8NRGXQ6Fpbk9l2+Z7gYXaKGO6Q7Fpv3V0Eyyg707gBrxWx
   ZGI5TwURDCje4kyXQbgKVFhKtfdIFtoPX8HFRiO6h/j7pRfWbSFyiCzlU
   Q==;
X-CSE-ConnectionGUID: 9hhqTnxeQCitDniGMUMw1A==
X-CSE-MsgGUID: YerniTbAQoS1W3Y/MypRZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="93635819"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="93635819"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 23:55:02 -0700
X-CSE-ConnectionGUID: AIBRExpSRje8/dm+myjECA==
X-CSE-MsgGUID: a+UcCIC2TmKeL6bLijduDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="225759277"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.124])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 23:54:59 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C3606121CEE;
	Wed, 01 Apr 2026 09:55:07 +0300 (EEST)
Date: Wed, 1 Apr 2026 09:55:07 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Anushka B <anushkabadhe@gmail.com>
Cc: andriy.shevchenko@intel.com, andy@kernel.org,
	gregkh@linuxfoundation.org, hansg@kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mchehab@kernel.org,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Dhruva gole <goledhruva@gmail.com>, m-chawdhry@ti.com,
	Simona Toaca <simona.toaca@nxp.com>
Subject: Re: [PATCH v6] staging: media: atomisp: fix GP_TIMER_BASE scope in
 gp_timer.c
Message-ID: <aczBS_KJQa_j97RP@kekkonen.localdomain>
References: <20260327031106.10386-1-anushkabadhe@gmail.com>
 <acZo5LUXH70-UKUi@kekkonen.localdomain>
 <CAAfE=nNNxCKv0JoRcib7YVQfQ9MxqE34WyYu2GHNYaroxzpw1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAfE=nNNxCKv0JoRcib7YVQfQ9MxqE34WyYu2GHNYaroxzpw1w@mail.gmail.com>

Hi Anushka,

On Mon, Mar 30, 2026 at 07:02:21AM +0530, Anushka B wrote:
> > There's a lot to cleanup here, but what should be done is roughly:
> >
> > - Make these constants macros (with IPU2_ or ATOMISP2_ prefix?) and move
> >   them into a separate header (perhaps with register definitions?).
> >
> > - Remove my_env and make struct device (or maybe struct atomisp_device?) as
> >   a parameter for register access functions.
> >
> > This may get a bit complicated due to the amount of cleanup needed so
> > having the hardware for testing would be rather essential.
> As a student, I don't currently have access to the hardware needed to
> do the bigger refactor safely. However I'm happy to fix the comment
> formatting and language.
> In earlier versions, I had merged the split declaration of
> GP_TIMER_BASE in place in system_local.c before later moving it to
> gp_timer.c.
> Link: https://lore.kernel.org/linux-media/20260325132434.55775-1-anushkabadhe@gmail.com/
> Would it be okay to proceed with the simpler in-place fix for
> GP_TIMER_BASE declaration instead?

I'm fine with v4.

-- 
Regards,

Sakari Ailus
