Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69343FC3
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 20:13:47 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1mP9Ne-000250-8j; Sat, 11 Sep 2021 22:13:42 +0200
Date: Sat, 11 Sep 2021 22:13:42 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Michael Straube <straube.linux@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/12] staging: r8188eu: remove rtw_set_rpwm
Message-ID: <20210911201342.jiratddjuniccisc@viti.kaiser.cx>
References: <20210911141521.24901-1-martin@kaiser.cx>
 <20210911141521.24901-6-martin@kaiser.cx>
 <760ac39a-5562-cac5-0b7b-e42f6628743c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <760ac39a-5562-cac5-0b7b-e42f6628743c@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Michael Straube (straube.linux@gmail.com):

> On 9/11/21 16:15, Martin Kaiser wrote:
> > After we dropped the call to set HW_VAR_SET_RPWM, the rtw_set_rpwm
> > function doesn't do anything useful.

> > Remove the function and the rpwm component of struct pwrctrl_priv,
> > which is not used outside of rtw_set_rpwm.

> > Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> > ---
> >   .../realtek/rtl8192cu/include/rtw_pwrctrl.h   |  1 -
> >   drivers/staging/r8188eu/core/rtw_pwrctrl.c    | 34 -------------------
> >   drivers/staging/r8188eu/include/rtw_pwrctrl.h |  2 --
> >   3 files changed, 37 deletions(-)

> > diff --git a/drivers/net/wireless/realtek/rtl8192cu/include/rtw_pwrctrl.h b/drivers/net/wireless/realtek/rtl8192cu/include/rtw_pwrctrl.h
> > index a4cb292e1aea..303df55c521a 100644
> > --- a/drivers/net/wireless/realtek/rtl8192cu/include/rtw_pwrctrl.h
> > +++ b/drivers/net/wireless/realtek/rtl8192cu/include/rtw_pwrctrl.h
> > @@ -309,7 +309,6 @@ extern void cpwm_int_hdl(PADAPTER padapter, struct reportpwrstate_parm *preportp
> >   #endif


> The patch does not apply to staging-testing.

> Looks to me that the change in

> .../realtek/rtl8192cu/include/rtw_pwrctrl.h

> made it into this patch by accident?

thanks for spotting this, Michael. I'll send a v2 on Monday.

Best regards,
Martin
