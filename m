Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC33D214204
	for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 08:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776673551; cv=none; b=Q9Ka20NhDf8AX0bz9kgzMmuhXpzN+A5MuTfSKrsHCPd0q2MYhga/KcN4p4hJe8siDhjCoc2CpYk3SNZLW4ZA4Y9+F+pvuGNc+GHL80v8SgTGh9TRAexHOjrCCLp9ZlF0enaKXlDyml81SyuKF86f3QRl4lScDsSu6we60raaZsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776673551; c=relaxed/simple;
	bh=Gx5jlVfGRaAb323+FyRNSfHZpRPN1dyKRlcSd1cof48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYP4EKs9qWhvc0dm3VVG2tl7Sm+oknXttLcPzbA90lftSfmxTmX9omiP0IRUd3Snx5CPbxrMEQvI7aI4mK275ngVnl0hd6HZOAfNMvKncmF5AKhfkO0onOezz1qJnFh4SMGdus/RL7/S2Twwin4XQYCX0g2Bw7gtBno4EH1tryY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mFZMmH1P; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFZMmH1P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776673550; x=1808209550;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Gx5jlVfGRaAb323+FyRNSfHZpRPN1dyKRlcSd1cof48=;
  b=mFZMmH1PS2/dxO1M9SUDA9If3qfMnS/IvwneezCwkTWB6GT5m4KMdi3d
   fiHLM8c+I/kr80xNtYVumRnP4nk+Ge+eqYCkjBQl/rI6OQ4gotceXtqdB
   tjn1SOWvcUNdLS9QmQyCK2HV1+cKJI92nwexSH25n/bLxqGKhhekoihPX
   QHNfpO2cTWPn636xIJjLQxIyIvb+Zu3Zo3DlvymeV315DMJl4gWTYkOXp
   5Lu7I1sscXsKd2FWM16A/Fc92zdJJ+1G6fjrAROfaH3TLLbCRFTc7xkYQ
   NMUKyM16MsHSRAyGsX0taMMSwCfQcTg7tXQ7tcA3ffV5C5fqs4gBXjJ2d
   A==;
X-CSE-ConnectionGUID: YMxk/YL8RaKWOuNt4jokuQ==
X-CSE-MsgGUID: WdP2OtSgRNa1pfmPYexZlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="65116804"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="65116804"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 01:25:49 -0700
X-CSE-ConnectionGUID: ew9fIvMqQzqAP4xSI0kvYA==
X-CSE-MsgGUID: NTyANVJdS2Wy59BcHYPElA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="255135729"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.90])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 01:25:46 -0700
Date: Mon, 20 Apr 2026 11:25:44 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Yuho Choi <dbgh9129@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>,
	Michael Straube <straube.linux@gmail.com>,
	Minu Jin <s9430939@naver.com>, Ingo Molnar <mingo@kernel.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	William Hansen-Baird <william.hansen.baird@gmail.com>,
	linux-kernel@vger.kernel.org, Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>, Taegyu Kim <tmk5904@psu.edu>
Subject: Re: [PATCH v1] staging: rtl8723bs: remove shadowed bDumpRxPkt
 declaration
Message-ID: <aeXjCFcx_usLQkK0@ashevche-desk.local>
References: <20260420030543.72423-1-dbgh9129@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420030543.72423-1-dbgh9129@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Apr 19, 2026 at 11:05:43PM -0400, Yuho Choi wrote:
> DBG_RX_DUMP_EAP redeclares bDumpRxPkt inside validate_recv_frame(),
> shadowing the existing function-local variable. Drop the inner declaration
> and reuse the existing variable to avoid unnecessary shadowing.

> Co-developed-by: Myeonghun Pak <mhun512@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Co-developed-by: Taegyu Kim <tmk5904@psu.edu>
> Signed-off-by: Taegyu Kim <tmk5904@psu.edu>
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>

You are kidding me...

>  drivers/staging/rtl8723bs/core/rtw_recv.c | 1 -
>  1 file changed, 1 deletion(-)

^^^^^^^^

-- 
With Best Regards,
Andy Shevchenko


