Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34E9391E50
	for <linux-staging@lists.linux.dev>; Mon, 20 Jul 2026 19:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784574714; cv=none; b=GH67a1ftXgIm3zxf/8JMRAkj9eu9JMloIhosEEXJkylEuTzhh3ymgebA9wkayDqCry5WSxXakyGgpsnRC1ARoOFg+qUrLPuChEIGhBFeJZjoDJHz5pSfWNb2OjaqR9pBroib+G5Lau5akMDvdylcFTMZDZmVPQxRD5G6hyurcq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784574714; c=relaxed/simple;
	bh=T0dyXddYxGKE+VdmnRmqHMhGiVf/itmLMBFQ/L0Ebug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eF50qGfBM9gIiqcBw3tYOVqNMNIcxgxCsA+aw4s6p+IVGvquQrKtN8tDM+KeOHQcgKH2BXMBxgyFEXk3KCXBJGpMwiuY0MqDOcjcr6ka9FQEC0ZzXPEL3kVBAqv7SC8d8agkwx4y9u/6tfJ8jW5+17e7P/h6fe2e4o7QHDt2ADk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hqUk0RzB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hqUk0RzB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784574713; x=1816110713;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T0dyXddYxGKE+VdmnRmqHMhGiVf/itmLMBFQ/L0Ebug=;
  b=hqUk0RzB8gm8ct0CDRxPLGeK79XWMtYhzMzpeN5hUynJ9KfItzEvVo2H
   p5USMYkJZ6x5/f8Ci+zEXjQVFyGUBPs6amVsEtMq+FkXdMS7ODAH2fgki
   5t/+kA8zycWMj3DEu9HH+4lsSTH6Og9/PUKIatCPH1u03sD6IJ043/ELR
   f74Z+GDU1/ddh02KCIly9wFTkUMLNRujWqJ7eompPz19Q7tXWOkuaGntb
   dy2RoBx4iY6p8DkgWj5kFoUD0HAzl15JYcuIRoedp4I1GmakwN7sovcBq
   UeaCYDnCStf4Fmez54z8nEn5dZUV5Jjhakqq+5r+togUd1v8cxbgWiQHA
   w==;
X-CSE-ConnectionGUID: TAUHBipATTmnC7lsvO1/1w==
X-CSE-MsgGUID: ThjI7U9MRwaYe82vm7KEMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85286711"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; 
   d="scan'208";a="85286711"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 12:11:52 -0700
X-CSE-ConnectionGUID: DKbo386EThCm/eJV2yvh8w==
X-CSE-MsgGUID: AiF1uxqxSBWbIU/9Fj6sDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; 
   d="scan'208";a="254130163"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.175])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 12:11:49 -0700
Date: Mon, 20 Jul 2026 22:11:47 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Pan Chuang <panchuang@vivo.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chelsy Ratnawat <chelsyratnawat2001@gmail.com>,
	"open list:STAGING - ATOMISP DRIVER" <linux-media@vger.kernel.org>,
	"open list:INTEL MID (Mobile Internet Device) PLATFORM" <linux-kernel@vger.kernel.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Subject: Re: [PATCH 5/7] media: atomisp: Remove redundant dev_err()
Message-ID: <al5y85CR77ZxT3XR@ashevche-desk.local>
References: <20260720134324.239391-1-panchuang@vivo.com>
 <20260720134324.239391-6-panchuang@vivo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720134324.239391-6-panchuang@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jul 20, 2026 at 09:43:11PM +0800, Pan Chuang wrote:
> Since commit
> 55b48e23f5c4 ("genirq/devres: Add error handling in devm_request_*_irq()"),
> devm_request_threaded_irq() automatically logs detailed error messages
> on failure. Remove the now-redundant driver-specific dev_err() call.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


