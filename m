Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D770282F12
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 13:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781531376; cv=none; b=vFd9MRwBdYLny6gF978IOQN/cAzUNxw8vU75+ddyTfX74rVc33yuD47leSozWmMgplthznffQw3zU5uL2v1WrypmgflrI59pN0m0dhvMoLKl6q5rJmg+HnHYUyCbak4/7YXN0RwdURXG/2LfI3KZ8DTC3FhYzsKPzedKTNubhFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781531376; c=relaxed/simple;
	bh=k++5s6H7LP2FFKO/y3x5gTxmu8AjlTXP5feboQ5QR34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHTg5qVvbLoRF3Y2UOvQ9cHfdVRK600d3VjTfB6RlCdiRskMoDcPD4162jE+m5R6sHMDBtGv3IqPq8iToqXHkM4TtTNImq96dgbod7nAFERqdN/udyXilmo6lrQIr3/yYuEtiHYXyk2JXJyB7f3rIV9AA/bVDt/aNvyrHPfbyl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DbpRiaFd; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DbpRiaFd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781531375; x=1813067375;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k++5s6H7LP2FFKO/y3x5gTxmu8AjlTXP5feboQ5QR34=;
  b=DbpRiaFdKrrvMovLdO3T7J60MlAjYD7CVJ/oIDV/AUtJrMU9YbR/sJii
   ckXfvyIG8ix0S4vE8iDT2R7B5QmskPHDz1tybH1K54UCSJQXgPNZd4SI9
   3pl55USSFSdK4HyJe/vmh33eeywVy3Si3u30qlBTk0z/QMvKN0XsdEyML
   trjHNEcukL6ic9TJCvYvJlA1DU9GlLh2k2i6piYx567A+WVGFCuXrY2QQ
   YQbHXO7/vOnRMkY3DIVelwwa0x2Olm2uq62d9F9VUxVnlPuWBtsMZF0i1
   B+0TrKPOEBn7GdYL2nvnRl9C1qcietswNb/3x11cSAqIY36gr0wb4R/cN
   A==;
X-CSE-ConnectionGUID: kJLTo6ZkRZ2UAhCg1jeWIg==
X-CSE-MsgGUID: 6ZFSK8OITq2FfR9qR/k7mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82009970"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="82009970"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 06:49:35 -0700
X-CSE-ConnectionGUID: Pth0CHSJTs2hBLA6+YSDJg==
X-CSE-MsgGUID: 3Vf0x/xLSbyquNjEzhLtsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="249363221"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 06:49:31 -0700
Date: Mon, 15 Jun 2026 16:49:28 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Dawei Feng <dawei.feng@seu.edu.cn>, andy@kernel.org, hansg@kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, abdelrahmanfekry375@gmail.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, jianhao.xu@seu.edu.cn,
	Zilin Guan <zilin@seu.edu.cn>, Kees Cook <keescook@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 1/2] media: atomisp: fix memory leak in
 atomisp_pci_probe()
Message-ID: <ajAC6E3Pc0edjySZ@ashevche-desk.local>
References: <20260615072841.3113700-1-dawei.feng@seu.edu.cn>
 <20260615072841.3113700-2-dawei.feng@seu.edu.cn>
 <ai_d0B8YOZAwnqu_@ashevche-desk.local>
 <ai_kfgkuDYcFd0bG@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ai_kfgkuDYcFd0bG@stanley.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 15, 2026 at 02:39:42PM +0300, Dan Carpenter wrote:
> On Mon, Jun 15, 2026 at 02:11:12PM +0300, Andy Shevchenko wrote:

...

> > > The bug was first flagged by an experimental analysis tool we are
> > > developing for kernel memory-management bugs while analyzing
> > > v6.13-rc1. The tool is still under development and is not yet publicly
> > > available. Manual inspection confirms that the bug is still present in
> > > v7.1-rc7.
> > > 
> > > An x86_64 allyesconfig build showed no new warnings. As we do not have
> > > an Intel Atom ISP platform with the required camera sensor hardware to
> > > test with, no runtime testing was able to be performed.
> > 
> > These last two paragraphs do not suit the commit message. Please, drop them
> > here and better to describe all this in the cover letter (if not yet).
> 
> This is how the documentation says to write commit messages.
> 
> https://lore.kernel.org/all/ahgaOigklcDCYvRp@stanley.mountain/

Isn't it enough to have in the cover letter?

Thanks for commenting there, but I would insist to move these two paragraphs
from the commit message here. Maybe Kees is okay with that, I'm thinking that
this is too much (since we have lore archives).

-- 
With Best Regards,
Andy Shevchenko


