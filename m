Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF703306486
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 11:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781521953; cv=none; b=cVgcPW3nEv4mPh+bo/KzfgEeMsebSubetyQ2iZP63TKYkTbufdSzhNSzr7dGKRj4y1s8EBZqGmFHbfJNusb6qUBD76FDw9FlEmj+tKWWC8rNeT3okuIZh02nVV5bK/LNhNLMGOhaDCQqLsWCu4hjJiV83UxWT9O0ZHD27Iav1xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781521953; c=relaxed/simple;
	bh=bOEzvUcDtX5+6116v382NIYxku0vbuP0satudsWACWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=htgxaqTleAHOfnpFlwMndK7/8bt9qK2A1Qh1vOpoeA3t+5+n1Lvmy6/hIWE71XqxghH+c0vAqIcGCMrAOAlRUEM3kx+UDMdethM2hdKb0iDr4mVkIuv9ftpa3aNnIdGRcdNzgOuiWJCZd/kDtu5Ih0bOA7GuoB/r95AV5kuLFsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YpR0TU3R; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YpR0TU3R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781521952; x=1813057952;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bOEzvUcDtX5+6116v382NIYxku0vbuP0satudsWACWg=;
  b=YpR0TU3Ryj866uE2j7Nb3MfoUFtrR4SnYp7masXFepsbBugRfx3TAxAy
   GYk98PPoggkplG7Ept0X/bcfI8quCG2LjlQVqMRutMuMrUa3bfLbILaJx
   v5kahH6JOxclpTDqJf3DOk7scwZPkl8bpWpwuXQZGgXmewbUvU8DMudeb
   IZ5/naATjI0vHGaDBa7uMwEBgrIdNC5Q8P5iSxklZ39ZBejoeR9tK0oYP
   wX1eQFqCCYGCHbZG2MTwMUcOmf2NQAS5E/Fw3Pgpbx6S12/kgQ9zpU6BF
   oeUwiahYr+vIlESffmVSfoj6D410BY3/OgaQeTs1FLSKK8DkK6neca18k
   g==;
X-CSE-ConnectionGUID: iarpQUs9SOyFA7T/jINbEw==
X-CSE-MsgGUID: FSMILSG9QrajMpfqIMLPIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="81397149"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="81397149"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 04:12:31 -0700
X-CSE-ConnectionGUID: UdwlmRAWQzGX2UaOgfHjag==
X-CSE-MsgGUID: xFAL/hNeSyGEIOcvIbk1TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="277647473"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 04:12:28 -0700
Date: Mon, 15 Jun 2026 14:12:25 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dawei Feng <dawei.feng@seu.edu.cn>
Cc: andy@kernel.org, error27@gmail.com, hansg@kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, abdelrahmanfekry375@gmail.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, jianhao.xu@seu.edu.cn,
	Zilin Guan <zilin@seu.edu.cn>
Subject: Re: [PATCH v2 2/2] media: atomisp: fix memory leak in
 atomisp_csi2_bridge_parse_firmware()
Message-ID: <ai_eGXhKhsV1fhlC@ashevche-desk.local>
References: <20260615072841.3113700-1-dawei.feng@seu.edu.cn>
 <20260615072841.3113700-3-dawei.feng@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615072841.3113700-3-dawei.feng@seu.edu.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 15, 2026 at 03:28:41PM +0800, Dawei Feng wrote:
> atomisp_csi2_bridge_parse_firmware() initializes isp->notifier and may
> allocate async notifier connections via v4l2_async_nf_add_fwnode_remote().
> However, these resources are currently leaked if a subsequent entity
> registration or probe step fails, or when the driver is removed.
> 
> Fix this by introducing dedicated helpers to clean up and unregister the
> async notifier state. Call atomisp_notifier_cleanup() to release the
> allocated connections in both the entity registration failure path and the
> overall probe unwind path.
> 
> Additionally, invoke atomisp_notifier_unregister() during the device
> remove path to ensure the notifier is properly unregistered from the V4L2
> core before its underlying resources are freed.

> Fixes: 8d28ec7e9145 ("media: atomisp: Add support for v4l2-async sensor registration")
> Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
> Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>

Same comment as per previous patch regarding to SoB chain.

-- 
With Best Regards,
Andy Shevchenko


