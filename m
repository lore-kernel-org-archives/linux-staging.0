Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E3F72
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 09:44:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 50F2260ED3;
	Sat, 28 Aug 2021 09:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1630143877;
	bh=6KXHEFTldR58KIsMPXI+PdwLyLFXMO5pNa86tpdq5u8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uMfaZ1j7XnSZwb5TbKoVkqMupaby5sHKVkFJYpfLaEhJIdOXWSv+an62yOUxNOlob
	 IO13Y2Aj4CT3Qj4kvUUZeUH4OURVUSCqvbupDP4s6tsuHV5MBgUSq2Y4w9NP8A6g1B
	 MOTNe51P+3IT0lWtRz0zppIYPZSWKRGd7aloI5VI=
Date: Sat, 28 Aug 2021 11:44:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Aakash Hemadri <aakashhemadri123@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/5] staging: r8188eu: fix sparse warnings
Message-ID: <YSoFgUT5+5nwJOo7@kroah.com>
References: <cover.1629563318.git.aakashhemadri123@gmail.com>
 <20210828085017.d5l63yrxkaxqgpgu@xps.yggdrasil>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210828085017.d5l63yrxkaxqgpgu@xps.yggdrasil>

On Sat, Aug 28, 2021 at 02:20:17PM +0530, Aakash Hemadri wrote:
> On 21/08/23 10:30PM, Aakash Hemadri wrote:
> > Hi,
> > 	This patch series fixes some sparse warnings in rtw_br_ext.c
> > 
> > Changes in v3 -> v4
> > - Added this changelog, as requested by Greg's patch bot
> > 
> > Changes in v2 -> v3
> > - Fixed incorrect usage/removal of endian swaps and checks
> > 
> > Changes in v1 -> v2
> > - Split patch
> > 
> > Aakash Hemadri (5):
> >   staging: r8188eu: restricted __be16 degrades to int
> >   staging: r8188eu: cast to restricted __be32
> >   staging: r8188eu: incorrect type in csum_ipv6_magic
> >   staging: r8188eu: restricted __be16 degrades to int
> >   staging: r8188eu: incorrect type in assignment
> > 
> >  drivers/staging/r8188eu/core/rtw_br_ext.c | 20 ++++++++++----------
> >  1 file changed, 10 insertions(+), 10 deletions(-)
> > 
> > 
> > base-commit: 093991aaadf0fbb34184fa37a46e7a157da3f386
> > -- 
> > 2.32.0
> >
> 
> Hello greg, if there are any issues with the patchset do let me know,
> Larry & Philip acked the previous ver of this patch.
> 
> I'd rather not add noise to the ml unnecessarily.
> Also this patchset doesn't apply cleanly to the current staging-testing
> I can resend fixing that if that's the issue.

Please fix up and resend, my staging review queue is empty.

thanks,

greg k-h
