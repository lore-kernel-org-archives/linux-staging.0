Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794519305;
	b=aTz3FHfla6LiQ3WIPNlJa/y4aQhjrSbdXZuSqYDZcCbPgagdqIe5VXkku4gBZSY+cyur
	 5T4fio0chaFG5ke0csRelOR07VYCewO4thySpU29vXmaM+UpDOL0/JYzh6exfbns6aCgM
	 I01jjAVuy83c7ExI5YLMlbrDgbje7S+81RjZrqhbayyekK/2Nt3kIIkHqrGUC3cCUNMoJ
	 RpgYXx/bpT6bkBksQarMuOAUMn8Gb0Ij1SC7ycq33jg+eKuq+8PUI9SP/IhPvCXYP8pf/
	 uSrehDDgAaBqO5s99csTOnedH5r3mXIhKOMTeOhHpZESjEkkbGpVl4H6PBj2cYVMbrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794519305;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BhcCDoIl9otRnW4ujBdyNoukGej6r/uzdNbV6Dh8hRc=;
	b=hwPCX+b7bz9fSYEwzJFxOQ0LNMwBZ56b3F1aIWnx4RIOINITq7UttYiD6423JV7WuKIl
	 IU6IfwqQo6NiFM2O4OJp6bn0ZD1m+KZwgFdJoBUR3mj1iM2El7g5Tx14UHwzY6UVjCGfr
	 i3sYEMThhEkJX4gzQmthvvO94AFOn+RpKcXNx5K50EnuRXI3hvyT4oPzqbAxJ8ya9QO8W
	 cFrfHQJGr07LfIaFcaDTzbWfjmPdqZg0OsQmUf++AuTBOFw0sVbamJjWKRpdsgyeWPjN/
	 Dx5NIjKORhpeJu63o/n4gOaGCvTmUCartwd9jv+pSwUC3TU2SbnE61eLLGFjLBgg+eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kXc7Y1nZ;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDA0606A323
	for <linux-staging@lists.linux.dev>; Thu, 12 Nov 2026 21:35:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FDA0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kXc7Y1nZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794519304; x=1826055304;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qiPKcs32cIql2L4FKZiiE+381T/H6p7Ydei/f5AE/Xk=;
  b=kXc7Y1nZakc4z6acqtuMcvVf6lPAD6UaTf1jv00vuJ820ElUNxVTJ7v3
   qCXIygQKo6GCfbAFAL1TYnwK/rBPSHKuFhaFVFlSfjRJEPB44Cqz4OjnX
   Pkuw3iwcmW1ldvbqhjR05l3L3ptVi2Dhn3n4wXq4YcNOvY8aHVX7KHjDc
   uCx7ZRJlKcSw6S9JvsnL3j3ZbYBesWGzcHk42wHPAIELDE8VTYHc5mg7j
   Hh0hK/nPqGmBYVVOSGVhpvpbFkgQ1gO8IL8JJAw1fUFEdNtK0rzlR4Fpb
   0YmBKchY0W7IvjyliatlSvNUuppZ6dgMaTgNV7BvKCQHrbekPWSTXBf+7
   A==;
X-CSE-ConnectionGUID: WyUR4doLTFSo1uZXnl5wkQ==
X-CSE-MsgGUID: 7nnsWJcNQ9qkQ4U0npdRUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3337901"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3337901"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 13:35:04 -0800
X-CSE-ConnectionGUID: RpXP1+IKRjCrp7G288nWEQ==
X-CSE-MsgGUID: 7Z8WZBzRQqymuNkyk7JalA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="9317428"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.244.107])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 13:34:59 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 153E5121B71;
	Thu, 12 Nov 2026 23:34:59 +0200 (EET)
Date: Thu, 12 Nov 2026 23:34:59 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-pci@vger.kernel.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/1] media: Consolidate AtomISP v2 PCI IDs in the
 pci_ids.h
Message-ID: <avYxAxh61Rv956SO@kekkonen.localdomain>
References: <20261002094813.856439-1-andriy.shevchenko@linux.intel.com>
 <asFuWAQUPxETWqDL@kekkonen.localdomain>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asFuWAQUPxETWqDL@kekkonen.localdomain>

Hi,

On Sun, Oct 04, 2026 at 12:06:32AM +0300, Sakari Ailus wrote:
> > Assuming that media subsystem is the main beneficiary I think it is the best
> > to route it via that tree. For others (i915, PCI, PDx86), please Ack if you
> > are agree.

Just checking -- are the respective maintainers fine with merging this via
the media tree?

-- 
Regards,

Sakari Ailus
