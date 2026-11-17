Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906734;
	b=IOhfl9nkIYMDV2CYrmJabnK0LoXGTpLkCxtSHFZ97KodcdEoDct+T2S2TT6UJ/Ok2AF9
	 xspzpQhMBR3Dm3lXPiqZX6NY6JZTXymwN3nPxDWv/AjT4YaWSL/MmpN8DS7FjbcQK+NJ/
	 9uCtig/Gy5YDDG4a89bAJC0oz1sqeYgd9N5lR9z0SX+rBcuCgE/gayTVONfXfD2XTXoH2
	 GHahJViB00bADE4z392q659i8CLGZM2eQNGCjCv7eKOsXoWvX8FfwrH2DAoqP2cYo60G+
	 EWpQRZhaJhDCMcj1dg/8+IwHt7S6RQu8KqUkPFNbonR+PZrjhXYy5Y/wvOxKH5H9jXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906734;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=sARh2vxI77mefNWtiaNXngUxhjlF/CvgAiwrCgNCyNw=;
	b=u1UuukIieZoZJHcnAmfqyQZCDZxpLeAFB4BFlFpxNSWoe/SyZfAa62FpoNSpN2mVm8/H
	 Jge9ipZmhaTydwjO3l1ZRwU4NP3mGUGND6oTBut56erHY2GHbM9NsUGSrii7TTw/PFoZp
	 8FQ1ME+SI2Ikwraw/CuvHcOawGw10SjtIjCBg8CIAIzWF/XS+zPvWwjiwJ/27SZKHDGkm
	 SSGwiexKEwBiGjlDEUuGIKoehnDu1ulRuISI2vCbiDwDi/ID4Kk0twQJkj8PrH0hVRmOI
	 f8Wq8k6ckmSdsGkWl0a9uZJMUVoK7/DHlbB0ObfR1BvKySJy3FteOUHWbSgEMEJE9+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cq+DUecl;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E07606A32F
	for <linux-staging@lists.linux.dev>; Tue, 17 Nov 2026 09:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1E07606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cq+DUecl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794906732; x=1826442732;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xK75Rwny+8YxOayz9J2hx5xcwDjlispCGjCFjO57dxk=;
  b=cq+DUeclDtbQy2BLhgfjWrKqizJnQdVAe2QzzjNkTnFJEEYIl5awSrox
   B1QM9dcnr+F7AC0vvu9/1e47IWqMuYGJPwisbpmEW3Gxze0WwfstvR0hi
   VfH0ZLlKaaYqC6egwntZCf8ADTtDXAy+ZHTiceRbwKotuJJE4TMjJUSyK
   6J8bK10r0IiT+7kJaGr7+NkCow2LVYzaL3Ep2QrL976cD29zRshbfVbi0
   pv+qLEHvgCeGVjSs7C8bTHmxVDVYeMSZU2AZQFbam7HcrDVAxLbv/cCh8
   IHS47nV7oFBA0jVeBRpfr73rleW3u6/wgkI2tKY3JAcXKQeVb4F5oclB8
   A==;
X-CSE-ConnectionGUID: X4yEMqN3TgOgWVRDRCS4Ug==
X-CSE-MsgGUID: YRmjd/tyTtGq2cT2tVXjVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3751071"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3751071"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 01:12:12 -0800
X-CSE-ConnectionGUID: DNi+Nw6MR7eQl3esGPmN3w==
X-CSE-MsgGUID: EJ/9j85CRZm/6qg/Vl7mbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9784071"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.254])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 01:12:10 -0800
Date: Tue, 17 Nov 2026 11:12:07 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Avishek Chaulagain <chaulagainavishek14@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dan Carpenter <error27@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] media: atomisp: remove unused functions
Message-ID: <avwaZ4cK8-sgJSMG@ashevche-desk.local>
References: <cover.1794845230.git.chaulagainavishek14@gmail.com>
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
In-Reply-To: <cover.1794845230.git.chaulagainavishek14@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 16, 2026 at 05:08:10PM +0000, Avishek Chaulagain wrote:
> These three functions have no callers anywhere in the tree. Remove
> each unused function along with its declaration and the now-stale
> leading comment that described it.
> 
> Found via a tree-wide search for functions whose name appears only in
> their definition and prototype, and compile-tested under allmodconfig.

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


