Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE1734676F
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 14:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775658590; cv=none; b=bwwZEMxWx7YWaucD5OR+634wbVsgGB0GS7taMd/luzACuiUXL09zxflnM0CtqxQNVF6KBDjdoFSb/Fy8T9KWgva/bPG0UfS4A2KDtYN9II5vqc+8LgCEJBOMz8zg0ESL+0u3bzlu/LqfG2lGomQ4Rww6snUkQUkqiLHf35xfMeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775658590; c=relaxed/simple;
	bh=GAP/DMpZr8A4ie5pXw4wqMwLJbxOUwnvPgOfhYRCVg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jo4Jl7MN7mw5SZOmnEPryXE5bbyRSdQ0wJmSt3FDFwHcrYGfFjFp3S70MuZKuNzS0lGbUCSwhBTL2drKDKlZn03oOd89dAZ8B5PMWxu4LU/q9kbB8XiERQR7OSwkzYYqyHI7eQr3ef4/xF2A7SjDghuUIcTWieW+cHRjPyNsRbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ginFHfTD; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ginFHfTD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775658589; x=1807194589;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GAP/DMpZr8A4ie5pXw4wqMwLJbxOUwnvPgOfhYRCVg0=;
  b=ginFHfTDxHRr9vSfW87PGcVjUwsV7po2fkZTZvjduf15rYijVgnKHCOu
   ilJfUdHKrry1cAW5wZV3u65D9DFJ8ZzWvrbFtPblIjc0LwNbBcMphbKM0
   nLOwKTrJ+kEzpieG7uOLuCN81fedCUVSFWjijrMDpFLtvbTrzATYS+OcE
   Ajqp0ajXsvp8CJ7MyHX/rY7JzCQK7bUGtM1KSdM18Cux+g6I0CdsL2vpV
   7LbqmisQbUXkKGc9V2ErTcbcAgriN6466KjNd0EzWHffvOWU9If1NVKab
   c4dYiVtmervPuOPh/O4TSzTNwZ1yBJG092+DjI1plyIfh1g6xQp4zDgo0
   A==;
X-CSE-ConnectionGUID: k2bRn3JDQvmdNgq9s9DLBQ==
X-CSE-MsgGUID: 7zPtNh0iTHO/EwCQQsrMdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76716905"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="76716905"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 07:29:49 -0700
X-CSE-ConnectionGUID: 3M4FIUerR8eqJHP3ra24fA==
X-CSE-MsgGUID: GcSX3ng7S5KHCwbnaBXDFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="266470038"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.72])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 07:29:48 -0700
Date: Wed, 8 Apr 2026 17:29:45 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [RFC] media: atomisp: change copy_from_compatible to iov_iter
Message-ID: <adZmWZ0SXRhHPyQ9@ashevche-desk.local>
References: <adUeywfiQzZ5JgEd@ashevche-desk.local>
 <20260408134612.1380-1-joshua.crofts1@gmail.com>
 <adZlX-5rx0jtIMpD@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adZlX-5rx0jtIMpD@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Apr 08, 2026 at 05:25:39PM +0300, Andy Shevchenko wrote:
> On Wed, Apr 08, 2026 at 01:46:11PM +0000, Joshua Crofts wrote:
> > Since the atomisp driver concerns transferring video
> > data, it would probably be better to use an iov_iter
> > than copy_to_user calls (scatter-gather i/o and better
> > pointer safety). Per yesterday's emails, I'm sending an
> > an example of a function in atomisp_cmd.c where I've
> > implemented iov_iter usage.
> > 
> > Note, this isn't a patch, more of a question whether this
> > style of changing the copy_to_user calls is valid (or if
> > I'm writing garbage code). I'd rather get your opinion
> > than submitting a patch first.

Sure, see below.

...

> > -	ret = copy_to_user(config->data, asd->params.s3a_user_stat->data,
> > -			   asd->params.s3a_output_bytes);
> > -	if (ret) {
> > -		dev_err(isp->dev, "copy to user failed: copied %lu bytes\n",
> > -			ret);
> > +	ret = import_ubuf(ITER_DEST, (void __user *)config->data, asd->params.s3a_output_bytes, &iter);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (copy_to_iter(asd->params.s3a_user_stat->data, asd->params.s3a_output_bytes, &iter) != asd->params.s3a_output_bytes)
> >  		return -EFAULT;
> > -	}
> 
> It doesn't change any architectural decision here. Basically you need to have
> s3a_output_bytes to be already iov_iter at this point. So, import_ubuf() has to
> happen somewhere else.

Brief grepping shows this

        /*
         * Intermediate buffers used to communicate data between
         * CSS and user space.
         */
        struct ia_css_3a_statistics *s3a_user_stat;

which suggests that iov_iter should be somewhere here, in the struct
atomisp_subdev_params. But you need to read much more code and get familiar
with this. I wouldn't expect any meaningful change by a few days, maybe by
a few weeks as this driver is quite complicated.

In any case, thanks into trying with this, will be very appreciated
when the task is logically finished.

-- 
With Best Regards,
Andy Shevchenko


