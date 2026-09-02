Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1934A1E18
	for <linux-staging@lists.linux.dev>; Wed,  2 Sep 2026 13:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788355691; cv=none; b=R/ix3lYcV2yYHIXZi6X8ogrSQA9epyRGBXlbqAxFfRNNsCuzh55SXfaEGyo2ndXWRzJopaTkpd4NXqIZhHBM9lzvKop7UoU69x8cxD86OgXCvWVIPNy/m0WQvT4NAzwxwTXiWOK59JEHp7JRNgAo59WWAg4WsaouwROWkEhLe3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788355691; c=relaxed/simple;
	bh=n7uS+1u7Rz2/XZgUfmmvueShfkKIx2EpODxPDs9Q0PM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d3sjeGAZQzgZ7d/HHZGQHZ8tHNUQG3oiYEji37UeT0Yy0hQ4elM0tWEZVb1K74Slnofhd0ehq0z5HoAUWiWsUvfFj8GYjqtdrKsACtdcYuIyoFdgwmp3dMUTPS0ZzQsSTvsJ3/PLB69hExf3U49cdyXP7VgDUYFB0SuRufOKZs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QQulmhEB; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QQulmhEB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788355690; x=1819891690;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n7uS+1u7Rz2/XZgUfmmvueShfkKIx2EpODxPDs9Q0PM=;
  b=QQulmhEBvd3BqrurKuH/+JxToJByuwq8AT1X3ppWs3kcuUYSpMDCb2my
   ON5WJxzIoJHXcRkxXI3YNVk+TNgt5y9u7ylyrYa6Mrp+oXJ6yj4Q6xTf5
   YM2AYRkRbsH+Lgd5pEk+iJkE65I3JnnbwSgJ3O5u+a3wtCPmVoOLP+9gX
   iETd010nQ3FHWmNFrpyNz1C6pnHeMjU6cFCJdNdtkaKLfdLUl43stql4H
   adMnGnwK2txgHV2NWKpuo6zVXD63R7lA8Y0PR5ngshGA2aZOQl6pD6Vjl
   csxWcvdTmCBnZZeDcXFEY8yB+AcYzFq/q82Xe3PdYkYlJSVk+cfCv3kYi
   w==;
X-CSE-ConnectionGUID: fbld/ySMQQq8tIIindDxog==
X-CSE-MsgGUID: vSfvZpFnSwiJBb5acFMtKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="89022337"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="89022337"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 06:28:01 -0700
X-CSE-ConnectionGUID: c1CjdiMYQGWXSu0ksEXn8w==
X-CSE-MsgGUID: EMLDa0vOTu6Ra1EETDiLgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="273576745"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.118])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 06:27:58 -0700
Date: Wed, 2 Sep 2026 16:27:55 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com, bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	andy@kernel.org, hansg@kernel.org, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 00/16] media: Add Yoga Book camera support
Message-ID: <apgkWxmlYyWFfHjT@ashevche-desk.local>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 01, 2026 at 09:04:22PM +0200, Maurizio Casciano wrote:
> Hi,
> 
> This series adds the sensor, bridge, AtomISP and lens-actuator support
> needed by the front and rear cameras of the Lenovo Yoga Book YB1-X91.
> 
> It covers the OV8858 19.2 MHz clock and Cherry Trail gain programming,
> OV2740 288 MHz link frequency and manual white balance, firmware IDs and
> IPU bridge data, AtomISP raw capture and CSI-2 timing, and the WV517S lens
> actuator.
> 
> Changes in v6:
> - In patch 2, replace the arithmetic MHz expressions with direct Hz
>   constants, as requested by Andy Shevchenko.
> - Give the supported input clocks distinct names:
>   OV8858_XVCLK_FREQ_24MHZ and OV8858_XVCLK_FREQ_19_2MHZ.
> - No other code changes from v5.
> 
> Validation:
> - Strict checkpatch over all 16 patches: no errors or warnings.
> - W=1 object build of drivers/media/i2c/ov8858.o.
> - Sparse C=2 check of drivers/media/i2c/ov8858.c.

> - Front and rear cameras previously validated on the Yoga Book with real
>   raw Bayer capture.

Can you confirm it still works? Because word 'previously' makes me a bit
worrying. In v7 it might be even more changes, so please make sure it still
works as expected.

-- 
With Best Regards,
Andy Shevchenko


