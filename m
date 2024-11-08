Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741111494D4
	for <linux-staging@lists.linux.dev>; Fri,  8 Nov 2024 08:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731055690; cv=none; b=V0roew1L+RXmq3j/W1e7YEkvovQ267qpUNXv6urU1RgXvsEqI+jhHkvDkiIOeHwo1VfW3XHlUfoALcc5hE96wq+Dj3UNL7xZiRR4xr8foDMgpoh/Qu8Vy4Cg3Am487hoEZZwST0m3s2EKjdzjVGFFmnQDWyDBfGosFj5JdUuOuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731055690; c=relaxed/simple;
	bh=QXXT6D0uJ9MLI43khc4CysnOj5oz/Jo4XHurt75Mqck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNtJbkbvovYBSRUMj2fHpfe0wdJgbyscMQRdvHDsiVLvxCQu3WM/4T8KMAVS4I7ygcgaYWHdFXUc5EmJzM5z4QDvawM4zxABuTSWsYPlOL4yZT0hBjGJY4ZFSfrdehUWwlmeGlCuXTkbh+aAI9/lAIueq8v0I5gYBFM5t2m/uAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I4FFModV; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I4FFModV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731055688; x=1762591688;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QXXT6D0uJ9MLI43khc4CysnOj5oz/Jo4XHurt75Mqck=;
  b=I4FFModVWcZqEOLvWimXbwXHBo62vfrG5aeGJya922fQ9TpgqzpwVU6/
   5AKwag12w/1GURruwASW2LSD3ui5+x6SikKT8biyEnQfqBUVeZJLaBUBg
   +AtFkS4hCY4PtDy7/ZKFbSJhHqGJE0LTPfbzE+bGIefbkZYmctdOAhxhq
   moeCejccihODKOYSgBUFnySR08IeTKNZ6uUCwqvJ1PW74Jp20sLZaaary
   00qhf2ZV+c9sVNBg6sbHg9sjWeel5ZrBXVVM24UceCSzGEaj6cFk3ooq1
   fR74QI80u1Cb1Di/jXukVVbncgVnZz1+MCFbHfT21RRZRocAp1WM/mg/0
   w==;
X-CSE-ConnectionGUID: /Yr34dAgS2W7Rhh9ML36mA==
X-CSE-MsgGUID: KhJ3N2L/RB2vTwg8e7RvAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="33789621"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="33789621"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 00:48:08 -0800
X-CSE-ConnectionGUID: q/jZQsKvTX+5t1QEYclQwA==
X-CSE-MsgGUID: iDutvCtySYugQPslXekYcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="85362950"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 00:48:06 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t9Kex-0000000CXhv-2ft8;
	Fri, 08 Nov 2024 10:48:03 +0200
Date: Fri, 8 Nov 2024 10:48:03 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH] media: atomisp: gmin: Remove GPIO driven regulator
 support
Message-ID: <Zy3QQ8C1NvfLdLkG@smile.fi.intel.com>
References: <20241107221134.596149-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107221134.596149-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 07, 2024 at 11:11:34PM +0100, Hans de Goede wrote:
> The GMIN code has support for sensors using external regulators enabled
> by GPIOS, rather then using regulators build into the PMIC.
> 
> With the exception of the Trekstor ST70408-4 (1) tablet there are no known
> devices which actually use external regulators for the sensors and the code
> for this is using deprecated old style GPIO numbers support for which is
> going away.
> 
> Remove the GPIO driven regulator support so that the gmin code no longer
> depends on deprecated GPIO APIs.
> 
> 1) The GMIN support itself is also deprecated and all sensor drivers still
> using it are being moved over to use ACPI + runtime-pm and the ST70408-4
> shipped with Android as factory OS and thus will have broken ACPI tables
> for the sensors, so like other Android factory OS tablets it will need
> a bespoke solution anyways.

Definitely a good patch!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


