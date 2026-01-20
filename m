Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B28230649A
	for <linux-staging@lists.linux.dev>; Tue, 20 Jan 2026 16:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768925838; cv=none; b=Exiivicpo4y4FpZVyrA95FczpjcbW3akOn/PhiFcnV+v5VMoJldb6LOfyVVU0rdOITPAkwpoS4YMMSuhtogA0WyIluEsqMsHyfCvABc+VF74e3c9OK820WVpBhWBMxfVxenFRiUCQkQ/umoQjke6E0Q7KvNrY6ordmhiaQOs/Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768925838; c=relaxed/simple;
	bh=zJIzIOax5kN53QKzF+HCwlOps5yQm0vym5Yg5kuJewU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smCXeOgOfRThU+bdSw7wkF8yx6H68DpdzwVMx2gkjc2/LPJJiZe0BSmsuypYIyWh5qYh4ZsSB9qW2d+dm8112V+zUSWEZPQsn1X8HzbsjBzI7et6mbluN14qk2HjHxjWbo1r3wQ9Jk4sgXORHnHt88npYHKqJdhiBvURoL8+GvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jiBiVMSj; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jiBiVMSj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768925836; x=1800461836;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zJIzIOax5kN53QKzF+HCwlOps5yQm0vym5Yg5kuJewU=;
  b=jiBiVMSjCi2HfM8dA7nATT/y+N4Y3zr+jUweOqVhjo5ENSyIZPBDQQ7Z
   4JtEVIFUajhbDIYSoXqk5Azyu6i8qvcj9JEohsWwVK5GQ0L3k6eKZ3Hyq
   xBznqZZNJGY9jZNiaB0rqXwpw0QHZE0VUXj/vHRGFGF0kHtl68Db4m7dD
   vW6xFQUu/12XcPPzQ83NUKVDenoz6xn5oogDfBh3zVSCv4eU/A4HrUvyI
   OepbyTaEV7y/8e71eMSR0c1f+lUqwdj8KK29PgBbttWNuidARl3JqQVGr
   rYevP1BvhxwxG7DvVK4tQauIdKDBtWSZEXcIyztu9YkowIceIM+gYEDUU
   g==;
X-CSE-ConnectionGUID: UdiiTDyISHq0vQk/kT2FOw==
X-CSE-MsgGUID: xC0YdIqtRaWDUDPq7o6Ckg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="69154073"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="69154073"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 08:17:16 -0800
X-CSE-ConnectionGUID: 2RqSjtBfTBilC6qRX1rFjQ==
X-CSE-MsgGUID: drmwHL5ORdGS53RJiRAllg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="210649543"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.244.240])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 08:17:14 -0800
Date: Tue, 20 Jan 2026 18:17:11 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Minu Jin <s9430939@naver.com>
Cc: gregkh@linuxfoundation.org, abrahamadekunle50@gmail.com,
	dan.carpenter@linaro.org, milospuric856@gmail.com,
	zxcv2569763104@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: fix unchecked return value of
 skb_copy_bits
Message-ID: <aW-qh9mc-Uc2eV6w@smile.fi.intel.com>
References: <20260120155035.2939512-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120155035.2939512-1-s9430939@naver.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jan 21, 2026 at 12:50:34AM +0900, Minu Jin wrote:
> The function _rtw_pktfile_read() incorrectly updated the file pointer
> even when skb_copy_bits() failed.
> 
> This patch fixes the issue by:
> 
>     1. Propagating the negative error code from skb_copy_bits() if
>        it fails, preventing internal pointer updates.
> 
>     2. Updating all callers (including set_qos) to check the return value
>        and handle errors appropriately.

...

> -uint _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen)
> +int _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen)
>  {
> -	uint	len = 0;
> +	uint len = 0;

Use
	unsigned int len;

(Note that the 0 assignment is redundant)


> +	int ret;
>  
>  	len =  rtw_remainder_len(pfile);

^^^ len is assigned here.

-- 
With Best Regards,
Andy Shevchenko


