Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41C035AC33
	for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 07:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786521386; cv=none; b=mzXKhA4DfY9BZkM+VZ2wIKr8IubmSPJf1I8dTvx3CUD2dMoL3A1O+xZZb211KkW+8Mriii7CoLsB13mZhmNHWH00M2Lc8yYkgN6Y5ogSzFPJQM7r6axIMAIaNS+J6HW+OGtBDbohLyhV2Ja2h2333YJhk6t2YvQPsGvpEcF0iko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786521386; c=relaxed/simple;
	bh=KEaI6BRIDGJdLKFm77uOFfv/MOXuwwRaLwt4jlrfuww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bcm4aQ4QVjCYFJ/DWFEg3yE7MHMm7ChOrVmyd75SWeNQvMgzZVjFOzdw/KOAEhPw1GEHedjMQ964/fnkhKm1oFH8kf4DuPsUV5lBtfs4oM4tFYMBx2anJc+fgyn1Z3xYyxZKDEi4nCIZxa/wu/dIc4X0vT+Zx4vL6VQBb8wLgY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jXkqsXdT; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jXkqsXdT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786521384; x=1818057384;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KEaI6BRIDGJdLKFm77uOFfv/MOXuwwRaLwt4jlrfuww=;
  b=jXkqsXdTzUbuJ3My5w9gj39OvlzsDdIx8BpeZwLoXz29OcJYiz5o6k/g
   oJLcfU43cY2wknBBgQnygFsj8dWRuhsOWKrIoPYi7qiUX9sNGRT64R5jD
   tY0uo7+csflUvNr1SdrqXERHEGVPjjDp285eIL9egTDFtRQ6QTX9/Runf
   k94rM+Bft/Hag27ptkjHE0J0o7Q9LQVxz4Rj1AxDOuXki+Nefz/J0RJT2
   sOu+BMc2wQEab9hT/l1j8gZZoGY9QNOoNZVMgCq29woDoV1qiDrg9a9xV
   sq9nsfXW6TXrqxGKjRT6x9mQ/JJKHLejA810U2FrSdmyYyWpCdI/Ao/Sj
   A==;
X-CSE-ConnectionGUID: 1X3I4X0xSK6BI1jOpBz6sg==
X-CSE-MsgGUID: 1EuHThzMQjiOcdlgydeaPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="98578875"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="98578875"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 00:56:24 -0700
X-CSE-ConnectionGUID: cPcoFgA2T7ybDPkG7+ORHQ==
X-CSE-MsgGUID: FoRojBwESMq8HD4pIUB/0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="264160223"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.92])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 00:56:22 -0700
Date: Wed, 12 Aug 2026 10:56:14 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nikolay Kulikov <nikolayof23@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] staging: media: atomisp: remove
 include/hmm/hmm_common.h file
Message-ID: <anwnHooR7vBvrNIc@ashevche-desk.local>
References: <20260723185217.317981-1-nikolayof23@gmail.com>
 <20260723185217.317981-5-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723185217.317981-5-nikolayof23@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 23, 2026 at 09:51:21PM +0300, Nikolay Kulikov wrote:
> Replace the last used macro with a conditional expression and remove
> this header file, as it no longer contains any code that is being used.

Split this to two patches: replace (in the similar way how previous patches
are done) & remove leftovers (file and no more needed includes).

The code wise LGTM, I will give a tag to these patches when they appear in v3
of the series.

...

> +	ret = hmm_bo_device_inited(bdev);
> +	if (!ret) {

In such a case it's better to have

	if (!hmm_bo_device_inited(bdev)) {

> +		dev_err(atomisp_dev, "hmm_bo_device not inited yet.\n");
> +		return NULL;
> +	}

-- 
With Best Regards,
Andy Shevchenko


