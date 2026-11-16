Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838811;
	b=1K0u49QOWrh2iuHxQHfQu/XZD0Ijzmv/ETFrzjAoepHAhRRXhXwrX+ejLUGjhIGC+uxg
	 lea68Gro4n/XUWRYOqemZ1o1Mv+JFAXLrVcQRkHWutwETdbj44dKocdC/3yKfqoA7A+t3
	 xPKY5gzizY3ssmHYb8iXxGUoy4y+AEXHRK8N13dkZUrYj7EN2EhExHQ2XFd3elIoHKAuM
	 XzVe+ni3zqel4EJ2Pdiak9XJlfcNc3wzn2JirkGaJm54DeF00mZUtCeRHWDH+7LjV9amY
	 rvaWFzZj63p9E0XaUkpwnDBxl7E8n2oG8jiixt/fLAwMWf06NtiCBW6A2n+Rs1Y9x8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838811;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=ZPnF7AXJqqhQH9EkBttMT76JzK8rqfInXWI5291QWiY=;
	b=C8hfkNGh8CyxQwaGLR9qfxDOzDCxGfeEiqmfl8iXDJ27Pi9qkvR9eQTdTAoLwcsLOGdL
	 8HErBfTgs/rxES0KSkw881+h5rpZZqjHUoenLeMKkjZuO4Nfa8v9TmpqFHC75zJg2eVlT
	 3VHwDuVSHKgEZ1WEvxkZ4JdyKx/rc0q2MO3NT0nboBAGQ1kV9H388P2gT/WNNZH6scxlY
	 yvl7UhYLtBEgj+ecLcTEssYRTpC1SLSOIsVIfHIVQcLJEjzFjYugwCPfJc74j2U4z3rlM
	 zR67s1oLWEATcLXuNcarUyoJ1+W/0J9dNlpVr+OyQitoXYIxAfmCbLaGhhNX+6T+oZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MRPME3eZ;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EC6606A32A
	for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 14:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17EC6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MRPME3eZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794838810; x=1826374810;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bDcsy2RPjNi+n7ijKnyp08tkF7Mr2ciXEhvTTatXinw=;
  b=MRPME3eZiX3gJPtnIO6vGSS/5pS1kRuQ1E8XZrN77d0BJFFKzYMBbxYF
   thg7QPyl2doaMJgPxy2dLzsfr9iewL30p2laqozdFmYSk2O+/Bkl0YIDu
   mQ/nqmDQ2YitBur7sZl6C6jGej0wJ35kHjNmepwOcspcdQBWIlPwwiicu
   eExHWNAud/swm/8wt91AabWnvDZsiUFCSiXqBAA6ofAL4/d7l5budouXq
   TBtG/JEJlkRllNlgDaY2/fGCn51KhtTkD8Y0fj/cXGWeuzFo6QHdO3Rmd
   WimkjeyDzEkoFRo7kvAvv68lKXa4HdrkVVcvr3MLEYyC4DTAlHNzYaCfV
   A==;
X-CSE-ConnectionGUID: UrhfibAKQrWZ+kG4YNsHtw==
X-CSE-MsgGUID: CJgDUZh+QeOqJh6wPKyQWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3611253"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3611253"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 06:20:09 -0800
X-CSE-ConnectionGUID: ON7eFZe5QFeg9R62tTKoEA==
X-CSE-MsgGUID: cEwgaYxaQGmvBCzhcXi0fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9554452"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.90])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 06:20:07 -0800
Date: Mon, 16 Nov 2026 16:20:04 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Avishek Chaulagain <chaulagainavishek14@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: atomisp: Remove unused any_virq_signal()
Message-ID: <avsRFGZYgz7KYcHD@ashevche-desk.local>
References: <20261116120703.6681-1-chaulagainavishek14@gmail.com>
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
In-Reply-To: <20261116120703.6681-1-chaulagainavishek14@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 16, 2026 at 12:06:56PM +0000, Avishek Chaulagain wrote:
> any_virq_signal() has no callers anywhere in the tree. Remove the
> unused function and its declaration.

...

>  
>   \return any(VIRQ.channel[irq_ID] != 0)
>   */

Do we still need a comment?

> -bool any_virq_signal(void);

-- 
With Best Regards,
Andy Shevchenko


