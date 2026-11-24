Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541306;
	b=t8uKmFIFRSK46x9BvwbE6GqfDSL6ROgPE2t19qXLRFDWbKnLA+M5gGBYNaqqYOh5NRdc
	 9FCP2pXfUu+fBQOYExvUaPYr8srbj8vQY3y+o4w55/hr/yeKTJEfgnYaul9F4ojT7LVw/
	 1N6Iu6t8E2qfy/wEWWWb6wv6QX999SDWnRgLogW+TNGAfG80WFjGnrmsiES8bwoNhITzo
	 3UnRgKfH7YAmXofOkVzmkMAkXLutMqWFTThcUFTVYen7HvgSgXApxkmWBH6ujZPx84MYE
	 Kx8Lvos+aguC3s/CELgw1XiIHEe4ItmTKWh5Ic0bbfFM4h1WQAD754WqZYF0xYv19Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541306;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=ffsNDG7rZ5R0j2yxFNZp26tEKpogV1MBod4g8hnw9Qk=;
	b=BuLBQfcmpZHoL100REcHCCZZyJxGjitiSvTG4/DKeuva2sx/B1J6bAOLnpur7R+gv1oF
	 Q+jOce8tA7ga8ntokj1fiRsZ/OxDsIeRT4bNmWIpQhcyf2ZvUZG7JfMswXVZT9yYAc+/G
	 d1EXgQMqSfVd2a5Lf9r2nW+3nAEfj7V3SuW80p6gWgHzh7/YjlgTDle/a3ak44qj6+8yn
	 X6k9kWBA6M0UNwnVB6NCjEy5V6b+gf4WpcU80yFCiFu3ozqKc+/lEaCXoXspuc+UCPQgp
	 PwinCyg+UW2P3YRMzPrEvS0cgHLbpqRWASRcsA/yR3newMXJu6q8Wahhmw0ayMNNEiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aX5e4SfQ;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85FE606A32D
	for <linux-staging@lists.linux.dev>; Tue, 24 Nov 2026 17:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C85FE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aX5e4SfQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795541305; x=1827077305;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yJAlPXvrI00wm1acbN/uJcwx38S8ia1++yAKKe9BDs8=;
  b=aX5e4SfQyTJoAXi1Sq/jtTcvM+9J5RMTD4hrHPDVOBLf3oKSEbH69oCJ
   oOxQdMmZkT0zUEF9EXWHMKQSzs3v1ELqmFe+N0yraWjhlH+EG8aowb/y0
   SxqctrL9xRn5lwH0LiJhXVWLV2hUF+x2JCJ+6pcc/fNyc3U/uYe2FENbW
   /2RB026nNGigjjE/VUTfW9RNaElf7TntNiWIm/RAc91AHll0BRgVgf4gG
   j0DHBO7EG9BSGpJ3cYXJ1jcgdA1++v1LOjjH8WLdlzQR3W80L3dvyUb5M
   1LGSadyd+qGZWewMkVKP9OGh6bBs7EXFxI84R1lid2eT+T2MpCLqCYPQS
   g==;
X-CSE-ConnectionGUID: RSsNEHlJTK+ft1fX3DHScg==
X-CSE-MsgGUID: oP1U7vFlSwmEgar3OczyHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4284894"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4284894"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 09:17:36 -0800
X-CSE-ConnectionGUID: aZ0oM0a1TjiludAUk2BVKw==
X-CSE-MsgGUID: XxGUKT6tR6GrVQVSHMwkSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11497087"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.125])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 09:17:33 -0800
Date: Tue, 24 Nov 2026 19:17:30 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Abhishek Chaulagain <chaulagainavishek14@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: atomisp: Remove unused timed controller code
Message-ID: <awXGquBiO15OWx1-@ashevche-desk.local>
References: <20261123200658.449-1-chaulagainavishek14@gmail.com>
 <20261124164504.443-1-chaulagainavishek14@gmail.com>
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
In-Reply-To: <20261124164504.443-1-chaulagainavishek14@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 24, 2026 at 04:45:04PM +0000, Abhishek Chaulagain wrote:
> The timed controller HAL module - timed_ctrl_snd_commnd(),
> timed_ctrl_snd_sp_commnd(), timed_ctrl_snd_gpio_commnd() and the inline
> timed_ctrl_reg_store() helper they used - has no callers anywhere in the
> tree. The only remaining reference was a stale #include in sh_css.c that
> pulled in none of its symbols.
> 
> Remove the dead source file, its public/private/local/global headers and
> the timed_controller_defs.h definitions header (included only by this
> module), drop the object from the Makefile, and delete the unused include
> from sh_css.c.
> 
> With the module gone, the timed_ctrl_ID_t enumeration in system_global.h
> and the TIMED_CTRL_BASE[] base-address table in system_local.{c,h} have
> no remaining users, so remove them as well.
> 
> No functional change intended.

Good cleanup if it compiles,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


