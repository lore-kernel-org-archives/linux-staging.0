Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793436052;
	b=J/2AkcJWa9AmU7ul+6mhVllb7rNn+ciDwHJrh+M6wdUA2xhwmIhpNWo9c1YnoDUJGGth
	 kuPuwKay65s2mCDYk6D5hcLI1cupdEX3bCzfmA9/gKwYzPayXN/MdPPC0rmCkkscvrAFE
	 EO/aj9QjFzh8uY3JRg8kuYPfWTNFk3u3irmUO2zDTyH/94WgxfTXZ6wGT7pGjhTXyXOLE
	 5rRVGm8ezP03WKUIpxkW0jHSC8APdSOXqCSJ6JNnK7sj2CACaDf0K12jCxjCCNKZtUsD+
	 WmX/f5Z9gxOMPuJiHyw+U6mFWnhLcaAZV/eYJYmyrd5x/xzcdnQQi6VF2CcqTMpUqeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793436052;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=6svTTISeQUYx1ZIWsfbO5edWqBQzyZocELnYvruPeJQ=;
	b=KAahtmOOOWX7jZaxRmS+jyfnIdcUlb9u0dyL+Wp7C+s+UL1xvp8YIUjrxPgZh5Hi9xU5
	 1iagz5isWGCsHAAoR1K4L/Zs2yTkI226sXaHmdcS5TlNpM3Quf1a2OhkCQJ0YK1njQk1u
	 JftJoxPEHixyu0QttUxxarjp0zkYKuQoFS3YlzJKB8UsLv/82dCEgHH06AEEv8JE3urDO
	 YoqSqQNvTKCkBv2JN2lDZfB8CaIVM6C/raoXT8mtR8cJXj8QsCrXUTvIVs42bCn6COfqp
	 zrAXKzXyAdElDzcBH6oz7GBXvdu289f9i7Bug/HfopvvX8xsTGyWRwAzL/1bzs3sOyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bxCyBxt9;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F8C606A31C
	for <linux-staging@lists.linux.dev>; Sat, 31 Oct 2026 08:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7F8C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bxCyBxt9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793436050; x=1824972050;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BF/278JGTfk0RG+nqNh0X0rOdKPRj+r50jvDUKTf/J8=;
  b=bxCyBxt9aIwNnkJLpd/c0qwqBNdUugxDfhvLcTNF4gJyUDtmE/YVQU6U
   SL7L+ohKVMIY6Xmch02aC2VTgCeSd3Q4nG43yaBoz9l3jK3CYvsIf8uKz
   jtUNPhHVttq8ZFS94FpmMtcf3sN4jYxijF31GTgVdZbBI+DcK/vV3Fz7M
   swVERMwDn1n6mkuHaCwq0yzMXgJvK5QfEyyCHis+LAcrlBSfbXuTRVxks
   GzfLHoqtJZ1NWPLvJjwneHjGQFFonz/dxqi56O0wcM++EnHNf7aCdZeRa
   0RgedtHac0T/I9T6BI0xU9c6fUqxRsKljEBB5SHCG0SdUJQy/Q4AHK6XF
   g==;
X-CSE-ConnectionGUID: RXC6wQdoRB+Iy20MnZhqqQ==
X-CSE-MsgGUID: ARnxGHgtT4O2ZoKVxR/HAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2220960"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2220960"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 01:40:50 -0700
X-CSE-ConnectionGUID: GO8Lq7JGTfyf+TJ2wWyVRw==
X-CSE-MsgGUID: edkas0dCReeUBlowOcjoDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7429665"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.127])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 01:40:48 -0700
Date: Sat, 31 Oct 2026 10:40:46 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Avishek Chaulagain <chaulagainavishek14@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: Remove redundant return statements
Message-ID: <auWpjhhTGEJS09n0@ashevche-desk.local>
References: <20261030193322.13777-1-chaulagainavishek14@gmail.com>
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
In-Reply-To: <20261030193322.13777-1-chaulagainavishek14@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 30, 2026 at 07:33:04PM +0000, Avishek Chaulagain wrote:
> A return statement at the end of a void function is redundant; control
> returns to the caller once the closing brace is reached. Remove the two
> such 'return;' statements in hmm_bo_release() and hmm_bo_vunmap(), as
> reported by checkpatch.pl.

Usually we expect deeper cleanups for this driver, see [1] for the best
(so far) example how somebody can help with it without having deep knowledge
on the particular hardware.

This type of change has been appeared many times in the mailing list, you
can study the case why it's still not in the upstream.

[1]: https://lore.kernel.org/linux-media/20261027230807.2407261-1-vladurares@gmail.com/

-- 
With Best Regards,
Andy Shevchenko


