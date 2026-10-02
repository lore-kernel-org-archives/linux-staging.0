Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DCD1BD00C
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 18:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790967145; cv=none; b=a4Ykbj/VtUt8dsaL7BQotPLS9rHO16jOm+fjF7srly3+LibicYqseenwkoBmsN0jiCiwDV8K4v3gFz8CravBwpnPRoDcnPwV3sGOf6mC3DhvSJHHrfGm5ZhItooPxroW5gloOh10WYsbCJmFFPaT3cJwUVa/LUj5rboeQzJULms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790967145; c=relaxed/simple;
	bh=acZn+DQwzgqtDPZktYzvVkV1BU/0NMyBtMEghpn7H/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mCmG5+YnIGN4isJzE7PbCN9dV2+pmD0y/s3C7jVmbYj/kcWsjAB9z6Xj424bnXdX/so0TGF6LzJndpBYJk11u2G2zzMrEglG3K/vVIxSW5Tg3OwKtHC8CFLndgY66NChDlphOYtbiUlCPqSJ8gIWcVupDyWAc+1UzfJ0HP8FKsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KN2FJHDY; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KN2FJHDY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790967143; x=1822503143;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=acZn+DQwzgqtDPZktYzvVkV1BU/0NMyBtMEghpn7H/o=;
  b=KN2FJHDYTjcHTAj+XUusKTThgQQoqNbom58gEAcVAkRgfH1SpAjvVY6H
   5RA42lyO8SWq+TKqs6z4FY+xP31hNwZG0cOHRGsPKLq9gr65gNZH5T2ri
   yN/2Jc4GINhwOnDyiqJS217mcBjHcdPL3AkxzI6AawxCtGz9jV/g/Tyd/
   5K8HuXqdzKVB1jasrxo6iJ7cO+JAHKOBGqI3JAa7oG0aQkEwBiyDqUdqh
   S3W+9M5BgXlWCwF4vL08dCa09p+JTWNquAxway2peGeGDLwOk2K1H5V3c
   2Mf+ctmq6hTJhbN2lNiHVR7o6IwbXuM6X2y1FP49JZlnOGpSiGn5bDaGm
   g==;
X-CSE-ConnectionGUID: APYFJAyATs6s2i8QWH/gYQ==
X-CSE-MsgGUID: IMxnFH2RQva8+QBWlC2/ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="90796828"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="90796828"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 11:52:23 -0700
X-CSE-ConnectionGUID: i+pvZfXuQjmOzwIpjBRQqw==
X-CSE-MsgGUID: o/UNA2bRR5G0Dm95Wq1/6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="391566"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.45])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 11:52:19 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 696F6121BB9;
	Fri, 02 Oct 2026 21:52:16 +0300 (EEST)
Date: Fri, 2 Oct 2026 21:52:16 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-pci@vger.kernel.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/1] media: Consolidate AtomISP v2 PCI IDs in the
 pci_ids.h
Message-ID: <ar_9YLJj5_PbzGEO@kekkonen.localdomain>
References: <20261002094813.856439-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002094813.856439-1-andriy.shevchenko@linux.intel.com>

On Fri, Oct 02, 2026 at 11:43:43AM +0200, Andy Shevchenko wrote:
> We have a few drivers using same pair of the PCI IDs across the kernel and
> there seems more to go, consolidate AtomISP v2 PCI IDs in pci_ids.h database.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
