Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF9C3C13F5
	for <linux-staging@lists.linux.dev>; Tue,  7 Jul 2026 07:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783408700; cv=none; b=Vc/kuxyY8OZAv9xf5XGcVJikDa+INnumMmLfthd7sGLbFmyiEg8aNr17k5pUr8ZiBd0npGLINqRWEZ1PAHVcya0Kxt6DZ0qNoP4YoMZ7m4M0VyqgliLUVf9lKu/upVIAQQzEwJxUneubGt1MPkCbLWY4cbH5D9YPqlQuc4/hY7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783408700; c=relaxed/simple;
	bh=lXv3s7TUQglwtYTP8xhW2uZKJRMERLZ2mMC90X8SyVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pr9C+G9Dseq6W9wMHwuQBfEvZ6FJkVHdMZ1ife5o+/5+BENLytxXgR7z2T4ZMfyA9NFrKZqbPOslvVF5GEXb8hnE6FMo5DSnsO+BEDci7OCYpGk07UPKpDGyan6zwp4UOwW5zlij+BBLqOSBNTQXHifGptszJqG7PaYXDkfHTu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mK6Iolm+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mK6Iolm+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783408693; x=1814944693;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=lXv3s7TUQglwtYTP8xhW2uZKJRMERLZ2mMC90X8SyVI=;
  b=mK6Iolm+zAtXgIajTm4BQ2OiwRm8kWuXRuuSU8jlj0aSp1PMdSymSdGn
   pSqvbXUlQWN13GisU7cJMGekApOzwI8VylX/xtYSVlGuXVfYlvty+Bs2I
   aCS1K0CID/LvA1z6EPx1SfwdgxYi8yoH3Z5YLsLBqguRcyWwACRrFbuJT
   uvU19ETS/GcH3vcYzM+UO1dL1wtkaV9vBHPaKYt5I3pmjzdm1KbNOcxZt
   RuCVEOK9S3l+x2MV2S20UTNH32lirm9uN+EKdTS7f76VWuLsxq524/Ada
   IlE2Ez89JunovRAxDIoxrmy/+SPs8qy1iruBTwBtBFb7yEj4ZP9OgxlwI
   Q==;
X-CSE-ConnectionGUID: U4W25O11TnKTaAfftE1Evg==
X-CSE-MsgGUID: nfznV4TbSwqOWdh/63gk5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="84072954"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84072954"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 00:18:11 -0700
X-CSE-ConnectionGUID: GR2WtPkFT+KRqjVdul0wpQ==
X-CSE-MsgGUID: Ea2HVu0rRgS03xBy/Mzg9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="254009287"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.178])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 00:18:09 -0700
Date: Tue, 7 Jul 2026 10:18:06 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Neal Patalay <nealpatalay0@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, andy@kernel.org,
	hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	mugrinphoto@gmail.com, matt@mattwardle.net
Subject: Re: [PATCH v4] staging: media: atomisp: refactor pipe graph dump
 stage formatting
Message-ID: <akyoLqy98pt2iRkP@ashevche-desk.local>
References: <20260706000738.18478-1-nealpatalay0@gmail.com>
 <CAHp75VcSGXC=x3hFXt8qvyRQjPzy3uLN9iBTURp2yA9+P_jibg@mail.gmail.com>
 <CAGjuiT9gu32wvx2Vf0U0g9deyAzzGtwwCNEdW_R4JVarO9x4JQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGjuiT9gu32wvx2Vf0U0g9deyAzzGtwwCNEdW_R4JVarO9x4JQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jul 06, 2026 at 02:59:16PM -0700, Neal Patalay wrote:
> On Sun, Jul 5, 2026 at 10:37 PM Andy Shevchenko wrote:
> 
> > Please, slow down! No need to send a new version immediately after
> > replying to the previous one without settling down all aspects of the
> > change.
> >
> > This version is no go, sorry.
> 
> Understood, no problem.
> 
> > > +static void ia_css_debug_build_info(char *info, size_t info_size,
> > > +                                   int *offset,
> > > +                                   const char *flag_str, size_t flag_str_size,
> > > +                                   int *line_len,
> > > +                                   int *num_lines)
> > > +{
> > > +       int len = *line_len;
> > > +       int off = *offset;
> > > +       int lines = *num_lines;
> > > +       int len_written;
> > > +
> > > +       if (lines > 3)
> > > +               return;
> > > +
> > > +       /*
> > > +        * If new line length exceeds max line length,
> > > +        * replace the last ',' with a "\\n".
> > > +        */
> > > +       if (len > 0 && off > 0 && info_size - off >= 2 &&
> > > +           len + flag_str_size > ENABLE_LINE_MAX_LENGTH) {
> > > +               if (lines >= 3) {
> > > +                       *num_lines = lines + 1;
> > > +                       return;
> > > +               }
> > > +               info[off - 1] = '\\';
> > > +               info[off] = 'n';
> > > +               off += 1;
> > > +               len = 0;
> > > +               lines += 1;
> > > +       }
> > > +
> > > +       len_written = scnprintf(info + off, info_size - off, "%s,", flag_str);
> > > +       *offset = off + len_written;
> > > +       *line_len = len + len_written;
> > > +       *num_lines = lines;
> > > +}
> >
> > This makes helper too ugly and unreadable. Again, study the case
> > first, when this can be true. Do we really need to cut it? This whole
> > thing AFAICS depends on the dtrace facility in the driver. Is that
> > HW-related? Is it pure SW? You need to perform some homework.
> 
> I've taken a look at the driver in greater depth. The flag wrapping
> functionality being refactored here is used to construct a graph
> visualization for debugging.
> 
> > >                 dtrace_dot("node [shape = circle, fixedsize=true, width=2.5, label=\"%s\\n%s\\n\\n%s\"]; \"%s(pipe%d)\"",
> > >                            bin_type, blob_name, enable_info, blob_name, id);
> 
> Each one of these calls generates a node in that graph, and the contents
> of the node are decided by the flag string we build in enable_info. Seeing
> as we are just collecting debug info and populating a visualization with it,
> this refactor seems to be software.
> 
> Seeing as it's unlikely that every flag is enabled at once, and even if they
> are this only causes a slightly more unreadable graph, avoiding 3 line
> truncation seems to be the best option since it leads to more readable code
> and avoids omitting information.
> 
> Additionally, len > 0 && offset == 0 is an impossible condition under any
> feasible helper function use condition. This can be documented in a comment.
> 
> Given this information, to me it seems like the best course of action is to
> revert the helper function to its simpler state without line count truncation
> or the offset > 0 comparison. What do you think?

I agree, just add more comments to the code and elaborate in the commit message
the (potential) difference in the behaviour.

-- 
With Best Regards,
Andy Shevchenko


