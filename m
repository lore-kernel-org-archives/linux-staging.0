Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D42725F7A5
	for <linux-staging@lists.linux.dev>; Tue,  7 Jul 2026 09:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783414829; cv=none; b=BD9MbI+UsA6k8mCqjfCXfmJ9FgKBXVJaUtKXfhm75qe/xI90C8ArDhNDmATMFQNqQdx6E0klTpfHHQwc3OP7DZZAjbkBgw8bo79JepG11NsFPhgH7lGLkNH4z5zOn2mP6gV59hsdX3wM8q3j+Zm79Kgbc3jKqng1DrX3mOxtN5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783414829; c=relaxed/simple;
	bh=ZYNjbp+fxCd/Ev2TPUKV7YvCVxIkasH2kNS7bWFSCiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tR0FFK5MfVgb8Lc8ICayLhKXrfaxYsbBUXquBHSxqHcfnSuyenqhEgEpyOu9f+E7WSQ/Qp80/j8pI0dmqXmqXgN/FW+S9U/Crbw35u+HVKAVuSaQTvVnSaNKCP31MpEaEhv/y7+ZzekrrC9auph1qtZEk1c3SX3YcT9N2LuFjXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lSYq5kIQ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lSYq5kIQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783414828; x=1814950828;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZYNjbp+fxCd/Ev2TPUKV7YvCVxIkasH2kNS7bWFSCiU=;
  b=lSYq5kIQJh/W2IvAw0BXjHxtzfbdpCJcARStpr+XvqEUg125MX9oy6Sk
   Zc+mZcdCiCuCBXZLsLvBo/uV1TKoGhfFm2+vFMqUvGXuixAESiO3/dUPo
   bjguIB58aj7pzmhJSB95ZTsMPpr9myBT2LmDYrLQzvs+kX4tpRmwmut+D
   U+E0PxfAJTwjykKCj3uBXqYY9KOtbM0RQ2A3tWJ8pXlXBeUH9D2ZwEEgW
   qSf+yVLhjaligBSvHBGo+jmi5wPP+2+OOrJURosvMWYD65XINPAjHm4n8
   t4pvApSSjGd/4weU4p/92RmM+tIqRJ2DLJn4MjG/HjqsARICFp8CU+ZrK
   A==;
X-CSE-ConnectionGUID: rEomwh9dTKuaLWPdKrbFLA==
X-CSE-MsgGUID: h9LHXAaCTIKh4OR5hP73mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="86606231"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="86606231"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 02:00:27 -0700
X-CSE-ConnectionGUID: gczYZBwSQHCVh298C+84IA==
X-CSE-MsgGUID: dp6Zg802QRCi19GLT3Dsuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="258848273"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.178])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 02:00:25 -0700
Date: Tue, 7 Jul 2026 12:00:23 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Ziad Ali <zalshemy9@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com, andy@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: atomisp: fix typo in atomisp_tables.h
Message-ID: <akzAJ1pN1nyInsbS@ashevche-desk.local>
References: <20260707074020.12332-1-zalshemy9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707074020.12332-1-zalshemy9@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jul 07, 2026 at 10:40:20AM +0300, Ziad Ali wrote:

No. Read, how to describe changes and write commit message.
Also I'm going to NAK patches against single files. Do your homework.

NAK.

...

> -/*Green enhencement image effect table*/
> +/*Green enhancement image effect table*/

Even after the change this has another style mistake. Read and study
documentation to understand what is that.

-- 
With Best Regards,
Andy Shevchenko


