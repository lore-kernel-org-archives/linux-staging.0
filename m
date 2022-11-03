Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3D363A0;
	Thu,  3 Nov 2022 17:38:44 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id h24so1684453qta.7;
        Thu, 03 Nov 2022 10:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDKGNUL62Hmp7TO+80EI0t8/5fmkoGs0W5GjhbEg7Ak=;
        b=R+/jni/tECFejnbeSf8ovTZ/MmCDfZB+T8D3a1hCW/IkQSpJkpkn1ei4qBFRh37Iad
         bRazMNBta9jmU4DF1NKLyZbXhYFmI3n+4SxPXQykRk8divLF3ZvPhfFl+nfO3r9Mw0Hs
         RP4TPF13nFKLdnCL8tO8uxywSd5Du7ngg4UvcLG/bI9ku/234zmdhntB9VO3sBx79KG7
         ZdhiPuUAwDsnk8rBQ82vgVOWeq9rOPKHSoXuwPtJ1w81OF2D4jNt6r+JqS5W9s4ARc2f
         SpmeHn8CEkCeyjnl1WUEAkhkX7egqM79y3r0dpT9FLsf0EXV2Nx7xGwHeabdcustk+FP
         tx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZDKGNUL62Hmp7TO+80EI0t8/5fmkoGs0W5GjhbEg7Ak=;
        b=SRZAGIDwLIda0XrNy9mn9RWRDPw45h9NIjaFccw2hq5ESQOgD5SozuElVch56WpA6M
         zqHMh4iJ/ddQ5FWCfCb0ryi7E6AYymW+mnOeW5hueRAvDewerjL4IEIKZoWX9SIpfdpd
         CSbGhGzj9mXOT73tYhCVb6jT/s1229JeKGBHq5oSe67HIY8AyKoY3IocDw/N80Agv9L9
         zybb53nx7ZxK9JH4sOKlaYzFwWfFKzJcvEV/MAZaLfMlEYkjLx0Y6p5qcU2GssCVXpi2
         f9LjKTH2HvvezTwEtrUQ9YIUUctN4vjY6x3d644pc8vnP1mZ3OnTHfWrc31LIbB6FiT6
         3hJQ==
X-Gm-Message-State: ACrzQf3Sp2vygJ36/tnZM1zxY/lhNsIgeSinWIUhk3l+rqyY8qo/zUFx
	imesAdmj/2hjQNp9KH72DMdrVDoOdxAul9lEow0=
X-Google-Smtp-Source: AMsMyM5Mqnw5541HEzedFBWf4iB4Sg2nht4t3zf1zNKf7ZZ4XhdBaeGEAHHS8vgMpapBPKGC2zrMz/IqNY+71nF7EqE=
X-Received: by 2002:a05:622a:147:b0:39c:dc0d:7d0f with SMTP id
 v7-20020a05622a014700b0039cdc0d7d0fmr24886331qtw.281.1667497123725; Thu, 03
 Nov 2022 10:38:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y2OPStg4jXtWpJcd@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
 <d0d6d613-174b-f7dd-7d45-45eecd26a850@inria.fr> <CAHJEyKUA4FG468S5bMsx+XGUR3pB3kKm_bx=LNPNJ6n9yPxCrQ@mail.gmail.com>
 <612f7cf-43db-a684-7a98-8469275b43fd@inria.fr> <CAHJEyKXL=u=7tH2O3tdeSBZHyXLAdP9JcfzKHy6-bc7Bju5NMQ@mail.gmail.com>
In-Reply-To: <CAHJEyKXL=u=7tH2O3tdeSBZHyXLAdP9JcfzKHy6-bc7Bju5NMQ@mail.gmail.com>
From: Tanju Brunostar <tanjubrunostar0@gmail.com>
Date: Thu, 3 Nov 2022 18:38:31 +0100
Message-ID: <CAHJEyKWBTxvP_mkSaWw7duhm1_-_AE27FhrnZYOXsTy1Qt_c=g@mail.gmail.com>
Subject: Re: [PATCH] staging: vt6655: change the function name s_vFillRTSHead
To: Julia Lawall <julia.lawall@inria.fr>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 3, 2022 at 5:04 PM Tanju Brunostar
<tanjubrunostar0@gmail.com> wrote:
>
> On Thu, Nov 3, 2022 at 4:58 PM Julia Lawall <julia.lawall@inria.fr> wrote:
> >
> >
> >
> > On Thu, 3 Nov 2022, Tanju Brunostar wrote:
> >
> > > On Thu, Nov 3, 2022 at 1:38 PM Julia Lawall <julia.lawall@inria.fr> wrote:
> > > >
> > > >
> > > >
> > > > On Thu, 3 Nov 2022, Tanjuate Brunostar wrote:
> > > >
> > > > > Remove the use of Hungarian notation, which is not used in the Linux
> > > > > kernel. Reported by checkpatch
> > > > >
> > > > > Fix checkpatch error related to code line ends with a '(', by joining
> > > > > some lines and indenting correctly. This improves visibility
> > > >
> > > > I don't think it will be appreciated to do two things at once.
> > > >
> > >
> > > I sent it earlier as two patches but it seemed to break and fix the
> > > kernel which was not appreciated by one of the mentors
> >
> > OK, then it is a presentation problem.  You have presented the changes as
> > unrelated.  Rewrite the message to make clear what is being done.
> >
> > julia
> >

Hi Julia,
I am having a hard time figuring out exactly how to write this, since
I made both changes in one patch and there is no way to send them in
separate patches. should I just report just one change and leave the
other? I would appreciate your help here
Thanks

tanju

> okay
> > >
> > > > >
> > > > > Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> > > > > ---
> > > > >  drivers/staging/vt6655/rxtx.c | 48 ++++++++++++++++-------------------
> > > > >  1 file changed, 22 insertions(+), 26 deletions(-)
> > > > >
> > > > > diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> > > > > index 31ae99b3cb35..debc5d5daede 100644
> > > > > --- a/drivers/staging/vt6655/rxtx.c
> > > > > +++ b/drivers/staging/vt6655/rxtx.c
> > > > > @@ -23,7 +23,7 @@
> > > > >   *      s_uGetTxRsvTime- get frame reserved time
> > > > >   *      s_vFillCTSHead- fulfill CTS ctl header
> > > > >   *      s_vFillFragParameter- Set fragment ctl parameter.
> > > > > - *      s_vFillRTSHead- fulfill RTS ctl header
> > > > > + *      fill_rts_header- fulfill RTS ctl header
> > > > >   *      s_vFillTxKey- fulfill tx encrypt key
> > > > >   *      s_vSWencryption- Software encrypt header
> > > > >   *      vDMA0_tx_80211- tx 802.11 frame via dma0
> > > > > @@ -85,15 +85,15 @@ static const unsigned short fb_opt1[2][5] = {
> > > > >  #define DATADUR_A_F1    13
> > > > >
> > > > >  /*---------------------  Static Functions  --------------------------*/
> > > > > -static void s_vFillRTSHead(struct vnt_private *pDevice,
> > > > > -                        unsigned char byPktType,
> > > > > -                        void *pvRTS,
> > > > > -                        unsigned int cbFrameLength,
> > > > > -                        bool bNeedAck,
> > > > > -                        bool bDisCRC,
> > > > > -                        struct ieee80211_hdr *hdr,
> > > > > -                        unsigned short wCurrentRate,
> > > > > -                        unsigned char byFBOption);
> > > > > +static void fill_rts_header(struct vnt_private *pDevice,
> > > > > +                         unsigned char byPktType,
> > > > > +                         void *pvRTS,
> > > > > +                         unsigned int        cbFrameLength,
> > > >
> > > > Strange spacing in the above parameter declaration.  Maybe there is a tab
> > > > that should be a space?
> > > >
> > > > julia
> > > >
> > >
> > > I was also shocked when I noticed that. It seemed like a tab but when
> > > I removed the space, the two words were joined and when I added the
> > > space, it became this lage space once again. checkpatch does not
> > > complain about it though
> > >
> > > > > +                         bool bNeedAck,
> > > > > +                         bool bDisCRC,
> > > > > +                         struct ieee80211_hdr *hdr,
> > > > > +                         unsigned short wCurrentRate,
> > > > > +                         unsigned char byFBOption);
> > > > >
> > > > >  static void s_vGenerateTxParameter(struct vnt_private *pDevice,
> > > > >                                  unsigned char byPktType,
> > > > > @@ -555,19 +555,15 @@ s_uFillDataHead(
> > > > >       return buf->duration;
> > > > >  }
> > > > >
> > > > > -static
> > > > > -void
> > > > > -s_vFillRTSHead(
> > > > > -     struct vnt_private *pDevice,
> > > > > -     unsigned char byPktType,
> > > > > -     void *pvRTS,
> > > > > -     unsigned int cbFrameLength,
> > > > > -     bool bNeedAck,
> > > > > -     bool bDisCRC,
> > > > > -     struct ieee80211_hdr *hdr,
> > > > > -     unsigned short wCurrentRate,
> > > > > -     unsigned char byFBOption
> > > > > -)
> > > > > +static void fill_rts_header(struct vnt_private *pDevice,
> > > > > +                         unsigned char byPktType,
> > > > > +                         void *pvRTS,
> > > > > +                         unsigned int cbFrameLength,
> > > > > +                         bool bNeedAck,
> > > > > +                         bool bDisCRC,
> > > > > +                         struct ieee80211_hdr *hdr,
> > > > > +                         unsigned short wCurrentRate,
> > > > > +                         unsigned char byFBOption)
> > > > >  {
> > > > >       unsigned int uRTSFrameLen = 20;
> > > > >
> > > > > @@ -912,7 +908,7 @@ s_vGenerateTxParameter(
> > > > >                       buf->rrv_time_a = vnt_rxtx_rsvtime_le16(pDevice, byPktType, cbFrameSize, wCurrentRate, bNeedACK);
> > > > >                       buf->rrv_time_b = vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11B, cbFrameSize, pDevice->byTopCCKBasicRate, bNeedACK);
> > > > >
> > > > > -                     s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
> > > > > +                     fill_rts_header(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
> > > > >               } else {/* RTS_needless, PCF mode */
> > > > >                       struct vnt_rrv_time_cts *buf = pvRrvTime;
> > > > >
> > > > > @@ -931,7 +927,7 @@ s_vGenerateTxParameter(
> > > > >                       buf->rrv_time = vnt_rxtx_rsvtime_le16(pDevice, byPktType, cbFrameSize, wCurrentRate, bNeedACK);
> > > > >
> > > > >                       /* Fill RTS */
> > > > > -                     s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
> > > > > +                     fill_rts_header(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
> > > > >               } else if (!pvRTS) {/* RTS_needless, non PCF mode */
> > > > >                       struct vnt_rrv_time_ab *buf = pvRrvTime;
> > > > >
> > > > > @@ -945,7 +941,7 @@ s_vGenerateTxParameter(
> > > > >                       buf->rrv_time = vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11B, cbFrameSize, wCurrentRate, bNeedACK);
> > > > >
> > > > >                       /* Fill RTS */
> > > > > -                     s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
> > > > > +                     fill_rts_header(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
> > > > >               } else { /* RTS_needless, non PCF mode */
> > > > >                       struct vnt_rrv_time_ab *buf = pvRrvTime;
> > > > >
> > > > > --
> > > > > 2.34.1
> > > > >
> > > > >
> > > > >
> > >
> >
