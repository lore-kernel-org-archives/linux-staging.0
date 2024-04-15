Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FBB74E25
	for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 14:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713193148; cv=none; b=U/besvIkCu7pWov+PyQa3HHIO7t0caBkswTNAgJJxR/aE6siO3keXx5is7GthiAaW2YZJs+5p7EkXhTNX2Jjw6mwiSVuC3ER1+fSKvugcVmcFG8aDr5Wfs8c7cMIhd/ceZofh6QZ3QvZbugOqQWuphLDPA86r6FeNh33tPKz7EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713193148; c=relaxed/simple;
	bh=9BEfL0/R2EKlaqpP1DN0nA6JucN40DYPWmMjubPPF/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFsztq9zFunwOyMzFxJ0hpzlGEYHdOsp6CvadZqp7bJgCkl0+Ree9i+TbgX8n5/82FcEoN/1jAkm9iFvq5f4ClQL5DxHmDu9p3fQV2eQiUatAiuqkx5pTBOhZhtfuELoQ5+0LQlDRZQXhtxsJgBMkkGXyEV3RVFhsiXZnUoJs+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: X8t00qD3TvKNA4wqgR6mrw==
X-CSE-MsgGUID: o1TfhesGQfyBJwSAIMpHug==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="26045005"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="26045005"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 07:58:53 -0700
X-CSE-ConnectionGUID: lTm7UWagS7+q1masA5MenA==
X-CSE-MsgGUID: 8PneIB4JRzSwfOCRpssCKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="22035635"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 07:58:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rwNnD-00000004RHa-3GtP;
	Mon, 15 Apr 2024 17:58:47 +0300
Date: Mon, 15 Apr 2024 17:58:47 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 00/23] media: atomisp: Further media-controller related
 fixes + dead code removal
Message-ID: <Zh1Ap3Zqp2Lj9xww@smile.fi.intel.com>
References: <20240415120220.219480-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415120220.219480-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 15, 2024 at 02:01:57PM +0200, Hans de Goede wrote:
> Hi all,
> 
> This patch-set contains a couple of atomisp driver fixes for issues which
> I found while working on a libcamera pipeline handler for the atomisp
> (and thus controlling the atomisp driver in a more media-controller centric
> fashion).
> 
> Patches 1-8 are more or less prep work for fixing an ABBA deadlock in
> atomisp_link_setup() in patch 9.
> 
> Diving into the code for this made my hands itch to remove of bunch of
> atomisp custom internal APIs for things like flash support, so the rest
> of the series is just removing a whole bunch of dead / unwanted code.
> 
> This series is also available here:
> https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp
> 
> I'll do a forced push there addressing any review-comments + adding
> tags before adding a signed-tag for a pull-request to Mauro for this.

Thank you for doing this nice cleanup!

For non-commented,
Reviewed-by: Andy Shevchenko <andy@kernel.org>
otherwise feel free to add it, if you agree on the suggested improvements.

-- 
With Best Regards,
Andy Shevchenko


