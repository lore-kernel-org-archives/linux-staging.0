Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E4B3537FB
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 09:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777886590; cv=none; b=s5QriHpPUlzvs/adwQaj0PCC4W15i5G702pdNUH97cjDF4vnP+aGq5MSxf222Y6twwX5vYVJD3phF8T/S5apeDQ8OcEwSs3ZVT/Fl/i1rPpLqx3Epmd/ICzPHQuYhWdCH449Rfmm62sMMs1WWujdSxlLK+/Auq9iC/g+QyKy5fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777886590; c=relaxed/simple;
	bh=nZb0z9pTsXJI05TJH4UO/YC/GWTdUKG+HJaCP67coDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVt+0D8wHWx3EyHWbRF6jGzsTRsrarYI1lIXlIiWW9qbbQRfCuz2u4LQBKchlm689C5dgl0YH6/RBiu9nTIJPe0yxsA5u9sQu/j1AmcTZW4VnIBvsVfVFjqLbXJg1Y8ajebyhhid605dIVsXfU7XuFt3Ip2GatsqfDN3tngfB5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdlEHcn/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdlEHcn/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777886589; x=1809422589;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nZb0z9pTsXJI05TJH4UO/YC/GWTdUKG+HJaCP67coDE=;
  b=CdlEHcn/DhzhZnuI0POrhjPIfDpijzPHNQEuD2zVbbqtHReBjnaJ7lg9
   673UrjEQtMjZsImVeSu/99ux3c9tr6T7r+3Js5WdExy0D+aybUXu8hh5m
   UzGxdaAuWh+maR2ezG/wXYjDcPYU9aIUmiKFn9RhuE31c3J9XChu+hanL
   lcCfqasZ08IIR78flCV0wiAvAcVI4XoF55FIuBKUFrbHVhNf0q/13CcOn
   YY9q3PlqlxU+fDL4nWArdE1NFZLShssCwXC+dbZ7194VwePiXBiG3SCYn
   4fHP/azReD/X50yimxAbJoCkDFS7yb3KHuuq7D6hEfdbJKTUhedxhgEM1
   w==;
X-CSE-ConnectionGUID: ivlKERGZTsK+yJl/DZX35w==
X-CSE-MsgGUID: BwVnMr7HSACJwoSfQucc7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="82589819"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="82589819"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 02:23:08 -0700
X-CSE-ConnectionGUID: lMWpqpVDQA6m+lgKQHiWpQ==
X-CSE-MsgGUID: B59DyxOwSSWdP1Kb4r6Dsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="234603399"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.78])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 02:23:06 -0700
Date: Mon, 4 May 2026 12:23:03 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: drop unnecessary else block
 after return/break
Message-ID: <afhldw80eBVTR8Fo@ashevche-desk.local>
References: <20260503172200.94712-1-shyamsunderreddypadira@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503172200.94712-1-shyamsunderreddypadira@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, May 03, 2026 at 10:52:00PM +0530, Shyam Sunder Reddy Padira wrote:
> Remove redundant else blocks following return or break
> statements.As control flow exits in these cases, the

There is a room for more words on the lines. Also respect English grammar and
punctuation, exempli gratia use space after a punctuation.

> else branch is unnecessary.Dropping it improves code
> readability.
> 
> No functional change.

...

Code wise almost good, see below.


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
> +		"%s: error in iunit interrupt. status reg=0x%x\n",
> +		__func__, irq);

Now it may occupy two lines only.

	dev_err(isp->dev, "%s: error in iunit interrupt. status reg=0x%x\n",
		__func__, irq);

> +	spin_unlock_irqrestore(&isp->lock, flags);
> +	return -EAGAIN;

-- 
With Best Regards,
Andy Shevchenko


