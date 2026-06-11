Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6979367F4D
	for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 07:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781163505; cv=none; b=tzey1TBMHAYxIs3BlxVDl6gchUgYrC3vem75oPVV9bTX8wAATllXN5eZ0XmeQAJo0pjlvdCjg+iczj0zJCOsj8kLsk27sP/wGPzIi3ab/Bx40jyjGXe2mOfCl5YQ3y4tE9LjjX1lVuUSUSyzChAEsEQ/nOb3pKr/+Re5BDGavLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781163505; c=relaxed/simple;
	bh=12ELDSpkGN0c9Vw+xiPWSuC+hqNsmpdnzTyHPHobxmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPuntDQhwXLBXtPB0/1ufIX1woHs6JBpGRxDsBjJy4Z9KJiJMjZMNkrtbYi2YbR17Stdr0bI66kHeTr74EF6AYn27ipjnuO1DNLY3YBPWfuFHIpqdkFf9echYOL+P+qjel1yp/56WjB/b3KOcot0yEWN/Hfm3ZR3cdafmWiMmfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CZUeb0la; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CZUeb0la"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781163504; x=1812699504;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=12ELDSpkGN0c9Vw+xiPWSuC+hqNsmpdnzTyHPHobxmw=;
  b=CZUeb0laADXQeCTBgzU8PYD/fkYQtq9KVtu/9+yX94KMkVc24wxPh8lz
   +EPSSr5r/beplLeu/W/BteydKtMhQ+wRk+bERJJurWQGqwQXpbV9dBNoz
   0jRAEtCHVDG7wsO/47yXhLZa7SLxWLffh5MUi9JbphWumnBulWRG87Boh
   0Wf52yyYnt9wIiJI/tdHZJqvbXVABMW9zEgnd90k1/mJ0l8/LQqB4DFpe
   dKu8rCYnYmviY0SiTe6zFKMGq8aONnJENx3AJ/De1Ya1Ft3DEYDBvyTSO
   B88LCtlXnRlMWIs1QJw4x19Fy8wy9L3x3K/Hg8lsysR5jJDgYQhtYboBW
   Q==;
X-CSE-ConnectionGUID: 6QJDOWkpQ6mymbq46movYw==
X-CSE-MsgGUID: 3APqHQc3TSuUJ0l3fYeqBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81104134"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="81104134"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 00:38:23 -0700
X-CSE-ConnectionGUID: RKZwnkDdQVe4UY2m+kEB/A==
X-CSE-MsgGUID: dNEGkc+lQMyyFYYDxGOhNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="243957461"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.123])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 00:38:21 -0700
Date: Thu, 11 Jun 2026 10:38:19 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mert S <mertsftl@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: atomisp: gmin: Use str_on_off() helper
Message-ID: <aipl6zqwTggWZ2zw@ashevche-desk.local>
References: <aipI6J4kDWESZgtA@ashevche-desk.local>
 <20260611061417.11747-1-mertsftl@gmail.com>
 <aipbDeEFbXam1WPN@ashevche-desk.local>
 <CAA3Noor=rsoCR9NoWy9KEZSrK66p0WN1i4C0aDwn8AzuN3p0hw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA3Noor=rsoCR9NoWy9KEZSrK66p0WN1i4C0aDwn8AzuN3p0hw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jun 11, 2026 at 09:09:23AM +0200, Mert S wrote:
> Andy Shevchenko wrote:
> > First of all, do not chain a new version to the email thread with the
> > old one.
> 
> Sorry about that. I'm pretty new to all this and still finding my way
> around the process, so I appreciate you pointing it out. I'll send the
> next revision as its own separate thread.

Also note, the new version of the patch should be sent not earlier than 24+h
after the previous one.

> > Second, you forgot tag from Kees. Why did you not take it?
> 
> That ones just my mistake, I overlooked Kees' tag when I put v2
> together. I'll make sure to take it in v3.

`b4` tool is your friend. Become familiar with it and it helps you a lot.

-- 
With Best Regards,
Andy Shevchenko


