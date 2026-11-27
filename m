Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793528;
	b=11dMGtn+NyXyWeKuZ5XMobg3fDMAnMXf0CDZqc9xEBc1FxMxna+m3hTc3D4NSCkuHC4u
	 LiAc37d5nREuvYWerPYBixjsDsOcoyQ0p5I/NEkG5dZFzDKSQsxF6tIgyOdUyVS3BNN9j
	 tjm6nZWRu6EVwDVRJ2FwJuj8pirzvoNtWJY9Vek8XmYt9ZzhegeiM06bBy5SJeRMFJRy0
	 uke7CoZ6bxWIc/xqb5zN60uwLiVxkkw1Jo7CiflGdigijULvI7Y+L/EeVkAj5Ct04emSq
	 Nz9ChPcA+pPvy42fBiZvoVvxYnukwOwn1ecjiMb7NszXwYJJ5ls2XHI1xWsz9H2AfFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793528;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=S8SIjn5jhpWrO4H0i18sVftbBxRoyw9+zah7CQ51v2M=;
	b=sz5DB6TKm+M8sioeSr4hsmq8Zvy9F/HovKmi+h3frD3/neHwFQwed+epWzN4oPTKw5D8
	 7Oumk16dJ/0SMIdzVfu7BpPjxiOK75HA03ZSMXRX8KJx8CMDkC7EgiO8WVTkLDUmG659a
	 tRevcENwLUXnekzXO6i+mA3YYgswZGyZO8Dd+fOP8IE/ESwnLdJXIA10Rm60qyVe6RCXE
	 U+MPwnyOdL7qDFcKhIcy8S2bZjNp3fYkMhhs4tea91wg5BZfH6AsnqjSIQyZ/5R07mxH/
	 Lc3m6JSCTItclO7Bx4Bw3/1GwVdGbUw7eAdGvpVYqsCS9sSJE5QPz4YAZ3aY5fRbncg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="fdh/WF5S";
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141A1606A329
	for <linux-staging@lists.linux.dev>; Fri, 27 Nov 2026 15:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 141A1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fdh/WF5S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795793528; x=1827329528;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lClgaioM6X/vpnkOdTOvJo7RDPggy8ZlNTMehLTbj0c=;
  b=fdh/WF5SfwaFQU61YfKGmXfYCjQpMi9ASaO3r0Re7YXFQ62EJjV3o9ky
   42waxS8l696mJQfOhlxeIRjTDTkFmcB1e3usmu9UNlqCJJ6lPdAFD18+r
   7LMmf7fBxmUh0DcHS/qqztN2+PjtqLZcEIuqBm7oNJgud8G3hQoNnREAR
   ZxjgB7PcpyUMghvyJ+LebE7Y/FyiagfZerYxzOi8pxCyinZsyozT5Dtu5
   BMrNpDTlCtWBd3kUyY9zy5RYpvkMPqMPCKuSSXivB/yRG9heia2VKF3dp
   bK9/8HWp1BkTBoBlv84evTLhrMRb/yMD5OtiRURc80GbWihgvVaChy0yf
   w==;
X-CSE-ConnectionGUID: 0v5/0NWjRyaC3BYP5j7e4Q==
X-CSE-MsgGUID: gJLyIzXvRBu5w88jL0disg==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4618618"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4618618"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 07:32:08 -0800
X-CSE-ConnectionGUID: b+8pwmFSTjSKCG8MEl237w==
X-CSE-MsgGUID: fcpE+hmFRUqX2pZ5MJ1f7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12744811"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.115])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 07:32:01 -0800
Date: Fri, 27 Nov 2026 17:31:59 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Punnay Sharma <punnaysharma805@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux@analog.com
Subject: Re: [PATCH 2/4] staging: iio: impedance-analyzer: ad5933: reject
 frequency code overflow
Message-ID: <awmibz0Q3bVMMq0M@ashevche-desk.local>
References: <20261127123303.144052-1-punnaysharma805@gmail.com>
 <20261127123303.144052-3-punnaysharma805@gmail.com>
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
In-Reply-To: <20261127123303.144052-3-punnaysharma805@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 27, 2026 at 06:03:01PM +0530, Punnay Sharma wrote:
> With a 500 kHz external MCLK, writing 30000 to
> out_altvoltage0_frequency_start succeeds, but the chip starts at
> 14374 Hz. The attribute then reads back 14374.
> out_altvoltage0_frequency_increment has the same problem.
> 
> The start and increment registers hold 24 bits. ad5933_set_freq()
> turns the frequency into a code, freq * 2^27 / (MCLK / 4), and writes
> only the low 24 bits. A bigger code silently loses its top bits.
> ad5933_store_frequency() only checks the fixed 100 kHz limit. With an
> MCLK of 3.2 MHz or less, 100 kHz already overflows. The datasheet
> suggests a 500 kHz MCLK for measurements between 100 Hz and 1 kHz.
> 
> Move the conversion into a helper, ad5933_freq_to_code(), and call it
> from both ad5933_set_freq() and ad5933_store_frequency(). Make
> ad5933_store_frequency() return -EINVAL when the code does not fit in
> 24 bits. With one helper, the check and the value sent to the chip use
> the same math.
> 
> Keep the 10 kHz probe default, because a probe failure breaks boards
> with a very low MCLK that work today.

...

> +	if (ad5933_freq_to_code(st, val) > GENMASK(23, 0))

Perhaps >= BIT_ULL(24) ?

Then it will be in align with the commit message and BIT_ULL(27) already used
in the code.

-- 
With Best Regards,
Andy Shevchenko


