Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78EB3C30;
	Tue, 14 Mar 2023 16:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35351C433EF;
	Tue, 14 Mar 2023 16:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678811950;
	bh=Vx7uM9fWMCpVMGWtFNryGdXdw31PgaYm7KlFHOU1CLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NdEhbzs1kV/dXeAH8MDyev+OO5WZj8wqk/IU/cHy/kb7/5PhKl82ojWqOJtxBbPzf
	 qsdLG7edz5/l9Z/ydeC8zhY/pxepnTtXd51i70E6sJmOGKd4DCmefjEIqX+939fh2s
	 lBvgzLrmwLgNamx2QWQndUS0OgQLNKru5TfXyExY=
Date: Tue, 14 Mar 2023 17:39:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alison Schofield <alison.schofield@intel.com>
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Kloudifold <cloudifold.3125@gmail.com>,
	teddy.wang@siliconmotion.com, sudipm.mukherjee@gmail.com,
	linux-staging@lists.linux.dev, outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750: Rename function to avoid CamelCase
Message-ID: <ZBCjK2BXhfiFooeO@kroah.com>
References: <ZA+K6OdPe21k8F2k@CloudiRingWorld>
 <64f9d3ca-268e-71ae-4a6d-b71315a8406e@gmail.com>
 <ZBCbJR2RVzc7Wr4g@aschofie-mobl2>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBCbJR2RVzc7Wr4g@aschofie-mobl2>

On Tue, Mar 14, 2023 at 09:04:53AM -0700, Alison Schofield wrote:
> On Tue, Mar 14, 2023 at 01:07:59AM +0100, Philipp Hortmann wrote:
> > On 3/13/23 21:43, Kloudifold wrote:
> > > The sm750 driver had some functions named in CamelCase,
> > > which violates the kernel's naming convention.
> > > In this patch, I rename these functions to snake case,
> > > which is the expected style.
> > 
> > Hi,
> > please make the Subject more unique. Many patches could have this name.
> > Look for examples in:
> > https://lore.kernel.org/linux-staging/
> > 
> > Please use your full name consisting of a given name and a family name in
> > front of your email. Or is this not possible and "Kloudifold" is both?
> 
> Kloudifold,
> 
> It'll probably take a bit for the change, allowing pseudonyms, to become
> common knowledge. When the question comes up, you can just point to the
> latest update to Documentation/process/submitting-patches.rst as I've
> done below.
> 
> Phillip,
> I commented similar to you, and then discovered this:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d4563201f33a022fc0353033d9dfeb1606a88330
> 
> Pseudonyms now allowed.

"Known pseudonyms" are now allowed.  So that means that somehow I need
to "know" this is actually a pseudonym and that it is unique and so on.
As you are dealing with outreachy already, odds are you have to use a
non-pseudonym for them in order to track patches and payments and the
like, so please use the identifier you use with outreachy.

thanks,

greg k-h
