Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FD72D7DCE
	for <linux-staging@lists.linux.dev>; Wed, 22 Apr 2026 06:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776839889; cv=none; b=lx1zA9sNLpKm86lXDUJo2AlNgvj26gUqzJQdhq+8vvjPqfzrWC6RqJS5ZlAkyRZyVYIMAwj8QVFG1+j1x5coZEtCJlUJV9h2m4jrfhxvlbKbJSerPwTnvi+ITM8vMVP0vEWY17ll3GVlcp+8zd5fwsJV4U5nmZaXmPIol44s/Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776839889; c=relaxed/simple;
	bh=KFMauCP2XQjIpQdiAuu6fHPvoVvod+5DcklxZ+tYiKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+XHcQO121T7oS+7wKy4S0HGw7ZTQU2v9RxcMgucPnkNilbzFCgOGmRPZwlJVVA48k8cMpuZ2IWX5nPB2ODTY/AC1vKVHg0J+9+YSnrmOi2TJGZd88iDIZse18m2srjxT8BaM8hBP3RCXYyLMSGNjx7tKTLDHPFnc04QBnt8Lkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ilTBTGa+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ilTBTGa+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776839888; x=1808375888;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KFMauCP2XQjIpQdiAuu6fHPvoVvod+5DcklxZ+tYiKw=;
  b=ilTBTGa+OiICRogLzZ0vVO7EiCI8mCehTT9HPqLLrKqT5/kvtaJ+/hn4
   tcfvb6B1/56WN2exgKJ0bvTM0k3BZPCQiFlGtQobXlaxEZhvwfmw0Fo0W
   O9U1DGGYog6AZGXnqY+q/kTU28WphMBplbHrBpG+EXkpfGy5nThgO+/Q1
   imrSE40mJgcvMs3Rnf6f+xkPQ7xjOE12OQss9Dk74Iwdksww/t8jTvisX
   7FbdoIKOfW7L/1MytNhheM7I7bXlaGMhgUscgzWJsmkDzK3VJnnWEpXiM
   LpUe3Q4Knrqb9HLhAYehvKhe7KDTc2NDoJae1fiuu2Dc4MqbZviqOxB+P
   A==;
X-CSE-ConnectionGUID: J0Lym2X8RnubzfIXh4WaYw==
X-CSE-MsgGUID: dcYWv8LzSHyx1yRGspazKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77800532"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77800532"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 23:38:08 -0700
X-CSE-ConnectionGUID: VFGKTCX3QImusvcUKZpLYQ==
X-CSE-MsgGUID: ImmJa47eSjqQwHdvz+bXWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="232176277"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.208])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 23:38:05 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E3B931201FC;
	Wed, 22 Apr 2026 09:38:03 +0300 (EEST)
Date: Wed, 22 Apr 2026 09:38:03 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Sajja Easwar Sai <eshwarsajja20@gmail.com>
Cc: bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, yong.zhi@intel.com, tfiga@chromium.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, iryuken@duck.com
Subject: Re: [PATCH] staging: media: ipu3: fix out-of-bounds access in
 imgu_map_node()
Message-ID: <aehsy3AY7Zpqm8gf@kekkonen.localdomain>
References: <20260422061951.352746-1-eshwarsajja20@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422061951.352746-1-eshwarsajja20@gmail.com>

Hi Sajja,

On Wed, Apr 22, 2026 at 11:49:51AM +0530, Sajja Easwar Sai wrote:
> imgu_map_node() walks imgu_node_map[] looking for a CSS queue ID. When
> no match is found the loop exits with i == IMGU_NODE_NUM, which is one
> past the end of every array that is indexed by node id.  The value is
> returned without any bounds check, so callers that use it immediately
> as an array subscript produce out-of-bounds reads.
> 
> The most critical caller is the threaded IRQ handler
> imgu_isr_threaded(), where b->queue comes directly from firmware; a
> malformed or buggy firmware return could therefore trigger a kernel
> oops.

Have you seen this happen in practice?

-- 
Regards,

Sakari Ailus
