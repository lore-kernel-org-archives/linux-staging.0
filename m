Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761CE23A1
	for <linux-staging@lists.linux.dev>; Sun, 16 Oct 2022 16:07:27 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1ok6AW-0008HP-ME; Sun, 16 Oct 2022 18:07:16 +0200
Date: Sun, 16 Oct 2022 18:07:16 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/10] staging: r8188eu: summarize tx/rx and scan blinking
Message-ID: <20221016160716.mdofznui73w4ir2c@viti.kaiser.cx>
References: <20221015151115.232095-1-martin@kaiser.cx>
 <20221015151115.232095-11-martin@kaiser.cx>
 <41f4482a-a213-8e71-be43-2e8539b646eb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41f4482a-a213-8e71-be43-2e8539b646eb@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Hi Philipp,

Thus wrote Philipp Hortmann (philipp.g.hortmann@gmail.com):

> On 10/15/22 17:11, Martin Kaiser wrote:
> > Summarize the code for tx/rx blinking and for scan blinking in blink_work.
> > The only difference is the delay for scheduling the next worker.

> > Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> > ---
> >   drivers/staging/r8188eu/core/rtw_led.c | 19 +++----------------
> >   1 file changed, 3 insertions(+), 16 deletions(-)

> > diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
> > index f8bd183fba1e..ce8de2eb7845 100644
> > --- a/drivers/staging/r8188eu/core/rtw_led.c
> > +++ b/drivers/staging/r8188eu/core/rtw_led.c
> > @@ -81,21 +81,6 @@ static void blink_work(struct work_struct *work)
> >   		schedule_delayed_work(&pLed->blink_work, LED_BLINK_LINK_INTVL);
> >   		break;
> >   	case LED_BLINK_SCAN:
> > -		pLed->BlinkTimes--;
> > -		if (pLed->BlinkTimes == 0) {
> > -			if (check_fwstate(pmlmepriv, _FW_LINKED)) {
> > -				pLed->CurrLedState = LED_BLINK_NORMAL;
> > -				schedule_delayed_work(&pLed->blink_work, LED_BLINK_LINK_INTVL);
> > -			} else {
> > -				pLed->CurrLedState = LED_BLINK_SLOWLY;
> > -				schedule_delayed_work(&pLed->blink_work, LED_BLINK_NO_LINK_INTVL);
> > -			}
> > -			pLed->bLedBlinkInProgress = false;
> > -			pLed->bLedScanBlinkInProgress = false;
> > -		} else {
> > -			schedule_delayed_work(&pLed->blink_work, LED_BLINK_SCAN_INTVL);
> > -		}
> > -		break;
> >   	case LED_BLINK_TXRX:
> >   		pLed->BlinkTimes--;
> >   		if (pLed->BlinkTimes == 0) {
> > @@ -109,7 +94,9 @@ static void blink_work(struct work_struct *work)
> >   			pLed->bLedBlinkInProgress = false;
> >   			pLed->bLedScanBlinkInProgress = false;
> >   		} else {
> > -			schedule_delayed_work(&pLed->blink_work, LED_BLINK_FASTER_INTVL);
> > +			schedule_delayed_work(&pLed->blink_work,
> > +					      pLed->CurrLedState == LED_BLINK_SCAN ?
> > +					      LED_BLINK_SCAN_INTVL : LED_BLINK_FASTER_INTVL);
> >   		}
> >   		break;
> >   	case LED_BLINK_WPS:


> I cannot apply this patch.

> Applying: staging: r8188eu: summarize tx/rx and scan blinking
> error: patch failed: drivers/staging/r8188eu/core/rtw_led.c:81
> error: drivers/staging/r8188eu/core/rtw_led.c: patch does not apply
> Patch failed at 0001 staging: r8188eu: summarize tx/rx and scan blinking

did you apply the patch "staging: r8188eu: remove bLedLinkBlinkInProgress"
(that I sent on Oct 1st) before this series?

I didn't mention this dependency in the cover letter, sorry for that.

Thanks,
Martin
