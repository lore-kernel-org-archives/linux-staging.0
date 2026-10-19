Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2664F4A688E
	for <linux-staging@lists.linux.dev>; Mon, 19 Oct 2026 09:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401658; cv=none; b=XduB0bhhLVL/XTewpKpCATGD6gU1LdQjqKpfTk1VR0vHYwGyH478BMr3N3eFbCaOLqHFE/QYu+baFNQP5XjSfSg64H9s4T+pLjfO1AVN9fe9Wv+B42vtNw/lMABsFnzRyYI35AjOhCqR4oi4zfxAPK1ZIbJU8CMG9EsI7TSwtoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401658; c=relaxed/simple;
	bh=DcmCQr+wPZOsTvW7Bqt3y8moIQ64eG6w0LecBO0EAFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ueNgkHTPpb91OEkwM1rPczREdjzZG8J+c6Wk4bY23xHGWJPIXzjl6R25fMZp9gYkZ2cz0WMZ16Wh90m3O+DQuD73307YPkCVwrI9ftCKMM/5saBuMDoaaOwDQbNleBVFrVVx9jn62MO2wE7ZRfyyRDrgxtV4Oh9wGA2Qp0m2kXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RgRXW9iE; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RgRXW9iE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792401656; x=1823937656;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DcmCQr+wPZOsTvW7Bqt3y8moIQ64eG6w0LecBO0EAFA=;
  b=RgRXW9iEFYRwCgCMWgSq3vSQR+ZE1d6Qc4WpF8a/aByY/Ie3K7hL4bxc
   Evr5pb+fBiaBFB51cwD227+t5WytYbxhrPJfBG8Wu929iIqvow+Crc/B3
   gqOig1Z5mZTMnQi65S0hIWTjrdCCd6UGmNbfOSR8nT7oi6Ojia+jB27fm
   Fpeg+hIVt8tTRtA3PC/rK7BMOEt3i5KjEuHl93UcxQMiwJPE2rr2JrohQ
   uv7QEZYzFWy+PgJ1hZ+jakTUaF7iHraouSxQlNOi8W2upBEpzBlkWJwYG
   pyxKX74PDBMuzpV76sLe3d0OQdYiStqxybC1TE5S9aOn2T7RcKK7Mugpe
   w==;
X-CSE-ConnectionGUID: XC/PytxHRWK+qPeRsKrQ4w==
X-CSE-MsgGUID: zgZk/1aMQPqZiahpdbZFfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1089950"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1089950"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 02:20:56 -0700
X-CSE-ConnectionGUID: OEcLK07XT8CtbkY6p1I1lA==
X-CSE-MsgGUID: kKuZ3vV3S+Cvly4mnFZsaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2909163"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 02:20:53 -0700
Date: Mon, 19 Oct 2026 12:20:51 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: wrmfwv@163.com
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	gtl-m <admin@micronull.cn>
Subject: Re: [PATCH] staging: fbtft: fix syntax errors in macros
Message-ID: <atXg85m8ukjFuok_@ashevche-desk.local>
References: <20261018085345.17619-1-wrmfwv@163.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018085345.17619-1-wrmfwv@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Oct 18, 2026 at 04:53:45PM +0800, wrmfwv@163.com wrote:

> checkpatch.pl reported errors regarding unnecessary commas and spaces
> before closing parentheses in the fbtft_write_reg macro definitions.
> Remove them to strictly comply with the kernel coding style guidelines.

NAK.
It's your homework to understand why.

-- 
With Best Regards,
Andy Shevchenko


