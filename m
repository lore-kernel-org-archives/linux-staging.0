Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F141525F7A5
	for <linux-staging@lists.linux.dev>; Tue,  7 Jul 2026 09:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783414865; cv=none; b=AL95Xyac8Fms96ilG9ms+gJGkn8uJ0mGZjef7DY1r6dC1zCgyo2XjUe3+nuMjt+VlR1FnEkxtCTkzRhmMiUyN8efsPPVR9nkBR3CgDC3jzP4KrSMA2y4jSw7wTTtOLvl5eioSSQHn67uYCdlxKxMlqS5etfzPMQfyjQT/OlKfgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783414865; c=relaxed/simple;
	bh=nPytIJ0z49V43dcUJjqtD4dHBw0wrx9/aoNavFQ4gr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H3SImk1b47B2GKsvOhrWfV2WRkSMjwz2ehkMMwdJq6IReqC6sTupN9trbd70QUdF12RiDkshByDKf5dAnhqlTJOWTxTa79e69gUNVlahruf6cdUIP3pRJYbCFjgL9394KPB9wxuXvVhQzHew2kNI+Hd9gP3/AT+kL2rb0W3kijY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GJ1akSEh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJ1akSEh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783414864; x=1814950864;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nPytIJ0z49V43dcUJjqtD4dHBw0wrx9/aoNavFQ4gr8=;
  b=GJ1akSEhbqvXGW6guIbqA8o+0JOfNA8GmJJlRBzCaisFplg+6QW5A0XU
   XNcnDp9SV8WKidX9OHpU0SqakLYhkeU6Bt4I4QVBYrWGI5Za27/gFuYVh
   4Yrh4RHjUiZmS0C8tFFPRKqnIJlFOwd2iKXxN2Kix/5GzdfiMFHJ1pFCu
   yElVkdQK8ik/OjZy6fAyHybJryGag+zctseko1W2Gz9PgmhnsUursEfSV
   RzRbINiu/unylljni9tmMHlbhjCylfyHOVE6Vrx4IorIGT6O1ddP/dFbH
   dWdW1YPqzHYH6y8fp21PrrU7VlcYLTt5EeXYafqRgVfemoOcmUDuyHATV
   Q==;
X-CSE-ConnectionGUID: 10qDyxmQRBae/zandaep7Q==
X-CSE-MsgGUID: 07MFLu9qT7m4z6yC/o8m7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="83928431"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="83928431"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 02:01:03 -0700
X-CSE-ConnectionGUID: +5x1GlqLR3a134x/sQOHPQ==
X-CSE-MsgGUID: 4c6bOT/sSj+Zza2MBWAR1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="284051600"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.178])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 02:01:01 -0700
Date: Tue, 7 Jul 2026 12:00:58 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Ziad Ali <zalshemy9@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com, andy@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: atomisp: fix typo in atomisp_tables.h
Message-ID: <akzASmY2ztyo4x2k@ashevche-desk.local>
References: <20260707073604.11463-1-zalshemy9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707073604.11463-1-zalshemy9@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jul 07, 2026 at 10:36:04AM +0300, Ziad Ali wrote:

No need to dup, also read reply to your other mail.

-- 
With Best Regards,
Andy Shevchenko


