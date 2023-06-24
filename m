Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60D9360
	for <linux-staging@lists.linux.dev>; Sat, 24 Jun 2023 06:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8178C433C8;
	Sat, 24 Jun 2023 06:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1687589454;
	bh=PgkM/agWEzkV5O8q2f8AerxnNjt83yq2Cif+ksBuT5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ph5Uo/SAaykbjmUcgRS/wlzuFsMU1uMQRfZwB5NDJ8cC4jrons60SFAoMRCL+DKmo
	 +r9labIhdk+E+RSuEvDFHDkomAWbmhAZrUNd/kmFQw99RUisxchMaaJMtzlDzcpk5c
	 o0B3L4GBvp3CUBhkaVcdPZiC3yzX8ULXySiNxdLw=
Date: Sat, 24 Jun 2023 08:50:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Franziska Naepelt <franziska.naepelt@googlemail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	eperi1024@gmail.com, hdegoede@redhat.com, quic_vjakkam@quicinc.com,
	johannes.berg@intel.com, tegongkang@gmail.com,
	Franziska Naepelt <franziska.naepelt@gmail.com>
Subject: Re: [PATCH v2 0/5] Fix some checkpatch issues
Message-ID: <2023062422-anchovy-hazy-0996@gregkh>
References: <20230621184635.25064-1-franziska.naepelt@gmail.com>
 <2023062306-reload-squeezing-633a@gregkh>
 <2d1ba862-961c-ec91-3a28-7f2f221b90d4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d1ba862-961c-ec91-3a28-7f2f221b90d4@gmail.com>

On Fri, Jun 23, 2023 at 07:20:42PM +0200, Philipp Hortmann wrote:
> On 6/23/23 10:18, Greg KH wrote:
> > On Wed, Jun 21, 2023 at 08:46:35PM +0200, Franziska Naepelt wrote:
> > > This is a series of patches to fix some trivial checkpatch issues. Not all
> > > issues have been fixed. I intend to submit another series to fix more stuff.
> > 
> > None of these apply to my staging-next branch :(
> > 
> 
> Hi,
> 
> this is the repo and branch I use:
> 
> git remote show origin
> * remote origin
>   Fetch URL:
> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
> ...
> git branch -a
> my branch: staging-testing

Please note that this branch will get rebased at times, so be aware of
that and know how to handle it properly.

thanks,

greg k-h
