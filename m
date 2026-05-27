Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705F5257849
	for <linux-staging@lists.linux.dev>; Wed, 27 May 2026 08:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779869415; cv=none; b=aeRRaHQkeUK+Cw5QP5jVAbkrmN2jM8WlGY5xrvK/wcGeqnyGRQVnZxIK2hN1T+hEljumqyt+sphB1AFpvFLF31xItACD6ymhI8GaQikZWlot+annA3fMh0j8+uNxm/zMTWBy0s1sf41KtiPPQKwpe085K5cLm6Z/oV6uJRiEi/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779869415; c=relaxed/simple;
	bh=JyXXGr82ONuILH2HUJ86RZ3Gqwg7XcRiFuOMfbpBKy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qrSfPl9Kq3CbQ3aI/pB/+ntPZiJX2154imn5jbQ9DRcSL73/+TytjXoGe+dRsgXzTHgCThuYXsNOGQj/UDyuiD5pg99l1+AsZ8KVydNOhOMcOpadc4Oqs/7YGbyGO/5aYK0bg6zsmKwMTdmWMQ6e2o/oP7ISJdlwfDkDOx8RuBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AOQLjLt9; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AOQLjLt9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779869414; x=1811405414;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JyXXGr82ONuILH2HUJ86RZ3Gqwg7XcRiFuOMfbpBKy4=;
  b=AOQLjLt9x/6TskaDm/3cpAWSmxCQ6yFF0VGD5X76R2drvDvhiWw2+0Ca
   ItHIWsePNV28DopVLzS+VhhPNfS0ufJRxxB9vDr/iFX0V1RcMYZekm/Dz
   U5GCyd1XptrOHto6N6FWpjeG0BfqgLCDtqN9QGP7FQLOm3+SYv5clqO2d
   v7vFgJZQp/cdI7EFBsn4J1ikjaZ2lA7A+0YDpBV2Sk1BoKnH5lEgtfiwG
   WXYkg9M3mvv+7VG2yZcQdrn2zUlo6Jq9P0uswhA6iGo3M4OL8RaVkTa37
   7Qoptbodr0Ce7ZPankXIO8nVRGrz4PG518cxv4dg03mPIbH1uJMu2i1YK
   w==;
X-CSE-ConnectionGUID: GEeTscSFRYasYgSof1cXCQ==
X-CSE-MsgGUID: nZy98DFQS0mNgOSEGtTAvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80879124"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="80879124"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 01:10:14 -0700
X-CSE-ConnectionGUID: 4fdlRkEETEqTJ8VOmUSSmw==
X-CSE-MsgGUID: 7fAzM3RrSLOYBb221jui2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="241337353"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.41])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 01:10:11 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B9EA6120EBD;
	Wed, 27 May 2026 11:10:07 +0300 (EEST)
Date: Wed, 27 May 2026 11:10:07 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lixu Zhang <lixu.zhang@intel.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] MAINTAINERS: Remove bouncing Intel media maintainers
Message-ID: <aham35tbJEbDc1Ee@kekkonen.localdomain>
References: <20260526214131.51118-1-dave.hansen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526214131.51118-1-dave.hansen@linux.intel.com>

Hi Dave,

On Tue, May 26, 2026 at 02:41:31PM -0700, Dave Hansen wrote:
> Tianshu Qiu and Bingbu Cao are maintainers and reviewers of a bunch of
> media drivers (7 and 9 respectively). Both of their emails are
> bouncing.
> 
> Remove the bouncing entries and update driver status in cases where
> there are no M:'s left.

I can pick at least some of these. I'll send v2.

-- 
Kind regards,

Sakari Ailus
