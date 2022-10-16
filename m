Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1EC23A1
	for <linux-staging@lists.linux.dev>; Sun, 16 Oct 2022 16:21:16 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1ok6O0-0008P2-Tq; Sun, 16 Oct 2022 18:21:12 +0200
Date: Sun, 16 Oct 2022 18:21:12 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/10] staging: r8188eu: fix status updates in SwLedOff
Message-ID: <20221016162112.g4bk3anzudq5qn7e@viti.kaiser.cx>
References: <20221015151115.232095-1-martin@kaiser.cx>
 <20221015151115.232095-4-martin@kaiser.cx>
 <7d72c804-265e-b515-78a7-976deaa06310@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d72c804-265e-b515-78a7-976deaa06310@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Hi Pavel,

Thus wrote Pavel Skripkin (paskripkin@gmail.com):

> Hi Martin,

> Martin Kaiser <martin@kaiser.cx> says:
> > Update bLedOn only if we could update the REG_LEDCFG2 register.

> > Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> > ---
> >   drivers/staging/r8188eu/core/rtw_led.c | 7 ++++---
> >   1 file changed, 4 insertions(+), 3 deletions(-)

> > diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
> > index 4f1cad890cae..38433296d327 100644
> > --- a/drivers/staging/r8188eu/core/rtw_led.c
> > +++ b/drivers/staging/r8188eu/core/rtw_led.c
> > @@ -43,10 +43,11 @@ static void SwLedOn(struct adapter *padapter, struct led_priv *pLed)
> >   static void SwLedOff(struct adapter *padapter, struct led_priv *pLed)
> >   {
> >   	if (padapter->bDriverStopped)
> > -		goto exit;
> > +		return;
> > +
> > +	if (rtw_write8(padapter, REG_LEDCFG2, BIT(5) | BIT(3)) != _SUCCESS)
> > +		return;
> > -	rtw_write8(padapter, REG_LEDCFG2, BIT(5) | BIT(3));
> > -exit:
> >   	pLed->bLedOn = false;
> >   }

> If we don't always update the state then, I think, it's better to inform the
> callers about it

> I guess, this won't happen often, but you are changing semantic of the
> function

Changing the state without changing the led feels like a bug to me. It's
done only for SwLedOff, nor for SwLedOn.

We could add a return value and inform the caller that we could not
change the led register.

How would callers of SwLedOn or SwLedLOff handle such errors? blink_work
looks at bLedOn and calls either SwLedOn or SwLedOff. If bLedOn is not
updated and the led is not changed, the next run of the worker will
retry. This does already happen with the current code, a return value of
SwLedOn/Off would not help here.

Best regards,
Martin
