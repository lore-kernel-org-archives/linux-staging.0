Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B428744A3F8
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 12:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834787; cv=none; b=PVtf0R6h7HkEYk6ALBVh4bglHPE0hRNMe8P7H9rMYr3iGm964JCUI5qOspeIp7dlsg0LG0b0obLTDkSOQp9g+Tx6RilxkIh1NXO/FhY04BInJMM6Te3pXLnpTYzRY3DOHgsDQpmpztjNQjPHHB8OlcdAjjXDmuBIU8R58RWK8t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834787; c=relaxed/simple;
	bh=zgIDnx18/VODbAUQka6DE+sFFxzPzeHaQdIjq/as79s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jm5a+rsWl+s/QAPe1L4A3Ptr4RR0JatEm0DhfQqceT3JdiGR1ATrXmq4vMFTh9d7U/zNqF2kNj6xDZKnlsvr7eFs6p1eRqYVP6h/ok2az/qTShJAshHronhvcVxKsPlJ5UIWlsBSDf0qL75mwHSTT1itxgqOHzqmv8onsrfyvRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B58LhLDg; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B58LhLDg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834784; x=1819370784;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zgIDnx18/VODbAUQka6DE+sFFxzPzeHaQdIjq/as79s=;
  b=B58LhLDgVepK2dK+CNXN0yZvNdEQBhr+x588efsm2ZXPHysVfL4fH5Qy
   E8QKw286x80q2NyFzRbGlupYuANYjc0JkTAJPn8k61xS6tVM419KbxoLl
   WQYZqXDZeNYSmr8AZk/flEP7Nrd0jDIa5clrT9nuTigXoLTXeMMXTd721
   8YWT1nQZDCF9AfkZOeYmzmHjfWm0u50hTFw+DwzeN5FUS45b68KRgWRhS
   NOpOO+wbePPmAlWiedbHDlM48Hyw9lkerJkxJ1Vl7lJpzcZ7f+2tDrp+8
   nn8o8HspHsBNY/GZMHf6ojQ8RWyHDPohj4qlMrK2bNGcg2xbCBRPTsJ61
   Q==;
X-CSE-ConnectionGUID: S1dJbHGhRxOTeQNkw7N9mg==
X-CSE-MsgGUID: yR1Q3HY0QI6LztZds7Uo9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88351077"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88351077"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:46:21 -0700
X-CSE-ConnectionGUID: 8WvHB9opQ/SBwBwZAKTb4A==
X-CSE-MsgGUID: b7lFnPSqTHW91sfIs0NeZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="306079298"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:46:17 -0700
Date: Thu, 27 Aug 2026 15:46:14 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] media: i2c: Add Yoga Book camera ACPI IDs
Message-ID: <apAxllYaUEQRqlZf@ashevche-desk.local>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260826132256.3343451-3-mauriziocasciano7@gmail.com>
 <apAKR_wiAUhI0ZQn@ashevche-desk.local>
 <apAqKrNsZbd4JE-b@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apAqKrNsZbd4JE-b@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Aug 27, 2026 at 03:14:34PM +0300, Sakari Ailus wrote:
> On Thu, Aug 27, 2026 at 12:58:31PM +0300, Andy Shevchenko wrote:
> > On Wed, Aug 26, 2026 at 03:22:50PM +0200, Maurizio Casciano wrote:
> > > The Lenovo Yoga Book YB1-X91 firmware enumerates the front OV2740 as
> > > OVTI2740 and the rear OV8858 as INT3477. Neither ID currently matches
> > > its sensor driver, so both I2C devices remain unbound.
> > > 
> > > Add the IDs to the corresponding ACPI match tables. Sensor
> > > configuration and CSI lane quirks are kept in later patches.
> > 
> > For the record can you provide an DSDT excerpt of this device object (no need
> > to put into commit message, just reply here)?
> 
> Typically the information comes from BIOS (EFI variables?) so the DSDT
> nor SSDTs have this information as such.

I am asking to see it in general, then to see that the IDs there.

-- 
With Best Regards,
Andy Shevchenko


