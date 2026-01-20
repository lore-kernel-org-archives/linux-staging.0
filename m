Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4143D3305
	for <linux-staging@lists.linux.dev>; Tue, 20 Jan 2026 13:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768916638; cv=none; b=KdkvPpH9mhgf6ObjCjFQwr6CBCuICwOmdM1saxEpX4Qb+6hgvo3w4HCLndICJy30TtYW6xHLJupwyl3HpuJsqrVFsu2VxG5LVtGBUQbEVTQKPdMn4mW+9QhmPd6J6jqfar7zYYodw0k0Xi98qOkt/JSPgHVTKRv20m6k/4IkzhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768916638; c=relaxed/simple;
	bh=0Yomg1imUw5MWEXC9zO42TcUNZfOhftmRTbOkBHjqRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KoWqpE1KuQ7uxRsdnA7i5a03R8caepZkUNvM8hgkWPWNOKmGL4lDMUL2Ud/aH13PWNTFFJJhuBKrn6d/s/PGecTPHUqorlJJiQHGBLGL2lSSDcd8pqmDO6Qk1fMBaaOQQNH6jab93m0UvMY8lVu+VA3yq6CtUX6yu4Wo7wLK4Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VIdXKB1X; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VIdXKB1X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768916635; x=1800452635;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0Yomg1imUw5MWEXC9zO42TcUNZfOhftmRTbOkBHjqRQ=;
  b=VIdXKB1Xhsh8wLc9CdgtY4qqLu+CNvclcWi6fKKDrchR+89BfVZDIgvG
   engTmxFA+K1S5ShoBIPNKKDl1/QY5VdCZFpuvDe7dsaKWDvKbmGQzKBxh
   fnYgsuV+jOvfNyoGHJUy2lVHjFrw1E2AjNNCFPyZLUJgp+zI3A3+JswXZ
   fdgu5kJQ124/I0wCx29HtM53bJUMP9dRc0z/3xGGp3ZYr1ZdZO7w8S4vZ
   E4SdQtwISiDjn5XXzVERN1P64dljXZVeQ6EFi9WXVK9gjkubHP63nemdQ
   5c8CZK35Or0SrIu+Wpg+LY2qqNV63Q5IwXHO2sM/gJw4Fp2JNiuv64giA
   w==;
X-CSE-ConnectionGUID: qjKDKr/US/KHcqxARWXARQ==
X-CSE-MsgGUID: IkwwXVF8T7GBu6Wos0YEow==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69136681"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="69136681"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 05:43:54 -0800
X-CSE-ConnectionGUID: W8NXe3PATfiRKI4EUxzPyA==
X-CSE-MsgGUID: 6vpjjs1FSBeaj7sLzWRRrw==
X-ExtLoop1: 1
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.244.240])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 05:43:52 -0800
Date: Tue, 20 Jan 2026 15:43:50 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Minu Jin <s9430939@naver.com>
Cc: gregkh@linuxfoundation.org, abrahamadekunle50@gmail.com,
	dan.carpenter@linaro.org, milospuric856@gmail.com,
	zxcv2569763104@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix unchecked return value of
 skb_copy_bits
Message-ID: <aW-GlpEkWUYNZsg1@smile.fi.intel.com>
References: <20260120132241.2119454-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120132241.2119454-1-s9430939@naver.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jan 20, 2026 at 10:22:41PM +0900, Minu Jin wrote:
> The function _rtw_pktfile_read() incorrectly updated the file pointer
> even when skb_copy_bits() failed.
> 
> This patch fixes the issue by:
> 
>     1. Propagating the negative error code from skb_copy_bits() if it fails,
>        preventing internal pointer updates.
> 
>     2. Updating all callers to check the return value and handle errors
>        appropriately.
> 
> Signed-off-by: Minu Jin <s9430939@naver.com>
> ---

Ick, and what has been changed? Where is the changelog?

...

>  	struct qos_priv *pqospriv = &pmlmepriv->qospriv;
>  	signed int res = _SUCCESS;

>  
> +	signed int ret;

No way. This should be attached to the definition block, id est no blank lines
should be in between.

> s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct

>  	s32 bmcst = is_multicast_ether_addr(pattrib->ra);
>  	s32 res = _SUCCESS;
>  
> +	signed int ret;

Ditto.

...

>  extern uint rtw_remainder_len(struct pkt_file *pfile);
>  extern void _rtw_open_pktfile(struct sk_buff *pkt, struct pkt_file *pfile);
> -extern uint _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen);
> +extern int _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen);

Drop 'extern' at the same time. Or even better, submit a followup patch to drop
all of them at once.

...

Also you can submit the patches to convert types:

uint --> unsigned int

signed int --> int // this one is optional, signed int longer, but still well
		   // known standard.  etc...

...

> -uint _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen)
> +int _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen)
>  {
> -	uint	len = 0;
> +	int ret;
> +	int len = 0;

Reversed xmas tree ordering?

-- 
With Best Regards,
Andy Shevchenko


