Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1025E371CE7
	for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 09:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773740007; cv=none; b=maxJQhQS8N8IDMc7LWlXebzuHf5knXxO/tLbMoWpiP+3lA7AHT5jS8IRxck4skn63Uf4BHuScjQrQeaKO2EmpmUgTnSCDo6DK7t3eFJO48kZM+IUp0Q5i2F28TJ4UJacaNMh+6zmY41nC87MDrjbKQEXNLsEJQP87FNKjs4ch9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773740007; c=relaxed/simple;
	bh=o7cd+HVeX1tC031s7B2HYg/pTMstxYJyYrz/evoPXBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=envYjA6gS78YAUz+xqcA12tnxZT0haW+5Y1rfZA5uyEracSPYLsCpbridtxfFSEFGNXOrQMKLPRcKB83i6RE5gl1IXkdYa5k2DTlO27CDG/DqJMiOjBXIIzrAffe3QAwB9XRMeD8z4Vi7I639kuQ4ETyKUHc7v0ZLwpenOe1Qms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fO3DLMDX; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fO3DLMDX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773740007; x=1805276007;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=o7cd+HVeX1tC031s7B2HYg/pTMstxYJyYrz/evoPXBw=;
  b=fO3DLMDXLjHoOxzoRPl6b4jVDkQA5g8ZeAX7o6UYOlVG5PzvmjYuIiQQ
   FWS1aoHdpuvhG6eUfddrCDE62QRMzxm4Zb3MHm9L3ha2EA6qYjHajdGxj
   6Iwp5ki2ylhYxoZQ+xDsFySrqh3PZpgz7uhYxrnSv/9+QGtyYwIhHpUz/
   ymd7O8i0xOrnbup0//iJOwHz1cSfGPxX657jSNMN40GCEnyjRk5A7vE5X
   QiZ84/qPuVem/wHNPyzGGuN5JBQ6RJNjE4JJTcfPbzoXjja/EOlPIL1D2
   IJV5v8COcxNoKhCyyS5b2Zqf2lyuW04NuYy1Zy1Fql45K/s+g26oExFh6
   Q==;
X-CSE-ConnectionGUID: xqJ9Z/RzSR+iyyPHIzL6cA==
X-CSE-MsgGUID: VgPs9jJDSE+fWnAkpNuHBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="92151110"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="92151110"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:33:26 -0700
X-CSE-ConnectionGUID: bj4DElf/T/ij6gtnlgq7Tg==
X-CSE-MsgGUID: PmosvjiVRVuW/J83Vecj7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="222267358"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:33:07 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E2C3411F870;
	Tue, 17 Mar 2026 11:33:04 +0200 (EET)
Date: Tue, 17 Mar 2026 11:33:04 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Kalyani patra <kalyanipatra2003@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Simona Toaca <simona.toaca@nxp.com>, d-gole@ti.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: atomisp: fix brace style and trailing
 whitespace in isp_param.c
Message-ID: <abkf0KPSKnKZep5V@kekkonen.localdomain>
References: <20260311151302.105992-1-kalyanipatra2003@gmail.com>
 <a26ba4c7-05d9-4df0-b4ec-1a82d2df075e@nxp.com>
 <CACjYBviU6v_QbpPy0zhfpaBYMoQrO-pBNywzXZb9cHgerCCGBw@mail.gmail.com>
 <abkRdID5NGk2mkOF@kekkonen.localdomain>
 <CACjYBvir9vnXqH4HVXKqMs-pmqTWjs3wA92WH9_KUpwSr3KD8Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACjYBvir9vnXqH4HVXKqMs-pmqTWjs3wA92WH9_KUpwSr3KD8Q@mail.gmail.com>

Hi Kalyani,

On Tue, Mar 17, 2026 at 02:12:20PM +0530, Kalyani patra wrote:
> Hi Sakari,
> Noted. I’ll keep both of that in kind going forward.
> Thanks!

I first applied the patch to a different branch and it seems the issue the
patch addressed was already fixed by another patch in the atomisp branch.

Thanks.

-- 
Kind regards,

Sakari Ailus
