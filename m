Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8AF3019AA
	for <linux-staging@lists.linux.dev>; Tue,  2 Jun 2026 23:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780444703; cv=none; b=HOT3UA36wBJ4P053tWbOyH3cqJ4B/eF8tNTmgDr3KhUYUat1nuQym2xbdwbb6v04Lv1KPUV0x8gCwtqyfHzQeU5InGxfUhMHEkLKzgfwmpOOOBqdXZYVRGbdb7E6K0S5Ssg0Xa2xKFPKlAGef7cYU6/9AEdzemyE4LkAtl12TRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780444703; c=relaxed/simple;
	bh=2mFBFAQG+khjgWSRYTFuDfdUptWLawLd6FI3LlnaVWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eBvkFjdPCxcV0hDsGpBgZsV4Hgb7Vw5E3/Gq9jtIIDjTB8gz9it4Wvm2hHmJsM0caJqn/ODqMp6YsjmCDEbVrRYPMy+jY7xfykcRPrCnsfkvyOchAidALLZwVoE2WYnuUjMqxFuADtvDRp5lpJVUf5wAJl4PVbIewyT4njo4jlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WxHE0yt1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WxHE0yt1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780444703; x=1811980703;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2mFBFAQG+khjgWSRYTFuDfdUptWLawLd6FI3LlnaVWw=;
  b=WxHE0yt1x3XGWzBP8zBr3Asqn9f7cgKZkj7RqxuUN45vHrPYElUw7XZy
   iFUMYszwr0GUP5130oE3uDRhbHDOUtrGF6/eqK3eoRf/lw8nwhuZ7rQbh
   xu25a/dkWZHNvsRICN0zpnw1Xgr5tpgydKt0o1DePdn27eExUkDweTDHu
   5SqDSrQgz5Brm4V6/3mgoFB61/idELUEMLWtGGXn1TfrGOONSs3SGKvNb
   XmQutnL5Zu8MYrBXDXIx6U15kOXuNENy8ZIEVpNModXWJhsORyrm4eGcW
   GicRiL2is4LuXRZSg4byFPqSyVs2jhG+Hhqq+d3n/lItrAUOs47Fv+AkD
   g==;
X-CSE-ConnectionGUID: 5e4zTS31TAudEZkeOgQz/A==
X-CSE-MsgGUID: hntrABuARdqLzw1+vaAlfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="68785199"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="68785199"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 16:58:22 -0700
X-CSE-ConnectionGUID: 2UupLwI5RNSRYd0izdI/PA==
X-CSE-MsgGUID: RM9KZVjVSeqhHHZlG8Ul2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="239600096"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 16:58:21 -0700
Date: Wed, 3 Jun 2026 02:58:18 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Pramod Maurya <pramod.nexgen@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] staging: rtl8723bs: Fix line over 100 chars in
 xmit_linux.c
Message-ID: <ah9uGi-BIE5RIVSs@ashevche-desk.local>
References: <20260523162831.163704-1-pramod.nexgen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523162831.163704-1-pramod.nexgen@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, May 23, 2026 at 12:28:31PM -0400, Pramod Maurya wrote:
> Wrap the long function signature of rtw_os_xmit_resource_free to
> comply with the 100 column line length limit reported by checkpatch.pl.

Folks, are you going to send a patch per a single issue (of the same type)?
It's quite extreme and puts tons of unnecessary load on maintainers and
reviewers. If you are fixing a problem (a type of problems) fix in the entire
driver at once. No need to go file-by-file.

-- 
With Best Regards,
Andy Shevchenko


