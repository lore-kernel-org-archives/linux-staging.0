Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606811;
	b=0CEPMKICj5rBHARkrJeWEtWintk6ATgXTRjBNChqb49XdrrgTGkNofM6Bd0zjnuJDdGh
	 jK52g4LAdsJivu3S9ZKDhrLPXGAlE/5O/cnbXIos+jEW70dMYKhuOxmenyglw3E1+yW4f
	 g/XEbqlokLvB63Ftm4NfNjr7liU07TiDtqj8xLLkGr20J8MHG7bRRYeoy4olHMpiKlAan
	 vf3cKIihDsLn6ZtJ0FyUAXo2zsrq9MWt+9QUW7ZROY+HRdtAleSjJJPv65LRj/1Q5hwVt
	 wc1eWPLFK7U9tR0q77fQSuVJ+OWHDx9DJaoLlTUbAtPr2gx7C0EXI9p+Xe7OCd6jnWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606811;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZHBAKn/6mnDMz3G6KYCfWnFqdTg254dkkOYHSR+PjqM=;
	b=LYvHFgRI0m2UfUlSb2bL7+AXyrD0eijuvwcS8+ni2O5eQ/3NDhLxPaNI35RZONTnO2B2
	 JJIymt/dQzDgDEiyhv3ovns0VtNF2SI1hGRQKBi3UOpNwXXhs7KHQnfGwVsif/BTNLqv2
	 GcW5Fvxzl63iMfmg/wQYK2Ag9V3W2UiC7TT67mlg1j7QM6cC6Nk/PtPacpreDiUqdgOK/
	 /lTEgwQP31tHD/P9EZ91brWhII0Xxu/w91mzLVU5YGcsEXPs2mtIwpPkGfv5LihGpX4Bc
	 hkqamX8G3VAVb1Demk8EfxGOmWPF+wjWrkxUwHBO+c4q2uIMqFIAXHwya8iMsSDrFxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a9gL3hGh;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ECA606A321
	for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 11:40:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66ECA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a9gL3hGh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795606810; x=1827142810;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cOmxLcOtM4ej56pou+GrQe5UPufOSFf+f+fj4Cpa++g=;
  b=a9gL3hGhLlCh6f32TRiD5oLAfbO0C3q7V02SivHsCsbO+JrJ4iPIOmLV
   byLobcN9xa0Elb8ls7bAoWNrHXRKp/bsU2P3KDhFbBBjYbPT69PFBT/Im
   2gUxVbf93+/s+ParZ4oeCJdtEB/zKlMy5OdAiBvP29uiX21V917qanrC8
   v7ZRa7Dcl+UjYCLAhecv4ykgS93+4AxR8usuIe5MFEoEZNTLsiBlWkIod
   n9zZQuh4TM7ecEm0pRSIRAMPdZ+ohHKBr418N+fQ0nQrOEQKkOCqwLKXK
   6fafRFIU+dUbJvTzjbXNX2ethLnJULYBqa2CJmrq3ILffH9poN8PL6rrD
   Q==;
X-CSE-ConnectionGUID: MTQg52hRR1uPQdAbJCICiA==
X-CSE-MsgGUID: jixFulrzRV2iDeEjsyqSBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4340892"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4340892"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 03:40:07 -0800
X-CSE-ConnectionGUID: QneYRPHTRYiuHjMchAp8bA==
X-CSE-MsgGUID: 1vU1F3/2TJiIKgXo4Psaeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="12062865"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.36])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 03:40:04 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 089BD11F920;
	Wed, 25 Nov 2026 13:40:08 +0200 (EET)
Date: Wed, 25 Nov 2026 13:40:08 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Manik Bajpai <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	German Pablo Lindo <germanpapulindez@gmail.com>,
	Christian Murphy <christian@themurphys.eu>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging/ipu7: snoop ISYS writes to capture buffers
Message-ID: <awbJGGu0xANDKrhg@kekkonen.localdomain>
References: <20261007183311.24637-1-lsa.uz@pm.me>
 <asaywQrMq-GSrI2r@kekkonen.localdomain>
 <20261110065119.20575-1-lsa.uz@pm.me>
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
In-Reply-To: <20261110065119.20575-1-lsa.uz@pm.me>

Hi Sergey,

On Tue, Nov 10, 2026 at 06:51:25AM +0000, Sergey Lebedev wrote:
> Hi Manik, Divyamani,
> 
> Sakari added you to this patch in October. Is is_snoop = 1 on the
> capture pin right for IPU7, and for IPU 7.5, which I could not test?
> 
> Christian Murphy sent a different fix for the same rows in August,
> which I missed: a clflush of each capture buffer in buf_prepare and
> buf_finish, with is_snoop left at 0. If the snoop bit cannot be relied
> on, his is the one to take:
> https://lore.kernel.org/all/20260824224139.21256-1-christian@themurphys.eu/
> 
> With is_snoop = 1, frames holding rows of the buffer's previous fill
> went from 301 of 698 and 684 of 697 to none, reading every frame with
> the CPU, and 4224x3136 raw at about 790 MB/s still ran at 29.95 fps.
> The patch applies to v7.4-rc1 unchanged.
> 
> It carries an Assisted-by tag, which 7.4-rc1 no longer accepts; Sakari,
> please drop it when applying, or I will resend without it.

Thanks; both this one and Antti's corresponding ipu6 driver patches have
been merged.

-- 
Regards,

Sakari Ailus
