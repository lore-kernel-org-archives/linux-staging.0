Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605DD192D97
	for <linux-staging@lists.linux.dev>; Wed,  1 Jul 2026 09:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782898257; cv=none; b=a9ZgKi4fnxyd/1HzDBBqZ2Ca3Q0zwDqWhVAkbyYgRrQYF7gu8aAI9h0IUqSsgZ8B3w/JjqLOgEtBcLJ1eaUvR1luuDzABAjmEVdQpsWo1K2veCJdGECpsOfzP8QrdeBMzCQ/9t085S2HBYnIZ+q0WBr1LXRkCXsNSExaRGTqwgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782898257; c=relaxed/simple;
	bh=zxdlH1FR6khQMS+6yKVEt4UheNLI9wZOoLU6TFR9BOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5RSIzxoRbQoU+LgR1vj5CdLLC9KFgdSMDEsL9rpuVauywQRazj9qGSUG05eoC7FIeWY8ZMRjggdrN311g+ZZUHHPJsD73pgaKmwKKJoa9H2t1BiE9RzcXLwcSi0ME9fQD2YFevKEVWMYBiC8x86g7L51xvCs+9whQF3zeCX3b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eVbCqeJt; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eVbCqeJt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782898255; x=1814434255;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=zxdlH1FR6khQMS+6yKVEt4UheNLI9wZOoLU6TFR9BOI=;
  b=eVbCqeJtKWm1p5EzNDYJkTafMfbjm1jFfBaE4sQ+fkqKxwVZ/FYtQbxY
   ubRhkWI7FWVMGa4qQXp39pAPIfJRWx/paK9Yd4FinBHpVkDMrCn9FDGvH
   Tgl4jHj5tn+VjdJTNd3I7FnTKIcgPTkCN4Rvb3y5CP4H9JxF+z42H68pY
   +9cnsKi7hqnxERJLyKbqQB0dNqfKzEJvyv+f3v0LOHP95L/2K+tDzaDn6
   iznh7UjLy9fhqyC/N6glqqMT6OVWhwmmjMawnpqiET3cx0hFqAADYiBCV
   8qPyV4nX9j/wWJ4jcNF7Url9btbNVx7TCMj7r6/OEJRwcen04L+rjVImo
   w==;
X-CSE-ConnectionGUID: 4/f4oFjBRuWoyMeqRkPlXw==
X-CSE-MsgGUID: ntAEOa04Tn+7dQ+q57yp1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="71150580"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="71150580"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 02:30:55 -0700
X-CSE-ConnectionGUID: IG6YrvELQtayc+DmRhZEeQ==
X-CSE-MsgGUID: X4PJDEzmRS+/ArkfpiivJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="248537020"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.65])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 02:30:52 -0700
Date: Wed, 1 Jul 2026 12:30:50 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bohdan Derkach <bohdandmarcus@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, hansg@kernel.org,
	mchehab@kernel.org, gregkh@linuxfoundation.org, andy@kernel.org,
	sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: atomisp: fix block comment formatting style
Message-ID: <akTeSuxmA8PesfAt@ashevche-desk.local>
References: <20260630160435.3293-1-bohdandmarcus@gmail.com>
 <CAHp75VdX_DmiWXc_pYCgZd88cO3=yB7vFsgHx_8HLAJtaJOHow@mail.gmail.com>
 <CANqab03_SQFDb38wkXBMUiJ1Xk-g9_ZpqvOUo+nQyR+SsVnsFQ@mail.gmail.com>
 <CANqab0096R4gKrwfKF78iyQt2aM0qQJoSwrBKBqMiZxna60rsg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANqab0096R4gKrwfKF78iyQt2aM0qQJoSwrBKBqMiZxna60rsg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 01, 2026 at 11:51:43AM +0300, Bohdan Derkach wrote:

First of all, do not top-post!

Second, do not send HTML, the only plain text is what is considered.

> On Wed, Jul 1, 2026 at 11:42 AM Bohdan Derkach <bohdandmarcus@gmail.com> wrote:

> > You are completely right about the indentation and line wraps. Dan
> > Carpenter also pointed this out to me yesterday, and I have already
> > prepared a v4 that fixes all of these issues perfectly. I am strictly
> > following the rule to wait a full 24 hours between sending versions, so I
> > will send v4 later today.
> >
> > Regarding your question about whether this is the only issue in the driver:
> > I understand that sending a patch for a single block comment in a 100k LoC
> > driver is a very small contribution. Since this is my very first patch to
> > the Linux kernel, my main goal was to learn the correct workflow (git
> > send-email, formatting versions, acting on feedback) before sending larger
> > patch series.
> >
> > Once this v4 is accepted and I am confident that my setup is correct, my
> > next step is to grep through the rest of atomisp to fix similar block
> > comments and submit them as a proper patch series.

It really doesn't matter if this is a single place fix or not, the part of
the process is to try to fix the whole class of the problems at once.

Also check that your code is based on latest and greatest maintainer's tip.
(It's located somewhere on git.linuxtv.org with atomisp in the tree name.)

> > Thank you for your patience and for guiding a newcomer!

You're welcome.

> > On Wed, Jul 1, 2026 at 11:31 AM Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> >>
> >> On Tue, Jun 30, 2026 at 7:06 PM Bohdan D. Marcus
> >> <bohdandmarcus@gmail.com> wrote:
> >> >
> >> > Fix a block comment formatting warning reported by
> >> > checkpatch.pl in atomisp_cmd.c to conform to the
> >> > Linux kernel coding style.
> >>
> >> Almost the same comments as per v2. Please, slow down, read other
> >> comments and act accordingly.

-- 
With Best Regards,
Andy Shevchenko


