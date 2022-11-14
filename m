Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1AA8498;
	Mon, 14 Nov 2022 22:59:34 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id x21so8514116qkj.0;
        Mon, 14 Nov 2022 14:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5Bd+hPxRC8CJvSI+iSnYQgyjxDeUguvczWQMfQnYonI=;
        b=INOwPdrEBgADif+uik9Nd2gkrct6olxqpY0ZhI9BzXqZ09CrNJpxz8jb+ks1TClKZd
         un4pScO4qyTOFePGRJJEDfqD0AQ2TxHoJVhK2XJzhf/wTOEHpu/x6YnZJNTuUKkfwbGM
         kxqes3BtnFARLwrMlyie5ppNv61f0D2C7SvB10WsXJjWVy8qSFVT6ZHXcYSlQgBMDM1E
         bWUG0MsZXcR789Qp1NuKdFvrbNzBg4RIDAz9RCRo+N0LYO7qCPUOH3/t8ipjws10WEHU
         TYodoNsj4EGkIWF6pav9iCWwScoSaIp0gxvgr9UN+R3jv/+m6t0N7qJKPc3sTvVapb5v
         /kRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Bd+hPxRC8CJvSI+iSnYQgyjxDeUguvczWQMfQnYonI=;
        b=QXhFR9RdJwVuzS5tuo6Z8fZTJNcYqis2tsDYjq4N+IjA8jdcgF9kVJNrqrdabjiWHe
         dMYxxBzykf9DiVVjofWTgoCcyrSJJvnyaR0OOvjfy9D3ANEhTeWNgUDgFag/O9slJeN8
         W7OD9GqMrxBrO0/kuYZb5/Z+WruXcsazBkMMTKxXP9ryg8o9JGEv8McA08InfIxbMTXq
         GF3+IVsFVkVl5KBiSsfl/+pUWbVwTjs9YgzjpO3Ia38ScPR66Y0wmlqS6g5Owk1Nwn0A
         5FuFBrCu0le+2OsAA0NuwwrB78l0IZxbF/V/HK2WqpF9XFZCk/s7mcRA9Cqsl7WItnhE
         bGIA==
X-Gm-Message-State: ANoB5pn4Yj22HHhuWj7Biln5afyUF8raEuLIq9ts4fE9VLqlzFfKHgRq
	R5xmIAF9VojM8zeEfZFnO8y7TbQD7m82N2FNWnI=
X-Google-Smtp-Source: AA0mqf4+uAd8QY4rcmNAPSZ7CzhMsZy85axr1O83SH3ZgfZ/CRIdoZk3kL88Qm+CZzZhZFutnwPBcdcpocHBejOwE1g=
X-Received: by 2002:a37:aec3:0:b0:6fa:2ff9:e9ca with SMTP id
 x186-20020a37aec3000000b006fa2ff9e9camr13377681qke.29.1668466773107; Mon, 14
 Nov 2022 14:59:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y3KJBdUue5otWgOT@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
 <480340b3-c1c1-74b5-1889-f49dcb644469@gmail.com>
In-Reply-To: <480340b3-c1c1-74b5-1889-f49dcb644469@gmail.com>
From: Tanju Brunostar <tanjubrunostar0@gmail.com>
Date: Mon, 14 Nov 2022 23:59:21 +0100
Message-ID: <CAHJEyKWRm_wzUcz7wzcveLLGND9F3m3HM23mpwQ=zjeO5zh5FA@mail.gmail.com>
Subject: Re: [PATCH v3] staging: vt6655: change the function name s_vFillRTSHead
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 14, 2022 at 9:19 PM Philipp Hortmann
<philipp.g.hortmann@gmail.com> wrote:
>
> On 11/14/22 19:29, Tanjuate Brunostar wrote:
> > Remove the use of Hungarian notation, which is not used in the Linux
> > kernel. Reported by checkpatch
> > Add indentation to the affected function to follow the Linux kernel
> > coding style. This improves visibility
> >
> > Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> > ---
> > v2: corrected confusing changlog message on this patch
> > v3: removed unnecessary function prototype
> >
> >   drivers/staging/vt6655/rxtx.c | 40 ++++++++++++-----------------------
> >   1 file changed, 13 insertions(+), 27 deletions(-)
> >
> > diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> > index 31ae99b3cb35..715b323cd2a8 100644
> > --- a/drivers/staging/vt6655/rxtx.c
> > +++ b/drivers/staging/vt6655/rxtx.c
> > @@ -23,7 +23,7 @@
> >    *      s_uGetTxRsvTime- get frame reserved time
> >    *      s_vFillCTSHead- fulfill CTS ctl header
> >    *      s_vFillFragParameter- Set fragment ctl parameter.
> > - *      s_vFillRTSHead- fulfill RTS ctl header
> > + *      fill_rts_header- fulfill RTS ctl header
> >    *      s_vFillTxKey- fulfill tx encrypt key
> >    *      s_vSWencryption- Software encrypt header
> >    *      vDMA0_tx_80211- tx 802.11 frame via dma0
> > @@ -85,16 +85,6 @@ static const unsigned short fb_opt1[2][5] = {
> >   #define DATADUR_A_F1    13
> >
> >   /*---------------------  Static Functions  --------------------------*/
> > -static void s_vFillRTSHead(struct vnt_private *pDevice,
> > -                        unsigned char byPktType,
> > -                        void *pvRTS,
> > -                        unsigned int cbFrameLength,
> > -                        bool bNeedAck,
> > -                        bool bDisCRC,
> > -                        struct ieee80211_hdr *hdr,
> > -                        unsigned short wCurrentRate,
> > -                        unsigned char byFBOption);
> > -
> >   static void s_vGenerateTxParameter(struct vnt_private *pDevice,
> >                                  unsigned char byPktType,
> >                                  struct vnt_tx_fifo_head *,
> > @@ -555,19 +545,15 @@ s_uFillDataHead(
> >       return buf->duration;
> >   }
> >
> > -static
> > -void
> > -s_vFillRTSHead(
> > -     struct vnt_private *pDevice,
> > -     unsigned char byPktType,
> > -     void *pvRTS,
> > -     unsigned int cbFrameLength,
> > -     bool bNeedAck,
> > -     bool bDisCRC,
> > -     struct ieee80211_hdr *hdr,
> > -     unsigned short wCurrentRate,
> > -     unsigned char byFBOption
> > -)
> > +static void fill_rts_header(struct vnt_private *pDevice,
> > +                         unsigned char byPktType,
> > +                         void *pvRTS,
> > +                         unsigned int cbFrameLength,
> > +                         bool bNeedAck,
> > +                         bool bDisCRC,
> > +                         struct ieee80211_hdr *hdr,
> > +                         unsigned short wCurrentRate,
> > +                         unsigned char byFBOption)
> >   {
> >       unsigned int uRTSFrameLen = 20;
> >
> > @@ -912,7 +898,7 @@ s_vGenerateTxParameter(
> >                       buf->rrv_time_a = vnt_rxtx_rsvtime_le16(pDevice, byPktType, cbFrameSize, wCurrentRate, bNeedACK);
> >                       buf->rrv_time_b = vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11B, cbFrameSize, pDevice->byTopCCKBasicRate, bNeedACK);
> >
> > -                     s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
> > +                     fill_rts_header(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
> >               } else {/* RTS_needless, PCF mode */
> >                       struct vnt_rrv_time_cts *buf = pvRrvTime;
> >
> > @@ -931,7 +917,7 @@ s_vGenerateTxParameter(
> >                       buf->rrv_time = vnt_rxtx_rsvtime_le16(pDevice, byPktType, cbFrameSize, wCurrentRate, bNeedACK);
> >
> >                       /* Fill RTS */
> > -                     s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
> > +                     fill_rts_header(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
> >               } else if (!pvRTS) {/* RTS_needless, non PCF mode */
> >                       struct vnt_rrv_time_ab *buf = pvRrvTime;
> >
> > @@ -945,7 +931,7 @@ s_vGenerateTxParameter(
> >                       buf->rrv_time = vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11B, cbFrameSize, wCurrentRate, bNeedACK);
> >
> >                       /* Fill RTS */
> > -                     s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
> > +                     fill_rts_header(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
> >               } else { /* RTS_needless, non PCF mode */
> >                       struct vnt_rrv_time_ab *buf = pvRrvTime;
> >
>
> Hi,
>
> I cannot apply your patch.
>
> Here my git infos:
> git remote show origin
> * remote origin
>    Fetch URL:
> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
> ...
> git branch -a
> my branch: staging-testing
>
> Bye Philipp

I was recently asked to rebase to the staging-next branch. I think
this is where there is conflict
