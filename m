Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36727479
	for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 17:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC39C433C1;
	Tue, 25 Oct 2022 17:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666718539;
	bh=b2jLgOkbVkgTFTZHzgyPA7Qmaai4R+6ZbvML08sPZ8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XGcaCVTWH69C0Hr/M2My2JludMZyyrkr7NYNOM8i6rIGudr+GcROIX1eqmUgJvi1m
	 rOQp1BVl++YOu+PK1vY/AVI7g5pDGh1eUqVRNkG8tUVDXudml2D4uZDGTJQUt4AaWA
	 zTdg0yObDCvWmchtRx6I5H264wxT7WZiBolLodaM=
Date: Tue, 25 Oct 2022 19:22:01 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kang Minchul <tegongkang@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] staging: r8188eu: cleaning up unused variables
Message-ID: <Y1gbOfBBkqt1m5rS@kroah.com>
References: <20221024084925.262289-1-tegongkang@gmail.com>
 <CA+uqrQDuJQ3yBY8_re===u0f97pyr_hn_VNu6LqLJAZnDeqhVQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+uqrQDuJQ3yBY8_re===u0f97pyr_hn_VNu6LqLJAZnDeqhVQ@mail.gmail.com>

On Mon, Oct 24, 2022 at 08:23:08PM +0900, Kang Minchul wrote:
> 2022년 10월 24일 (월) 오후 5:49, Kang Minchul <tegongkang@gmail.com>님이 작성:
> >
> > This patch series cleans up unused variables in r8188eu
> > causing coccicheck warnings.
> >
> > Difference between v1 and this patch is that this patch series
> > include making function amsdu_to_msdu in /r8188eu/core/rtw_recv.c
> > into void function.
> >
> > Kang Minchul (4):
> >   staging: r8188eu: remove unnecessary variable in ioctl_linux
> >   staging: r8188eu: make amsdu_to_msdu void function
> >   staging: r8188eu: remove unnecessary variable in rtl8188eu_xmit
> >   staging: r8188eu: remove unnecessary variable in rtw_ap
> >
> >  drivers/staging/r8188eu/core/rtw_ap.c        | 5 ++---
> >  drivers/staging/r8188eu/core/rtw_recv.c      | 5 +----
> >  drivers/staging/r8188eu/hal/rtl8188eu_xmit.c | 3 +--
> >  drivers/staging/r8188eu/os_dep/ioctl_linux.c | 4 +---
> >  4 files changed, 5 insertions(+), 12 deletions(-)
> >
> > --
> > 2.34.1
> >
> Oh, I guess patch 4/4 can be fixed as well.
> I think the function rtw_sta_flush can be void as well.
> 
> I'll resend the patch later.

You broke the build in this series, please fix up and send a v3.

thanks,

greg k-h
