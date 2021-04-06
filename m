Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB5070
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 14:22:43 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id y19-20020a0568301d93b02901b9f88a238eso14759756oti.11
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 07:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2C58heWhjWSXVwd82d75mh+4ssAK4ihVn1YcjIF/AAg=;
        b=soHVhgYDQK5DhGL2cYR8dtJ3mFb+IY7oWhlKrSZCmDH1eu4FvpnLjil8XXxZp8VfI1
         KMfyYHBaG4bbiJGwZVZclylKZoUl+Vbq+NrD7aEkhlRvckUYo4j3I8AQNFzsAoioZEv+
         W9aI91zfZzVrrfEOpCA52VvHoMwsr5hJFfWbc/19Myy/9rp8ysbtrUXfpdv+MXN2CHbG
         S1BHi1AorKcTyhjRmhqoS5OEJ8UwUK2MwlIeRcVuYLUBg76CREejoZyN9phYCF311Dk2
         sSYUHg4A3W2eGOXnYDhPc7MzEG32PaakcTBpLeeTgyYyZZyKL78UGPxJFO1EaHYLtzxr
         p7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2C58heWhjWSXVwd82d75mh+4ssAK4ihVn1YcjIF/AAg=;
        b=M6mPumwyEG1vXT0x8kUVG/we/Kf9uFUmyP7w3oUDvukC4giWtLT676pq0yN9CWUx01
         quFhnkwpGR6yz1bB2Cfd15HUjjhPXxB32ASGtvfqJduoP92QAc1Y+vEvOrF2LUwbNKEJ
         diinonmjRMcMnn+PmDH6Oa77/eyYVBwRM34PVxa16im3q1ayNj1Gr139K+r/SpVS13VK
         Cq8NyIqLHFhnZebOadxgsMDnPf0H6YAYO/QBIduX6GQOGa0GllnE6jFDP0vTOowURHAh
         fKp6399V3V0+7O4kcCmGE1KKduAmx+htfuQfUHWP5+dBzRkcy0APlL/dqrsKggcrbrAl
         nhbw==
X-Gm-Message-State: AOAM533fJg0DMBsJ5wuxFfp9K8P5/Sj9NqC8ttSYp2tZL/ox7RwaWCYN
	peupKo9c2iLANb20rrbh0EvTThLJdwiIPmGTdts=
X-Google-Smtp-Source: ABdhPJy+Cwg2iYwtFcgBus7i09ayPPWSytIc4YUURuFQzet7jXBYENspMVnnC2fb4zFlxp0jCH/i5bdsoHdsVulcIas=
X-Received: by 2002:a9d:7f8a:: with SMTP id t10mr26150737otp.239.1617718962943;
 Tue, 06 Apr 2021 07:22:42 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210406130138.30744-1-fmdefrancesco@gmail.com> <YGxsNVs+sexiPMJS@kroah.com>
In-Reply-To: <YGxsNVs+sexiPMJS@kroah.com>
From: FMDF <fmdefrancesco@gmail.com>
Date: Tue, 6 Apr 2021 16:22:27 +0200
Message-ID: <CAPj211s_MCJ6R+DgETqzj8pbzToZv=aYsDjT-c-HvLst+4nNOQ@mail.gmail.com>
Subject: Re: [Outreachy kernel] [PATCH] staging: rtl8723bs: hal: Add spaces
 around operators
To: Greg KH <gregkh@linuxfoundation.org>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 6, 2021 at 4:12 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Apr 06, 2021 at 03:01:38PM +0200, Fabio M. De Francesco wrote:
> > Added spaces around operators in file HalBtc8723b1Ant.c. Issue detected
> > by checkpatch.pl. Spaces are preferred to improve readibility.
> >
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> >  .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   | 98 +++++++++----------
> >  1 file changed, 49 insertions(+), 49 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
> > index 3e794093092b..b2b872016e45 100644
> > --- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
> > +++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
> > @@ -38,7 +38,7 @@ static u8 halbtc8723b1ant_BtRssiState(
> >                       (pCoexSta->preBtRssiState == BTC_RSSI_STATE_LOW) ||
> >                       (pCoexSta->preBtRssiState == BTC_RSSI_STATE_STAY_LOW)
> >               ) {
> > -                     if (btRssi >= (rssiThresh+BTC_RSSI_COEX_THRESH_TOL_8723B_1ANT)) {
> > +                     if (btRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_1ANT)) {
> >
> >                               btRssiState = BTC_RSSI_STATE_HIGH;
> >                               BTC_PRINT(
> > @@ -85,7 +85,7 @@ static u8 halbtc8723b1ant_BtRssiState(
> >                       (pCoexSta->preBtRssiState == BTC_RSSI_STATE_LOW) ||
> >                       (pCoexSta->preBtRssiState == BTC_RSSI_STATE_STAY_LOW)
> >               ) {
> > -                     if (btRssi >= (rssiThresh+BTC_RSSI_COEX_THRESH_TOL_8723B_1ANT)) {
> > +                     if (btRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_1ANT)) {
> >                               btRssiState = BTC_RSSI_STATE_MEDIUM;
> >                               BTC_PRINT(
> >                                       BTC_MSG_ALGORITHM,
> > @@ -104,7 +104,7 @@ static u8 halbtc8723b1ant_BtRssiState(
> >                       (pCoexSta->preBtRssiState == BTC_RSSI_STATE_MEDIUM) ||
> >                       (pCoexSta->preBtRssiState == BTC_RSSI_STATE_STAY_MEDIUM)
> >               ) {
> > -                     if (btRssi >= (rssiThresh1+BTC_RSSI_COEX_THRESH_TOL_8723B_1ANT)) {
> > +                     if (btRssi >= (rssiThresh1 + BTC_RSSI_COEX_THRESH_TOL_8723B_1ANT)) {
> >                               btRssiState = BTC_RSSI_STATE_HIGH;
> >                               BTC_PRINT(
> >                                       BTC_MSG_ALGORITHM,
> > @@ -353,11 +353,11 @@ static void halbtc8723b1ant_MonitorBtCtr(struct btc_coexist *pBtCoexist)
> >
> >       u4Tmp = pBtCoexist->fBtcRead4Byte(pBtCoexist, regHPTxRx);
> >       regHPTx = u4Tmp & bMaskLWord;
> > -     regHPRx = (u4Tmp & bMaskHWord)>>16;
> > +     regHPRx = (u4Tmp & bMaskHWord) >> 16;
> >
> >       u4Tmp = pBtCoexist->fBtcRead4Byte(pBtCoexist, regLPTxRx);
> >       regLPTx = u4Tmp & bMaskLWord;
> > -     regLPRx = (u4Tmp & bMaskHWord)>>16;
> > +     regLPRx = (u4Tmp & bMaskHWord) >> 16;
> >
> >       pCoexSta->highPriorityTx = regHPTx;
> >       pCoexSta->highPriorityRx = regHPRx;
> > @@ -1317,7 +1317,7 @@ static void halbtc8723b1ant_SetFwPstdma(
> >       pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_AP_MODE_ENABLE, &bApEnable);
> >
> >       if (bApEnable) {
> > -             if (byte1&BIT4 && !(byte1&BIT5)) {
> > +             if (byte1 & BIT4 && !(byte1 & BIT5)) {
> >                       BTC_PRINT(
> >                               BTC_MSG_INTERFACE,
> >                               INTF_NOTIFY,
> > @@ -1349,9 +1349,9 @@ static void halbtc8723b1ant_SetFwPstdma(
> >               (
> >                       "[BTCoex], PS-TDMA H2C cmd = 0x%x%08x\n",
> >                       H2C_Parameter[0],
> > -                     H2C_Parameter[1]<<24|
> > -                     H2C_Parameter[2]<<16|
> > -                     H2C_Parameter[3]<<8|
> > +                     H2C_Parameter[1] << 24 |
> > +                     H2C_Parameter[2] << 16 |
> > +                     H2C_Parameter[3]<< 8 |
>
> Why did you miss the space that is needed here too?

I really don't know why I overlooked these.

>
> Did you run this patch through checkpatch.pl?

Yes, I did it as I always do.

>
> Please do so.
>
> thanks,
>
> greg k-h

I am going to send a v2 as soon as possible.

Thanks for your review,

Fabio
