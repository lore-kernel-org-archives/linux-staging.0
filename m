Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2153876A0
	for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 08:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776673668; cv=none; b=f0ToG6ufblsDibc6lU1n6jP/8CQ6/nufAuEW0IRR51tBUd26jHEnHv72hONooNn+cLx1ZsCA691ZhIXu79YC6kh0KTs4gCRxE1TeSEotJOl5gBV2914nHkiXfoPuQQORMwezgBw7YhLMn/q/+fU6u4ef1+Uw8kPhKspyXOn+nfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776673668; c=relaxed/simple;
	bh=eUYeukojicnRRkMXdJS2uEG2qla1t/9wKN+/rmERs/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TSFQBfDXC3jP75yUkcI3C8Qwm61ugqSyM0VKjP1IYInaBTOxn56XKhU6aLtI6erGQ27TzkZMe0B9AGjKavVkp8HIsorM8qCOOM1/py4CDH5wZV5cXXKnuwbtMDVnJNi1w3mGpRE1zUJiOa+cl68ypLiCV9/Q0DChdskj5kOkquM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mrOMmRyZ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mrOMmRyZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776673667; x=1808209667;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eUYeukojicnRRkMXdJS2uEG2qla1t/9wKN+/rmERs/o=;
  b=mrOMmRyZ1x3fduVb98tSZzQFi9TRrDmNHuJtyR3wHyGa1Em43zfZj41L
   c24qwGiRvGzZQmPItM4tUaF81qsuzkY+0AAMcm/xoxCej/Sh/6dKfzn2y
   suqGvLUH2QCTP9qvBHPiKLESeKXB1el906gb3myCgh4JPmRfPpjGrm12p
   IHmuLENtk5toFoz2QSbuoWwLUnTxtv9zvHlX8Ygubm8nTHh81Gs9z3D5u
   YBhlMwUVMlwNhktPrvgsFhLitoWUw5E38mjqMMYYOTYJgtmsyseltVRMd
   znuPLPc5Ufpui+amG/Ww2fHcgbzPH/ccSXQpbCwG+FjXMaygD/8Cre/8A
   g==;
X-CSE-ConnectionGUID: ZaAeBMsRRnWTh73M1S+vLw==
X-CSE-MsgGUID: RC0nM0pUSRCkh18F3iAttQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77709117"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="77709117"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 01:27:46 -0700
X-CSE-ConnectionGUID: cIfcxwqNQZCYL/MWqVVW4w==
X-CSE-MsgGUID: z2LulJ2sTd6k+wwSONmscg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="231572533"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.90])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 01:27:42 -0700
Date: Mon, 20 Apr 2026 11:27:40 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Yuho Choi <dbgh9129@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>,
	Michael Straube <straube.linux@gmail.com>,
	Minu Jin <s9430939@naver.com>,
	Omer El Idrissi <omer.e.idrissi@gmail.com>,
	William Hansen-Baird <william.hansen.baird@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>, Ijae Kim <ae878000@gmail.com>,
	Taegyu Kim <tmk5904@psu.edu>
Subject: Re: [PATCH v1] staging: rtl8723bs: fix stale recv_frame free in
 recv_func_posthandle()
Message-ID: <aeXjfNcdhi7JBMR9@ashevche-desk.local>
References: <20260420042734.3685-1-dbgh9129@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420042734.3685-1-dbgh9129@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Apr 20, 2026 at 12:27:34AM -0400, Yuho Choi wrote:
> recv_func_posthandle() saved the original recv_frame pointer before
> calling recvframe_chk_defrag().
> 
> On the last-fragment reassembly path, recvframe_chk_defrag() may return
> the first fragment as the new frame while freeing the original
> last-fragment frame when draining the defrag queue.
> 
> If process_recv_indicatepkts() then fails, recv_func_posthandle() frees
> the saved pre-defrag pointer again, which can result in a stale pointer
> free.
> 
> Free the current recv_frame on the failure path instead of the saved
> pre-defrag pointer.
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Co-developed-by: Myeonghun Pak <mhun512@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Co-developed-by: Taegyu Kim <tmk5904@psu.edu>
> Signed-off-by: Taegyu Kim <tmk5904@psu.edu>

Same. Are you, folks, doing some AI/static analyser tool?

> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>

-- 
With Best Regards,
Andy Shevchenko


