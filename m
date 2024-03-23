Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421DD610B;
	Sat, 23 Mar 2024 04:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711167015; cv=none; b=NXoTIx19ONpoiGBaeUsF7KlL3D2BsBod9OmFnOKLaQ/W+tyuPlhVyJGmW/SzyvwE6I7r1X/OX2lnfXN91tD7AF0adqt+xgDPhWmD7rn/sUy3n920wboEv9C9oxejxE17uc0MmrosXkoctiUMdJvJ8CWtysxvwOQEPkyvTtkA+gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711167015; c=relaxed/simple;
	bh=npx0xi/SL5eNh92oHzNrAfnEp/6E8qDeQ134lzqBjCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mg6um2f4G5DE95a9Q1+15nkBBF3DS+1+SVyIj6/lKngcCXhrQ/08cwz8HYmc/zmRka0VLT2+Mt/xsaxWn20bqE+gQE6w9ozhC3tDSsiWGUs3PkTrSNUhxp7clWa6STEYrvBz+inq7Ws7UvH2nkG8sfg0yKUJ3XAxBurWYEjbi8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZzNrKUWv; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZzNrKUWv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711167013; x=1742703013;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=npx0xi/SL5eNh92oHzNrAfnEp/6E8qDeQ134lzqBjCI=;
  b=ZzNrKUWvm6NwixJdJ4rgugr8KqdpIGn1EPUvpnxT22aDwDi4BMoQNKPN
   2GJ0vJF6OgvmaPH6P1Ee+Rp/AghS2/6DGLzfhUQSvy8FJJc93ocNdDABk
   ltoSKHhwwbLyPF0V+FmmmBUGXimdfMTP7pkB6goyvRaSotn0kX4sHeMQx
   8XDkKSC4VCfdAHvEjYGXqFcTXQYFSTyp2obDjyMkG2NRCrkq4k9isg5FV
   QgizzFMsRQh6TXsdqAIQCg+zakJdDnCe43agD3UmuAyGxf5uk108qHQms
   3JIvy8nB/bbPqvVtiSLNpY3rlItMcQQ96KBKPP7LfyhYnA2Ijf5LO0rCG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6167897"
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; 
   d="scan'208";a="6167897"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 21:10:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; 
   d="scan'208";a="52543987"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.209.88.188])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 21:10:12 -0700
Date: Fri, 22 Mar 2024 21:10:10 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Dorine Tipo <dorine.a.tipo@gmail.com>
Cc: marvin24@gmx.de, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: nvec: Fix documentation typo in static
 irqreturn_t nvec_interrupt()
Message-ID: <Zf5WIiSAXKAIlBC1@aschofie-mobl2>
References: <20240317120947.2923-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240317120947.2923-1-dorine.a.tipo@gmail.com>

On Sun, Mar 17, 2024 at 12:09:47PM +0000, Dorine Tipo wrote:
> Correct the spelling of initialisation with was misspelled in the
> documentation

Thanks for the patch Dorine,

Please tidy up both commit msg (so it doesn't line wrap) and the
commit log. (s/with/which and add a 'hard stop' ie. a period at
the end of your sentence.) If the issue was found using a tool,
say that. "Issue found using checkpatch."

There's a section in the First Patch Tutorial about following the
style of the subsystem or file. Please check it out.

--Alison

> 
> Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
> ---
>  drivers/staging/nvec/nvec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 282a664c9176..b4485b10beb8 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -712,7 +712,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>  	 * TODO: replace the udelay with a read back after each writel above
>  	 * in order to work around a hardware issue, see i2c-tegra.c
>  	 *
> -	 * Unfortunately, this change causes an intialisation issue with the
> +	 * Unfortunately, this change causes an initialisation issue with the
>  	 * touchpad, which needs to be fixed first.
>  	 */
>  	udelay(100);
> --
> 2.25.1
> 
> 
