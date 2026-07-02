Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB66E478E51
	for <linux-staging@lists.linux.dev>; Thu,  2 Jul 2026 09:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782983548; cv=none; b=cHEcyAjncKs1u6PnC1Pnrp+w3L+CJJmSOxBRGrMNDEeSq5XgkM2tVCqDsafFcI/+Vs9pC3D7Vkww6dpOR0lj13hZLzfqvZEs6V2Lizp+o154B/SUc+Qd96dA7zCz94j+ytRoU/mkz0Cm/yCKbdSp7VP8OfcHs9l07H4WYmopBFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782983548; c=relaxed/simple;
	bh=Re1pebt/H4sHm958IImha/A4UIlkgi79BYxbPtjPdEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZ0mvi7xXloZjWpsqitmmu3PHG4HH+0XUctPaIjPba0ixrMX/5jwNX4D77zNL4ISPLfp654immwoPHLg/THmNyD8n5hQGWjns7Dnc41jHOkxGc6bW7Z+G0oaN73ShjqX+PkAjgC6LX+aPTQU4ZdSSk7mCaiT8RUSglkxzw5OARk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SL/0VEPc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SL/0VEPc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782983547; x=1814519547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Re1pebt/H4sHm958IImha/A4UIlkgi79BYxbPtjPdEc=;
  b=SL/0VEPcH3q81CKLtK0HR0SCc7ZenXQrH41To7g8ILhqeJ/Jt5ZEpuNA
   vGAXTG485zxBp0LBacmPi+/lCdL8sfFwyB76Hoaa8pMecPPabCUini9Q3
   BTzkyFPeAhrTAS+Z80nvCv8lKE1NRY0avLV85obmUnjH7WkVyS3kuMWbW
   BqsxPsRJPF1FAkR+zuN87oZz/4EkW11ua6IVg6NQv02WyGqY5gXzwZHy+
   ywZlyZ6XrGWBDoLBa31lmJLjXXxeyMSFc49v3mmORpYZ07KvLyzsViXW3
   mRVi9jR/mVgeIErdTZwhUM1G2YFwsue+WDqOwxEVFa2cZt1N4Nl0rTO6N
   g==;
X-CSE-ConnectionGUID: 7t6omA2oT7KBpRZGKldmxQ==
X-CSE-MsgGUID: Xbrlx6j5QoWDMIfL9jnBrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="86274243"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="86274243"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 02:12:27 -0700
X-CSE-ConnectionGUID: Gxe05u50QzWOZB9vpoljGg==
X-CSE-MsgGUID: X9J6+rLwQnaHPP924CYuVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="246455572"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.213])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 02:12:25 -0700
Date: Thu, 2 Jul 2026 12:12:23 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Cc: error27@gmail.com, gregkh@linuxfoundation.org, hansg@kernel.org,
	mchehab@kernel.org, andy@kernel.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] media: atomisp: fix block comment formatting style
Message-ID: <akYrdxIXmGbCxEV3@ashevche-desk.local>
References: <20260701161451.5442-1-bohdandmarcus@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701161451.5442-1-bohdandmarcus@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 01, 2026 at 07:14:51PM +0300, Bohdan D. Marcus wrote:
> Fix a block comment formatting warning reported by
> checkpatch.pl in atomisp_cmd.c to conform to the
> Linux kernel coding style.

This is too condensed commit message, use up to ~72 characters per line.
Also try to find more issues of the kind and fix them altogether.

-- 
With Best Regards,
Andy Shevchenko


