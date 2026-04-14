Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9AE145355
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 07:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776152581; cv=none; b=Xg2ntJHxQkrFviZBO6GQWHoSa3fv2HCCUnERKYw28S8zDHPQiTxVjT8M7Wz2TKGaJdVDpE+kd4geST6h5+2cOIrgMLDIg1bPUcMZL/W1lmx0PNjXPR8LvEXAlV01qNEtoR03yXm1TR+QSNOYIFzkml2rMxnLbLcli+VxZHGkp3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776152581; c=relaxed/simple;
	bh=rRWK2VPDgEYlHy3edAzzB62wFvUQRsjIMFtaUw0Fqfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bHIm3LEuu3+Pw+f+AcTj5yXc7ZJvah1Hqlre/eGSGMwUIRfpPwYlYsGkN6VvPjCRhQZUKEzLuBvMmEfufJ+nAZ9CPOZpS/mJDRy7MOQy09YkYPgTEbI9KZ+UrRrRAfsYL4ZOrbEtv8vQAsDAtv0ZB99yRvIht6fETv00uwc/rJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AevYEldZ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AevYEldZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776152580; x=1807688580;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rRWK2VPDgEYlHy3edAzzB62wFvUQRsjIMFtaUw0Fqfs=;
  b=AevYEldZAxtI1ULiygAn7OSFCjSYJZBDZy5d/BcJRVLRY7/UwdCylFkR
   EmXUz8ZoukezBeukBXJfY1yq9+7LM0jngDzwASBoFljjLB7hVXEHdZx/E
   WiTYEbedsS8lcbQ6HGymqi0+vyIuqPwQ52EtXNuJ4mf+iuNvDzFjoR3Wc
   DctMd6tP1L08YozNdwsNE2g3uhqhilCklDSYDHuLRvUCVTU2bToTnm+Lx
   JMBB/vsDIC+/IspWP4WBNzxAMLUgWbvU+m20Swf8r73pfC/Q55+W/QCSm
   6dayb9hpWqgKOwtiXcaEkiSRyc7D3sdGdtEybErvUFEgHVW3UfsVEIF1l
   g==;
X-CSE-ConnectionGUID: MiKVVgnyQ4GqE4atHRd5qw==
X-CSE-MsgGUID: 39aza8GwQfOqoZwuASuPzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="76265173"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="76265173"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 00:42:59 -0700
X-CSE-ConnectionGUID: 50hX+NOsSwO7rqf7TiV5gw==
X-CSE-MsgGUID: MoK8Mt/TRgablZTkJYYJ2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="268001514"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.106])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 00:42:56 -0700
Date: Tue, 14 Apr 2026 10:42:54 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>,
	gregkh@linuxfoundation.org, --to=ethantidmore06@gmail.com,
	nayana.mariyappa@gmail.com, s9430939@naver.com, kees@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: os_dep: avoid NULL pointer
 dereference in rtw_cbuf_alloc
Message-ID: <ad3v_t18EHP_Ztis@ashevche-desk.local>
References: <DHSBOBFQ3HZK.39HN9XAYE4BT1@gmail.com>
 <20260413224417.5674-2-shyamsunderreddypadira@gmail.com>
 <ad3XuZrHwaUiPTIM@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad3XuZrHwaUiPTIM@stanley.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Apr 14, 2026 at 08:59:21AM +0300, Dan Carpenter wrote:
> On Tue, Apr 14, 2026 at 04:14:17AM +0530, Shyam Sunder Reddy Padira wrote:

...

> > Fixes: 980cd426a25747daf8ed25e2a1904b2d26ffbb3d ("staging: rtl8723bs: replace rtw_zmalloc() with kzalloc()")

> It should be a 12 char hash:

Or 16... (or how many Geert suggested and actually started using?)

-- 
With Best Regards,
Andy Shevchenko


