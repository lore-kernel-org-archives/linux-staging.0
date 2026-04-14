Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6374638236D
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 07:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776152956; cv=none; b=jAupD+eBaEMDKEz/sLjE/+KN707tL+5d8jDxns/YzgrHfCcFZggraHGKJqy9J9sb4wOwVlUDHQ4XxRfRYE5yPEC0dKAHfKL8UENyW04+GTltmIaDN0Q8lDvjG96bKtyaOY6vSUX8C21KsUzC8ImV0vF6XcYjvFYhf33his86EHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776152956; c=relaxed/simple;
	bh=MKuHVxrPF8dtGDV/naHv6QawM3n4QlmcIcVNt2I4WMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ft140Nf5w235f64GjLwH9QXawbPjYjKfM0yNHHBBm6vEBYNCQ+mf5katt2H97T2XexN0UZ+Scx7OBaqErSqsSln+Pp57rm7J0EKjz6pethsW+Olzy4/dtW06CAnsuSzvxCdUr38i6Hcr54vpnIjpu+IjbscUTWEUllgT/p4l370=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z/H05kPn; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z/H05kPn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776152955; x=1807688955;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MKuHVxrPF8dtGDV/naHv6QawM3n4QlmcIcVNt2I4WMM=;
  b=Z/H05kPnYWSXp+r6DP4vng87UDmbvv8KWC1X4GeGEtKGTvze0keQ/5u0
   1j/wXmRYEt/ns18+n5fU99FnpZBs/Npx2ISHdsxzK1dzHYXEtWN7wUZwh
   WngPe9+BCkwFdzi44Nam4boJj0bXHk4R9FE7TcQPn0ankHBFe0demqGTQ
   geCrYBfGqWTDywvIWnRi9Hc8XGtJzGuJf7GkxWwP/ggrn85AIGpbxwjSo
   rlfopgXTgmsq+I3FacWhI088keu1kOqv2/KMCAT/AD+XROOMXG0Azp9Hq
   thyTcriGjNJ9d7H37H0zHWHT5wE8kQ2KX0DrG1o47Vs82QNkXlaONsMKA
   w==;
X-CSE-ConnectionGUID: f4GocCY9T7uc6P63fo1JRQ==
X-CSE-MsgGUID: o5G4HOwVS1qOwjykTKSyTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="76979423"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="76979423"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 00:48:26 -0700
X-CSE-ConnectionGUID: tK5m3I0qSk2WsuZwT2/XcA==
X-CSE-MsgGUID: /+UWcmQDTdq+m+LAtapxnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="229954370"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.106])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 00:48:23 -0700
Date: Tue, 14 Apr 2026 10:48:20 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, lars@metafoo.de,
	Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 2/2] iio: frequency: ad9832: simplify bitwise
 math
Message-ID: <ad3xRJg7LFL0Luil@ashevche-desk.local>
References: <20260411085848.75381-1-joshua.crofts1@gmail.com>
 <20260411085848.75381-3-joshua.crofts1@gmail.com>
 <adokoNfP-Ueg4yQ7@stanley.mountain>
 <CALoEA-z0hkOw35D9suEKi61x12fNSSzYem5pecCFj0w_EwLHvA@mail.gmail.com>
 <ad3sckiwifI5ZQYU@ashevche-desk.local>
 <CALoEA-y4Uf+LbM8w+bMA7DdW0Pcpv7AVcbdOD9GknVu5R7TKUw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALoEA-y4Uf+LbM8w+bMA7DdW0Pcpv7AVcbdOD9GknVu5R7TKUw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Apr 14, 2026 at 09:39:04AM +0200, Joshua Crofts wrote:
> On Tue, 14 Apr 2026 at 09:27, Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > Yes, please slow down as you also missed a tag.
> 
> Yes, I've realized that it was stupid not to wait. What is the proper
> etiquette here if the
> v3 patch doesn't have the reviewed-by tag? Should I do a RESEND PATCH or a v4?
> I've attached the tag in a reply to the v3 cover letter but not sure
> if that will do something.

In this case it was fine what you have done with attaching the missed tag,
but be careful in the future.

-- 
With Best Regards,
Andy Shevchenko


