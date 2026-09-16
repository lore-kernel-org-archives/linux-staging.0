Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC0A4E80DA
	for <linux-staging@lists.linux.dev>; Wed, 16 Sep 2026 11:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789556635; cv=none; b=GXD0r3p6aLo37QM7Z5CwoMx6tIEdOS/kY3fXR2O8ifywRWvPkjI5CmcGvSMpAjrf70QE5xPQwg37gCL1ezJ+8EjxKhmIiXUUZZ9AJTPQ/9MpniNDMiLfVIVz4g2pjccZE9XTxhM5bnZw/Cb5AlWk35EKcm5XWZ19A15y4uAJ9Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789556635; c=relaxed/simple;
	bh=IWnV54RNLS5F9xKNa2KWOePuLIifnOT2PSpdpWwTw/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=njkZ5lLQEOzk4joknSxATha7cFZH1RK0GL8vUo+qK3EMLHFXgyuQ7LwN9O46EtiYu1/ytAgAuFsWz+DihOG8k1xobl8Q6L2iai0Zk4BbsKg9ztRxJnkiqMiizJ8eC7doqudDC6a+X3VVkbaP574UGbQszbfDcWY/4dOem2p7JxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gAm+JsGF; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gAm+JsGF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789556626; x=1821092626;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IWnV54RNLS5F9xKNa2KWOePuLIifnOT2PSpdpWwTw/M=;
  b=gAm+JsGF63mG/2cpP+J6XDC1XqiYRVf9BGJ5bELWDdzKVbChsYIKCXlt
   21JKOEnjRcdxjMo5SjmNsJ2aIEQZdB3T5Culk18uxtAw3S3amhpHap97y
   u/aL/hvJJ1K4XOALwUtcEuaEdcPdXsG0a+OwTBYYIJu2NSGP3KvTF2gcT
   1YLWoiL44eXFPQCmJRKmjXJAUbkr9onJoYAvLXR0VdW3OPIpKQ+wf7iuA
   727Crkps0km5HZoTM7ZOsyKvNLnGTFp0n7z8Dt0YsjMDhGhXKphlSasoI
   /R9L3vB6o5vrrqpwEDc7CGQoUpVq2vCsxdBaiiZCjEJqHAywxEquiMeTz
   w==;
X-CSE-ConnectionGUID: oB+C6yqXQ/yjXCh6UJtx3w==
X-CSE-MsgGUID: oGxwhEaCRdSuxjaHHnFcwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="438859"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="438859"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 04:03:43 -0700
X-CSE-ConnectionGUID: sp8bFXe2Qju9twLMm3wY3g==
X-CSE-MsgGUID: OMGnJVYkR/ijCWfmFIVi5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1531519"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 04:03:41 -0700
Date: Wed, 16 Sep 2026 14:03:38 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Omer PALA <palaomer100@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fb_upd161704: replace udelay with
 usleep_range
Message-ID: <aqp3ihtGN5-J9TPa@ashevche-desk.local>
References: <20260916093928.52057-1-palaomer100@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916093928.52057-1-palaomer100@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 16, 2026 at 12:39:28PM +0300, Omer PALA wrote:
> Replace udelay() calls with usleep_range()
> to avoid busy-waiting and allow the
> scheduler to sleep during delays.

First of all, too condensed commit message. We have as twice room on each line.
Second, do you understand the difference on what code is doing before and after
your change?

...

Please, instead of posting patches, read first, check email archives, understand
the code...

-- 
With Best Regards,
Andy Shevchenko


