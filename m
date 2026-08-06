Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD2C2F8E99
	for <linux-staging@lists.linux.dev>; Thu,  6 Aug 2026 23:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786057590; cv=none; b=V2umBY969qofk+CSfQJ/2vNyDFyy7fAFPbPfJvFAhetPNWv79wdbeB9d9dJXv4xZ5jMyhm2s0vXQj9eINxqmot+lOLV1xQaZG4zkSbXvd/HcNTmHBrpbI4/aNO2JhfmLGSB8LRJbxG4ThspQ6R8thEKpkWrecjutkr1sepP+0pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786057590; c=relaxed/simple;
	bh=wGIDycR52k02hTBR2JMMfYfFb19M6FVrZWsU4A9nh80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HI43F5onBluuYSgabjKGnkuEu/07veNHHM1O0cD3KtqMbDhGY08BujEgyQ90lEG6Tu4x98m0ZUpWdJWKLFHvOMA1+3wPnyZnSOY5oWf6A3LvME/tYoM8Y/e88erJt20ON28q1bNajWLhk6Gqp7GehrFc8qhhl4RS0CnNY4tKnNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ndnc3dHe; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ndnc3dHe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786057589; x=1817593589;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wGIDycR52k02hTBR2JMMfYfFb19M6FVrZWsU4A9nh80=;
  b=Ndnc3dHeRXibf7mv4jnH1xy8mDBLpaEy05EuAScOYUVpCCcm5RGEUYb5
   bBw6dlazKqM02aDZo9CfvWNmhQpiOGZ/oQx6SiMZ1B+uWYjHJBaWHH9aI
   VRDSympMBRIi37z0F5T7sMjY7566Ki7Tk+p9ybmzbBUXQqbMc+8ODKPRD
   RZqjhf0Ihnb8kxgcnRKtX3kOrC6+1bXHmaM11K0n76Y2CBmSJDHLsIrtm
   MDdhUbRbYezLVaDPonAH8uXdf+mJYwBbEOrZNUi8YRlScquluZofIZJkx
   FxKAgvYcFcI1QonSAaSO1rBVUfcVoauk1Nc2N0TyWg4JK2bm00bPbx1V0
   Q==;
X-CSE-ConnectionGUID: hV0ub8mrSZaTEQFn8pmGwQ==
X-CSE-MsgGUID: M/nN8Y+DT8uoeXbMHliYbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86777806"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="86777806"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 16:06:28 -0700
X-CSE-ConnectionGUID: mPvDfYinRLeBIkILMpAimg==
X-CSE-MsgGUID: QMjGvVDRRUGsyLMD01CvWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="257928356"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.50])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 16:06:26 -0700
Date: Fri, 7 Aug 2026 02:06:23 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sergei Stepanenkov <sergei_stepanenkov@disroot.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, andy@kernel.org, hansg@kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com
Subject: Re: [PATCH] staging: media: atomisp: move constant to the right side
 of comparisons
Message-ID: <anUTbyNk4H7Qet29@ashevche-desk.local>
References: <20260723155027.124722-1-sergei_stepanenkov@disroot.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723155027.124722-1-sergei_stepanenkov@disroot.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 23, 2026 at 12:50:20PM -0300, Sergei Stepanenkov wrote:
> Fix all checkpatch warning occurences
> "WARNING: Comparisons should place the constant on the right side of
> the test" in folder drivers/staging/media/atomisp/pci
> 
> Signed-off-by: Sergei Stepanenkov <sergei_stepanenkov@disroot.org>
> ---
> Hey, this is my first patch, I appreciate any feedback, thanks!

Right.
Please, read lore.kernel.org linux-media@ archives against this driver to
understand what to do with this patch.

Also, if you are in a group that is mentored, tell to the mentors to stop
looking into this driver by a newbie. This driver has much more urgent tasks
to do and it's not trivial, it also requires a real HW to be at hand to test.

...

> -	if (0 != ia_css_pipe_get_info(asd->stream_env[stream_index]
> -		.pipes[pipe_index], &info)) {
> +	if (ia_css_pipe_get_info(asd->stream_env[stream_index]
> +		.pipes[pipe_index], &info) != 0) {

The style is still wrong.


>  		dev_dbg(isp->dev, "ia_css_pipe_get_info FAILED");
>  		return -EINVAL;
>  	}

The above most likely already or should return a Linux error code in which case
the whole thing should be refactored,

	ret = ia_css_pipe_get_info(asd->stream_env[stream_index].pipes[pipe_index], &info);
	if (ret)
		dev_dbg(isp->dev, "ia_css_pipe_get_info FAILED");
		return ret;
	}

-- 
With Best Regards,
Andy Shevchenko


