Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E863AFB09
	for <linux-staging@lists.linux.dev>; Mon,  8 Jun 2026 09:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780911731; cv=none; b=Sli6c+baQXunS8+j1pzu4FiXCmz3lxlY23MOwJjfEiPQewQgiWgF8Q29EYdZ0+gT+4HkGotCJGihsITITk7jGvLppa7knGro3rkT08Q7mebwgDEIhUdmI0jXMmAsvTImDyvZdnnM3e4hkBSweS5qSk1rwGz6rE/8E/8U0KkSXNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780911731; c=relaxed/simple;
	bh=ldOnsl5F3ax8w/TkW/PCiwokYR6H6h8KIyl0418IMUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d5jnXpq9nbPL6Wc1ZzUgC/9sG1SsQOAGz7QUhMMkSWgqijMV1vGOpLKaMT9u7DYLDlWdwlEXQZMaYH4XwW/j7tL4SfyDfA/Nusm37euinpG92UegTbyXQJbWHCWFxyXIjNHiwsmPWQM8nrW/NEZlrz1LByYBJxgkp0llNpIw5C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vg+moecv; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vg+moecv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780911730; x=1812447730;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ldOnsl5F3ax8w/TkW/PCiwokYR6H6h8KIyl0418IMUY=;
  b=Vg+moecvtREJ+5nGrsiaBcUQpa+p6fd/VPaOx/V1Cmetbmf1PGPjhpPL
   mdFbRz10kMVJ6Bu1WULBEIuQ76H8H8QnfnzJRSeUf2DNqrU8QgMjjoPvG
   BFkmYWNlgBTjYhrNjlDZddkhqWoGGqB2wpQCkbbUHbuQElamz9EnwisaE
   nUtmolPUVnXNHJdkZVry5uGMe+s8T8AIUpIVp0c8aaQptOWZfkGavwy/9
   KDQQXT+4ZbbJ05jyVZhKd5n457gLHp6KkN12w3Rb4uffKFs3Rw9MGui0j
   gf62IjTCHc3ARW7mPTqQn0/lpDEWGbhtG3EL0++JFLDBOXJ6b/58ZyflA
   Q==;
X-CSE-ConnectionGUID: a39R7YfBRMGsr+UaYkYo5Q==
X-CSE-MsgGUID: bPlJ2P/FTKWY30qBp+HHow==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="93033464"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="93033464"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 02:42:09 -0700
X-CSE-ConnectionGUID: GqS50Ob9Q4KKiKVgJFVomw==
X-CSE-MsgGUID: Hui5CjryTMCiAZGFt3QOiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="245596346"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.110])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 02:42:01 -0700
Date: Mon, 8 Jun 2026 12:41:58 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Andrei Khomenkov <khomenkov@mailbox.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kees Cook <kees@kernel.org>, linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: Re: [PATCH RESEND] media: atomisp: replace kmalloc() with
 kmalloc_array() in sh_css.c
Message-ID: <aiaOZrwQjHufwiLE@ashevche-desk.local>
References: <20260606095410.13968-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606095410.13968-1-khomenkov@mailbox.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Jun 06, 2026 at 12:54:10PM +0300, Andrei Khomenkov wrote:
> Replace arithmetic in the kmalloc() function with the kmalloc_array()
> function, as this calculation method is unsafe.

...

> -	descr->in_info = kmalloc(descr->num_stage *
> -				 sizeof(struct ia_css_frame_info),
> -				 GFP_KERNEL);
> +	descr->in_info = kmalloc_array(descr->num_stage, sizeof(struct ia_css_frame_info),

Why not sizeof(*descr->in_info) ?

...

Same Q to the rest.

-- 
With Best Regards,
Andy Shevchenko


