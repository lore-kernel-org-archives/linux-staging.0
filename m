Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699737;
	b=c6CNI+8tqSUfasY9KeCIXRKjH8TenbHQYLSlNZ/aDs9hMZiBD+FgBViQi7V3KtJZHJUM
	 Comem1cxH8/WVpJh0zwO2FXc83tqfqCG38NF4dz4NcHoHUA/ujKe1skP16Et7FRaFamj1
	 KKCi/AJSniUEDAbfETJX/z66MJaJPb6iJavzztb7zhJJXB0JhuqjT6hIVVnmlzgj1sTbb
	 VGSXkZbq7909bQnUZu2ItzgWLttWTwRJUiZ/SQwdJFThaTqkmc8itYqqkQnUg9+/+gXqL
	 Pvetpce/zYO2YDt5QHzRif9suroQ+XNYNGRSPYAlBNqYlAxqo/pgpJ5hcMQXqpmvXJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699737;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=BeQGUCOl1k+ajaLkli3SGFUKxG/MbdebyYfebJs1qjY=;
	b=dzNmEwWSabfADHT2PdWK0Bfczf9oybk2spUnogQinpnrLl9EKOfXceShEvnEltaveidE
	 9TldoPhpqX+KX+uEnOx9Y5E1mEqOOi3gF2aaUkMccGcvPjJ7sm/QXze4lDLXDnQ8R533c
	 ySU50QySTTF96KcMdjlUXN7KTeTMUa1MGoftkBLGfrWCxRb4qWn0gEhfmMGYiDLLVp2nw
	 cEX2HJPpQNdOWWzfiLTJ1pcS2IcCfCGpG27Qk1lYbxs8rbr0tpPs7oMoh4gBS39sag7Vd
	 +ICGdVXnOs+6xv3Nb4vobZNYYrtqzodppPw8k/d0wRJOtn9qx8ahsfJ1NxMf8U7MP/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="lB/78FF9";
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E814560A6F6F
	for <linux-staging@lists.linux.dev>; Tue,  3 Nov 2026 09:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E814560A6F6F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lB/78FF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793699735; x=1825235735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0UZauren3FKcX2qFQSrZTnrqyYVdkjbCTu/nrHaJWM4=;
  b=lB/78FF9SfGF3XuUMS4v3Taq1uW+GjkRtqt+rIEzLAMw6p/G49Oy9HgK
   MN6EDznTCZwhdlXRuqF1d2jcWLPiSTa9aw50Cd2GeoB4jJSdCm7bMHi/d
   AJ3WEqHBSks+wy7ICd9l1btwGbYAVH7W+4izl9orK1DOwc/u7TognEFiQ
   cZXDwx1tNxi+bv5uc/afwOzQyc9yi+nBxF3WZVpG2+d4MWj3U5BDtcgC8
   6/4UHH8ocIaCPBwAddPQFu8pTIAYjRa8qQ5zLYeEVzHOQcNKVW2+1uXWO
   Qu2JC8/2+3VzyCZlzguaZkZmPvkv7+AQfwe7E9COwPrGqqOnzlzJyXMmi
   Q==;
X-CSE-ConnectionGUID: MVVvx12VQ4ypFFUD5/YyjQ==
X-CSE-MsgGUID: 1Iu7aW8oR2G0Jx9c0pRxAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2306695"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2306695"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 01:55:35 -0800
X-CSE-ConnectionGUID: c9SjTP9tRECL/nhQYcKZXw==
X-CSE-MsgGUID: U4AhdxKWR/+2AadWm0Giyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="8223937"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 01:55:32 -0800
Date: Tue, 3 Nov 2026 11:55:29 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joshua Crofts <crofts@kernel.org>, linux@analog.com,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] staging: iio: addac: adt7316: replace kernel.h
 with explicit headers
Message-ID: <aumvkSfdGIoJHtmn@ashevche-desk.local>
References: <20261102094236.57757-1-abdelnasserhussein11@gmail.com>
 <20261102094236.57757-3-abdelnasserhussein11@gmail.com>
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
In-Reply-To: <20261102094236.57757-3-abdelnasserhussein11@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 02, 2026 at 11:42:36AM +0200, Abdelnasser Hussein wrote:
> Drop the proxy header <linux/kernel.h> and replace it with direct
> inclusions per the Include What You Use (IWYU) principle. Also remove
> unused headers and keep the list alphabetically sorted.

> Explicitly add:
> - <linux/bits.h> for BIT()
> - <linux/err.h> for IS_ERR() and PTR_ERR()
> - <linux/errno.h> for error codes (-EIO, -EPERM, -EINVAL, -ENOMEM,
>   -ENODEV)
> - <linux/kstrtox.h> for kstrtou8(), kstrtou16(), and kstrtoint()
> - <linux/pm.h> for EXPORT_GPL_SIMPLE_DEV_PM_OPS()
> - <linux/string.h> for memcmp()
> - <linux/types.h> for fixed-width and standard types (u8, u16, bool, s64)
> 
> Drop unused headers:
> - <linux/i2c.h> (no I2C symbols used in core driver)
> - <linux/kernel.h> (proxy header)
> - <linux/list.h> (no linked list symbols used)
> - <linux/rtc.h> (no RTC symbols used)
> - <linux/slab.h> (no kmalloc/kfree symbols used)
> - <linux/workqueue.h> (no workqueue symbols used)

This is too much for this type of change. Please, move it to the changelog and
comment block (after '---' line).

> Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>

-- 
With Best Regards,
Andy Shevchenko


