Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4428742314F
	for <linux-staging@lists.linux.dev>; Sat, 28 Feb 2026 10:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772275311; cv=none; b=VNy7ZqBAQkwgasbJ1I3wRuZOKaV1m0aMaFxs3qW3y+ZoefoW2FNOsKGT2h5DWPddRhtu3XtobrUgfa6r+quD8eIx7/8O4EwjWR8p2b/Q2a5OF2Te408f313bCzr4fhNNLy9xB576spWiVvxDj8HX8JVwzXuRbRN06omWA9GX5TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772275311; c=relaxed/simple;
	bh=7x1dtgzDYigphYDSDXzzvlk8qdlCaYVUipaXjIDK/F0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lgan33/WxtoBaJCKCVVZbCPj7Tsjd6P3cqHW758MidAyqwPy5Ge6wfvujTTFwHIs+NLlQ6VewbUGuGNX5P9xsw616vsUZwLf/+fx0Tvly1eHMuueJbasuIpjRvz+A4pt7xF63sHA92F4KiY9V6EmVzL+EYgJ7NvWe3HcIy62oUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NJcqYXAd; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NJcqYXAd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772275310; x=1803811310;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7x1dtgzDYigphYDSDXzzvlk8qdlCaYVUipaXjIDK/F0=;
  b=NJcqYXAdVEB/nJxdLnxzf1bJlBaoCnHNvK14rZZNId8QQTKpLLJoBu91
   xD+k9noUJ91JeJxoqpeMgjFHKlQw+rFv5hWBTPPqX4srjJEYwWnIzTUSc
   0CAJfWNpP/gKFgDKAjBHiq7ZO61ciG0PqGTfxHajM2Al7C/+/olgVlj5q
   dlX6ocVuHvKhSCEziilB/vWoaqA0ft+0Aguayc3hEek1RCqjlsoLkKkGQ
   lhOvHe41RaeOQPI9iYw6hvRsHJAwvO8R+2fuaKDei8L8e/YBcuux2OoTh
   TZXqVzTLMdRscZYWPRgQRQfQhh1zdPNb4oySHMh+fEHi0HSJeB8mYz17W
   w==;
X-CSE-ConnectionGUID: pMzxYTDbQ0uy4qOttcTc9w==
X-CSE-MsgGUID: ngcwlXJGSPKQUj255VNVLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="90925974"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="90925974"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 02:41:49 -0800
X-CSE-ConnectionGUID: nw0TgUtFQTqZn1i30TpKbg==
X-CSE-MsgGUID: tBaSgUazQyGh8yfkJEq2dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="216382460"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.224])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 02:41:48 -0800
Date: Sat, 28 Feb 2026 12:41:44 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bera =?iso-8859-1?B?Wfx6bPw=?= <b9788213@gmail.com>
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com, Yeking@red54.com,
	hansg@kernel.org, ethantidmore06@gmail.com, weibu@redadmin.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: change custom comparing function to
 memcmp()
Message-ID: <aaLGaLTiglwOh5-j@ashevche-desk.local>
References: <20260227200637.47130-1-b9788213@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260227200637.47130-1-b9788213@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Feb 27, 2026 at 11:06:37PM +0300, Bera Yüzlü wrote:
> eqNByte() function is a redundant reimplementation of memcmp().
> Remove eqNByte() and switch its usages to memcmp().
> No functional change.

Can be something better like using match_string(), but that will require more
study of the code and can be done later on.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


