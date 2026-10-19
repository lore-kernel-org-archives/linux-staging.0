Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792436643;
	b=uDSeq12bVby8FGF5RTnECizX8Ivs+8I4RjclLw7pNvMsltLGes34XttPKtBjHDhmLC+P
	 efEoF71zDQBsaxwSQ9QVhFFfh5W7PC3EnP1zfHuQKxSRC0MxNaOaiAy/PdQPs59b+SN5X
	 d7zNraf8WcJk6u/tlO/kNt/CyvZco6bMhJqsJZ5nvsu4V4EEK0EAERWKBpciYYNR5Sk2m
	 nfV1FHN/6b7w5Wlzo+M4u+xMwEYBpe5VmGN0Vhc5T9SsWAq2fCvvs49PN51OZsYzVE8Wd
	 RsFuCqeQFNHyXghXKUUxgGijI83wMShMsmNhv30tKpNUlMb95MabOG6Q1LHi388CNrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436643;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=dL8ZGUobikYXfeavA/hCoH0m0XNsNI0h4JXi+H04Ge4=;
	b=Dz1r0KVxeuzH1C99LS6VBw+8rUYrJLdeeAxEVeYvdtvcylvFUGCzBUDRG0/qylrLG2s2
	 hDCNND6tNTLEFCFgBoGFjLZnGunqD4ns7uvL2RGUDonR4zuNJ4t1y28/v+tNMNyHpUmNO
	 u/IpyFfjFDhLurxQSFFZreWH2+PqoQjKiIicBHKjqTGol7+9O4AlQPlWVI87C/pq/UdwX
	 rc6mQ7kIAUJ8vJY35MXJUfLVxzWqIvLchvSPVeFwAsvSaqdmYf6l9jgBtAvs0ohGPU2f0
	 SNyXnsoOZONjWetpndkFRmnc2H9MXb7qjPNBa2VSeuPBaZpvWRHo675Ol58UlZDLcXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S7HNhb1m;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477BC606A31A
	for <linux-staging@lists.linux.dev>; Mon, 19 Oct 2026 19:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 477BC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S7HNhb1m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792436642; x=1823972642;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J+FWQwTwrvLkVXTmczbs/r9eIiKcg2wlsFRu0rFmGOA=;
  b=S7HNhb1mwVzDQgKftNNE9OVHF32RY5yXwO7ouYijRQ8YEeL0d3YCl9e6
   XHmy6zqw8JbmZrGqkhu+XjgKHNpAGr+p7dYwbmGDFuFrT0UefNnWZUtzq
   9gDWGJV6hebOGNfj0WdPBFjTZ2KaKYk1zlmZP291NTbrYrBuuH9eI/o4d
   bOzF9KCIXasVu8XE8Nm3MFmMo4JeP3QHsRtdeJM1bRekWytCYGyeaEs8m
   1RlHelS36BgPX1b1xjbJOFC18Z4WODbiozkfFZlN9hiJ02N6uQz9kgl9N
   TGtWXuQGIeHrGLVoyPMgLdiRiL3hjgOfUFHk5LdM+casrckXK+cpaX/gd
   g==;
X-CSE-ConnectionGUID: c3XFhdHpTymEdi73ijKR/Q==
X-CSE-MsgGUID: BlE9E3roSK2dYxoHg1ISlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1009428"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1009428"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 12:03:45 -0700
X-CSE-ConnectionGUID: DaLQB0JGQtiDRU5HnhCXig==
X-CSE-MsgGUID: Ty9MtHA9QCqcz04CqgeBSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2619666"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 12:03:42 -0700
Date: Mon, 19 Oct 2026 22:03:40 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: amiratefabdallah1122@gmail.com
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>, Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: iio: frequency: ad9834: use guard(mutex)
Message-ID: <atZpjGgTBcdVMtQJ@ashevche-desk.local>
References: <179241934543.347.7026859519510388428.20261019-ad9834-guard-mutex-v3@gmail.com>
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
In-Reply-To: <179241934543.347.7026859519510388428.20261019-ad9834-guard-mutex-v3@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 19, 2026 at 05:15:45PM +0300, Amir Atef via B4 Relay wrote:

> Use guard(mutex) to manage the state lock in ad9834_write() and
> ad9834_store_wavetype(). This simplifies error handling by allowing
> early returns instead of setting the return code and breaking out of the
> switch statement to manually unlock the mutex.

If you want to continue improving the code, you can research the use of
sysfs_match_string() and rather use it as an outer check.

static const char * const wavetypes[] = { "sine", "triangle", "square" };

	int wavetype;
	...
	wavetype = sysfs_match_string(wavetypes);
	if (wavetype < 0)
		return wavetype;

but it might be actually worse than existing. Again, it needs a research to be
conducted.

As for this change, it's good enough.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


