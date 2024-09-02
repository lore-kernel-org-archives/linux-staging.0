Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B4E17C7C3
	for <linux-staging@lists.linux.dev>; Mon,  2 Sep 2024 11:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725275173; cv=none; b=rWOVj/XL54HqC8DWpYFqT+9rlxzM6ZnSex2I6HGvidtFhg04P9z4TkuHzFiTr5IFT/QLpu1eovaBEed9mBjoMndmCwHyXyQEzStNtYjy5fzsnTCTpx/YS3r7j3aQ/JYSVcVrTWPahjSNiNcbeVLzhVYUegiDpdFUkKqXX9i6+Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725275173; c=relaxed/simple;
	bh=OqxNejW0+NDbK1dTS0ZIo/Yfvqpav+sVZBMeJ1w/FDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KiSW0iwrve2xOEYUVOiJcx3DCrDN4+W04I+5/8U3mkrAzZ8QrkiY9HVlUMRlBtpv7zLueP5/kbilC7SIk89+ijKzWEUxMRN/K01pMpP/+IJPUBZfM4KrbFaSuTlFzRSDaaimASeGRbNVHw3sXFPef6BNPr45LIBjUM4sIYnRe7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: J1/4OUSdTjisB5GVPxELdQ==
X-CSE-MsgGUID: YSBFkMpqTyS/kbdvsLNacg==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="23983587"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="23983587"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 04:06:12 -0700
X-CSE-ConnectionGUID: sp9GlmQ5Srm2DGLVnQpieA==
X-CSE-MsgGUID: bjFI1V1+QPyH2wKyADT/rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="64548078"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 04:06:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1sl4sn-00000004KqQ-3CXM;
	Mon, 02 Sep 2024 14:06:05 +0300
Date: Mon, 2 Sep 2024 14:06:05 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/3] media: atomisp: csi2-bridge: Add DMI quirk for t4ka3
 on Xiaomi Mipad2
Message-ID: <ZtWcHQSfpRMNo6TV@smile.fi.intel.com>
References: <20240902095229.59059-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902095229.59059-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 02, 2024 at 11:52:27AM +0200, Hans de Goede wrote:
> The t4ka3 sensor on the Xiaomi Mipad2 is used as a back facing sensor,
> it uses 4 CSI lanes, but the _DSM has CsiLanes set to 2. Extend
> the existing Xiaomi Mipad2 DMI quirk to override the wrong _DSM setting.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko


