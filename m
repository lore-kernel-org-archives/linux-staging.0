Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9995F3D5C1C
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 17:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778605249; cv=none; b=QI8IvvtVDjRjh1/LbMh8xFzsVTT6jg19FjN8uoDqejIYUKzSB1QebsEkDCwrG7jVzXUiKBXrE8pjs8SFD2DiPjCnB2VVcAzYdtROR24JjErp8tWWpVx8S9Wm/hoK1Xp4sAz5nxtZzpZM4tzWwHPVbKHNMrVmTX6iSqPK3bTDhZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778605249; c=relaxed/simple;
	bh=k6HLYgxn1OTzvh/XSsj+s8Xe8oyn9z21HvDBjIXXB+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4H7dDqSzhUIx011PfvOGFAL8MdcPvxvtvgQl5ON5RXYG7WRMRQUqVXkYnXG6IhJ7gx6Y9w31t2eVptBFgN26TaLY88VX+o3pW0eGtTUEW43JksKi/jzAxtSj7trmvZFNPQt4Mw8USrZPs3+OjspCsNe0PswPKYZcN+T5ve0j20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G5n9jGr3; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G5n9jGr3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778605249; x=1810141249;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k6HLYgxn1OTzvh/XSsj+s8Xe8oyn9z21HvDBjIXXB+4=;
  b=G5n9jGr3IktfKJKfL1/sgy78akQnn4Ot9DAgtS2dTC1eqyRfha0gZOP8
   IdLqg00Ziegun2BwrvMJ1TRCdU4NPgOGMzO3c9O2ghx5PPCa8M18br4Em
   C3h4ORwASe8WLmhxk/eAaCz4bymvY0Qkxgk4QuxEZ2GHpCmbcJEJfFnYu
   ZqM1mNA6OY5/5Tn94J1fc5OfJj945z31ksXS3lt7VlnoMmc15S8CSSPW1
   GzxJZGdJPTIoqtXlRIwKZDsf4JbiAbMEz2pjL9oZf41UK3JsFcfNjWhrL
   JEvNF8hvxvBqif76u1jt4ebAmKCCYO2v+9meCGhAGA1wFr1yasCExnkCB
   Q==;
X-CSE-ConnectionGUID: K8r/2PVMQ+Skcq/wuaZPqw==
X-CSE-MsgGUID: wWAHsfm7RVmHqZefKPXZbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79630519"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="79630519"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 10:00:48 -0700
X-CSE-ConnectionGUID: 8zTvYSsHSXGRklNSr1vVfQ==
X-CSE-MsgGUID: RtVoBSRCR3OzxVbhlNaPug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="261305881"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.244])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 10:00:46 -0700
Date: Tue, 12 May 2026 20:00:43 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Harshit Shaw <shawharshit116@gmail.com>
Cc: gregkh@linuxfoundation.org, error27@gmail.com, deller@gmx.de,
	chintanlike@gmail.com, tzimmermann@suse.de,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: convert sysfs attributes to use
 ATTRIBUTE_GROUPS
Message-ID: <agNcu-D4zjHnZarz@ashevche-desk.local>
References: <20260512154020.491-1-shawharshit116@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512154020.491-1-shawharshit116@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, May 12, 2026 at 03:40:19PM +0000, Harshit Shaw wrote:
> Replace direct device_create_file() calls with the correct
> ATTRIBUTE_GROUPS() macro. Add fbtft_groups as dev_groups in the
> driver structure so the driver core automatically adds and removes
> the sysfs attributes when a device is bound or unbound.

> Signed-off-by: Harshit Shaw <shawharshit116@gmail.com>
> ---

This is not a v2 as you read the Subject.

> v2: Use ATTRIBUTE_GROUPS() macro and add dev_groups to driver
>     structure instead of using sysfs_create_group() directly,
>     as suggested by Greg KH.

I gave you the comments in previous version, and at least some of them were
ignored. Why?

...

> +extern const struct attribute_group *fbtft_groups[];

You haven't compiled that?

-- 
With Best Regards,
Andy Shevchenko


