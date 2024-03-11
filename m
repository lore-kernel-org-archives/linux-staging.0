Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07BA56B70;
	Mon, 11 Mar 2024 23:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710198302; cv=none; b=DTsiZW5PIABhw1rLehx73WLiUNQvRqsZAETjRaYq0kExlvIj9sj2MZBoihljalR07Oo1i2yy4olNnZlCdqYp9833/UpwImDA6GZf72NV4qSBAM0SoeG46DRYNHfZ0DE1/CcWFbQTDaTQ8DCu9fpwTYi8gKO2k5KgsLLaJADu1g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710198302; c=relaxed/simple;
	bh=1vGwppsSXiylo9flONhUS6XTqnkONv7hQPfkSQv9Flc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cg1WWqL55Yi0U8ntJTUDZPKpaIoRQg9/tzrXVLn9jksBL/H4PXH0iGGvxDcak0RZqX3Z6BySOXNJb1J81MMqp1V33Hefhy494uARjr3J/IsWvikl3scIsVsw1jXYMJo/ierJNK4xKLgqi1LtW/A/4ET/2atYeUk3Aq2RApuGuFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wefgn3vW; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wefgn3vW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710198299; x=1741734299;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1vGwppsSXiylo9flONhUS6XTqnkONv7hQPfkSQv9Flc=;
  b=Wefgn3vWQ+AsLaG1aEhxNGCglc526xqsUneH+zc6oORM7TeLv7Qjj4kQ
   eMwUe7dFbVqWqp9y0g2NER2kxq2oxL9FdntwwyNJUuzgVtpXD/+O3AGoT
   4FVw4YrjYnl876Tnz8arQiRtdTBgmlF27CsEFFw6ZWDnFmsva2YOkG5Vp
   s3CRvlbyX7BDBRAcjidZKarmhyPZM97KwLZ9+EsmYybR4CaxHK3faiihr
   3HX3E/S6ozHLYpR64yXvw9YOLDmSlBK5Mw+QnEAbtIeZf6ETZcw/GlFAA
   6qT+SvmvU3Vqi9ngEscNaqVcCJJivYcx21IgyJ03aG2SG6EfvzVtYr22X
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="16289841"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="16289841"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 16:04:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="11753104"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.212.137.71])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 16:04:57 -0700
Date: Mon, 11 Mar 2024 16:04:56 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Dorine Tipo <dorine.a.tipo@gmail.com>
Cc: gregkh@linuxfoundation.org, pure.logic@nexus-software.ie,
	johan@kernel.org, linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: Add blank line after struct declaration
Message-ID: <Ze+OGOEcpbrl7HJL@aschofie-mobl2>
References: <20240310053718.6435-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240310053718.6435-1-dorine.a.tipo@gmail.com>

On Sun, Mar 10, 2024 at 05:37:18AM +0000, Dorine Tipo wrote:
> Add a blank line after the loopback_class struct declaration to silence
> checkpatch warning Please use a blank line after

Hi Dorine,

I think you have a few patches posted where using a similar
phrase '...to silence checkpatch warning'. 

The phrase is awkward because we never have a goal of silencing
any warnings.  We 'address' them. This checkpatch warning is
reporting something that does not adhere to the kernel coding
style. So, more fitting to say - "...to adhere to the kernel
coding style."  Adding 'Issue found using checkpatch' or 
the actual checkpatch warnging is commonly added.

When you are addressing checkpatch warnings, you can bet you 
are not the first one to address it. So, you can search on
previous commit messages and see what was well received, and
if you search on Lore history, you can also see what was not
well received. The Outreachy mailing list is a treasure trove
of checkpatch commits. 

This, linked in the First Patch Tutorial, is helpful -
https://kernelnewbies.org/PatchPhilosophy

- Alison


> function/struct/union/enum declarations.
> 
> Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
> ---
>  drivers/staging/greybus/loopback.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index bb33379b5297..4313d3bbc23a 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -101,6 +101,7 @@ struct gb_loopback {
>  static struct class loopback_class = {
>  	.name		= "gb_loopback",
>  };
> +
>  static DEFINE_IDA(loopback_ida);
> 
>  /* Min/max values in jiffies */
> --
> 2.25.1
> 
> 
