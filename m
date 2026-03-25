Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC4D324705
	for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 08:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774428215; cv=none; b=sJ6FC4bTXxcWiU4sqUKaGrZPYsPWtIXJ8vAonxBYKXlm4wrH2K9BwSd3bYpHTdwQ1x8AASHUAVF8uGGCQzuVaZU9ncam/EkQO8+GD1aPPfaQJtabC/ldHhpnw+q6Af0HVNoHCs/EneEBrGq0zVke6Qv7lzOdfOoC4bdQAuFeYQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774428215; c=relaxed/simple;
	bh=ncrO6JQUjK3dUOugqaArO5iN/w0R0RtmMEPaaBuunm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sr08RqmwrCdmqBefXTVCsqO6Lt7c+Vw/QrCpRj18ean/2fE+qy7U6MxtfyVQ5b9hZ+fYZbyg0j/6PXaEUXdz6DqEyWq6UcUdwFolZBmhZwZtVoPDRgmpGxDLm8AsqKZiGLOryy1iuwb0qEDBSobhPt2ThBiyHNcTT/Wucy4DYew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q+kmQFwb; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+kmQFwb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774428214; x=1805964214;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ncrO6JQUjK3dUOugqaArO5iN/w0R0RtmMEPaaBuunm4=;
  b=Q+kmQFwb1aG3bY67B8rxGjhS+hBcBKZBdTJG2m1IW314jpr90YDgsY7H
   ox5eFInS/bM16ZaT+8QvRj6MxU+PkAnOyerFf+HT/k5RwJ0MSQorHvSF2
   ZyH8K/OwJtqKebA+vpHs67Xm0QWi8/kxKmtnN4iBbxMBk2UbFn53NB0xb
   u7ai7sysuxbsYFK8dNJWdiNTfD+/gcf5vS3fyzwJSpSgg9Zh9L49pUtIE
   GeFR63/x95GI+sTc8ytllJeEbjJFva+qccI2ZiQGoOiWmqhV8QxxQQFpr
   2DgWEuguJ8HordttAJOKgwkn++45SvXiGAOHs8ua4wqGhjd6xHhxrRKPy
   w==;
X-CSE-ConnectionGUID: DU5kQ1SIRoeH8PKzhacjPw==
X-CSE-MsgGUID: cioUmm4dQ02ksvOA+wZJQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75428077"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75428077"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 01:43:30 -0700
X-CSE-ConnectionGUID: 9IdeZU3OQf2ZgJMrHnV5XQ==
X-CSE-MsgGUID: CSWPfrS7R1+5T6MLof0wqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="229390068"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.64])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 01:43:27 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C0E8F121CF9;
	Wed, 25 Mar 2026 10:43:30 +0200 (EET)
Date: Wed, 25 Mar 2026 10:43:30 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Lian Xiangyu <lin25001x@gmail.com>
Cc: gregkh@linuxfoundation.org, bingbu.cao@intel.com, mchehab@kernel.org,
	linux-staging@lists.linux.dev, linux-media@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: ipu7: remove 'U' suffix from
 hexadecimal literals
Message-ID: <acOgMi9Ww0MjPAnq@kekkonen.localdomain>
References: <20260323173140.993436-1-lin25001x@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323173140.993436-1-lin25001x@gmail.com>

Hi Lian,

On Tue, Mar 24, 2026 at 01:31:40AM +0800, Lian Xiangyu wrote:
> The ipu7 driver's TODO specifies that the 'U' suffix should be
> removed from hexadecimal values in register definitions.
> 
> This patch cleans up the definitions in the header files within the
> ipu7 directory to comply with the requirements and improve consistency.
> 
> The modification was verified by comparing the disassembly of the
> built-in.a archive before and after the change. The MD5 hashes of the
> disassembly output remained identical, confirming that this is a
> purely cosmetic cleanup with no functional impact on the binary.

How did you come up with the patch, is it manually written for instance?

-- 
Regards,

Sakari Ailus
