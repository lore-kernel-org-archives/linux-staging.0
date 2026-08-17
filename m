Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6293B8BDA
	for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 08:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786954219; cv=none; b=P672zK5rWQ+Sy8671mvROYRMqH3tGm8d09wuAbqxkRK+ZlhUPyploaKaR1st0EcV5ZQK25vV9l4CAPhPm0G36r09KXBpDdWylVLN6bbbOI9I5Jk6NbBy9fCIAejdYL7AD2zGORLZ0qQ9C6HwLflOJ9qg1DA7jsCv53ldmWUy0Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786954219; c=relaxed/simple;
	bh=5OjshCl31AU0mFzLwSGIPUSWkxwiZ7ChZBVrpKdXpS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ILMtPmBsjXA+MV7F8XkrLdtJe4ViFxBCBZbSv7/X84G9gQdER6b0veKrnLC1zGsiyuhw2tEQIT3BWzJqhfzNx9PLBcqJ8x+VFW2bynU0bemGDOI1duefBXBkHFLJ3WQIjpdTcuHexZklmqGSzRPZbY1torciN7unTIgDPzcmZAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GIkFpTKP; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GIkFpTKP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786954218; x=1818490218;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5OjshCl31AU0mFzLwSGIPUSWkxwiZ7ChZBVrpKdXpS4=;
  b=GIkFpTKP0GN+Bz5YwAmq8UBthqoo8xGLnqc8zEqKaz5G2b/vGAwHHcHt
   R/lEErmCwOmwAzD2okabUsm+F69jkArN+Rf8ucdHKoMw0N8YwyAx7St4y
   t9cU0sE7q50mHmGZWxx1wfr0CbwoKTWZEMhPWUo7lmXfcVLjyeT6G8bjg
   hcU2CrFE1AiY0mXJfa8gWkHTujWgQeY8bErX1fvFtlwYKN8orqWQYPxeT
   76ghu18lRT1Q4a+jcQq/iUDDzq1gYVNlU/7LpwprN6ug6AIj8SN51bYgs
   Z1SqQ8OrUmeOH+UablmsYhpbloJo9ol6CRdox4cWzDjvFpFq3gcSRuJSb
   Q==;
X-CSE-ConnectionGUID: qh0gXG49T9CHHPx5i23Mzw==
X-CSE-MsgGUID: psFyFlmaRU25aP4wEOXPGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87184083"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="87184083"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 01:10:18 -0700
X-CSE-ConnectionGUID: GpLHyjooT328beQLkxtzVA==
X-CSE-MsgGUID: RCOFTfauT0SgPPMc63aAaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="269117035"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.67])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 01:10:14 -0700
Date: Mon, 17 Aug 2026 11:10:12 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Rishab Madhugiri <rishab.madhugiri@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	andy@kernel.org, sakari.ailus@linux.intel.com,
	linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, error27@gmail.com
Subject: Re: [PATCH v3] staging: media: atomisp: Use ARRAY_SIZE macro
Message-ID: <aoLB5EUUVP-_XVZF@ashevche-desk.local>
References: <20260816010126.159514-1-rishab.madhugiri@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816010126.159514-1-rishab.madhugiri@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Aug 16, 2026 at 01:01:26AM +0000, Rishab Madhugiri wrote:
> Clean up loop bound calculation by replacing sizeof(bds_factors) /
> sizeof(struct bayer_ds_factor) with the ARRAY_SIZE() helper macro
> to improve readability and maintainability. Move loop counter
> increment to the same line as the for loop and declare the loop
> counter locally.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


