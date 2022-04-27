Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6A97B;
	Wed, 27 Apr 2022 16:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651076671; x=1682612671;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xbVkhqUprSffI6k9578RyOtKLKT5PDGpfnHI0RkdbJg=;
  b=TA0/ftZoB/ez/G1Tt5STYHdZczL9VAOTHnWcnLWPUHPPVSf7m3rPWRKR
   fu3G8BiQHDT5jt6g/uaPP7FuP0Dmnyi0v38KEg6qtIGmM2gNA+/FcVHmH
   8Ttl7VxwjSaAWLOmtKScPC9eSZ/qb3IVADXZNzZgQaPgYvIvbm9DnLcUt
   OOBC7DlsjWBZkQ3zFFeu8t65q2ZMCAwde6NS+2XpzQ3A1BRa1H99xJ7vj
   HuRTCkdH16NG9XheL2ndBwudCf0PW0ewgBaf5rsx4mjxRRIkz05fJlryY
   i4+MpaexPYiNu/MsytyryVv+ECmZkCbqlamzqJMD7wllwibfqi7orsniw
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="266151257"
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; 
   d="scan'208";a="266151257"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2022 09:15:06 -0700
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; 
   d="scan'208";a="533293590"
Received: from alison-desk.jf.intel.com (HELO alison-desk) ([10.54.74.41])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2022 09:15:06 -0700
Date: Wed, 27 Apr 2022 09:16:33 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bruno Moreira-Guedes <codeagain@codeagain.dev>,
	Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Bruno's Patch Watchbox <patch-reply@codeagain.dev>
Subject: Re: [PATCH v3 0/3] staging: vme: Cleanup driver tree old structures
Message-ID: <20220427161633.GA1314857@alison-desk>
References: <cover.1650321310.git.codeagain@codeagain.dev>
 <YmA4QIRfx2QPhEJi@kroah.com>
 <3e91b72a86294b542acf460657d0fd94adeb252e.camel@welchs.me.uk>
 <YmJNqMjXEc4KGrJ8@kroah.com>
 <20220427121851.4e2rjbbabw5sh3lk@AN5Bruno>
 <Ymk3qimGl1tTjpSL@kroah.com>
 <20220427124114.woiiuxr6pnxvadwg@AN5Bruno>
 <YmlA1w124Ws2z/RV@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmlA1w124Ws2z/RV@kroah.com>

On Wed, Apr 27, 2022 at 03:10:47PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Apr 27, 2022 at 09:41:14AM -0300, Bruno Moreira-Guedes wrote:
> > On Wed, Apr 27, 2022 at 02:31:38PM +0200, Greg Kroah-Hartman wrote:
> > > On Wed, Apr 27, 2022 at 09:18:51AM -0300, Bruno Moreira-Guedes wrote:
> > > > Hello,
> > > > 
> > > > On Fri, Apr 22, 2022 at 08:39:36AM +0200, Greg Kroah-Hartman wrote:
> > > > > On Thu, Apr 21, 2022 at 08:16:05PM +0100, Martyn Welch wrote:
> > > > > > On Wed, 2022-04-20 at 18:43 +0200, Greg Kroah-Hartman wrote:
> > > > > > > On Mon, Apr 18, 2022 at 08:29:49PM -0300, Bruno Moreira-Guedes wrote:
> > > > > > > > This patch series modify the vme_user driver's place in
> > > > > > > > menuconfig (1/3), fixes a missing `depends on` line in a Kconfig
> > > > > > > > file
> > > > > > > > (2/3), and rearrages the directory tree for the driver allowing a
> > > > > > > > more
> > > > > > > > straightforward comprehension of its contents (3/3).
> > > > > > > > 
> > > > > > > > The 'vme_user/' driver is the only remaining vme-family driver in
> > > > > > > > the
> > > > > > > > 'staging/' tree, but its structure, entry in menuconfig and
> > > > > > > > building
> > > > > > > > routines are still attached to the 'vme/' subtree now outside
> > > > > > > > 'staging/'. The present patchset fixes it.
> > > > > > > > 
> > > > > > > > Signed-off-by: Bruno Moreira-Guedes <codeagain@codeagain.dev>
> > > > > > > 
> > > > > > > What about deleting the vme drivers entirely?
> > > > > > 
> > > > > > I assume you're suggesting deleting the "vme_user" driver from the
> > > > > > staging directory?
> > > > > 
> > > > > Yes, at the very least given that no one has tried to fix it up and get
> > > > > it out of staging in many years.
> > > > 
> > > > While I cannot comment anything on that regard, I imagine the v4 I sent
> > > > a couple of days ago will wait for that decision, right?
> > > 
> > > I do not know what you are referring to, sorry.  My staging patch queue
> > > is empty right now.
> > Ohhh, okay, no problem, I have sent a v4 around 6 days ago and thought
> > you were waiting on this definition.

Bruno - I see your patches was applied to staging-testing
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/log/?h=staging-testing


> 
> If I did not take it, please resend.
> 
> thanks,
> 
> greg k-h
> 
