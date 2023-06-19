Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73993107A2
	for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 12:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 899F4C433C8;
	Mon, 19 Jun 2023 12:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1687179478;
	bh=lvQFynrSlluUDfKEQRaFguLfTs4F/l2Y7cwjnHAJVMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QAp6/Cl5pH0cVIqqLi8S/dSa6nxYS/1OV+34wN1Hn45/wZOgdGKjOWD8j1cmucpvc
	 sMgV1vQG6OC1KjqPRE0Vm5OKgxbbkfQdmUemwUp7rey9/u6/kAg1CNWc05/3MhpgHh
	 ByI6S1k3IGPNdDKShufq/kF6ss9imOB7wL3hjruM=
Date: Mon, 19 Jun 2023 14:57:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Yogesh Hegde <yogi.kernel@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, dan.carpenter@linaro.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, ivan.orlov0322@gmail.com
Subject: Re: [PATCH v3 0/4] Trivial code cleanup patches
Message-ID: <2023061938-unbounded-unbent-e706@gregkh>
References: <cover.1687092111.git.yogi.kernel@gmail.com>
 <e80d385d-5515-ed42-e5dd-f9c977f7d4d1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e80d385d-5515-ed42-e5dd-f9c977f7d4d1@gmail.com>

On Sun, Jun 18, 2023 at 10:26:37PM +0200, Philipp Hortmann wrote:
> On 6/18/23 15:03, Yogesh Hegde wrote:
> > Rename variables in struct rtllib_device to avoid CamelCase which is not
> > accepted by checkpatch.
> > 
> > ---
> > v3: The driver is split into 2 modules, calling the functions directly which
> >      the v2 of the patchset does breaks compile. So reverting back to v1 of
> >      the patch as suggested by Greg Kroah-Hartman <gregkh@linuxfoundation.org>.
> > 
> > v2: Removed the variable and called the function directly instead of
> >      just renaming the variable as suggested by Greg Kroah-Hartman
> >      <gregkh@linuxfoundation.org>.
> > 
> > 
> > 
> > Yogesh Hegde (4):
> >    staging: rtl8192e: Rename variable SetWirelessMode
> >    staging: rtl8192e: Rename variable SetBWModeHandler
> >    staging: rtl8192e: Rename variable LeisurePSLeave
> >    staging: rtl8192e: Rename variable InitialGainHandler
> > 
> >   drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c |  4 ++--
> >   drivers/staging/rtl8192e/rtl8192e/rtl_core.c   |  8 ++++----
> >   drivers/staging/rtl8192e/rtl819x_HTProc.c      |  4 ++--
> >   drivers/staging/rtl8192e/rtllib.h              | 12 ++++++------
> >   drivers/staging/rtl8192e/rtllib_rx.c           |  2 +-
> >   drivers/staging/rtl8192e/rtllib_softmac.c      | 12 ++++++------
> >   drivers/staging/rtl8192e/rtllib_softmac_wx.c   |  6 +++---
> >   7 files changed, 24 insertions(+), 24 deletions(-)
> > 
> This patch series alone is fine. But when my patch series ([PATCH 0/9]
> staging: rtl8192e: Remove unsupported modes a and 5G) is applied before it
> fails as we change same lines. Will see what happens.

Yes, none of these apply :(

Yogesh, can you rebase this on my staging-next branch and resend?

thanks,

greg k-h
