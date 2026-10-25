Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792940662;
	b=MUZtmvvPIjuRy+biDL0ajr92939B4o6k/mJcvcdk49f7P40B1s3+mUuQ1gX8iP3yporV
	 Ks1r9ZPdF4ZuzelOR0ScHJ0if84dM/NVr+KUPWvgVA6OCqymRZ8KZg1XYvYFuvQ9clBb4
	 63rIddeLRmA/JJX51s0pFYlRcDmhtuHop61ezBNBPP0NFTaT7HMEZsqW509mUN3rzN3Nn
	 s1XpRwb5MkIXepeiXaB4D0xRk0Mrem4k45tS4QSC788O/4vyvbVG1Mvye2jY4yuc/3ozj
	 CY7X5O4qjQ2HAtmEcfkdGZOzW0lACHGA2SOCQpCyDowNRuVlVc/3RMIql97HhcnaQlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792940662;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=rS3/wqoyUiFC/nwlEVyVdFa4VAmvnpE3Qb2WkVE+lSE=;
	b=bcZ9VzS6F3TrNo12P6fD6LMegpDK0qytxBMF+HD/Ev1yJh0S92BWDwrdn9CigEO8hzpY
	 gNbOgFY4oL4rxWI2ySoiZ1yIcaZsJi/BeEaO2cZKkzT1A9xEYYNmAjIqJC9DqcN1bA6Q5
	 lLP4GnBZcEqX9kGoMggjc+cnPOADHYrx08Z+9JqnTTq52OKO3eAvmmQlpX9SlvzVDixWD
	 kSzUAakdyWs3hVbuNDM+2nhQzS1xe41wbCAuebBgOsnlIkVQcnc5epk8NV+YLMK0/t1Zg
	 zUuVKRQk3T/5X1tBv7YYSK9opnHUL+v+tZmAH+niYI8fMsSJQs85AzU4Pui9/OohQAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NT8kzVzT;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B2C606A31A;
	Sun, 25 Oct 2026 15:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63B2C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NT8kzVzT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792940661; x=1824476661;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mbitdxTff249OBDqO5321R0i6ugZINRmq8qsd0e14/U=;
  b=NT8kzVzTDbOLMSXUsBaCvB7A4KRSJGK2b+C4a4c+yZpz0qpdpUozKdWa
   ML2W/d4UK9xQKJZe7baMbDdIpXEDLpIW8PZzWvWPM30QlhmkhoD3P5Ia1
   vSGXgLg/TY7tr5zEorNxfA86Bkyqr+79NPkbXa3o0o3mO9n11Ya/3GuJ7
   wxaRwu4TGXKrg+gXZ7Rc4VpFu3UnA57w4u9Eg2Y6PW0DwxlGK4V85pfY6
   2vQzhJQ1kxGo7EHrcwA0ToCXJ13fLQwQOmS+heVfceuRp0CohQiS1Lfus
   97Dq3rxGzemlHj/v7sgvoxgYyjbnoeYzp7IJ2oTzgpCn+LIaR8Rj14eBX
   g==;
X-CSE-ConnectionGUID: AgGMeNiRQ8eWdp3ejQaG9Q==
X-CSE-MsgGUID: wLeXOgLDRiWapXGwgZE+Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1623170"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1623170"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 08:04:21 -0700
X-CSE-ConnectionGUID: pobX85RvRdSp/PhX9BTmGw==
X-CSE-MsgGUID: g5SvmkfrRiurS7nX9CyIDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4404121"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.10])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 08:04:18 -0700
Date: Sun, 25 Oct 2026 17:04:16 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Abubakar Musa Samaila <abubakarmusasamaila@gmail.com>
Cc: julia.lawall@inria.fr, gregkh@linuxfoundation.org, andy@kernel.org,
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: fbtft: fb_upd161704: Replace udelay() with
 usleep_range()
Message-ID: <at4acP_svOxU9_mP@ashevche-desk.local>
References: <CAHxSwT_bdBdiwwXpGpr9+rGizZU3p+RsB18hPH5TxqMuMZOsQw@mail.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHxSwT_bdBdiwwXpGpr9+rGizZU3p+RsB18hPH5TxqMuMZOsQw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Oct 25, 2026 at 03:22:30PM +0100, Abubakar Musa Samaila wrote:
> Replace udelay() calls inside the init_display() initialization
> sequence with usleep_range() to avoid CPU busy-waiting. Since
> init_display() runs in a non-atomic context, sleeping allows the CPU
> to yield, improving power efficiency and system responsiveness.

Please, slow down. I have already answered on very beginning version.
Don't waste time on this.

-- 
With Best Regards,
Andy Shevchenko


