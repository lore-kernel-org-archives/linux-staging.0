Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9985C38AC96
	for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 07:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786521179; cv=none; b=PP9aIcG+8IFVf9MwBrivEsTKGFewKm386RSEgR1ubw5Vrd98Up7hMcLfaqRJFwzu7sTxSgJYQgmLsxnvDO7kVZONuhiZclPFpOjxMxjLjrVGS+uZVxjlYVHq2ANFXqSMPZp5lRt/WBdPNEK/A+r6CtW9cSEGax0l4C9at9Ee4pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786521179; c=relaxed/simple;
	bh=aWplRC/rF2J14qLugULURMBrr3JDEdAcScXc1UINLWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=axqeBVrUaw/zcEwlMUZrwc/Kpd8rggqpdhlh7TWYmkQJgBvsola+KveFFj4Xd3ABftO7D0BY7zEX+1tS2CTCBgyNH3sU6UDEjtBAmhAEUO179giw2kQMpi1uk58bMMIrj1XLVRAo35tDInC9AMZgzJzY5VvTNSgHKHjUtJd7qUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hr7g5vG4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hr7g5vG4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786521177; x=1818057177;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aWplRC/rF2J14qLugULURMBrr3JDEdAcScXc1UINLWk=;
  b=hr7g5vG4Kl9SDWRW6mL6QsMbFCfMJfcFS5bAObdjzmxBtm8o9yXla2ej
   lwyibvcfE3Lt2kaYHdmXODbhxs7fJyzwIk39hNnpbN0ebVppf/JBsUNPZ
   zs4VylHfeNccmgJrEH5MqSxvkjziAZsgaydkfV5nEhe7ogtwQbmFweTzM
   YZsrc2Z3yTAdJG0eBE2/UGdAnyjFvS+xoeMp9a3yRujhxcxMS0DxEy05e
   6BV4EJDqTVKlc9KUnlMrEuphocJDsZD2T74x0I/hNbTt8ZKidBX66eYIF
   Fba+n+zlnDO2thHPxTcD7LXZeKYvIR1Ebq5gsw9X8UjxqYWp/mMLUElOR
   Q==;
X-CSE-ConnectionGUID: RuO0sZJHQky5cf4RDa6PRg==
X-CSE-MsgGUID: 1qGd1n07QVKKc/FrXkIIUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="90942674"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="90942674"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 00:52:57 -0700
X-CSE-ConnectionGUID: NudsPXWrR7e4h6gZpN3MNw==
X-CSE-MsgGUID: ozQ/JY3zTFqx3xwK3wEUMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="259734401"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.92])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 00:52:54 -0700
Date: Wed, 12 Aug 2026 10:52:52 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nikolay Kulikov <nikolayof23@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] staging: media: atomisp: inline macros for
 checking the bo/bodev pointer
Message-ID: <anwmVELbwVshXGzg@ashevche-desk.local>
References: <20260723185217.317981-1-nikolayof23@gmail.com>
 <20260723185217.317981-3-nikolayof23@gmail.com>
 <anwleCB7QFRPfY-t@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anwleCB7QFRPfY-t@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 12, 2026 at 10:49:17AM +0300, Andy Shevchenko wrote:
> On Thu, Jul 23, 2026 at 09:51:19PM +0300, Nikolay Kulikov wrote:

...

> > struct hmm_buffer_object *hmm_bo_alloc(struct hmm_bo_device *bdev,
> >  				       unsigned int pgnr)
> >  {
> >  	struct hmm_buffer_object *bo, *new_bo;
> > -	struct rb_root *root = &bdev->free_rbtree;
> > +	struct rb_root *root;
> > +
> > +	if (!bdev) {
> > +		dev_err(atomisp_dev, "NULL hmm_bo_device.\n");
> > +		return NULL;
> > +	}
> >  
> > -	check_bodev_null_return(bdev, NULL);
> > +	root = &bdev->free_rbtree;
> >  	var_equal_return(hmm_bo_device_inited(bdev), 0, NULL,
> >  			 "hmm_bo_device not inited yet.\n");
> 
> While at it, also replace here var_equal_return() with appropriate C code.

Ah, it's done in the last patch!

-- 
With Best Regards,
Andy Shevchenko


