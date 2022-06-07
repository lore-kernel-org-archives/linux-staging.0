Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD747F
	for <linux-staging@lists.linux.dev>; Tue,  7 Jun 2022 11:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0DDC385A5;
	Tue,  7 Jun 2022 11:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1654599641;
	bh=NCRYi15R3SZXtnylokP+CV2OP6UTPKNRKneK+LCEpG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ILDaKY5ugYGsxjq64AvD2ysNnh0lwMQfUX31OEtuMOLB15NMj9whtQz/IwJamuE0n
	 KOosLjA/tUa0TDajoaTZ7HU3GhWFivLIpk6uPwlJFR5HkBM4K2Cb/EHWQpgN0qQDSs
	 NqZudHs6sArM4mjJXfyJWnuXLd8mipD8YgISVE3Q=
Date: Tue, 7 Jun 2022 13:00:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH] staging: r8188eu: Fix kernel-doc
Message-ID: <Yp8v1OPPOlb9A16D@kroah.com>
References: <20220524083914.68736-1-jiapeng.chong@linux.alibaba.com>
 <Yp2WPrOz85/70CZx@kroah.com>
 <Yp2zwBqn6uDvGNWN@debian.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yp2zwBqn6uDvGNWN@debian.me>

On Mon, Jun 06, 2022 at 02:58:56PM +0700, Bagas Sanjaya wrote:
> On Mon, Jun 06, 2022 at 07:53:02AM +0200, Greg KH wrote:
> > On Tue, May 24, 2022 at 04:39:14PM +0800, Jiapeng Chong wrote:
> > > Fix the following W=1 kernel warnings:
> > > 
> > > drivers/staging/r8188eu/hal/rtl8188e_phycfg.c:291: warning: expecting
> > > prototype for Function(). Prototype was for rtl8188e_PHY_SetRFReg()
> > > instead.
> > > 
> > > drivers/staging/r8188eu/hal/rtl8188e_phycfg.c:257: warning: expecting
> > > prototype for Function(). Prototype was for rtl8188e_PHY_QueryRFReg()
> > > instead.
> > 
> > Please put build warning lines all on one line.
> > 
> > > 
> > > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> > 
> > No, gcc reported this, not a robot, right?
> > 
> > You have read Documentation/process/researcher-guidelines.rst for how to
> > properly document patches that are created by research tools like this,
> > right?  Please fix this commit up to follow those requirements please.
> > 
> 
> Hi Greg and Jiapeng,
> 
> First, IMO this is not research tool (in the sense of academic purposes),
> but development bot used in corporate environment, kinda like kernel
> test robot <lkp@intel.com>. When the bot reports any build warnings,
> these will be followed up by developers proposing fixes.

Ok, then please document it as such and point to where we can find out
more information about it.

> What I see in the patch message is just "Fix this warning..." without
> saying why there is the warning.

Which isn't ok.

> Second, gcc DOESN'T, again DOESN'T, report "expecting prototype"
> warnings. These are from scripts/kernel-doc, which enabled these
> warnings on W=1 build.

Yes, the kernel build reports this, not a random "robot".

> So the underlying problem is mismatching function name in kernel-doc
> comment and actual function.

Agreed, so the changelog should say as such.

thanks,

greg k-h
