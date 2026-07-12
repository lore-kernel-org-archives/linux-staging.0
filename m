Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EB222D7B9
	for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 14:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783866024; cv=none; b=mIwzRLIoYagmqRg1OwOmoLcaehRDiyXEjEmqdqvK7F5E4Xt4sAyUaq6Q0TghIAQNtO2u3lywMfcCGE5uUw93wbEf9C6gFm9ZhZkHnKToHZVaTPKPgeLLKpgYEAtIvj0pyXTAzavq980Am/YQYv6NHPmYJSFjtB3us+kb8792Sdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783866024; c=relaxed/simple;
	bh=5Nhcnc4ezLPy8605Kf9M8EI1NlsLUYRMPtnyY/wPBAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WA4AYvlqjvo8vYZAy2ZJLK5BcVeSPm2a5gpv5O33BDzuq+gBXFvYApu+joKu+rP4uLi77LAi+KtXO75Vzt/jVTH87b/x6PQj7M5eBc5Q0Id51PgadrLxbH17P54zIZOeaOQmUzD2BreIWOagtkqHdhdMdkZATL53L4pIKfHiauM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bAnVOMr+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bAnVOMr+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783866023; x=1815402023;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5Nhcnc4ezLPy8605Kf9M8EI1NlsLUYRMPtnyY/wPBAk=;
  b=bAnVOMr+UbCRZlQfQzKHSRnT2YoWW3qWePzlWNO32uFxv9C8rJvaDbZH
   5H5B5zOGEtiqyLd6iAK8HIB/KN4mwBDECwI9N75ndOCwXc/KRlGnq/5zj
   VFcGu1kEo3H20uzAITWuBFrleLrkNQvkXlyfXOzDn3+k4CJ4Zf+Ub0I4P
   8z88+ZlkVQPfEz5M5zHtAhSckiS4dnlfDDpwSLtqmheBr0dgQSVKHfnAQ
   jfoHkUOQuzi+xIMeKKO1LbyaJtJN0Fve0sNovNAn0VUct7JqGvGqYoVNS
   4FbVXd19ERJiFlIoDxPRd1B3qFpflJakCNSWhG4OwuRc50qfQEL2sun+7
   A==;
X-CSE-ConnectionGUID: cX6JN1HLTDOwVKuff8mJSw==
X-CSE-MsgGUID: kvZN+Y1LQ2Kdj8HIyXrZww==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107295052"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="107295052"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 07:20:22 -0700
X-CSE-ConnectionGUID: 4tJoZCGGRTS6U1yqQB2mNA==
X-CSE-MsgGUID: 4yjcvf6eSzinApMmCgAc3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259628589"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 07:20:17 -0700
Date: Sun, 12 Jul 2026 17:19:55 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dileep Sankhla <dileepsankhla.ds@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	chelsyratnawat2001@gmail.com, abdelrahmanfekry375@gmail.com,
	matt@mattwardle.net, azpijr@gmail.com, error27@gmail.com,
	kees@kernel.org, pontescpedro@gmail.com, starpt.official@gmail.com,
	karthikey3608@gmail.com, roehling@debian.org, feng@innora.ai,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: Drop unnecessary else block
 after return/break
Message-ID: <alOii3vwmkWGfVNx@ashevche-desk.local>
References: <20260706103810.71919-1-dileepsankhla.ds@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706103810.71919-1-dileepsankhla.ds@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jul 06, 2026 at 04:08:10PM +0530, Dileep Sankhla wrote:
> Remove redundant else blocks following return or break statements. As
> control flow exits in these cases, the else branch is unnecessary.
> Dropping it improves code readability.
> 
> No functional change.

...

> +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)

>  		spin_unlock_irqrestore(&isp->lock, flags);
>  		return -EAGAIN;
> -	} else {
> -		pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
> -		irq &= BIT(INTR_IIR);
> -		pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
> -
> -		pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
> -		if (!(irq & BIT(INTR_IIR))) {
> -			atomisp_css2_hw_store_32(MRFLD_INTR_ENABLE_REG, 0x0);
> -			goto done;
> -		}
> -		dev_err(isp->dev,
> -			"%s: error in iunit interrupt. status reg=0x%x\n",
> -			__func__, irq);
> -		spin_unlock_irqrestore(&isp->lock, flags);
> -		return -EAGAIN;
>  	}
> +
> +	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
> +	irq &= BIT(INTR_IIR);
> +	pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
> +
> +	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
> +	if (!(irq & BIT(INTR_IIR))) {
> +		atomisp_css2_hw_store_32(MRFLD_INTR_ENABLE_REG, 0x0);
> +		goto done;
> +	}
> +	dev_err(isp->dev,
> +		"%s: error in iunit interrupt. status reg=0x%x\n", __func__,
> +		irq);
> +	spin_unlock_irqrestore(&isp->lock, flags);
> +	return -EAGAIN;

I would really avoid touching this for now. This is non-straight workaround for
some platforms and it needs real care on what's going on and how to make it
look better. Since your patch does not targeting that, it's doubtful that this
change is helpful.

...

>  	if ((*flags) & INPUT_SYSTEM_CFG_FLAG_SET) {
>  		// Check for consistency with already set value.
> -		if ((*lhs) == (rhs)) {
> +		if ((*lhs) == (rhs))

Unneeded parentheses, also see below.

>  			return INPUT_SYSTEM_ERR_NO_ERROR;
> -		} else {
> -			*flags |= INPUT_SYSTEM_CFG_FLAG_CONFLICT;
> -			return INPUT_SYSTEM_ERR_CONFLICT_ON_RESOURCE;
> -		}
> +
> +		*flags |= INPUT_SYSTEM_CFG_FLAG_CONFLICT;
> +		return INPUT_SYSTEM_ERR_CONFLICT_ON_RESOURCE;
>  	}

In this case it's better to toggle the conditional to follow the pattern to
check for errors first.

		if (*lhs != rhs) {
			*flags |= INPUT_SYSTEM_CFG_FLAG_CONFLICT;
			return INPUT_SYSTEM_ERR_CONFLICT_ON_RESOURCE;
		}

		return INPUT_SYSTEM_ERR_NO_ERROR;

And yeah, looking at the below, you might want to have a common helper for
this. So, perhaps don't touch these three cases for now. Or we can leave them
as in your patch, it's up to Sakari and you.

...

> +		/* TMP: check discrepancy between nr of enqueued
> +		 * parameter sets and dequeued sets
> +		 */

When moving comments with a wrong style, fix the style at the same time.

		/*
		 * TMP: check discrepancy between nr of enqueued parameter sets
		 * and dequeued sets.
		 */

...

> +		assert(g_param_buffer_enqueue_count < g_param_buffer_dequeue_count + 50);

What will this do in the kernel environment? Perhaps first you need to check that and
most likely change the assert():s to something else?

...

> +		ia_css_bufq_enqueue_psys_event(
> +				IA_CSS_PSYS_SW_EVENT_BUFFER_ENQUEUED,
> +				(uint8_t)thread_id, (uint8_t)queue_id, 0);

Why do we need the castings?

...

Half of the patch is good to go, and the other needs more work and real work on
the driver.

-- 
With Best Regards,
Andy Shevchenko


