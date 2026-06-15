Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3961990C7
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 13:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781531503; cv=none; b=f75sHepZPHHDPCttRyMvDP7gk/Gm6vypDDpEhp0soUxG3mu/wpaa6+L3TvhlrbCdI2UhpoUxLMr4B/F5Aj5V8Jk0BlAxiCSOGRjryLK3Yv+OlRojKkw/MzDjEx5nUoanQQwN1dSxjnmeF05QqmmE/b0tTSTwVarDMFegEK7b/0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781531503; c=relaxed/simple;
	bh=NKdIejRqD7O9YL3VpvIPAzjNzj9Oq85oYsq2qct6wBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zoicam68qv2O2NcfUzVtwM8rKMSnqWFGqqLx7zmDSe6ckbPHU8UWXGuYnh8JJP0r1lsFZ02eFVrS/NDaVMEoqRKDNZZlaJnYgFgj1KIUKQDIWgKbYaPFd/mXhzad2t5s1BYMwFZeavnw9HSnJhWm+aF435Jm0Nvnv5vajEWR8XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RiLZPPNF; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RiLZPPNF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781531500; x=1813067500;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NKdIejRqD7O9YL3VpvIPAzjNzj9Oq85oYsq2qct6wBI=;
  b=RiLZPPNFuLP09Pw9lqfzpU7tpowS9y16RJSkBMJFv9gDz5ftKDSxJomT
   2eaYu3k10ALxhwzkhQFE5/ViUCjVqJx0Haev6sSe7aO1V8mafwiqn9uwf
   g7gMZKekK5NP+MNTuXfWKg0zAeytAyIE+AFZKY2H6LMqactLbRWJPQX9q
   pnP/NFFiL8FSCIuE+8jsHIkjRfWaXGblvCUg2OgJf0bBVY2xhRVfKUCVa
   Ih1tfjSYQo+8APB3Pp2tm+GG5xFwdVZZ4QYUjlb+P6dcnuKCiI8V7BAMD
   +P0KF/JmtmGYUvkACjsik5f2maSuNT3Do2zmBSliFP2PBDYcdoD8wo1+L
   A==;
X-CSE-ConnectionGUID: LxJic8S0RuK2VuQcFUaL5Q==
X-CSE-MsgGUID: f/zYWwwXQdyrok0vzbWKUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82117883"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="82117883"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 06:51:40 -0700
X-CSE-ConnectionGUID: 716bzmjzQdO0Gl1ucZ4RQg==
X-CSE-MsgGUID: Y3YAacW0RlGHMqAEjlJ2QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="251754307"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 06:51:35 -0700
Date: Mon, 15 Jun 2026 16:51:33 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dawei Feng <dawei.feng@seu.edu.cn>
Cc: abdelrahmanfekry375@gmail.com, error27@gmail.com, andy@kernel.org,
	corbet@lwn.net, gregkh@linuxfoundation.org, hansg@kernel.org,
	jianhao.xu@seu.edu.cn, keescook@chromium.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, zilin@seu.edu.cn
Subject: Re: [PATCH v2 1/2] media: atomisp: fix memory leak in
 atomisp_pci_probe()
Message-ID: <ajADZZqqsFcgAPhy@ashevche-desk.local>
References: <ai_kfgkuDYcFd0bG@stanley.mountain>
 <20260615123515.3289855-1-dawei.feng@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615123515.3289855-1-dawei.feng@seu.edu.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 15, 2026 at 08:35:15PM +0800, Dawei Feng wrote:
> On Mon, Jun 15, 2026 at 02:11:12PM +0300, Andy Shevchenko wrote:
> >> Fixes: 9d4fa1a16b28 ("media: atomisp: cleanup directory hierarchy")
> >> Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
> >> Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>
> >
> >This SoB chain is wrong. Who is Zilin and why is he here?
> 
> Zilin is the discoverer of this bug. We are in the same research group,
> and he actively participated in reviewing this patch. 

> To better align with the kernel submission guidelines, I will add a
> "Co-developed-by:" tag in the v3 patch for Zilin to properly reflect his
> contributions. Would this be acceptable?

But did he _develop_ any parts of this patch? Otherwise Reported-by is more
suitable.

> >These last two paragraphs do not suit the commit message. Please, drop them
> >here and better to describe all this in the cover letter (if not yet).
> 
> As Dan mentioned, I included those paragraphs following the exapmle in
> researcher-guidelines[1].

Yes, and I still insist to move them to the cover letter. In any case those are
not present in the second patch anyway, moving that to cover letter covers the
entire series (and I believe you tested the entire series, didn't you?).

> [1] https://docs.kernel.org/process/researcher-guidelines.html

-- 
With Best Regards,
Andy Shevchenko


