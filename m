Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C5D2D8379
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 08:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776156429; cv=none; b=EpbLKOXRe2AJw7tLSW5ffyVg2fQqoEJtGVjiIDW3vvSADoEM/2uYVGTZ2YgOy89BgiGgisBZRcIKll35m4OboreUUf+EWJW1jgOLqzqoXYhzxzi4KMXxub8IIX4AbZqbFbYetO15b2t5Cuy1BOomyK7TVtlo8iICt6NBDdcaIBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776156429; c=relaxed/simple;
	bh=mysA3IffONPSfZl5YMuDc5C1vDuj5BmdfIgS/N3TrHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MP0U9XGMjzBh/ygNKhFbTdJYtO9Idzh79H1AryWvBfuq3v9H3EJo6XyEDa0xjoEM3Ua/SJjFa6KyNK7x8Tetkoovs+tXv8p/dybRk5/++o7sCrJ0MprobPctuugwhHtLKpRlQz/QQTWjOXm11bdQ2/nykAnrNLGH5oqsYY2WiTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1Ok8YaB; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1Ok8YaB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776156428; x=1807692428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mysA3IffONPSfZl5YMuDc5C1vDuj5BmdfIgS/N3TrHA=;
  b=R1Ok8YaBy9bWmq2MEf3ASFqIWrVEo/AlXvweX9v//fDeVmZOT3MEe9LL
   cWu+5+cc/5NDnwYV0aZd3b7oUdpBt/rK2OeGg+07/HWjCtHTjgFs0DXT2
   dLd5okKSsqxPOcwf1WjVeg24G5KD8DqUQPgUZ3GAihbuUEPlVjtV+7ILw
   jYuVttTp2jsTfhAx8PTJeSC9twt2U9M3xZlAlrLW7yI/12g8FEt/WkHx/
   gcuLBfBPrhD/Mim1p26zBlvHdPH9MH77sxbjohh3nZsRgs/E0ik+9vxww
   ZpLTPabPdtastdxH1GLqfIhj+vr6pEESH0X4nLVs4Xtx4FNnW6lyi9rzj
   w==;
X-CSE-ConnectionGUID: ZmosobeMTC+YdzJ64SR5NQ==
X-CSE-MsgGUID: zzekhU8rSZyS2YMZiZFyaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="64642492"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="64642492"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 01:47:08 -0700
X-CSE-ConnectionGUID: JhcM/DcoTZ+Tfj2mVzB75w==
X-CSE-MsgGUID: LU3zOQBhR8KAP8+bKbMegg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="229909794"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.106])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 01:47:05 -0700
Date: Tue, 14 Apr 2026 11:47:02 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>,
	gregkh@linuxfoundation.org, ethantidmore06@gmail.com,
	nayana.mariyappa@gmail.com, s9430939@naver.com, kees@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: os_dep: avoid NULL pointer
 dereference in rtw_cbuf_alloc
Message-ID: <ad3_Bmo-t4ZyXXzQ@ashevche-desk.local>
References: <20260413224417.5674-2-shyamsunderreddypadira@gmail.com>
 <20260414071308.4781-2-shyamsunderreddypadira@gmail.com>
 <ad3wxbGGPxxm72_6@ashevche-desk.local>
 <ad3zDOhTjfwy_vj9@stanley.mountain>
 <ad30An8Oi_D-UTB2@stanley.mountain>
 <ad34vKH8FhDIWijv@ashevche-desk.local>
 <ad370g5G9eUWSX_E@stanley.mountain>
 <ad3-Yhh2kPsbYILC@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad3-Yhh2kPsbYILC@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Apr 14, 2026 at 11:44:22AM +0300, Andy Shevchenko wrote:
> On Tue, Apr 14, 2026 at 11:33:22AM +0300, Dan Carpenter wrote:
> > Really _obj() can't be ZERO_SIZE_PTR either, or if they are then it's
> > very difficult to dereference them since they don't have any struct
> > members.
> > 
> > The main way that ZERO_SIZE_PTR bugs show up is with strings and NUL
> > terminators.
> 
> Wouldn't it be the problem for
> 
> struct foo {
> 	u32 baz[];
> };
> 
> ?

In any case the __alloc_objs() is defined as

        const size_t __obj_size = size_mul(sizeof(TYPE), COUNT);        \
        (TYPE *)KMALLOC(__obj_size, GFP);                               \

Supplying COUNT as 0 will lead directly to ZERO_SIZE_PTR. No?

-- 
With Best Regards,
Andy Shevchenko


