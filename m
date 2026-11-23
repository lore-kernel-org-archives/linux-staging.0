Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421911;
	b=2GfRPHtfYtk3V8RSf2OK/NIjadA4R+ipKM3MCxR+b1Lj0S8o+iwKNQfUdnX87CeZWa/N
	 gn3Mr0xs0gkNVW9IKxitf0tqoE5bOLMth23DkTRBiLSNk6g7Brnigc76YMjGb243nn0Vb
	 AHAZCgFSpQhtzvOh4AB5m2xfo+MZwR8wvRsutp+1iff1MZNiHU8S4T1+Y++KoIANloF6V
	 wYRMEmseWQ3IFCCP/N4RBINUptFCGQOZDPUfMn0M4h7DrDxlqGbvKOiGjvWZqlXTmePGL
	 fBN31sIAhNFWu+SyV9hGJBrBwsjDYmXantSdapS3jyBqXvhA6DEDHhlho4oR6RKTaRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421911;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=pAi0FOlD7jecg0Jih3AEUeZr9uwQOqOruraPDjTwLmc=;
	b=GZ8UMoVck+1Aa/wswbVACo9DekUQPXEuM2ZOoapSIWHlzULsjKERkHMCQJ950+iPC2YD
	 dQ98bZ28puZi3biGWHF3ULA2ThmDpx1eM6u8AnWcaleEhvuF77pF1RsgPIUeeLrzuC5qB
	 Bnm6wohzt/iXdiy6HAEXWoJFq/aeYxOtGFgzF+8IS+AGTKYwE4q4Rjb9sZvtwQZ+lxgdM
	 YjOfdeK/91oT92bu4hHI+pbtcuI1ELYRTnuFLI+pAF6LWSorfwCkFc7rTqDBuaCgEWyCK
	 SxicwhMDOqj0xUwwU3IcGm+/NU8DBcIbpYgxNogXrVcPCNQ5GQ1c128rxLLJ9BuP03A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ff7Tu3cH;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6E8606A31F
	for <linux-staging@lists.linux.dev>; Mon, 23 Nov 2026 08:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC6E8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ff7Tu3cH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795421911; x=1826957911;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YKa1djohSu06ZYy3q58kr/JnsMrhtdQAwwPmVBocZgw=;
  b=Ff7Tu3cHqQlWas2ytOe0nSnPIrksEw1I6pqFCrsibu8YK0/n6InVtoC0
   OuIcbPVxEcmxzNu43vuGf3SYWuIQfsKXsSoW5F7PlMp24e0x0IkwUYytV
   XNBSwuvFY88EAVnC9thrJHGXBfDfRgpuZ70vyQHk6DrTwLfkxIr9E/VRy
   9bQyt/Ikx6IKFrukRHiuivarVYhGCADz6yrFZssNOoPC1gRTf8yyOcDyO
   8cI9J5RvmywxstDa7gjm/HRblC5N8Mld45Lk/2JXqz9FzLiHrl37hCON7
   xF/dgQrdszTq9P4TzMG2WU9nxS6noXQzNA+DOS+TP03RwUImvsUENl7gG
   A==;
X-CSE-ConnectionGUID: iyrMrsx6S26MOZ56jzMagA==
X-CSE-MsgGUID: BdO1+Iq2Q66aCsfB2x38Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4068631"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4068631"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 00:18:30 -0800
X-CSE-ConnectionGUID: ep+NzUUMTlGojlella1x1g==
X-CSE-MsgGUID: 6/T851vRRbK81n3gjfVcmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11562913"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 00:18:28 -0800
Date: Mon, 23 Nov 2026 10:18:25 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: atomisp: Fix potential firmware leak after
 partial loading
Message-ID: <awP20Wbc1Fh2dWpN@ashevche-desk.local>
References: <20261120173523.3923967-1-liguangshuo@mail.sdu.edu.cn>
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
In-Reply-To: <20261120173523.3923967-1-liguangshuo@mail.sdu.edu.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Nov 21, 2026 at 01:35:22AM +0800, Guangshuo Li wrote:
> A failed firmware load can leave the minibuffer table and successfully
> loaded blob parameters allocated. Probe skips firmware unload, and a
> later retry overwrites the pointers to those allocations.
> 
> Unload partial firmware before freeing the IRQ. Clear all_binaries after
> freeing it so cleanup after a later failed load cannot free the old
> allocation again.
> 
> This issue was found by our static analysis tool under development.

Please, test on a real HW.

-- 
With Best Regards,
Andy Shevchenko


