Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D4437C0FE
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 08:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776327515; cv=none; b=WEz/Ft7jFG55g1yuLJ1nQAkYyG3OsXVj322K7uM5vHl9r8MSFauJrdsgo2Hs/nNkEQaxsoQgHtqpb5U7j4UDPaZVI6IBgKXyKwLdT4Zp4JtZ90QeNM2NnZyO/JAP174ELvqdOD7Hh4s7YTCffceufBDsGQG1hBo6M6mITOcI360=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776327515; c=relaxed/simple;
	bh=gS18znHgFeciu4g1YYcDoFRxpODrze5FQhO2pZy83zA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MAHX2R7R+AtPE+WDp0QAzRnseVZCpOJv4SPHF0o9XZhKAvd+S1K0fWdJM3gw2gmH1foFPag8eGE7Jn/HPV8BWEppu4CcGM2iNyMnfBwKUAIRLSNnUmyoD+4ItWjubua86LFcbe5G1eqSRea+eUIYA+ZHx6+tqsItLkG6bSeS15Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fi4C10lJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fi4C10lJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776327513; x=1807863513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gS18znHgFeciu4g1YYcDoFRxpODrze5FQhO2pZy83zA=;
  b=Fi4C10lJTji56qjgsBU6uvvRz4TJph1SKxVR7RbHDtFDQ1/0bWrinxHm
   YS8PCuwD/cHPzkRDazACQCFf3+UgNlItgzf78aiOxVsW3+xkTBY9jM/Lm
   4Wrwym3UKXSRSJpmxyQxaI6cXXLr6cquEvv5aeDAgwGr6hJWzJS9YwwOK
   YAtNnf2XtY6YuIz8a+yyjwzNgYH2BOtq1NBDtdh5DehXluwOD8HnF/T/Z
   9aQ0hWwxhmthlcD4axrN8cRhgljIMna9RN/Iqot5n/SGVMsFvKdX5U1oq
   K9ySx8E4FafPV71waiGps9qRp2e+1h3ulc470pLZKqt2q3Z2QwUtkOoq7
   w==;
X-CSE-ConnectionGUID: 6QRZ4r38TDqi+bv3I8uf3w==
X-CSE-MsgGUID: 4QPBTpoTSOCs1Mbt/D9XHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="81191374"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="81191374"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 01:18:33 -0700
X-CSE-ConnectionGUID: RdWpbPheSLKRXPeZY1b41Q==
X-CSE-MsgGUID: vof9brrZQjOEnhTVWiqtnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="268655178"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.173])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 01:18:31 -0700
Date: Thu, 16 Apr 2026 11:18:28 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Huihui Huang <hhhuang@smu.edu.sg>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: fix memory leak of
 raw_black_frame
Message-ID: <aeCbVKLebxC9v-4r@ashevche-desk.local>
References: <20260416063058.2479566-1-hhhuang@smu.edu.sg>
 <aeCaPExt-sUiY-B9@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeCaPExt-sUiY-B9@valkosipuli.retiisi.eu>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Apr 16, 2026 at 11:13:48AM +0300, Sakari Ailus wrote:
> On Thu, Apr 16, 2026 at 02:30:58PM +0800, Huihui Huang wrote:
> > Our code analyzer reported a memory leak in
> > drivers/staging/media/atomisp/pci/atomisp_cmd.c.
> > 
> > In atomisp_fixed_pattern_table(), raw_black_frame is allocated by
> > atomisp_v4l2_framebuffer_to_css_frame(). If sh_css_set_black_frame()
> > fails, the function returns -ENOMEM directly without freeing
> > raw_black_frame. The allocated memory is only freed on the success
> > path.
> > 
> > My patch adds the missing ia_css_frame_free() call before the error
> > return, to free raw_black_frame when sh_css_set_black_frame() fails.
> > 
> > Signed-off-by: Huihui Huang <hhhuang@smu.edu.sg>
> 
> Thanks for the patch.
> 
> I believe the problem has been already addressed by
> <20260203163134.3901110-1-zilin@seu.edu.cn>. It's in my atomisp branch.

And exactly the way I suggested here, thanks, Sakari!

P.S.
It would be nice to see rather links to the Git commits in question, because
patch in the mailing list is just patch in the mailing list :-)

-- 
With Best Regards,
Andy Shevchenko


