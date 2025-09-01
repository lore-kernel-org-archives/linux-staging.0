Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4BF2D593A
	for <linux-staging@lists.linux.dev>; Mon,  1 Sep 2025 15:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756741086; cv=none; b=oVFrwnNeDB4rgejuY42BDlP4lsG5tzpipd8w90I145sk7WsgZ5PSg4SHbfrT29so0dxoXyBG9CNwo6QU/yjXkpslEgW2cOyRf/REJEPjCQ8uQ3GqkHETJ0Jbzdlq5RqvVFtgiBKgGaFRsMr7/MrUiPT7+YYe91V/MTP8Dx/eBL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756741086; c=relaxed/simple;
	bh=xLwC9q9C9piqBIiWcm/FI7iHfg5eM70lwU0qNuVUS04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tHfXRLaKxv0TvBDXVbZauEtlK9RAHoqz9jHmj/jwCl+ZhzJVtvwimK0syS5ccLDaNugXs4Nz1YENdi14ujc/LiIgJ0Zw1G/0HuTc1/+aLAEkJX73FjhBE/3Xjwv3NZuCzE6A8InV0TWs3TXPJxczoxVFZKlHsPsKcOUpjHTCsZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mssBd6K8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mssBd6K8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756741085; x=1788277085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=xLwC9q9C9piqBIiWcm/FI7iHfg5eM70lwU0qNuVUS04=;
  b=mssBd6K8qjFXIrSldOzIv7DkkyKERPyi9kW8Fyw/WhZ13ou2dglG3zeC
   ho3Z6WeVak7b8+6w02/iFE3eNEoA1GSlhxItAxvGWLc4+nCRSU770D9Si
   L2s8llu9OqiqxClBWJYxo2fAS98R/pYixZdO27mJAx/wLHH1SF3qLjiiP
   kmYdGmnfm4sSUpin+QRZPmErZ0FRD1RUebfkyflljcR6rqxZ61hdEnpLr
   glNScICvi9hO5LCaQbEbvpU6xMKu68Iv5YqSMssTKV1w4z0sN6PnnfsVB
   KBytG8RSLtivLk55AwFBM9nCnM9PqeOeip01Xl7JxlWTNN4RHiBvXZuhV
   Q==;
X-CSE-ConnectionGUID: hCfzcNG1SUe0ksFCzt1e/w==
X-CSE-MsgGUID: 8xe3z8+ST5y32cpUPto+Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="76448129"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="76448129"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 08:38:04 -0700
X-CSE-ConnectionGUID: mjKxYjsKTXKcOyjO45+Hdw==
X-CSE-MsgGUID: ajlsGzpvTLmzXbZgXg8X+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="194697266"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 08:38:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1ut6bX-0000000ASWv-0Mqm;
	Mon, 01 Sep 2025 18:37:59 +0300
Date: Mon, 1 Sep 2025 18:37:58 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/2] staging:media: atomisp: Whitespaces cleanup in vmem.c
Message-ID: <aLW91kNOfi1ab6D3@smile.fi.intel.com>
References: <20250901091050.1935505-1-abarnas@google.com>
 <20250901091050.1935505-3-abarnas@google.com>
 <aLWQSAX1ZKg6IiTb@smile.fi.intel.com>
 <CAATBrPHpLnsWb-Ua0z2Nmv7To_yXeosoV8+nGzcWfGUVPFq1Xg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAATBrPHpLnsWb-Ua0z2Nmv7To_yXeosoV8+nGzcWfGUVPFq1Xg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Sep 01, 2025 at 02:46:47PM +0200, Adrian Barnaś wrote:
> On Mon, Sep 1, 2025 at 2:23 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Mon, Sep 01, 2025 at 09:10:50AM +0000, Adrian Barnaś wrote:
> > > Whitespaces cleanup to conform with kernel style and improve readability.

> > Strange...
> 
> You mean the commit description? Should I reword it?

No, the case I explained below.

> > Note, the style after the first patch is okay. I dunno what's wrong with it.
> 
> Those were not violate the kernel code style indeed, but it looks more
> consistent this way for me.
> Should I revert those?

If you are talking about the second patch changes in the same functions, yes,
please, keep them untouched _after_ the patch 1.

-- 
With Best Regards,
Andy Shevchenko


