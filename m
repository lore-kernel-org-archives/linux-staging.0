Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B5F4F93A4
	for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 21:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791840334; cv=none; b=d0nsbKm5LnJL1CYrSilEbfdY3kcOKotM6CQUfryzJHVwCpg0ycNhSsU+4M6rqmBp7wABMGO1Hhe23uEUw+UCymixWeLm+E5s+GbfHNUJHYL595SdY1de03TPUU7I4RKuaD/pAeKr2ovpBAkYr/wK5/IaBmRlgVueeoGgWC8wWmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791840334; c=relaxed/simple;
	bh=Z2tjRVdTDNm+ozMbUPHCMIHfkHjpaqjDZKGIgktI2Q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BKyKgN6tD+TTA8SA0aerL3qPLyyOvPvRsLVux4drkHh09FBcTxGQm4lTWHJik+aTkEQU9KiXZxkq+B+zSHNrhT1j47gou73bdFiu1SQwfGrtMgu68PyEDcpHHALabx6NfblZ1d1bXqho2kjsnmWtNt+r1MSEwwuFczhdEigXMSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c9DTudKH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c9DTudKH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791840332; x=1823376332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z2tjRVdTDNm+ozMbUPHCMIHfkHjpaqjDZKGIgktI2Q0=;
  b=c9DTudKHWX3K4R5JaQJ88nNjijO1OopSVdzHT9KrLgtf6uRolGukL6PZ
   KnAT3rIacyUFao+pOQpPQVaYXGmDS2Xwh2Bv077FQCCSbRySxzKY4xh+d
   Uy3H4RuUSnb3jZU+Usi9JHFeh7SXt+c6+cy9L7J8+oT6P8wxjh8tC/Car
   /7ockqDw+KhydCCbirCqd/Yy1UE1YoRNwHqNYIYQe4BvbR5WbKSyx02EH
   v8yJtVlAAv6aEXNGFL5jD/pnRyw61vRFVFR0o9YTFEKqPpkbAJlUXEfef
   IP6BJX3TcWTzswLWroqCERF9L7Et825iYDOg6NU4WUjT/csAmfqlJPSdB
   g==;
X-CSE-ConnectionGUID: oH9GdLvGTmC76/s3p99QMw==
X-CSE-MsgGUID: t6PJzYo7QgS3hFTex78bPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="458086"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="458086"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 14:25:32 -0700
X-CSE-ConnectionGUID: YNqlACGkTziuWFJBduGK6Q==
X-CSE-MsgGUID: 1Oy9C0oOTqa7laHtZt7zEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="894657"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.35])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 14:25:29 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 171E8121BA6;
	Tue, 13 Oct 2026 00:25:32 +0300 (EEST)
Date: Tue, 13 Oct 2026 00:25:32 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jake Steinman <j@metarealtyinc.ca>
Cc: Ramshouriesh R <rshouriesh@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: staging/ipu7: Add 10-bit greyscale capture
 formats
Message-ID: <as1QTFB1CRDNxAEY@kekkonen.localdomain>
References: <20260801-hm1092-driver-v6-0-5979f223748a@gmail.com>
 <cover.1791608336.git.j@metarealtyinc.ca>
 <5423f57000600f27626ff785f80f94d3e7ad1106.1791608336.git.j@metarealtyinc.ca>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5423f57000600f27626ff785f80f94d3e7ad1106.1791608336.git.j@metarealtyinc.ca>

Hi Jake,

On Sat, Oct 10, 2026 at 12:59:22AM -0400, Jake Steinman wrote:
> The CSI-2 receiver sub-device accepts MEDIA_BUS_FMT_Y10_1X10, but the
> capture nodes have no pixel format that maps to it. Link validation
> between the receiver and the capture node therefore always fails for a
> monochrome sensor and nothing can be captured from it.
> 
> Add V4L2_PIX_FMT_Y10 and V4L2_PIX_FMT_Y10P. They use the same firmware
> frame formats as the unpacked and packed 10-bit Bayer formats, as the
> ipu6 driver already does.
> 
> Tested on Panther Lake with a Himax HM1092: both formats capture
> 648x368 frames, with 1344 and 832 bytes per line.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
> ---
>  drivers/staging/media/ipu7/ipu7-isys-video.c | 4 ++++

We're about to remove the ipu7 staging driver, therefore I'm not taking
non-fix patches to it. Can you se the ipu6 driver instead?

-- 
Regards,

Sakari Ailus
