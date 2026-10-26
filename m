Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793005665;
	b=YwSkTTD3Sifdhh04XDyu68zBjh3dCCpjcEDkMqAF2OB7A2b6JcV/0AKz59Q3e6Gi07MG
	 Sk73cl3I+9Fo7NXc10i9RzfS31p9Hya4CadMkbrKJ8p4y8nZb8224R+H0tQp6bKjqF63l
	 qrDG3kpWxGBq+md9db7l6t+FgdRNplWASFx1gjkU/C7Uhv+BE9K5YHqH1tYZ+1rZbrQ1Z
	 YojGjW71l4AkbcsvKQZIOghQhwmg55ZB70F2ji+CzEjji29AtIhyUGwtScVfKCPEa8yHb
	 xPVHUe8G5htuYPBe3McV5l9vhqewlHOYDl1AK3xgwdbk78/aB0yDbDQWVG0vOKi40/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793005665;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=tku1anvtsxeDxchSeNjnKF1Zpthldyy4qNBOIQp4nOc=;
	b=2QCvo7Dhkyy250LXVnYst3LPZrHDvwidMrxvyeBCqc8wZeYqkfPrRARyNe2k+bwUNeuG
	 3h4s1txeD0HPiJ0TMN9wjnrORoEJPWidNGhxWmruQgt5T4Y3/V122vsPaozUv6Blpindx
	 foXUicB/dLQN/iTMn8gSrj60xXtySRK31HRvfEIzhoctZgem/wXmRTaJMEY+EJOTrdVPy
	 pTKWfJJhrf5jHc/lO66ZJtIGtIoybR4YfarLDVCUIWF2D1VRBTkcCb5yMDsM/hDmfoYsJ
	 Q2b4jx8i2AhD9awRVnSSxqLjduWsW6hD7WElvQcK9O6LTcwEhNstoFPbpnOdAB9suyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SgtmbBEL;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A449606A31D
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 09:07:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A449606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SgtmbBEL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793005665; x=1824541665;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oRjbsiZqVRUV0hn32VGb6rhu6l3a8Gv47KkMMMF0Q68=;
  b=SgtmbBELmGMJXwdD2Z5jktDR/cwziyFNV/TIMbwMwOwh+ITRAMsxiRdd
   YoEJ63KVefAs3pml7A4lqiuTIN+zIWaMrcUCUzJ/PK8ae5KgGZQiIhjfE
   iynqyYkyNxYy7M5q2bfR6WOx2XBhmqhlBKEVVC92S/vN48HH5nmYbKUXu
   HfhlGZ7DhY6DhjKOfX8q2wCtZpsnDx+ulp06WGcGUVzRf5RI2SPZcGwPH
   JXD11U3WT75wVESFcFY83smJj45c2KmKTVJthLXWYoasomIEPCGGowRGA
   2di9dO5w2Y0t1m6tf3UlioS/aeyESImGeD6BhAfLBbFoTWUAIIBYyQZmg
   g==;
X-CSE-ConnectionGUID: hykAbO6gQ3iLdNYBn5uXnQ==
X-CSE-MsgGUID: muy9rMJaQ1aEQI1FuAR5iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1566084"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1566084"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 02:07:44 -0700
X-CSE-ConnectionGUID: 9Vtw9D1DSD64C3SluN7cIQ==
X-CSE-MsgGUID: P4xaKnc+TyuJ/TiwCDReBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4267628"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 02:07:42 -0700
Date: Mon, 26 Oct 2026 11:07:39 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Nithishvelan M <mnithishvelan@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nuno Sa <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: iio: impedance-analyzer: ad5933: use
 guard(mutex) in ad5933_show()
Message-ID: <at8YW0nzftacwkga@ashevche-desk.local>
References: <20261019150248.416-1-mnithishvelan@gmail.com>
 <atZq2GstK_rxOgbj@ashevche-desk.local>
 <20261026024049.556c6642@jic23-hlaptop>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026024049.556c6642@jic23-hlaptop>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 26, 2026 at 02:40:49AM +0000, Jonathan Cameron wrote:
> On Mon, 19 Oct 2026 22:09:12 +0300
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > On Mon, Oct 19, 2026 at 03:02:48PM +0000, Nithishvelan M wrote:

...

> > >  	case AD5933_IN_PGA_GAIN:
> > > -		len = sysfs_emit(buf, "%s\n",
> > > -				 (st->ctrl_hb & AD5933_CTRL_PGA_GAIN_1) ?
> > > -				 "1" : "0.2");
> > > -		break;
> > > +		return sysfs_emit(buf, "%s\n",
> > > +				  st->ctrl_hb & AD5933_CTRL_PGA_GAIN_1 ? "1" : "0.2");
> > 
> > You can (re-)use ridx here as well
> > 
> > 		ridx = st->ctrl_hb & AD5933_CTRL_PGA_GAIN_1;
> > 		return sysfs_emit(buf, "%s\n", ridx ? "1" : "0.2");
> 
> Maybe call it something else here as its not the range index that I can see.

True! I have no idea where the part of my thought went during the previous
reply as I definitely kept in mind and wanted to add something like "(and this
might need a variable renaming)".

-- 
With Best Regards,
Andy Shevchenko


