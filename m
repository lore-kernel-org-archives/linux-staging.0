Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21CF1C6FF5
	for <linux-staging@lists.linux.dev>; Sun,  5 Jul 2026 06:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783234022; cv=none; b=gvMLeWoWiUwnc7tqPk3vx35hWVUDB2FkEiCrAoXSB1uvoQ+bJst1e9gQq/Br9r0sIwm1+2dZRdEDGtWrhWaTQHNvYYhqx53gFSrQj76sNufqZezcwgUaSd8CvJ0azakBodILtG2OARolwSZtUZRNom3TAsUNzeIEXGQY143s6R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783234022; c=relaxed/simple;
	bh=0szE76Z+FnfS6/9eMRBf8Y5dGc8mSNxnjZ4Hok5rYNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ssFhc2QGu5P+n6rX0WyWqRO+wKX/xJGaQTVXW0WLSLI0N85ILMvo0cBVIbYYHuMee3NxzfZ8xBnLCrifPRaKKaceW5oRwm2EpVmr9b91AybxMgwYbHo803eSAZaodPoLMQSdxybIUYZzWb+9aDGzJN8Vxs3MGj5WcuB3QifrOmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dw7i3TuR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dw7i3TuR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783234020; x=1814770020;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0szE76Z+FnfS6/9eMRBf8Y5dGc8mSNxnjZ4Hok5rYNM=;
  b=dw7i3TuRsv1EKwWeNdV1FdY4f8nKXZ+crZdGDnvPJYYWwwTc+v+XM1gO
   fhqb8+rqV/Ce9fxVH0BaFVEQ8/l8S2pq6oRd57C1ay7QvbsbgTzsGB4Vf
   +EguH1QS/emdHG9N9/T7NNbEBAl5NNJkcPG7JZEghCIRxDAZhjYiYvLo0
   IgbNsu07LH57F4KsaO94oQUJEJzosu6C3Ias81ZULZKrm6l5ccXrEcFLj
   EqkGjMak9Xw0JqH5UJf1mwnv0W8M3NEoc5kZaeN99m6nhhc6QpAqq8FUP
   Zy5mXB+rlqrQk1zH4hu8DKnwfxfs3EjH8m/0g3TqTE64h+RmjZK9EhywQ
   A==;
X-CSE-ConnectionGUID: jQCml25VTYqnyRELlJihLA==
X-CSE-MsgGUID: eYB0pAYKTu2UxO/MEQaSKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11837"; a="83008310"
X-IronPort-AV: E=Sophos;i="6.25,148,1779174000"; 
   d="scan'208";a="83008310"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 23:46:59 -0700
X-CSE-ConnectionGUID: +Pe+6q0QTIido+0eN8X49w==
X-CSE-MsgGUID: PI7pShNwQJ2y7ycec0qG1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,148,1779174000"; 
   d="scan'208";a="254082219"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.6])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 23:46:56 -0700
Date: Sun, 5 Jul 2026 09:46:54 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Ruziev Miraly <miraly.dev@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	andy@kernel.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: atomisp: flatten pre_power_down logic and
 clean up staging code
Message-ID: <akn93mYvptws9heK@ashevche-desk.local>
References: <20260704190854.114172-1-miraly.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704190854.114172-1-miraly.dev@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Jul 05, 2026 at 12:08:54AM +0500, Ruziev Miraly wrote:
> Refactor atomisp_mrfld_pre_power_down() by removing the redundant
> nested 'else' block, making the function structure linear and easier
> to follow.

I don't see this. There is no 'else' removal, what did I miss?

> Keep both error logging branches intact to ensure consistency
> in hardware failure reporting.
> 
> In addition, fix minor checkpatch.pl style warnings in the same file
> regarding code alignment and hanging open parentheses.

These are a few things that probably need to be split to different patches.

...

>  	struct pci_dev *pdev = to_pci_dev(isp->dev);
>  	u32 irq;
>  	unsigned long flags;
> +	int ret = 0;

Don't do like this. It makes code harder to maintain and prone to mistakes.

>  	spin_lock_irqsave(&isp->lock, flags);
>  
>  	/*
>  	 * MRFLD HAS requirement: cannot power off i-unit if
>  	 * ISP has IRQ not serviced.
> -	 * So, here we need to check if there is any pending
> -	 * IRQ, if so, waiting for it to be served
> +	 * Wait for pending IRQs to be served.
>  	 */

Hmm... Why is this wording changed?

>  	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
>  	if (!(irq & BIT(INTR_IIR)))
> -		goto done;
> +		goto power_down;
>  
> +	/* Clear and check interrupt status registers */
>  	atomisp_css2_hw_store_32(MRFLD_INTR_CLEAR_REG, 0xFFFFFFFF);
>  	atomisp_load_uint32(MRFLD_INTR_STATUS_REG, &irq);
> +
>  	if (irq != 0) {
>  		dev_err(isp->dev,
>  			"%s: fail to clear isp interrupt status reg=0x%x\n",
>  			__func__, irq);
> -		spin_unlock_irqrestore(&isp->lock, flags);
> -		return -EAGAIN;
> +		ret = -EAGAIN;
> +		goto unlock_exit;
>  	}
> +
>  	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
>  	irq &= BIT(INTR_IIR);
>  	pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
>  
>  	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
> -	if (!(irq & BIT(INTR_IIR))) {
> -		atomisp_css2_hw_store_32(MRFLD_INTR_ENABLE_REG, 0x0);
> -		goto done;
> +	if (irq & BIT(INTR_IIR)) {
> +		dev_err(isp->dev,
> +			"%s: error in iunit interrupt. status reg=0x%x\n",
> +			__func__, irq);
> +		ret = -EAGAIN;
> +		goto unlock_exit;
>  	}
> -	spin_unlock_irqrestore(&isp->lock, flags);
> -	return -EAGAIN;
> -done:
> +
> +	atomisp_css2_hw_store_32(MRFLD_INTR_ENABLE_REG, 0x0);
> +
> +power_down:
>  	/*
>  	 * MRFLD WORKAROUND:
>  	 * before powering off IUNIT, clear the pending interrupts
> @@ -490,9 +497,10 @@ static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
>  
>  	atomisp_msi_irq_uninit(isp);
>  	atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_LOW, true);
> -	spin_unlock_irqrestore(&isp->lock, flags);
>  
> -	return 0;
> +unlock_exit:
> +	spin_unlock_irqrestore(&isp->lock, flags);
> +	return ret;
>  }

Are you sending an update on top of your v1?! You must use the same base for
the each version of the patches. The incremental changes in Git means something
different.

...

> @@ -839,7 +847,7 @@ static int atomisp_register_entities(struct atomisp_device *isp)
>  	/* Register internal entities */
>  	for (i = 0; i < ATOMISP_CAMERA_NR_PORTS; i++) {
>  		ret = atomisp_mipi_csi2_register_entities(&isp->csi2_port[i],
> -			&isp->v4l2_dev);
> +							  &isp->v4l2_dev);
>  		if (ret == 0)
>  			continue;

This change is not related. Split it.

...

> @@ -847,8 +855,7 @@ static int atomisp_register_entities(struct atomisp_device *isp)
>  		dev_err(isp->dev, "failed to register the CSI port: %d\n", i);
>  		/* deregister all registered CSI ports */
>  		while (i--)
> -			atomisp_mipi_csi2_unregister_entities(
> -			    &isp->csi2_port[i]);
> +			atomisp_mipi_csi2_unregister_entities(&isp->csi2_port[i]);
>  
>  		goto csi_and_subdev_probe_failed;
>  	}

As previous, should be in another patch.

-- 
With Best Regards,
Andy Shevchenko


