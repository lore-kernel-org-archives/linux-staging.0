Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C5D23A1
	for <linux-staging@lists.linux.dev>; Sun, 16 Oct 2022 16:22:24 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1ok6P7-0008Qc-Q0; Sun, 16 Oct 2022 18:22:21 +0200
Date: Sun, 16 Oct 2022 18:22:21 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Michael Straube <straube.linux@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 01/10] staging: r8188eu: fix led register settings
Message-ID: <20221016162221.lgqzc3ug6es3r2ze@viti.kaiser.cx>
References: <20221015151115.232095-1-martin@kaiser.cx>
 <20221015151115.232095-2-martin@kaiser.cx>
 <c8c03bd1-9fa4-fc79-d4fe-727753e1df2c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8c03bd1-9fa4-fc79-d4fe-727753e1df2c@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Hi Michael,

Thus wrote Michael Straube (straube.linux@gmail.com):

> On 10/15/22 17:11, Martin Kaiser wrote:
> > Using an InterTech DMG-02 dongle, the led remains on when the system goes
> > into standby mode. After wakeup, it's no longer possible to control the
> > led.

> > It turned out that the register settings to enable or disable the led were
> > not correct. They worked for some dongles like the Edimax V2 but not for
> > others like the InterTech DMG-02.

> > This patch fixes the register settings. Bit 3 in the led_cfg2 register
> > controls the led status, bit 5 must always be set to be able to control
> > the led, bit 6 has no influence on the led. Setting the mac_pinmux_cfg
> > register is not necessary.

> > These settings were tested with Edimax V2 and InterTech DMG-02.

> > Cc: stable@vger.kernel.org
> > Fixes: 8cd574e6af54 ("staging: r8188eu: introduce new hal dir for RTL8188eu driver")
> > Suggested-by: Michael Straube <straube.linux@gmail.com>
> > Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> > ---
> >   drivers/staging/r8188eu/core/rtw_led.c | 25 ++-----------------------
> >   1 file changed, 2 insertions(+), 23 deletions(-)

> > diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
> > index 2527c252c3e9..5b214488571b 100644
> > --- a/drivers/staging/r8188eu/core/rtw_led.c
> > +++ b/drivers/staging/r8188eu/core/rtw_led.c
> > @@ -31,40 +31,19 @@ static void ResetLedStatus(struct led_priv *pLed)
> >   static void SwLedOn(struct adapter *padapter, struct led_priv *pLed)
> >   {
> > -	u8	LedCfg;
> > -	int res;
> > -
> >   	if (padapter->bDriverStopped)
> >   		return;
> > -	res = rtw_read8(padapter, REG_LEDCFG2, &LedCfg);
> > -	if (res)
> > -		return;
> > -
> > -	rtw_write8(padapter, REG_LEDCFG2, (LedCfg & 0xf0) | BIT(5) | BIT(6)); /*  SW control led0 on. */
> > +	rtw_write8(padapter, REG_LEDCFG2, BIT(5)); /*  SW control led0 on. */
> >   	pLed->bLedOn = true;
> >   }
> >   static void SwLedOff(struct adapter *padapter, struct led_priv *pLed)
> >   {
> > -	u8	LedCfg;
> > -	int res;
> > -
> >   	if (padapter->bDriverStopped)
> >   		goto exit;
> > -	res = rtw_read8(padapter, REG_LEDCFG2, &LedCfg);/* 0x4E */
> > -	if (res)
> > -		goto exit;
> > -
> > -	LedCfg &= 0x90; /*  Set to software control. */
> > -	rtw_write8(padapter, REG_LEDCFG2, (LedCfg | BIT(3)));
> > -	res = rtw_read8(padapter, REG_MAC_PINMUX_CFG, &LedCfg);
> > -	if (res)
> > -		goto exit;
> > -
> > -	LedCfg &= 0xFE;
> > -	rtw_write8(padapter, REG_MAC_PINMUX_CFG, LedCfg);
> > +	rtw_write8(padapter, REG_LEDCFG2, BIT(5) | BIT(3));
> >   exit:
> >   	pLed->bLedOn = false;
> >   }

> I tested this also with a TP-Link TL-WN725N now and it works fine.

> Tested-by: Michael Straube <straube.linux@gmail.com> # InterTech DMG-02,
> TP-Link TL-WN725N

thanks for testing with yet another device! Good to hear that the
settings work there as well.

Best regards,
Martin
