Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C1D38A298
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 10:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774260426; cv=none; b=cu+JRAUaoNQXdi+K56ElV1N5+6On6XD2n14p/I284ZrU2SSEC5Zbm9frESyl6mReFlVjNiCfm+V3SO9SWSEMauXnkXAarM/n7vXaA1CUvKJFoMsQZRjmjM6130xf7pXyy6am6EkajQhSoWPXA4ahwo73EqSdyKCic4JZoXunYk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774260426; c=relaxed/simple;
	bh=yySN1S0XOHfQe1QlWEaf8tJOPFwXkYxkB7plS6mbTPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Shcp8B9GbzQFtfSNh/KFZNjwhR2CJYEVn8PmAyeSEy3MlnHqfDIkoY1Fig1U2bRDmzv5yqAJNVQPSr3ybjAxfnQRR3gTVsl4h5tpR226TKQu5aCL32GIKezTyOi0paeHLmrYpV5rH2VLdDSfVuUM+A9fELyaidLTKSIBqp0KWhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xs9cNHzr; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xs9cNHzr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774260424; x=1805796424;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yySN1S0XOHfQe1QlWEaf8tJOPFwXkYxkB7plS6mbTPQ=;
  b=Xs9cNHzri64CplqF3M8fIewlE+ebkDpr2dsAKC2Q+0ixJsonNpcIRrgS
   rji4WMilS+sRE3z0nEJsLzOAEVMJVXEBMSxu5O9x3M/kmkgPCxs1Sewvt
   /Jkbarv6+f3ZZHPxcDKxF6h8mQrshrEPvzsNCyZptcPVkLPeH+cNGdhxq
   ZnuqdIVM2q/28oF2tZwJRa+RGGL2eEIBIbtaCXQu3UEx7+qZiWziFHF06
   pcb8oA31BNknsJm/MmnRqWyTzL8XqmF5zYOrjpPC1ozD4SETdhKHEUYlO
   At1hElX2oAms3+EVc84hFe10xSxgGdPDRLA+tOpoxHYPt4IgfB68DhKbr
   Q==;
X-CSE-ConnectionGUID: 50lJkr85RMK8NA9Mp4PePA==
X-CSE-MsgGUID: eKTX35ZaRmibGc6gqYwBvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75320387"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="75320387"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 03:07:04 -0700
X-CSE-ConnectionGUID: JqRv0AmJSX2q/+/8WHYtYg==
X-CSE-MsgGUID: gejzjzQMRDS1jYFJM92o3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="228053416"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 03:07:01 -0700
Date: Mon, 23 Mar 2026 12:06:58 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mohammed EL Kadiri <med08elkadiri@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	andy@kernel.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: atomisp: fix spelling mistake
Message-ID: <acEQwoiv_IxLrrJc@ashevche-desk.local>
References: <20260322113222.27488-1-med08elkadiri@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322113222.27488-1-med08elkadiri@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Mar 22, 2026 at 12:32:22PM +0100, Mohammed EL Kadiri wrote:
> Correct the spelling of 'uninteruptible' to 'uninterruptible' in a
> comment within system_global.h. This improves code readability and
> searchability within the atomisp driver.

Check the whole driver with `codespell`.

-- 
With Best Regards,
Andy Shevchenko


