Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A2B1C3BFC
	for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 07:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771486236; cv=none; b=LImgt8u+JYmcuACkRfuNWEbah1fg80d/nGzkp6nQ/Q70rISy4Xc8H3WACuZE8XBLLolvxHBSj8FLmiw8I8+5zn96u/iKNbSNbXS+jP3IC9uiijdASottz0Vg7jSnx2jdpn4+6VkeP42wODrK0keNTYYvWtx5CiPLCdPFRxtDMF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771486236; c=relaxed/simple;
	bh=4UopJju+T6ayiowUx6+QzRQDCN3JznC4ONcFrg90nu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IJUiJg2Xuv/yqeigkR+YFlG/J4WVkooD62qlXKLwJu0eTeG7nfXiqIz0Bv+QiPDJ96Z/PmtLPWm35ZZcWgMtzj8Oy85KRmBgST2nVA385qsOWrKv9QwFS+gBGOj3gtRgegbEWyilJF0e7WrseWOQDR73zhA1ezBl6JRsTtV0InI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EAqn3s3B; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EAqn3s3B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771486234; x=1803022234;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4UopJju+T6ayiowUx6+QzRQDCN3JznC4ONcFrg90nu4=;
  b=EAqn3s3BwgTCBtQeqWDK9DD0HWxA+mUkPpPXIb7hf0RaMeZOqB4LnoxU
   qR68I2rgs9S1CwOBL1RhagNSo8sp9d6x82vUizrQs4xWcu7sOfrXyRdqG
   8gkXqEv84roHuAThxJgnLwwlkLL+w0WtFKSKxb2CMN6jVFHbDLy8bzIIo
   xLj+1CzzqgA7rPRJqYo4fKKT2iVd9aFJR1/nzX04vqXu3wS0ULN/9TRwZ
   EVyQXUa0TJrPyGr4Et6nHsFrXb06bfS8JhpgtHkTI7Ak/0p26Nezp7iYO
   luThm1AqHZBekQKlAC7qhB9pqoONP+olE96R2trHViS8wa4o7kLKUTvES
   Q==;
X-CSE-ConnectionGUID: I513U3MQQeeUjJ+zT3rd4w==
X-CSE-MsgGUID: pl3vFUDgTtCIMc5HDXsZTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72609612"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="72609612"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 23:30:34 -0800
X-CSE-ConnectionGUID: 2NbE2wBjTO64E6OY6HR2YA==
X-CSE-MsgGUID: AADvZWsPSfKNq1wsLDX/Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="212416665"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.114])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 23:30:32 -0800
Date: Thu, 19 Feb 2026 09:30:30 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: tomasz.unger@yahoo.pl
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fb_tinylcd: replace udelay with
 usleep_range
Message-ID: <aZa8Ft1W5Skrb5Pt@smile.fi.intel.com>
References: <20260218175517.87544-1-tomasz.unger.ref@yahoo.pl>
 <20260218175517.87544-1-tomasz.unger@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218175517.87544-1-tomasz.unger@yahoo.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Feb 18, 2026 at 06:55:17PM +0100, tomasz.unger@yahoo.pl wrote:
> From: Tomasz Unger <tomasz.unger@yahoo.pl>

NAK.


-- 
With Best Regards,
Andy Shevchenko


