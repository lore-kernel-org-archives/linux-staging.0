Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9430295DA6
	for <linux-staging@lists.linux.dev>; Tue, 21 Apr 2026 16:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776790338; cv=none; b=oyjiWWCFKw3Y5tg1aLYWLLBRInxlW5oGZIER7fYHkjkDNduaS6uFN5mJY0vEF2C0+5cQK2rPA06hMdxCFc30siQkAUskZB/a1Omtrmu8mxS4r+TvnqOvSrR92SJJSdKyJm1jHoNMdKMJypUTvo/72dCYPy2tnJAa9U7APri59IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776790338; c=relaxed/simple;
	bh=PlOny4vRH1ucGjNqEV8TWJMOlQe6fI56+SKom77gcxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gnp3HnZFaAOEFoPFBaemKXlIOA0bZsGRkI5iUhm3i1k6Do6o6JlWEdTGqcP1wjicCiQzOtt+ssUnbm5vVKpdWtBlNzhk2s4fG7VU/VNbzDy0DF26YrTG+tN8hU/QFV37eHhCmckY+4Rtcj5Cc+NpJMDuzbaJPLdUk1/jyWNU62Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zp8syc1F; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zp8syc1F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776790337; x=1808326337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=PlOny4vRH1ucGjNqEV8TWJMOlQe6fI56+SKom77gcxM=;
  b=Zp8syc1FX0paUqcjxJFSLKcsQlrs2WRQ0pMeeKRG9Zu+J+Zb1thcJdDm
   gJ0hr6Cxps9h2JQz7RvNu5JA+V0N9oBMQpi2ZOnWmF+TuQXEIsGKoy7Lw
   DqVXEwzE8wKEiVHg9C2X6Zi0cHQmYJcb//9oBJ8gMqbL05G3ms+Xg5l0P
   OInedUWDUtP7H9M8lRNq87T8aawvNyG8+yglF8aJ52Jtj6UydOLY8YCkm
   FMH17cs7T1F/2MzecHKVJ1yLewZPiqxKVVLZMnO1ET0j+mU5Doj0qC/rH
   fAydCOGr2ByYLXkH80h+jFg0Uja4YABZBhPo4HPWGW9Sh01JNDndzV55P
   g==;
X-CSE-ConnectionGUID: bhhacsN9TEe/GujZ1K2c9g==
X-CSE-MsgGUID: nkqxbaOVScmmpkmlOF4TZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="76894057"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="76894057"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 09:52:15 -0700
X-CSE-ConnectionGUID: AE6qVMuaSbiI6r6QW7simQ==
X-CSE-MsgGUID: hwwZfCMKT9KeQEJWSSEkPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="232001119"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.135])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 09:52:13 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D64DF120D05;
	Tue, 21 Apr 2026 19:52:10 +0300 (EEST)
Date: Tue, 21 Apr 2026 19:52:10 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Pedro Pontes <pontescpedro@gmail.com>, hansg@kernel.org,
	gregkh@linuxfoundation.org, mchehab@kernel.org, andy@kernel.org,
	kees@kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: use kmalloc_objs for array allocations
Message-ID: <aeerOursgkNeoMQo@kekkonen.localdomain>
References: <20260416134214.130665-2-pontescpedro@gmail.com>
 <CAHp75VeyCRCdR4VD8+KM33zYv3OMBSRGaeSE5B2Wc5hn9Q9hEA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VeyCRCdR4VD8+KM33zYv3OMBSRGaeSE5B2Wc5hn9Q9hEA@mail.gmail.com>

Hi Andy,

On Thu, Apr 16, 2026 at 09:26:47PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 16, 2026 at 4:46 PM Pedro Pontes <pontescpedro@gmail.com> wrote:
> >
> > Convert manual kmalloc() multiplications to the modern kmalloc_objs()
> > interface to improve type safety and prevent potential integer
> > overflows.
> 
> There is already a patch doing it in a slightly better way. Have you
> followed the mailing list?

I must have missed it, too. :-\

> Please, better to help with this driver is to subscribe to the mailing
> list and review already
> submitted ones.

-- 
Regards,

Sakari Ailus
