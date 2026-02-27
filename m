Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151653D333B
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 10:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772189644; cv=none; b=KOO/Z7CLebtayH3wZcZgkJl8nzSvzqfqxNM1Ft5oAfD5viGo4ZsYCgf5kySt7QoynBj05S3EkkKnWqlxQKgn+D9CZptVz4qCy4yE2owWADHwPkrg2oeeb1++tIelq7YWUnoSeX13v5Uh74+3GdmHFYSMtuzPYAjEmAvWVoaQuMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772189644; c=relaxed/simple;
	bh=kO+XTmDOsNEEx74+zD/4AjlfNI1loK9wTjl2o7uCpnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=afGKPcY+w0fGFRZdU+RVn7px1jyca8Alvzudra4ejRWHvMFV5jGhhHfHVrVqPOZmCG0Q8zyaIg7XRtiXIwGeBewiEoGLRPKZprki//6bn3/z+f+lItui0+MLdJ810q9rS7FIq3fnxC90+kdV1g7DRNaaXNXpXEyR8hj5rOjMG1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LXDjrLM3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LXDjrLM3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772189641; x=1803725641;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kO+XTmDOsNEEx74+zD/4AjlfNI1loK9wTjl2o7uCpnc=;
  b=LXDjrLM3SFfp+PNJHWab21KPu9z6Y9FyiZ2935NnWMtI7E/A4bso1qb0
   zenMHwjy74rtKDBeNDiaO+PWNPRzoK4rzZtRFbWLDyEbhwabWpv2lb92z
   ACrkFQU5r95UidSlkQV/RaRsKUlryHa15tSq1GgKSgl1/E3HLMjVL7yub
   AxtUvAxfV6BphY29zmRFzg6kUEKtZaK3+doADz413fCXpESEZlNd5Xq/U
   avykYPfFeCb7oqUg51HQhI0BK5jy/3KRiRJ9/lc3frcH60FeWQQZgrqQH
   622rqfvA3kyRAuA7z6mFTW1lAqRjZyFo2P3WAYjN05q14TvUPYVWETnQH
   Q==;
X-CSE-ConnectionGUID: OWq4nt4JQVO4cjJT46Gy5A==
X-CSE-MsgGUID: ek4xKKAVRY+OO45CERnE9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="90672696"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="90672696"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 02:54:00 -0800
X-CSE-ConnectionGUID: 9ItbOOuOS16RoZrtXOyxqw==
X-CSE-MsgGUID: QnalAIfDQ5OCYXWNt1ag/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="254643993"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.120])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 02:53:58 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 73905120FD6;
	Fri, 27 Feb 2026 12:54:26 +0200 (EET)
Date: Fri, 27 Feb 2026 12:54:26 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-media@vger.kernel.org, andy@kernel.org, hansg@kernel.org,
	mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	Soufiane Dani <soufianeda@tutanota.com>
Subject: Re: [PATCH 1/1] staging: media: atomisp: Disallow all private
 IOCTLSs but S_PARAMETERS
Message-ID: <aaF34slAiw7vOJGl@kekkonen.localdomain>
References: <20260227092327.3654603-1-sakari.ailus@linux.intel.com>
 <aaFkcS1fMVLxGB87@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaFkcS1fMVLxGB87@smile.fi.intel.com>

Hi Andy,

On Fri, Feb 27, 2026 at 11:31:29AM +0200, Andy Shevchenko wrote:
> On Fri, Feb 27, 2026 at 11:23:27AM +0200, Sakari Ailus wrote:
> > Disallow all private IOCTLs except ATOMISP_IOC_S_PARAMETERS. These aren't
> > quite as safe as one could assume of IOCTL handlers; disable them for now.
> > Instead of removing the code, simply check the IOCTL matches with
> > S_PARAMETERS and bail out otherwise, in order to ease backporting.
> 
> > In particular, ATOMISP_IOC_S_ISP_FPN_TABLE is disabled by this patch.
> 
> Why not removing the code?
> It's still and will be in the Git index, it won't disappear.

There have been changes in the IOCTL handler over the supported kernel
versions. This patch can be backported all the way down to v5.10.

I'm fine with removing the now-redundant code, but I'd rather do it
separtely from fixing the issue at hand.

-- 
Regards,

Sakari Ailus
