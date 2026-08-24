Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52F738643B
	for <linux-staging@lists.linux.dev>; Mon, 24 Aug 2026 20:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787603054; cv=none; b=EzpG7KYiwslhMdopxhhwfAd/FgJ71tyaXX9ZB5I+tniL3ETZrkWTHzhz1xz66p6l6/ggg3394kwLA8ZZKO9XZy1adXXUSEfTypjMZBbEC39FFpkwqz+DuvPW60SYrhw98Nzypsiqh2xKDvyv4ZLqo6HlmwLk+BQcxs+NloCEZZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787603054; c=relaxed/simple;
	bh=fiSs8oR/D4/BitaupT5YHmHxn1SU7YiJrGwTZoQ2YCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+G+lAq2kh9MQxdbKzftmrgn1+rQujR3vB17+qarAxIdrkbHmB50dzwzmz7g3xecrOvDtYp9fYQ2jZ0iBO1D6pjTxZ32cXfQjGroSZ1lUkiCJmIiyHm48ulgGynFa21Vpq5tj7iG3RFF19DSd1sTD/IJUr9/yU9ZzdITP0MtJPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WMo8OSdx; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WMo8OSdx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787603053; x=1819139053;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fiSs8oR/D4/BitaupT5YHmHxn1SU7YiJrGwTZoQ2YCI=;
  b=WMo8OSdx0IqoY4HHgo1k62PkKzD5KyzESI8X7GGthzGrqYBK+1QJ/UIQ
   fA+JnOi/G7QmcKqoCj5BgR8kS6LsIVhsuG8FZQjuyx52UuZ2kBDiIe4P6
   txH6XuOzRcexdZFm9Ff5wkqJCvWzCcdkHo2frTq0jsOIdc9xoScsex7RK
   1U5yDmtJ4kjkBPEZc1AtvdGvlZDQENmLULCjyoh18nvqurOLGpXCKz91p
   nnlqAMWZeQo+qu1qwRuIp3WvuCmmnTvMgGfET5Q3ACxhqi8ZzLIFs2O22
   crcnsgpB18Vb9vta7q+6/t/rfVt1z3j6MG6oI6qyousHNHT4/LOWA+jle
   g==;
X-CSE-ConnectionGUID: 5fBQVdZbS1SNAQ+SDcX8Qw==
X-CSE-MsgGUID: WSrzQaaoSO+IXfHpluy5Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87187997"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="87187997"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 13:24:12 -0700
X-CSE-ConnectionGUID: SAuD+I38T5Win4cxeXdb4Q==
X-CSE-MsgGUID: uK66tTaLSECWNb/QbHG+0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="291948245"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.9])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 13:24:10 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3C2FC11FC35;
	Mon, 24 Aug 2026 23:24:21 +0300 (EEST)
Date: Mon, 24 Aug 2026 23:24:21 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: ipu7: fix typo in comment
Message-ID: <aoyodTb0CsV5D1zt@kekkonen.localdomain>
References: <20260822-ipu7-utlization-typo-fix-v1-1-d1e551420be5.ref@yahoo.pl>
 <20260822-ipu7-utlization-typo-fix-v1-1-d1e551420be5@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260822-ipu7-utlization-typo-fix-v1-1-d1e551420be5@yahoo.pl>

Hi Tomasz,

On Sat, Aug 22, 2026 at 06:26:59PM +0200, Tomasz Unger wrote:
> Fix a typo in a comment: "utlization" should be "utilization".
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
> Verified with checkpatch.pl - no new warnings introduced by this change.

The patch is fine but we're about to remove this driver. Therefore I'm not
applying it.

Thanks.

-- 
Kind regards,

Sakari Ailus
