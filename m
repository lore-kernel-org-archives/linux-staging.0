Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA4D3A3E72
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 08:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776156265; cv=none; b=TO9yCg4x/GK5Uci4Z5XTxGHyTwBHhNSDdZYTrZ3dfTctLmK4Uw4cQ1gSIJrCfa2g6V/q3rRe9yLJPiOWUe5xo0qgvtnJjMdodYRsoMvCgC2wVsxT4dE38DnfDMQheSvZ2zQlAp1wvy9u9Tiqrgp5iZCQ1kx0RhFXmdYoyyybAjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776156265; c=relaxed/simple;
	bh=NpUf33pNRzJv2ubG74WhPL8sHzImSGAjeBTY6v+XzPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lxBZ5xewDKM1U1qSH2/rnP6SZrI7tsA/nInHXDHEpgfnRMApDQ/ok87CM/u7pPXowydiFWOyrO/31MkoxDiolrH/2gZl10Z+dzDkGCQJ12jceZo+9mgpRsCLavmjF13C+B8Mf4vyRTCIxUJKMq+wiSl8Bupqup2DFlBuDUSwFu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ipJDmIPA; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ipJDmIPA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776156262; x=1807692262;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NpUf33pNRzJv2ubG74WhPL8sHzImSGAjeBTY6v+XzPI=;
  b=ipJDmIPADoNC4szhEa75R3MV7tNXg+KojMKPE7hF+3lEfceRftftFGsF
   x7PzmPCsflpUSYNwxAjmUJtVgVlZreVr5YX/xa13V6rRk94sHI2N3rPM8
   f9fAA+CgKgtR1cndBgwvNz6+/r2R+utDeCQRNpSVxleO16K8ff3FBeYKJ
   YCAGT8dszfL56ZW9+dYIBKYuP94P7VYxUtjXjTM8tUY5AdDwH3y8rG4Xz
   pXL1a6TV9VRgn/6+GKVDtz9jUb0Is52k8LqieHvhB26pMXLMfXjDAQgAB
   OAcksLawCmCY5ECRnfspGGdxHGdXaasULFj8wUWwZU+W/g/7MuhZLUnPI
   g==;
X-CSE-ConnectionGUID: LzAWUugrS0+6KG4G5bV0og==
X-CSE-MsgGUID: r75Etz1jRquUnMxKvMN0hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="87410899"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="87410899"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 01:44:21 -0700
X-CSE-ConnectionGUID: UkkHo7FxTge38DJZUXI/xQ==
X-CSE-MsgGUID: F2pbr0vpRqCYhXmVL+s0Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="253252056"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.106])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 01:44:20 -0700
Date: Tue, 14 Apr 2026 11:44:18 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>,
	gregkh@linuxfoundation.org, ethantidmore06@gmail.com,
	nayana.mariyappa@gmail.com, s9430939@naver.com, kees@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: os_dep: avoid NULL pointer
 dereference in rtw_cbuf_alloc
Message-ID: <ad3-Yhh2kPsbYILC@ashevche-desk.local>
References: <20260413224417.5674-2-shyamsunderreddypadira@gmail.com>
 <20260414071308.4781-2-shyamsunderreddypadira@gmail.com>
 <ad3wxbGGPxxm72_6@ashevche-desk.local>
 <ad3zDOhTjfwy_vj9@stanley.mountain>
 <ad30An8Oi_D-UTB2@stanley.mountain>
 <ad34vKH8FhDIWijv@ashevche-desk.local>
 <ad370g5G9eUWSX_E@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad370g5G9eUWSX_E@stanley.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Apr 14, 2026 at 11:33:22AM +0300, Dan Carpenter wrote:
> Really _obj() can't be ZERO_SIZE_PTR either, or if they are then it's
> very difficult to dereference them since they don't have any struct
> members.
> 
> The main way that ZERO_SIZE_PTR bugs show up is with strings and NUL
> terminators.

Wouldn't it be the problem for

struct foo {
	u32 baz[];
};

?

-- 
With Best Regards,
Andy Shevchenko


