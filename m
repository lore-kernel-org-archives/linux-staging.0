Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BF514882B
	for <linux-staging@lists.linux.dev>; Wed,  3 Apr 2024 13:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712150661; cv=none; b=Mdw8OShVJP+M2TCeU2TkMHMZ6fD2Dwb5eSlWP99RUwQfpuKs6evNyuag/rIaQFSPD8x7DMAFKfHdLt15qdgbLRRKcX5S0+X05q0H7SI9TBN1AtTty7tvov3yZ3CmQMZHw8qeu4TfbnLOXqPNOHyhzrqCRXAAt8yzoTzZ9z1DGas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712150661; c=relaxed/simple;
	bh=I5RGyzMLJIXNupLdtHjUd2yPu3cEeEw2E/J4C1xPUx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZE5J67KRs3jivqOLT7fuTsnoSrteNjsvoK29ewvvrZcoUeBhRP32nmNXrwQw1eIB74X5bbNu7jxS/KdmGVXJIDoLd+WeVwn555v6B/Q8TRfrhSAwHD9yTSwkNypNG1j3XyW9qv6NZb9fYk9n74CjVspCgZNDV27EtNwyyx5R4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b2RFTIoI; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b2RFTIoI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712150660; x=1743686660;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I5RGyzMLJIXNupLdtHjUd2yPu3cEeEw2E/J4C1xPUx4=;
  b=b2RFTIoIv3wRgCMkGJbmW/gu6CxzYUK+GrcqajbzCQHRUsgqEav+u+Ir
   9w0ZhafJiqurrtF/tTnjmKnYgFL6WNswjjoSQVNZwI5s1qlgpMBbr19ps
   5IAvth6GPBv2DEXLKXXHlq43eWaAHDO21Cubba/8bVJziq0BLpJ3WtjlX
   5e3WrETzE1YPPBb2WXJFmoztIH7MMHgImPcgZykBb1Z/0iDBNs6FU8t3A
   bSVG5/iblfkM7+zWAGY0oXBT6u2UG4IjZucKsGtr2wENgmUa/MkkXKjCF
   fwS/AxeunZcKARt+JPpwErthh7Bbu1ebp9hJ79gxGNYMcPEtWzi20nGIO
   A==;
X-CSE-ConnectionGUID: QbXvr13GRiGiepWvg6Hgyg==
X-CSE-MsgGUID: NEysPXuHRWexAv04rM5a/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7243736"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7243736"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 06:24:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="915183381"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="915183381"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 06:23:53 -0700
Received: from andy by smile with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rs0aj-0000000180g-2o4w;
	Wed, 03 Apr 2024 16:23:49 +0300
Date: Wed, 3 Apr 2024 16:23:49 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Corey Minyard <minyard@acm.org>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>,
	Xu Yilun <yilun.xu@intel.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Peter Rosin <peda@axentia.se>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Iyappan Subramanian <iyappan@os.amperecomputing.com>,
	Keyur Chudgar <keyur@os.amperecomputing.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Xiang Chen <chenxiang66@hisilicon.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Jiri Slaby <jirislaby@kernel.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>, Arnd Bergmann <arnd@arndb.de>,
	Jason Gunthorpe <jgg@ziepe.ca>, Tom Rix <trix@redhat.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Randy Dunlap <rdunlap@infradead.org>, Rob Herring <robh@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	openipmi-developer@lists.sourceforge.net,
	linux-integrity@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-fpga@vger.kernel.org, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 33/34] drivers: remove incorrect of_match_ptr/ACPI_PTR
 annotations
Message-ID: <Zg1YZVtM3CZWDYq1@smile.fi.intel.com>
References: <20240403080702.3509288-1-arnd@kernel.org>
 <20240403080702.3509288-34-arnd@kernel.org>
 <Zg0hxMZGlwfXV2RA@smile.fi.intel.com>
 <Zg1P9fpdwPot3Dxj@mail.minyard.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zg1P9fpdwPot3Dxj@mail.minyard.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 03, 2024 at 07:47:49AM -0500, Corey Minyard wrote:
> On Wed, Apr 03, 2024 at 12:30:44PM +0300, Andy Shevchenko wrote:
> > On Wed, Apr 03, 2024 at 10:06:51AM +0200, Arnd Bergmann wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>

...

> > > I considered splitting up the large patch into per subsystem patches, but since
> > > it's really just the same thing everywhere it feels better to do it all at once.
> > 
> > Can we split to three groups:
> > - Dropping ACPI_PTR()
> > - Dropping of_match_ptr() (which I won't review in depth, for example)
> > - Dropping both
> > ?
> 
> Why?

Easy to review ACPI parts independently on the rest. I think I explained that
in above. Besides that some patches might require additional work (don't remember
if it is the case for _this_ patch).

-- 
With Best Regards,
Andy Shevchenko


