Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782581;
	b=Wj+eOZU2vV8JA1ZHuUcpfV37bWVMp3KB2glqGkIOlu0b0W5qR4jrokdvU9+L8D+SB1VY
	 mPvIK9FNwiCWN2ctIzVFWzeCTu57v4DUX95nRh6xXdVWLwm/r9QV/VKJbqwxAVwn7613v
	 7gLwxi1QtI1PzuVpnLw5TMKZ0VRo/WOpEpYjKUgTkbO5WevJW2msee5MwXo7jdgYJavL0
	 DOxcROyrFx09wYcBQ2bzyoMrGl65Zv0iD0EJcj0DeoUH5WBocEcDYM+9YDbOSS2yBRTYG
	 RjFuyCHsD1zK+ur9/I02oqaBAUK2zmEuR0800XcvhRiM2yV4kKDWxM+dTTc/5HBtyUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782581;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=UGaAgMpnljfOyuN0SyGCmbKUbOqRCYoSBuFFDyHRatM=;
	b=W8TNmhPKc3NkiYQ7x7V5f7prNTlNMpOmyWNkRvd8QFPTbBuYE4w9FrP/snGa1aIUCRIW
	 I3WuBM42IYuan09jjHE4+ekjyCWTa/2F8BuRWqVSe0yML7qcE9XIleeo42VmRFBwtiaAu
	 69ZDpeJrYECuHRWQE58RWoYUdYuLYya5vzuahPIcbNbiZK5OhcVcMq/27To6ZaCkrxhGe
	 fQuIpja+qadhfJCZZ0OyUFV+6ra4wW1Kx5qBGtZqxOLLQi93I7LbcJ2BPMpUiAg9uAP4P
	 JMxVTXQPipOvvE/E0AI7e6Uab8uceRwkVvh9V2QhX1e+3bG/+Hpj9J+b0bV6CGQgXZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BO+mjVab;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BB7606A336;
	Wed,  4 Nov 2026 08:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8BB7606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BO+mjVab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793782580; x=1825318580;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WEdnh3Um7RLyVQ8huXyPus5xQBPLH8vtUBUJSepuOP0=;
  b=BO+mjVab5YgIj25H2esws5VfMXuKu+IrdHJPGy7f+r767gi1Zd76MtLn
   wFsHDeOSh3UcJQkVANx+dm2yExwKEYNkCqwHz6ahn/+YA7ebuRHSQ/Q0v
   M61Pv4I+OXP4rtk5lwagd38mavUdcFbFbYqpwEscGuB4X4nu4s8yuHJog
   Ylne3u+KyvC9am1gJlCgq4nJ9ri0kSUZY96Edfg1PRdlLwb6F2F4/h1nX
   rhMcxn8qKq9/M5D6MKrqqlPLTTWXeUaiHl5SDWJkrLUP+ebRlIpIrN+LJ
   syyT/ccpCCw0bau8VN12bFeOqfr8+PhFftdNuzFiCgmUlx7TsUTWlJ3Vk
   w==;
X-CSE-ConnectionGUID: uxoaj9bXQgeKjX4R3Lox5Q==
X-CSE-MsgGUID: GG7vkYX0Q3Kuom3wz7nJWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2416678"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2416678"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 00:56:17 -0800
X-CSE-ConnectionGUID: /gOq8NuZS6ib1xsECxEouA==
X-CSE-MsgGUID: 6RQJzOOWQ9OH1ccyCgP24A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6515010"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 00:56:15 -0800
Date: Wed, 4 Nov 2026 10:56:12 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Eileen Blessing Kabi <kabiblessing5@gmail.com>
Cc: outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>, linux-staging@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix spelling mistake "writte" ->
 "written"
Message-ID: <aurzLD-baoebpE2N@ashevche-desk.local>
References: <20261103221142.45100-1-kabiblessing5@gmail.com>
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
In-Reply-To: <20261103221142.45100-1-kabiblessing5@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 03, 2026 at 10:11:41PM +0000, Eileen Blessing Kabi wrote:
> Fix the spelling of "written" in the write_vmem() kernel-doc comment.
> 
> Found with codespell.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


