Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1596129
	for <linux-staging@lists.linux.dev>; Wed, 10 May 2023 08:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 869FFC433D2;
	Wed, 10 May 2023 08:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1683707041;
	bh=QHl9O0+GyO3IxzYRQZ+Cvm8DVVpWm/ZqfcJpbla8hnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dr/bMcqj19gk6I9n/0MWgpijKmDcL7HAxKmE2zIcTS5maP99icKPJ1rwmQZoIqJMU
	 AzXU2oJ3jESPUUNLI1edrrQEj1O3zCHlCzSXJj7tNq4eZ5XDFcCDDz4O32uuz9m6u1
	 /bFlR9p2XsT0cTtLdQBuCh648zWP/tY+eK9WhbEo=
Date: Wed, 10 May 2023 10:23:59 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Radoslaw Szwichtenberg <radoslaw.szwichtenberg@intel.com>,
	Maciej Ramotowski <maciej.ramotowski@intel.com>,
	Kamil Konieczny <kamil.konieczny@linux.intel.com>,
	linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: Make xe build dependent on STAGING.
Message-ID: <2023051029-overspend-sherry-1b85@gregkh>
References: <20230509151008.1434683-1-rodrigo.vivi@intel.com>
 <ro2hcqlyzx4sfd7atm7r2kmqk74gymkpyo2kgt7heabvkolpre@xcfkmdn77ot4>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ro2hcqlyzx4sfd7atm7r2kmqk74gymkpyo2kgt7heabvkolpre@xcfkmdn77ot4>

On Tue, May 09, 2023 at 09:56:33AM -0700, Lucas De Marchi wrote:
> On Tue, May 09, 2023 at 11:10:08AM -0400, Rodrigo Vivi wrote:
> > As documented in drivers/staging/Kconfig:
> > 
> > STAGING means "that these drivers are under heavy development" and
> > "may contain userspace interfaces that most likely will be changed
> > in the near future."
> > 
> > As explained in Documentation/gpu/rfc/xe.rst:
> > 
> > "
> > Xe driver will be protected with both STAGING Kconfig and force_probe.
> > Changes in the uAPI are expected while the driver is behind these
> > protections. STAGING will be removed when the driver uAPI gets to a
> > mature state where we can guarantee the ‘no regression’ rule.
> > Then force_probe will be lifted only for future platforms that will be
> > productized with Xe driver, but not with i915.
> > "
> > 
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Radoslaw Szwichtenberg <radoslaw.szwichtenberg@intel.com>
> > Cc: Maciej Ramotowski <maciej.ramotowski@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> I agree with the idea, but I was expecting a few more hits:
> 
> 	$ git grep "\bSTAGING\b" -- '*Kconfig'
> 	drivers/gpu/drm/nouveau/Kconfig:        depends on STAGING
> 	drivers/gpu/drm/tegra/Kconfig:  depends on STAGING
> 	drivers/staging/Kconfig:menuconfig STAGING
> 	drivers/staging/Kconfig:if STAGING
> 	drivers/staging/Kconfig:endif # STAGING
> 	drivers/staging/vme_user/Kconfig:       depends on STAGING && PCI
> 	drivers/staging/vme_user/Kconfig:       depends on STAGING && VME_BUS
> 
> Are we doing something wrong here? Documentation/process/2.Process.rst
> talks about drivers under staging/ directory rather than drivers
> depending on CONFIG_STAGING.

Yes, you are doing something wrong here :)

CONFIG_STAGING is only to be used for drivers/staging/.  But I will not
take drm drivers into that directory as the DRM developers don't want me
to (and that's wonderful, no objection from me).

If you just use the CONFIG dependancy here you will not get the taint
flag set properly if they are out of that directory (and you want that
taint flag, TAINT_CRAP is there for that reason.)

But hey, it's your subsystem, if you want to depend on this random
config variable, wonderful!  But realize that it means nothing, and has
nothing to do with user/kernel api stability issues at all.

thanks,

greg k-h
