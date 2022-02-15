Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519F67C
	for <linux-staging@lists.linux.dev>; Tue, 15 Feb 2022 19:19:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E76B9C340EB;
	Tue, 15 Feb 2022 19:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644952780;
	bh=RxAYLCqbUWlxjV9GFahzPwnkRBYKU9aVJMxo+INb+K8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oa82FKq0/HZo1Hieccox0xhuEOltsBpyNCb/oKWHfz9JimsfI5qrPFHosVG+Hw9KD
	 FqjMZvJ5BquXlsEM1IUTOugfyhHJjbL+NoooCvHgJp/wzFU4N6mJ3/+qfEy0h1bhbj
	 fv9Bo5w4LHHM1g+pM9OlS1+FV6MX0/N+Aa88X5OzELy65s1Xs5Q/258d9WBNoUp0fb
	 HMGG+vm/A6PvbbvtXJ00MB45hauRqyRZCekvmCmXYRktZmaEtd9qOIjTryp50cyo1/
	 0DT+ajNam/uql+1lfstz9xW/6FSdwogqLIyHb8bwuPl3b0gveaOfCnpwJkPBK0mL1q
	 tCTR2Et3rHU/g==
Date: Tue, 15 Feb 2022 21:19:29 +0200
From: Leon Romanovsky <leon@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	GR-QLogic-Storage-Upstream@marvell.com, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	linux-xtensa@linux-xtensa.org, linux-crypto@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org, mpi3mr-linuxdrv.pdl@broadcom.com,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	sparmaintainer@unisys.com, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org, linux-ext4@vger.kernel.org,
	linux-acpi@vger.kernel.org, devel@acpica.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	greybus-dev@lists.linaro.org, linux-i3c@lists.infradead.org,
	linux-rdma@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] treewide: Replace zero-length arrays with
 flexible-array members
Message-ID: <Ygv8wY75hNqS7zO6@unreal>
References: <20220215174743.GA878920@embeddedor>
 <202202151016.C0471D6E@keescook>
 <20220215192110.GA883653@embeddedor>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220215192110.GA883653@embeddedor>

On Tue, Feb 15, 2022 at 01:21:10PM -0600, Gustavo A. R. Silva wrote:
> On Tue, Feb 15, 2022 at 10:17:40AM -0800, Kees Cook wrote:
> > On Tue, Feb 15, 2022 at 11:47:43AM -0600, Gustavo A. R. Silva wrote:
> > > There is a regular need in the kernel to provide a way to declare
> > > having a dynamically sized set of trailing elements in a structure.
> > > Kernel code should always use “flexible array members”[1] for these
> > > cases. The older style of one-element or zero-length arrays should
> > > no longer be used[2].
> > > 
> > > This code was transformed with the help of Coccinelle:
> > > (next-20220214$ spatch --jobs $(getconf _NPROCESSORS_ONLN) --sp-file script.cocci --include-headers --dir . > output.patch)
> > > 
> > > @@
> > > identifier S, member, array;
> > > type T1, T2;
> > > @@
> > > 
> > > struct S {
> > >   ...
> > >   T1 member;
> > >   T2 array[
> > > - 0
> > >   ];
> > > };
> > 
> > These all look trivially correct to me. Only two didn't have the end of
> > the struct visible in the patch, and checking those showed them to be
> > trailing members as well, so:
> > 
> > Reviewed-by: Kees Cook <keescook@chromium.org>
> 
> I'll add this to my -next tree.

I would like to ask you to send mlx5 patch separately to netdev. We are working
to delete that file completely and prefer to avoid from unnecessary merge conflicts.

Thanks

> 
> Thanks!
> --
> Gustavo
