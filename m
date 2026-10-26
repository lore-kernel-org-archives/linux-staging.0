Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793011683;
	b=Spk89AbCnOnrDCKrOtegfs8WnB2D2fgqxbw9bIE3/ixMbGoPW/91/cTJ8MGzsyfXdUtb
	 XWaCtGuy29Xgc8FRG0ft/I16uWfrKL8vG3N4vSTlGS1nuQYR9+NtQwi954wBONEP4qu8b
	 9EMChnaRkn/eQBR82pLSUjlAlmPyXKIT0zGudLNWvVeDdGCwgUy3Unqovcpp7XV1TrcUl
	 2bLiidbouJSP3cToCIzp84YuuzgHDhQRFMKgnnN0YzW1ciAnZQaEC2L6jfif/LO8JCTXu
	 1G3CnDhHHSTixYsTS3p1h8U7QG3xY2YMJbwHDJ6yK/M/v/IaVadIZuNNVY9nTthZc0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793011683;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=sB84iaBihThD3vkR0cJzbiSk7HWt7uW2J8rzQhkPKpY=;
	b=nnfmG0RQiGwUc65z+c2a666jdLIqJ7F4Pc2aSvPoBAP50m7bTmCEVyhCgmnpElo0c3pL
	 7NpOPTZOduRUPbZHLeLUf/rGxIPUSYvpwFIs9n+H4AWszCHaU56JNzqWh+UcVVhq/Hah2
	 yOUc9bj1660ON40grEFrmep40YNhbuoSqYBOVg973YBVkOkt5co/BTo27UWft2hkWbgi4
	 rlgGuGXusTSXuFqNLcb0djPh0PA5B9a9QNsMJxyE8qXJt2CHmHKwRlHzT8NwoLxtJZnav
	 EYQuEjqRhfD2WV6pIj3meMmUbJkFIvWo1oIJa75Xz5TBygFua1MDhKrGjRqhesTG/+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TRNsowGJ;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8546A606A31A
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 10:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8546A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TRNsowGJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793011681; x=1824547681;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9OD6Fc3Ri4/TWa2rRS9xHRLtGqIf8adQMmCjobWsN9c=;
  b=TRNsowGJLHh/t34fhkWdYffiQKrE8xYChRWTqjw1Ub3QpcuknfVag5Tq
   30mubGL4unTAAQOX3o8tEXDGXUGBTlJ/plfE1zzNKc9pZB5BkT573LXFL
   8qgiO5rtazibi9yQIQohzxVOM2K/S1D/aXQuPK9toNV/GJBLrQ/DR9gQT
   hsD1+CqjkFVGqnLTPSZD9+qYhM6wPo3TolNp59zT/Jk/yS9xnG75K37Jr
   m8JG2pbXaqSKsfvvGF3Xk6PmiZAmkuAWroaK/FNO/ddlG1h6eCyfZfDdZ
   SWeMGmjvBmLKaFN60YhZEQP8adw07GnfKIs07GKw2wKLTQTM5xqUeiKxt
   Q==;
X-CSE-ConnectionGUID: UuhLVWLZShyK2GoPDPSLqw==
X-CSE-MsgGUID: Dh/cOSD/QiCYGe3rgYrXfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1679201"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1679201"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 03:48:01 -0700
X-CSE-ConnectionGUID: vLuXQWh/RL6fYdilE8RQsw==
X-CSE-MsgGUID: yV79jj5PQye8KK3QcSefAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4268706"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 03:47:59 -0700
Date: Mon, 26 Oct 2026 12:47:56 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: himanshu bakshi <himanshu.bakshi478@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, dennylin0707@gmail.com,
	cenzhang@linux.microsoft.com, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, error27@gmail.com
Subject: Re: [PATCH v3] staging: fbtft: remove unused fbtft_init_dbg()
Message-ID: <at8v3P1bbai9lQPY@ashevche-desk.local>
References: <20261026101815.73722-1-himanshu.bakshi478@gmail.com>
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
In-Reply-To: <20261026101815.73722-1-himanshu.bakshi478@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 26, 2026 at 03:48:15PM +0530, himanshu bakshi wrote:
> 
> The fbtft_init_dbg() macro is not being used, so delete it.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

Next time wait at least 24h before resend.

-- 
With Best Regards,
Andy Shevchenko


