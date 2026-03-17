Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05DE358367
	for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 08:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773736313; cv=none; b=TIh9fKzeGcYcIl/HPHJg7P02LgXpm+zi81Ydw3gdc/mZtathElcE75UN77BqIqNwGuexOWg3+TIItNLYhh+HcUZMDAvQjyjQNBQ83vA+fbzTUpSVitaJA2IHgkNTnnf7+HZXdMlBxXRW9L3ommPLiDvYpK3PISg+XxvIA6m4M5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773736313; c=relaxed/simple;
	bh=V22S6tcbWuhZ2YPdpQRYNiMLkbvffQdLG1VFnhBc/d0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NOu0qrUk/I1LSdO0Odj3eVV7Iva5Pjft6fDlROFELWJ4+TkxdwpGPO1AFkNEg76CmSpgqUdhyuBvL4Sjuu/vqb7waVPANIL4xYVW9M1TUoba34zF0R8G/47Nus1bzCaRJSUFYAMOMA17OQW4vSd1BWjYvzxqK348Wvy+eCBGimQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YxGUakoX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YxGUakoX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773736312; x=1805272312;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V22S6tcbWuhZ2YPdpQRYNiMLkbvffQdLG1VFnhBc/d0=;
  b=YxGUakoXyOyz2vOw9YUGEHlHOuBuUO7IgnddxG8RD6nSXRhmPBpO4Xfs
   D3HTvoEHXXL4Hl/CdRENFBa2bX9knQ5MThI4SDk/ovXGfl/YhPaaDPGMA
   zqhMx+u1aZftYxNRTPCFGYE81f4+SBlCNWBuw6mMGVtRs2YP9vdmS5ehf
   XFZUMTXgnj1Y7qIAK0Wbb4vjkjmPCj1GUbw/IDg2DTOFVeJbgpSsYU3fj
   vMNJgILRvjZhYA3lmGjtGhYRVkXgzLW1Zz5dHfRq9/LZIeaPAfN+Xp73o
   cHKE7W7nhfVvsYB6ZmIu5Sly2cOKC3V1047OSWsobEJsn1/fmZBU0BV+6
   w==;
X-CSE-ConnectionGUID: RDjdRMcmToieCiwc9A/apg==
X-CSE-MsgGUID: ozNJ3TVFRaucEZ/WR+K28g==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74945342"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74945342"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:31:52 -0700
X-CSE-ConnectionGUID: yAGIY3SBRWCmMK0mGfChVQ==
X-CSE-MsgGUID: PQI4iqgXRfi0q82Crh/pSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="221429170"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:31:50 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8E3C6121D04;
	Tue, 17 Mar 2026 10:31:48 +0200 (EET)
Date: Tue, 17 Mar 2026 10:31:48 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Kalyani patra <kalyanipatra2003@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Simona Toaca <simona.toaca@nxp.com>, d-gole@ti.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: atomisp: fix brace style and trailing
 whitespace in isp_param.c
Message-ID: <abkRdID5NGk2mkOF@kekkonen.localdomain>
References: <20260311151302.105992-1-kalyanipatra2003@gmail.com>
 <a26ba4c7-05d9-4df0-b4ec-1a82d2df075e@nxp.com>
 <CACjYBviU6v_QbpPy0zhfpaBYMoQrO-pBNywzXZb9cHgerCCGBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACjYBviU6v_QbpPy0zhfpaBYMoQrO-pBNywzXZb9cHgerCCGBw@mail.gmail.com>

Hi Kalyani,

On Wed, Mar 11, 2026 at 08:52:20PM +0530, Kalyani patra wrote:
> Hi Daniel,
> Thank you for the review and for the clarification about patch versioning.
> I will keep that in mind for future submissions.

Applied this one... please use "media: staging: atomisp: " prefix in the
future. It's usually a good idea to check what others have used in git log.

-- 
Regards,

Sakari Ailus
