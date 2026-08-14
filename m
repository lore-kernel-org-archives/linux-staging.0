Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6102BB17
	for <linux-staging@lists.linux.dev>; Fri, 14 Aug 2026 12:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786709979; cv=none; b=YK3FwxxpPo1s8Cs1PGqiuGcVGO0EMsT2Weyywor8MGjsM4XvNaeIQJXopZf8L86+K2qTitU/9WrXGvZuz23UlUn79l6tptEB6HheKMg4DihqxgknhtqGOlhs1DaJ46xMWsAPC5XRBD74ELYUdAdllMAmdyM4F3AywgCD+4GKI40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786709979; c=relaxed/simple;
	bh=c4OTJWrLdT+z04Qr4vvrDxSGrytWojAfmSSmAXe8oMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GkWI32n6X3w/9H0efo1jd9TnqgCn1Mnfk7G7wRLUfSJvpkXdcVqqZFuDVsLJzgDr1e3+VabMETemyCY6ouivCfVwO99armP7CBPrAo/Cwvk/cLkDHgFFeSl4ciXBM9qjBweUjLL8JCtRs7EcuB2VNHcvAv5ZWy/VOCUXX2QLi8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aYFPujy4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aYFPujy4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786709978; x=1818245978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c4OTJWrLdT+z04Qr4vvrDxSGrytWojAfmSSmAXe8oMc=;
  b=aYFPujy4CK5LhmuoteP19eBfWg1YhrO8i/byQZg2Wm4asmMA6Du3+FL9
   QgBgWQ1ExKWoZ/zu/wm9KcoOZIv5Ntj529mD7SV48/Kg7MZ6l8HTQrX6J
   1EcXs2B/Z4A2D7leyzpmFyoqIho5pd0BaQEN3R56nsgf3B0jDZ++nTYDF
   8ExKno3l92ruws7xr2C5pe/1/3wYUMjJ92E3auWa/EIYCnjDZrfd9JmZH
   mjZKQTVPFIPfpm/tuW5nqAPcUr13g6vd8av5gPhsiO0mCRcglAjtb29He
   Qv0eqXr0Jtn3mDgfR+lX7tVm7N6AvLZF00ikMy1VfJRntwX3P969vqoSJ
   A==;
X-CSE-ConnectionGUID: mcWfTxwDT3q40S8WwU7P1A==
X-CSE-MsgGUID: lgMB431FR5aeWhlljjNtzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="86406252"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="86406252"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 05:19:37 -0700
X-CSE-ConnectionGUID: KWqn94UeScSzfk3jrdvwdA==
X-CSE-MsgGUID: 0aJ3ncJfQW2sz6LXrOLmqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="264822659"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.134])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 05:19:35 -0700
Date: Fri, 14 Aug 2026 15:19:32 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: media: atomisp: fix typo in refcount.c
 comment
Message-ID: <an8H1AhZGujYO162@ashevche-desk.local>
References: <20260814-atomisp-v2-real-v2-1-8f5ece54cc79.ref@yahoo.pl>
 <20260814-atomisp-v2-real-v2-1-8f5ece54cc79@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-atomisp-v2-real-v2-1-8f5ece54cc79@yahoo.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 14, 2026 at 09:57:03AM +0200, Tomasz Unger wrote:
> Fix 'aswell' typo to 'as well' in a TODO comment describing
> refcount support for memory types other than ia_css_ptr. Only
> the spelling is corrected; the TODO item itself is unchanged
> and still needs to be addressed separately.
> 
> Reformat the comment to a single line, since it fits well
> within the line length limit, instead of the previous
> non-standard two-line style.

> Suggested-by: Andy Shevchenko <andy@kernel.org>

This tag is wrong, I only commented on _your_ idea and implementation. I have
said nothing with regard to spelling typos.

The rest is okay, in case Sakari wants to take it.

-- 
With Best Regards,
Andy Shevchenko


