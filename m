Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA8820D4FF
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 16:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284348; cv=none; b=aYjju123cblmeFA9yYcBuyCifnYreNrtF/Yy/YRpPsytEySqEyAe5zjAFYF6r3rDXu6TijfcNSQxvMI7mkb49kvjGJgLbxQdqPghgnFmL6YkyVfBHDC8bwZ0F44Vxqa3if/F7ctG/l+evvP63wIVohVgo5mpfxuvlk0sg8yejxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284348; c=relaxed/simple;
	bh=hwPvzWHQD1WDa2CBQIoOfNLXQcKGLnBeYnlNRJCsBJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pyk4q4CyQK5VwAf7UZS9RfCcdALduJxuoarfyX60s0Ci54W2hKl4TwWS/z8LzNv/Xwxji/+BRQ/3gkJ7d7KzwD7ZP1a/3vb4fxH6vfzcg5qPutoID1BhSLZvFutusvkSPnFCJCaZAYUynBrsDL/OkVDA5YopqIDWypu60fiQay0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ctwc8oS0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ctwc8oS0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774284346; x=1805820346;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hwPvzWHQD1WDa2CBQIoOfNLXQcKGLnBeYnlNRJCsBJQ=;
  b=Ctwc8oS0bZYCU0gK7RjJ3GGjTdAg4saDF4fCuc5bcrVUYKQzBx0YzmhB
   r9Sb+X/SWMlio63Ll5PBzynK0yq9OHdGZozvtKv8u1xpgGUz4WwB8rnZ9
   +h2j7P6Fvx4WVYSRLX5xNcA8HF+Om0oJDUuDoe6KVdGfkyCsPB6kkj1lE
   ljvPpsDfDjpywfqDCOh2ua653wJLmhB2Wwe3Ptz3PjXLspbJ71VzG0o6C
   MyTjPCfmsk7mnL7XsVuYIEVAokwuI0bo5HBosjl8RXIWMwVJCMfd6fza3
   r0mmdn+5/o7HH0Ihg/mbQZi7qeqij3ULKPDE4TTytWutswc7Shq0BzN8d
   w==;
X-CSE-ConnectionGUID: EWxZ7Dn6SUSQ43cqbci+cQ==
X-CSE-MsgGUID: FLMZuSSBTzyo7e6vLKmhrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="74307313"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="74307313"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 09:45:46 -0700
X-CSE-ConnectionGUID: Ps5kwGAeTeimgfZndAnLgQ==
X-CSE-MsgGUID: 58deEc/8RMOswi0yIJ0JcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="228809618"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 09:45:44 -0700
Date: Mon, 23 Mar 2026 18:45:41 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Mohammed EL Kadiri <med08elkadiri@gmail.com>, hansg@kernel.org,
	mchehab@kernel.org, gregkh@linuxfoundation.org, andy@kernel.org,
	sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: atomisp: fix spelling mistake
Message-ID: <acFuNfiyxpOfqxit@ashevche-desk.local>
References: <20260323141143.27280-1-med08elkadiri@gmail.com>
 <acFj89pWfmhLKzQ4@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acFj89pWfmhLKzQ4@stanley.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Mar 23, 2026 at 07:01:55PM +0300, Dan Carpenter wrote:
> On Mon, Mar 23, 2026 at 03:11:43PM +0100, Mohammed EL Kadiri wrote:

...

> > -	 * how to destroy the bo when it is stilled MMAPED?
> > +	 * how to destroy the bo when it is stilled MAPPED?
> 
> MMAPPED was correct.  It means memory mapped.

Probably still needs a double P?

But taking into account FIXME there, I would expect the real patch to fix
the thing.

...

Sakari, perhaps we need to stop this activity, tons of patches without real
progress just waste our time... Note, for fbtft I have updated its README
to mention what kind of patches are accepted.

-- 
With Best Regards,
Andy Shevchenko


