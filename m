Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECB27462
	for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 20:02:33 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1oaMyC-0000KT-Ca; Mon, 19 Sep 2022 22:02:20 +0200
Date: Mon, 19 Sep 2022 22:02:20 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Michael Straube <straube.linux@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] staging: r8188eu: remove duplicate bSurpriseRemoved
 check
Message-ID: <20220919200220.c2cslbua6defxmwb@viti.kaiser.cx>
References: <20220918175700.215170-1-martin@kaiser.cx>
 <20220918175700.215170-6-martin@kaiser.cx>
 <8b17ac60-b2ec-26eb-d82c-9770e9733cdf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b17ac60-b2ec-26eb-d82c-9770e9733cdf@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Hi Michael,

Thus wrote Michael Straube (straube.linux@gmail.com):

> On 9/18/22 19:56, Martin Kaiser wrote:
> > We don't have to check bSurpriseRemoved in the SwLedOn function.

> > SwLedOn calls rtw_read8 which in turn calls usb_read. This function checks
> > bSurpriseRemoved for us.

> > Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> > ---
> >   drivers/staging/r8188eu/core/rtw_led.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)

> > diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
> > index 744247af5956..989808a2b171 100644
> > --- a/drivers/staging/r8188eu/core/rtw_led.c
> > +++ b/drivers/staging/r8188eu/core/rtw_led.c
> > @@ -35,7 +35,7 @@ static void SwLedOn(struct adapter *padapter, struct led_priv *pLed)
> >   	u8	LedCfg;
> >   	int res;
> > -	if (padapter->bSurpriseRemoved || padapter->bDriverStopped)
> > +	if (padapter->bDriverStopped)
> >   		return;
> >   	res = rtw_read8(padapter, REG_LEDCFG2, &LedCfg);

> Hi Martin,

> same could be done in SwLedOff.

you're right. I wanted to kick off the bSurpriseRemoved cleanup with a
simple patch and wait for people's comments. I'll do SwLedOff when this
one's accepted.

Thanks,
Martin
