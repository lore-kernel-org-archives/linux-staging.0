Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ACA6102;
	Fri, 21 Oct 2022 18:08:52 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id a24so2136491qto.10;
        Fri, 21 Oct 2022 11:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=loxIHvePw8P2bWZhs+2jg7E8L0WwySO9XZZAOZ78G+c=;
        b=QNKZRg/bnqOgjeIM0eVbXW/g8x2klcrNrWl3jIhl0EtTLlGyzygR71e5xxf6glEgs5
         H7zsM9zrYeqhEh8QV7zoJGYULJpALrP55t1vxfZSVIsyoAUcUGx5l50QxRPldWFWuJ+q
         rehdGu/Xi0g+GKRcvQ+yEvGedpSU9qi1ygNdRxo44HbxhfaLHAdPZylaV0aZwf94s3gc
         VsC+n49Ua5uUEz9tlF1r1hb79Lmwvp9remMpV2I0aWpbYPrZ/GymM1i3jfL11dzw63uW
         LaXv3tmj33vja16t5DmYbGKMnqXYN309pek4ikhNO5VyAnzaQ9jSclbLK0tkoZ9L7oX/
         KkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=loxIHvePw8P2bWZhs+2jg7E8L0WwySO9XZZAOZ78G+c=;
        b=DdOaYgyN5W6qRXgO+4I3hEC8t5xsWxpxzryJy4pLEjbSJA2bR1DrFyKlB/wQphoozf
         3QlUJZWSjpAo7I0YPaG/CXpor0kQOfE4l94MY/oUIbUMRUI544ogiexEKQB2lyiq4biT
         gMgUb60k4LJlxZaIebNF/erCyUOaAVM5K4Fq2PIiL7BltI/suDPyYWQcaJHMHECn02Wh
         Ri/tp81mFhRWaOGpE9NStf5r87dnL3m5Teqh1gC1D6Kn5BCGbngSsWSivd0TM+tnRarF
         R3lH3NjB9LoHpoaGPCDo5Kn4pd3nz09wx2wviVCaEMDqZDa7JEivR+YCaR8pzDD4fFBV
         67wg==
X-Gm-Message-State: ACrzQf1OHs7KH7tpZzL4II4bAN4QrNSjGO4PvakB47bpXMbLKEiWywJW
	xFuIDO5ZjktbxqcgJRR68KvBWy9+V7ObkBd3xrY=
X-Google-Smtp-Source: AMsMyM5SRt2o+5sChw0r/2m65qf3Iwqe0lThsuz+IMflSRNY/FGCjm8ZH0Dz6ylCRSblLb5Xqcyj/v2UQ7w7at+9EF0=
X-Received: by 2002:ac8:5902:0:b0:39c:e440:6adb with SMTP id
 2-20020ac85902000000b0039ce4406adbmr17509970qty.18.1666375730966; Fri, 21 Oct
 2022 11:08:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1666347511.git.tanjubrunostar0@gmail.com>
 <03dd39114b1e5c029cd8022245403a079ff03ae7.1666347511.git.tanjubrunostar0@gmail.com>
 <02a45afb-f81d-639c-1cc6-6376e31351a6@gmail.com>
In-Reply-To: <02a45afb-f81d-639c-1cc6-6376e31351a6@gmail.com>
From: Tanju Brunostar <tanjubrunostar0@gmail.com>
Date: Fri, 21 Oct 2022 19:08:39 +0100
Message-ID: <CAHJEyKW4QZHf_wjaR1bGs8vtb6Gu-inJ4oxcFkPPnAKEAd5-9w@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] staging: vt6655: refactor long lines of code in s_vGenerateTxParameter
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2022 at 5:52 PM Philipp Hortmann
<philipp.g.hortmann@gmail.com> wrote:
>
> On 10/21/22 12:33, Tanjuate Brunostar wrote:
> > fix checkpatch errors by refactoring long lines of code in the function=
: s_vGenerateTxParameter
> >
> > Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> > ---
> >   drivers/staging/vt6655/rxtx.c | 70 ++++++++++++++++++++++++----------=
-
> >   1 file changed, 48 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxt=
x.c
> > index dc853b83459b..42f4261293ba 100644
> > --- a/drivers/staging/vt6655/rxtx.c
> > +++ b/drivers/staging/vt6655/rxtx.c
> > @@ -839,7 +839,8 @@ s_vFillCTSHead(struct vnt_private *pDevice,
> >       }
> >
> >       if (byPktType =3D=3D PK_TYPE_11GB || byPktType =3D=3D PK_TYPE_11G=
A) {
> > -             if (byFBOption !=3D AUTO_FB_NONE && uDMAIdx !=3D TYPE_ATI=
MDMA && uDMAIdx !=3D TYPE_BEACONDMA) {
> > +             if (byFBOption !=3D AUTO_FB_NONE && uDMAIdx !=3D
> > +                 TYPE_ATIMDMA && uDMAIdx !=3D TYPE_BEACONDMA) {
> >                       /* Auto Fall back */
> >                       struct vnt_cts_fb *buf =3D pvCTS;
> >                       /* Get SignalField, ServiceField & Length */
> > @@ -878,7 +879,10 @@ s_vFillCTSHead(struct vnt_private *pDevice,
> >
> >                       ether_addr_copy(buf->data.ra,
> >                                       pDevice->abyCurrentNetAddr);
> > -             } else { /* if (byFBOption !=3D AUTO_FB_NONE && uDMAIdx !=
=3D TYPE_ATIMDMA && uDMAIdx !=3D TYPE_BEACONDMA) */
> > +             } else {
> > +                     /* if (byFBOption !=3D AUTO_FB_NONE && uDMAIdx !=
=3D TYPE_ATIMDMA &&
> > +                      * uDMAIdx !=3D TYPE_BEACONDMA)
> > +                      */
> >                       struct vnt_cts *buf =3D pvCTS;
> >                       /* Get SignalField, ServiceField & Length */
> >                       vnt_get_phy_field(pDevice, uCTSFrameLen,
> > @@ -964,50 +968,72 @@ static void s_vGenerateTxParameter(struct vnt_pri=
vate *pDevice,
> >                       /* Fill RsvTime */
> >                       struct vnt_rrv_time_rts *buf =3D pvRrvTime;
> >
> > -                     buf->rts_rrv_time_aa =3D get_rtscts_time(pDevice,=
 2, byPktType, cbFrameSize, wCurrentRate);
> > -                     buf->rts_rrv_time_ba =3D get_rtscts_time(pDevice,=
 1, byPktType, cbFrameSize, wCurrentRate);
> > -                     buf->rts_rrv_time_bb =3D get_rtscts_time(pDevice,=
 0, byPktType, cbFrameSize, wCurrentRate);
> > -                     buf->rrv_time_a =3D vnt_rxtx_rsvtime_le16(pDevice=
, byPktType, cbFrameSize, wCurrentRate, bNeedACK);
> > -                     buf->rrv_time_b =3D vnt_rxtx_rsvtime_le16(pDevice=
, PK_TYPE_11B, cbFrameSize, pDevice->byTopCCKBasicRate, bNeedACK);
> > -
> > -                     s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrame=
Size, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
> > +                     buf->rts_rrv_time_aa =3D get_rtscts_time(pDevice,=
 2, byPktType, cbFrameSize,
> > +                                                            wCurrentRa=
te);
> > +                     buf->rts_rrv_time_ba =3D get_rtscts_time(pDevice,=
 1, byPktType, cbFrameSize,
> > +                                                            wCurrentRa=
te);
> > +                     buf->rts_rrv_time_bb =3D get_rtscts_time(pDevice,=
 0, byPktType, cbFrameSize,
> > +                                                            wCurrentRa=
te);
> > +                     buf->rrv_time_a =3D vnt_rxtx_rsvtime_le16(pDevice=
, byPktType, cbFrameSize,
> > +                                                             wCurrentR=
ate, bNeedACK);
> > +                     buf->rrv_time_b =3D
> > +                             vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11=
B, cbFrameSize,
> > +                                                   pDevice->byTopCCKBa=
sicRate, bNeedACK);
> > +
> > +                     s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrame=
Size, bNeedACK, bDisCRC,
> > +                                    psEthHeader, wCurrentRate, byFBOpt=
ion);
> >               } else {/* RTS_needless, PCF mode */
> >                       struct vnt_rrv_time_cts *buf =3D pvRrvTime;
> >
> > -                     buf->rrv_time_a =3D vnt_rxtx_rsvtime_le16(pDevice=
, byPktType, cbFrameSize, wCurrentRate, bNeedACK);
> > -                     buf->rrv_time_b =3D vnt_rxtx_rsvtime_le16(pDevice=
, PK_TYPE_11B, cbFrameSize, pDevice->byTopCCKBasicRate, bNeedACK);
> > -                     buf->cts_rrv_time_ba =3D get_rtscts_time(pDevice,=
 3, byPktType, cbFrameSize, wCurrentRate);
> > +                     buf->rrv_time_a =3D vnt_rxtx_rsvtime_le16(pDevice=
, byPktType, cbFrameSize,
> > +                                                             wCurrentR=
ate, bNeedACK);
> > +                     buf->rrv_time_b =3D
> > +                             vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11=
B, cbFrameSize,
> > +                                                   pDevice->byTopCCKBa=
sicRate, bNeedACK);
> > +                     buf->cts_rrv_time_ba =3D get_rtscts_time(pDevice,=
 3, byPktType, cbFrameSize,
> > +                                                            wCurrentRa=
te);
> >
> >                       /* Fill CTS */
> > -                     s_vFillCTSHead(pDevice, uDMAIdx, byPktType, pvCTS=
, cbFrameSize, bNeedACK, bDisCRC, wCurrentRate, byFBOption);
> > +                     s_vFillCTSHead(pDevice, uDMAIdx, byPktType, pvCTS=
, cbFrameSize, bNeedACK,
> > +                                    bDisCRC, wCurrentRate, byFBOption)=
;
> >               }
> >       } else if (byPktType =3D=3D PK_TYPE_11A) {
> >               if (pvRTS) {/* RTS_need, non PCF mode */
> > -                     struct vnt_rrv_time_ab *buf =3D pvRrvTime;
>
> Error during compiliation in next line
>
> > +                     struct vnt_rrv_time_ab *buf =3D pvRrvT
> > +                             ime;
>
> make: Entering directory '/home/kernel/Documents/git/kernels/staging'
>    CC [M]  drivers/staging/vt6655/rxtx.o
> drivers/staging/vt6655/rxtx.c: In function =E2=80=98s_vGenerateTxParamete=
r=E2=80=99:
> drivers/staging/vt6655/rxtx.c:1014:34: error: =E2=80=98pvRrvT=E2=80=99 un=
declared (first
> use in this function)
>   1014 |    struct vnt_rrv_time_ab *buf =3D pvRrvT
>        |                                  ^~~~~~
> drivers/staging/vt6655/rxtx.c:1014:34: note: each undeclared identifier
> is reported only once for each function it appears in
> drivers/staging/vt6655/rxtx.c:1015:5: error: expected =E2=80=98,=E2=80=99=
 or =E2=80=98;=E2=80=99 before
> =E2=80=98ime=E2=80=99
>   1015 |     ime;
>        |     ^~~
> make[1]: *** [scripts/Makefile.build:250: drivers/staging/vt6655/rxtx.o]
> Error 1
> make: *** [Makefile:1992: drivers/staging/vt6655] Error 2
> make: Leaving directory '/home/kernel/Documents/git/kernels/staging'
>
This error occured on the first version of this patch. I corrected it,
compiled the code and the error was gone before I sent this version.
please check again. You may have seen this error on the first version
and not this one.
thanks

Tanju
> >
> > -                     buf->rts_rrv_time =3D get_rtscts_time(pDevice, 2,=
 byPktType, cbFrameSize, wCurrentRate);
> > -                     buf->rrv_time =3D vnt_rxtx_rsvtime_le16(pDevice, =
byPktType, cbFrameSize, wCurrentRate, bNeedACK);
> > +                     buf->rts_rrv_time =3D get_rtscts_time(pDevice, 2,=
 byPktType, cbFrameSize,
> > +                                                         wCurrentRate)=
;
> > +                     buf->rrv_time =3D vnt_rxtx_rsvtime_le16(pDevice, =
byPktType, cbFrameSize,
> > +                                                           wCurrentRat=
e, bNeedACK);
> >
> >                       /* Fill RTS */
> > -                     s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrame=
Size, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
> > +                     s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrame=
Size, bNeedACK, bDisCRC,
> > +                                    psEthHeader, wCurrentRate, byFBOpt=
ion);
> >               } else if (!pvRTS) {/* RTS_needless, non PCF mode */
> >                       struct vnt_rrv_time_ab *buf =3D pvRrvTime;
> >
> > -                     buf->rrv_time =3D vnt_rxtx_rsvtime_le16(pDevice, =
PK_TYPE_11A, cbFrameSize, wCurrentRate, bNeedACK);
> > +                     buf->rrv_time =3D
> > +                             vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11=
A, cbFrameSize,
> > +                                                   wCurrentRate, bNeed=
ACK);
> >               }
> >       } else if (byPktType =3D=3D PK_TYPE_11B) {
> >               if (pvRTS) {/* RTS_need, non PCF mode */
> >                       struct vnt_rrv_time_ab *buf =3D pvRrvTime;
> >
> > -                     buf->rts_rrv_time =3D get_rtscts_time(pDevice, 0,=
 byPktType, cbFrameSize, wCurrentRate);
> > -                     buf->rrv_time =3D vnt_rxtx_rsvtime_le16(pDevice, =
PK_TYPE_11B, cbFrameSize, wCurrentRate, bNeedACK);
> > +                     buf->rts_rrv_time =3D get_rtscts_time(pDevice, 0,=
 byPktType, cbFrameSize,
> > +                                                         wCurrentRate)=
;
> > +                     buf->rrv_time =3D vnt_rxtx_rsvtime_le16(pDevice, =
PK_TYPE_11B, cbFrameSize,
> > +                                                           wCurrentRat=
e, bNeedACK);
> >
> >                       /* Fill RTS */
> > -                     s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrame=
Size, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
> > +                     s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrame=
Size, bNeedACK, bDisCRC,
> > +                                    psEthHeader, wCurrentRate, byFBOpt=
ion);
> >               } else { /* RTS_needless, non PCF mode */
> >                       struct vnt_rrv_time_ab *buf =3D pvRrvTime;
> >
> > -                     buf->rrv_time =3D vnt_rxtx_rsvtime_le16(pDevice, =
PK_TYPE_11B, cbFrameSize, wCurrentRate, bNeedACK);
> > +                     buf->rrv_time =3D vnt_rxtx_rsvtime_le16(pDevice, =
PK_TYPE_11B, cbFrameSize,
> > +                                                           wCurrentRat=
e, bNeedACK);
> >               }
> >       }
> >   }
>
