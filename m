Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E52923BD05
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 10:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778407472; cv=none; b=ri1CmfsgdRo1R7LCdR6ciNxekIRUl8odTGXVhXVjW5CvRH4w6tSKOjHvtlP7EazdMP9HTjoayhuOvxWHOoZt+eOuWy9yR3JWHBTgeI1rdrq6RxYx4diGWaS9FTytvTklqSINJyhc7sOqt7149OVsnHKlfw07p7ctjGapin5610o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778407472; c=relaxed/simple;
	bh=PtNmBnkRtZniZ/Dwsrra0lsvuZm8ScicYV0EG0nj+rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtyrMGz/LaIVAGGeJE4EL7POpI/EMVWuBQuEWtbn8ppdehjEIl+LvqwqOCdRV+8fiVJ1oj1XT1zjwfROk1aT2NQgIzFZr2cwXI3vd+HJs4UDDLGEzELNEB4WPWYJ26uKH36TSUHfSWxHfnxTRioAcn+3ch1Av5wB8s1+5zKNqII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IWEM48UU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IWEM48UU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778407471; x=1809943471;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PtNmBnkRtZniZ/Dwsrra0lsvuZm8ScicYV0EG0nj+rc=;
  b=IWEM48UUV9YOt0lowUwsvEksD2MMYGve/MziLsuPSIj/TqZ3yAECQlz4
   GgT5bIChml+ojWqRrg1Zh8992KH4Za7Gd0m71p/MdQ/1Qqv9URQhNLNQC
   7j8fNLbrF+SYM5cOvKlx1rb3FHY/1H8rqhziCV6TrjFiUVHwxrWnD4R5k
   Pm0MJVByEn5tJCcXtmH0ZoGXgNBySiXvw7SFS2hTOWla6z1yIFp9Hes0z
   Un6Ibu+EzFl6lGFGsurAsOBmTZHGYctL86FfuwRbQsy0t8AAvHVQkkbwe
   BKyVIQSyUDzL4fZ9tYfq51KbqT5LpX8EDebTNmTfFYqfH2rqIKFEuOCCc
   Q==;
X-CSE-ConnectionGUID: MldN6TLPTSayh5d99p+PNg==
X-CSE-MsgGUID: 9DDonP+ORiaUJ6rl+6euyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="90425287"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="90425287"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 03:04:30 -0700
X-CSE-ConnectionGUID: SSJGZYLeRqOyJ3vOT7Wcaw==
X-CSE-MsgGUID: ZBzH31wASo23TkHxnvyfdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="232717499"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.244.171])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 03:04:27 -0700
Date: Sun, 10 May 2026 13:04:23 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Denny Lin <dennylin0707@gmail.com>
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
	gregkh@linuxfoundation.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: iio: addac: adt7316: document SPI interface
 switching sequence
Message-ID: <agBYJ2BCEBoCcUsv@ashevche-desk.local>
References: <20260510081041.85880-1-dennylin0707@gmail.com>
 <agBH9QqHW-cJN0iQ@ashevche-desk.local>
 <CAGEkeHf_wueMkwqQmQ0m2drXQ_m9UsvcFwqu5RVvg0WsjAJW1w@mail.gmail.com>
 <agBPR9xke1MTzL0B@ashevche-desk.local>
 <CAGEkeHdZoDGtHS0Cmh-HULo_vz44gF1sDMoxrtJ0Ykf9mqcZ=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGEkeHdZoDGtHS0Cmh-HULo_vz44gF1sDMoxrtJ0Ykf9mqcZ=A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, May 10, 2026 at 02:31:31AM -0700, Denny Lin wrote:
> > Do you have the Datasheet version? Maybe URL?
> 
> The datasheet I am referring to is:
> https://www.analog.com/en/products/adt7316.html
> 
> (ADT7316/ADT7317/ADT7318, Rev. B)

OK! Put the URL in the commit message as Datasheet tag and use the name in the
comment in the code

Datasheet: $URL
Signed-off-by: ...

...

 /*
  *...datasheet "ADT7316/ADT7317/ADT7318", Rev. B...
  */

-- 
With Best Regards,
Andy Shevchenko


