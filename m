Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A53039903A
	for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 16:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782750530; cv=none; b=FQVjmPIzpqSl0g29jt1mBQy5Mx3FxvjpY5tQq5KwgET3OsOSkk9m8z+ORlfqX2utzc8t+S9XiNKmlNDZNjX017YOUmzu8GjYgaxjbJpTcjxqZ7OH5kaXnKlr3X1e+OCtQpQ2XDMOnN9cKFuU9c08GMWYf0A+o4iDejFrH+rryg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782750530; c=relaxed/simple;
	bh=se7b240/rX82vU7s+UUPnwEkWL41iVnQ0fYlTD5vz9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hYJxFr86XmbNSxekQEzk80oPExYrdYW43MLSud/LJ+rKbdqkTvlGoRdwpo91FSYSTGgJhkNOhCpjeoC0OuY983OzFddlIriCUWk0ihCiEKBgLXZoFHBa3yMN//0HYJH9MrZx36gP+GNzNjH3Qrdant4v3IGLRwSM4uJVmiUoPag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TXE6Db7q; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TXE6Db7q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782750529; x=1814286529;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=se7b240/rX82vU7s+UUPnwEkWL41iVnQ0fYlTD5vz9w=;
  b=TXE6Db7qnIYhFH1ywj+GFMtSvAnY5QEvooLPP91xRmgNsa1Z9AuUbGm4
   gJAtexGmx/WvQldlevjCytNUK4zFtDQo9YknKdVu2haColz2vU8WtMnFd
   Pe1zaWFuAyImBNz/oQ26shujRwb9AuJRvilM3PbOabGdVsy8LDY7Xwl4M
   y14pJexh6TVS38Mk84otAjarYuGSFIXegGgF839DASqyV8UyyTZe7ZolP
   fyo6wGgvYHz2yjZRzUMnPiXPirgMysDuXQW09b1qyXX+q9Vw11b5FKv+j
   snzusdCPB7Z0HQ5iYhyzzrNI4ne/SwRolzZs/qO/rLp4UJrKeLJ3grG/p
   Q==;
X-CSE-ConnectionGUID: fm6C9SUgTr2ExSc5bBTMDA==
X-CSE-MsgGUID: aPsCXvgnTP6Lad4AUDJ/SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="94037643"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="94037643"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 09:28:49 -0700
X-CSE-ConnectionGUID: et20Ry6tR06RWRS2D84Llw==
X-CSE-MsgGUID: JXmhXpULQlStyhZjW0hpiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="276274022"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 09:28:46 -0700
Date: Mon, 29 Jun 2026 19:28:44 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Doruk Tan Ozturk <doruk@0sec.ai>
Cc: hansg@kernel.org, andy@kernel.org, mchehab@kernel.org,
	gregkh@linuxfoundation.org, error27@gmail.com,
	sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] media: atomisp: validate user-supplied buffer
 sizes in two ioctl paths
Message-ID: <akKdPGsvsMRqE1Hy@ashevche-desk.local>
References: <20260627100119.97650-1-doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627100119.97650-1-doruk@0sec.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Jun 27, 2026 at 12:01:17PM +0200, Doruk Tan Ozturk wrote:
> Two ioctl paths in the Intel AtomISP staging driver share the same
> defect class: one user-controlled field sizes the destination buffer
> while a separate user-controlled field sizes the copy/store, with no
> cross-validation between them, so the store can overflow the allocation
> with attacker-controlled length (and contents).
> 
> Patch 1 (framebuffer-to-CSS, FPN / S_ISP_FPN_TABLE path) bounds
> arg->fmt.sizeimage to the frame allocated from width/height/format.
> 
> Patch 2 (S_DIS_VECTOR DVS 6-axis config) bounds the user-supplied
> width/height dimensions to the stream-grid-sized destination config in
> both the ISP2401 and ISP2400 branches.

> Reachability caveat: both paths are private ioctls, and private ioctls
> are currently disabled by 2b7eb2c5dc72 ("staging: media: atomisp:
> Disallow all private IOCTLs") -- atomisp_vidioc_default() returns
> -EINVAL for any non-zero cmd before the dispatch switch -- so neither is
> reachable from userspace today. These are hardening of the
> disabled-but-revivable private-ioctl paths rather than a live overflow.

This makes these patches low priority. Why do we need to spend time on them
at all? Nobody knows right now how the revival of the mentioned private IOCTLs
will look like. I'm pretty sure it will be some generic ones that this code
should morph to. Since it looks like your tool is useful, can you check the
rest and reachable parts of the driver first?

> Both were found by 0sec's autonomous vulnerability analysis
> (https://0sec.ai) via static analysis; neither is runtime-reproduced
> (Intel Baytrail/Cherrytrail ISP hardware required).

-- 
With Best Regards,
Andy Shevchenko


