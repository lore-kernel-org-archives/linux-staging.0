Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FB97C;
	Wed,  2 Nov 2022 08:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667376155; bh=VKIIIg5Ow9y7BYrYGszDe/O+as8FGmI810ThX44IikU=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=Y0xyzs5pGSR1Iu1TqYpMZd2aE6Yk6L8Ehh0dO8hF/1rFvyz7Ok7ZUmmL35tzeFY3S
	 PdOMxMsYc4jNSnk5dbak8agMnrWb60Ox2AKmm90Wsa5DT4uTGYAjs4z+lEU+vmD+V/
	 E+E3hSNAH9TJNaoNZTmIHpDrA5y/XqKK+gGsJQQ8=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
	via [213.182.55.206]
	Wed,  2 Nov 2022 09:02:35 +0100 (CET)
X-EA-Auth: Xiede22fg5z65ZXwe/phWqFYfA6aaPeKR4bYp/aKyNsXF48FnuXBwt3VccAy9XBmO8VfenHNaxZxb8Y5YaXJxC0Gl2Kz7BAM
Date: Wed, 2 Nov 2022 13:32:30 +0530
From: Deepak R Varma <drv@mailo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: r8188eu: remove unwanted variable
 implementation
Message-ID: <Y2IkFqxujKnZ/9MQ@ubunlion>
References: <Y2F/CtEnjWlHgw9f@ubunlion>
 <Y2IccKxNDyd/MEqY@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2IccKxNDyd/MEqY@kroah.com>

On Wed, Nov 02, 2022 at 08:29:52AM +0100, Greg Kroah-Hartman wrote:
> On Wed, Nov 02, 2022 at 01:48:18AM +0530, Deepak R Varma wrote:
> > Local variables intended as the function return value are
> > initialized but their value does not change during function
> > execution. The initial value assigned to the variable is simply
> > returned to the caller. This makes the variable declaration
> > unnecessary and the initial value can be directly returned.
> >
> > Following table lists the initial commits when the variables were first
> > introduced but have not been used since inception:
> >
> > Variable  Function	File			     Inception Commit
> > ret	  rtw_sta_flush	r8188eu/core/rtw_ap.c	     [1]
> > ret	  amsdu_to_msdu r8188eu/core/rtw_recv.c	     [2]
> > ret	  rtw_p2p_set	r8188eu/os_dep/ioctl_linux.c [3]
> >
> > [1] 'commit 9a7fe54ddc3a ("staging: r8188eu: Add source files for new driver - part 1")'
> > [2] 'commit 1cc18a22b96b ("staging: r8188eu: Add files for new driver - part 5")'
> > [3] 'commit a2c60d42d97c ("staging: r8188eu: Add files for new driver - part 16")'
> >
> > However, local variable pull of the function update_txdesc from file
> > r8188eu/hal/rtl8188eu_xmit.c was in use prior to introduction of
> > commit ID [4] 7bdedfef085bb65. The clean-up associated with this
> > commit left the variable pull redundant.
> >
> > [4] 'commit 7bdedfef085b ("staging: r8188eu: Remove mp, a.k.a. manufacturing process, code")'
> >
> > The patch is produced using the following coccicheck options:
> >    COCCI=./scripts/coccinelle/misc/returnvar.cocci
> >    M=driver/staging/r8188eu/
> >    MODE=patch
> >
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > ---
> >
> > Changes in v2:
> >    1. Include reason for why the variable declarations are not useful. Suggested
> >       by Julia Lawall <julia.lawall@inria.fr>
>
> Does not apply to my tree at all :(
>
> Please rebase and resubmit.

Hello Greg,
Looks like there was another patch effort in parallel to correct this coccicheck
complaint. I am checking if all the observations from my patch are resolved. If
not, I will rebase and send in revised patch.

Thank you.
./drv

>
> thanks,
>
> greg k-h
>
>


