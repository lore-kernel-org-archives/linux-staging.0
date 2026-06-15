Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222533F4DC6
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 14:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781532560; cv=none; b=Sq9PNgde4AP9U23FhSYnFU3vxJQTu5A7aXuFGhLCh3fb5ZAWsH3yluUCio0koQjEW4XMmHrZMpFR3YEgCfk30ruw4z98ttfDvaWsb5dAEiwHBQ4kbKmh+DByuO1UnhTglk7TzmxOBCbwAwnfgMpoBtG2hWiPZWLRqPcyj2g0oeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781532560; c=relaxed/simple;
	bh=ty7y+PmmpPMcSZT3QxdciDZM4mxShqfTp18fzBz+R40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXbBi95GLPEt6pR/51PgZE0AZLLeac5uzAgud8ZRX66D48ksuHEnFQao5/mwJZXQj9SPmyl8egJp+02AmwlrNjido1SRNBMbB0fCs4AjyTY7U+YZ46K8OZhDZ3eewSjoL/yaUbTHnvfBbJL5yLGB2BNh18AAtU8HHI5G6Z5cHGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jMSbZTmv; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMSbZTmv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781532559; x=1813068559;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ty7y+PmmpPMcSZT3QxdciDZM4mxShqfTp18fzBz+R40=;
  b=jMSbZTmvdYoQtKaOyrAGtEfMWX+vizyoZdbSGBje/ShWw3T9YWP5/gqS
   luBrSQrCJcLbe50PsVgg0PHDp8tFLfK9HGZ0FydQcZqAyRRfqliTNqRwH
   SKl96rS4uOVoDYopQ41d2VPcDil4IluL8pD4Tp0Y66UDtydgiGMczG077
   jALyOcftl/8sc95ptDeYDFyEw0T33l/BzmMTP9zyLstw9+rVstNzLF6mk
   p1oSdmJFXXsnHXvRfPu58s9EFfysrnHmCtcaIfPy39RXhiP12eHBF/74y
   BqK5Hmav+CiiNpJ139W/wtTs3QodOE4Hbympe/6mpAvnOF/MDln2qABH0
   g==;
X-CSE-ConnectionGUID: w8LylAaRRFCFTU98ptpmHQ==
X-CSE-MsgGUID: pdonzjSpSwCxCma2Q/PDqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="104943465"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="104943465"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 07:09:18 -0700
X-CSE-ConnectionGUID: B91fJA2qRLStv/s4C6nG9A==
X-CSE-MsgGUID: XpaavBfkRRK1Hp5t+sA3PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="243115678"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 07:09:16 -0700
Date: Mon, 15 Jun 2026 17:09:14 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Andrei Khomenkov <khomenkov@mailbox.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>, Kees Cook <kees@kernel.org>,
	linux-staging@lists.linux.dev, linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: atomisp: replace kmalloc() with
 kmalloc_array() in sh_css.c
Message-ID: <ajAHitx6a0Sk5pLZ@ashevche-desk.local>
References: <20260613110712.71436-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260613110712.71436-1-khomenkov@mailbox.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Jun 13, 2026 at 02:07:12PM +0300, Andrei Khomenkov wrote:
> Replace arithmetic in the kmalloc() function with the kmalloc_array()
> function, as this calculation method is unsafe.

Why not kmalloc_objs()?

-- 
With Best Regards,
Andy Shevchenko


