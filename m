Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83765E829;
	Fri, 28 Oct 2022 16:42:39 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id ay12so3147721qtb.12;
        Fri, 28 Oct 2022 09:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x/62OrwGclpDYBooag3XtISZVZF7tfAvwgkcx6ffsI8=;
        b=Wp0hf7+sC54waOQ3PL2hLEIzXBDZdqOZY8g4zuTlyBC5Zxgh9IiBWEmeCsC4lXNHEZ
         Eap6bp8EQZfKKKsu4Y6fRNl1PG/ZwFKpeyPFOq4z0iBnECRg1mYHjdrCfTMNi/JaEWxi
         6SarMM9eO4S6PIrpns/IsF4aB6SyFshU3uKsybAOnOAESca13KrdAh6Qv4V7BIOmp3bF
         gvgl17j+0WqXBTBbFH6Hyb7BgKVxfrs3FT89lvfvRnwRWL4R+6uPvUi+A6oVQYag2FBz
         TqLdf7xU8t5vJJah1jnB8gVUHBnEUnZR7f0H8bKIi/Cblj7c0eK4cSTU7QBR6ObmSIMh
         uPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x/62OrwGclpDYBooag3XtISZVZF7tfAvwgkcx6ffsI8=;
        b=NbjTzDUSy3sXGIu01WRuzz/PumFdYGwXIpmZvg9ZWnz0jAf3lzP9JI2t/FDj8IKzgx
         79OZwmnHI2uj29Ks1A10PVT7RKb+XlWkOIn5uSCZjzYnOUVsAICfw5eo2bmo32hfVLqH
         bRv81gs+xKlQmStcpW1FoHEH111t8R77e9j/2KBJ8btrQvj19MOkcMsoFtwQfBH/jOzW
         GIgB9zL181N0o3zpr0CPo/uET4r0ZpKm7DHtByNl7SSJztww5j32VykWMCK8h+8bpvmR
         5YW2t3Sl1n4mMJZo0H83IgFi3FbMxzljLzKJZW1z9Pkv5Hw3+FbX1GEgr9VW4pRCDdBl
         yoxw==
X-Gm-Message-State: ACrzQf3883ko8pA2Gz3jdGo3vuzA3+M2tk/Rb0mHSEDLe6da9QubFWId
	YJ08yxJVIeCVgHKJ2LwnYKak+VqthwGy0tbZpBA=
X-Google-Smtp-Source: AMsMyM57xcefN3dQlJW2OkVRTwQskQNiOF2dtnHshowbcuNAl2hSdGBJG90wJwf9IyVMJKksUlV3nSw5wLCxsg9b+Y4=
X-Received: by 2002:ac8:5902:0:b0:39c:e440:6adb with SMTP id
 2-20020ac85902000000b0039ce4406adbmr353148qty.18.1666975358343; Fri, 28 Oct
 2022 09:42:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1666849707.git.tanjubrunostar0@gmail.com>
 <6742e42999e05ddf09318a0a3bda9ce23b6ae562.1666849707.git.tanjubrunostar0@gmail.com>
 <647b1d2d-f25a-c088-6a0e-0c2a39904150@gmail.com>
In-Reply-To: <647b1d2d-f25a-c088-6a0e-0c2a39904150@gmail.com>
From: Tanju Brunostar <tanjubrunostar0@gmail.com>
Date: Fri, 28 Oct 2022 17:42:26 +0100
Message-ID: <CAHJEyKVruckpK2mrc3uET2nP0yNtdBY335UVvXjWudCd-cijbw@mail.gmail.com>
Subject: Re: [PATCH v7 1/6] staging: vt6655: fix lines of code ending in a '('
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 28, 2022 at 3:57 PM Philipp Hortmann
<philipp.g.hortmann@gmail.com> wrote:
>
> On 10/28/22 08:39, Tanjuate Brunostar wrote:
> > fix several checkpatch errors related to lines ending with a '(' by
> > joining splitted lines of code and indenting properly to increase
> > visibility
> >
> > Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> > ---
> >   drivers/staging/vt6655/rxtx.c | 165 ++++++++++++++--------------------
> >   1 file changed, 69 insertions(+), 96 deletions(-)
> >
> > diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> > index 1e5036121665..7eb7c6eb5cf0 100644
> > --- a/drivers/staging/vt6655/rxtx.c
> > +++ b/drivers/staging/vt6655/rxtx.c
> > @@ -139,15 +139,11 @@ static __le16 vnt_time_stamp_off(struct vnt_private *priv, u16 rate)
> >    * PK_TYPE_11GB    2
> >    * PK_TYPE_11GA    3
> >    */
> > -static
> > -unsigned int
> > -s_uGetTxRsvTime(
> > -     struct vnt_private *pDevice,
> > -     unsigned char byPktType,
> > -     unsigned int cbFrameLength,
> > -     unsigned short wRate,
> > -     bool bNeedAck
> > -)
> > +static unsigned int s_uGetTxRsvTime(struct vnt_private *pDevice,
> > +                                 unsigned char byPktType,
> > +                                 unsigned int cbFrameLength,
> > +                                 unsigned short wRate,
> > +                                 bool bNeedAck)
> >   {
> >       unsigned int uDataTime, uAckTime;
> >
> > @@ -214,20 +210,16 @@ static __le16 get_rtscts_time(struct vnt_private *priv,
> >   }
> >
> >   /* byFreqType 0: 5GHz, 1:2.4Ghz */
> > -static
> > -unsigned int
> > -s_uGetDataDuration(
> > -     struct vnt_private *pDevice,
> > -     unsigned char byDurType,
> > -     unsigned int cbFrameLength,
> > -     unsigned char byPktType,
> > -     unsigned short wRate,
> > -     bool bNeedAck,
> > -     unsigned int uFragIdx,
> > -     unsigned int cbLastFragmentSize,
> > -     unsigned int uMACfragNum,
> > -     unsigned char byFBOption
> > -)
> > +static unsigned int s_uGetDataDuration(struct vnt_private *pDevice,
> > +                                    unsigned char byDurType,
> > +                                    unsigned int cbFrameLength,
> > +                                    unsigned char byPktType,
> > +                                    unsigned short wRate,
> > +                                    bool bNeedAck,
> > +                                    unsigned int uFragIdx,
> > +                                    unsigned int cbLastFragmentSize,
> > +                                    unsigned int uMACfragNum,
> > +                                    unsigned char byFBOption)
> >   {
> >       bool bLastFrag = false;
> >       unsigned int uAckTime = 0, uNextPktTime = 0, len;
> > @@ -316,17 +308,13 @@ s_uGetDataDuration(
> >   }
> >
> >   /* byFreqType: 0=>5GHZ 1=>2.4GHZ */
> > -static
> > -__le16
> > -s_uGetRTSCTSDuration(
> > -     struct vnt_private *pDevice,
> > -     unsigned char byDurType,
> > -     unsigned int cbFrameLength,
> > -     unsigned char byPktType,
> > -     unsigned short wRate,
> > -     bool bNeedAck,
> > -     unsigned char byFBOption
> > -)
> > +static __le16 s_uGetRTSCTSDuration(struct vnt_private *pDevice,
> > +                                unsigned char byDurType,
> > +                                unsigned int cbFrameLength,
> > +                                unsigned char byPktType,
> > +                                unsigned short wRate,
> > +                                bool bNeedAck,
> > +                                unsigned char byFBOption)
> >   {
> >       unsigned int uCTSTime = 0, uDurTime = 0;
> >
> > @@ -409,22 +397,18 @@ s_uGetRTSCTSDuration(
> >       return cpu_to_le16((u16)uDurTime);
> >   }
> >
> > -static
> > -__le16
> > -s_uFillDataHead(
> > -     struct vnt_private *pDevice,
> > -     unsigned char byPktType,
> > -     void *pTxDataHead,
> > -     unsigned int cbFrameLength,
> > -     unsigned int uDMAIdx,
> > -     bool bNeedAck,
> > -     unsigned int uFragIdx,
> > -     unsigned int cbLastFragmentSize,
> > -     unsigned int uMACfragNum,
> > -     unsigned char byFBOption,
> > -     unsigned short wCurrentRate,
> > -     bool is_pspoll
> > -)
> > +static __le16 s_uFillDataHead(struct vnt_private *pDevice,
> > +                           unsigned char byPktType,
> > +                           void *pTxDataHead,
> > +                           unsigned int cbFrameLength,
> > +                           unsigned int uDMAIdx,
> > +                           bool bNeedAck,
> > +                           unsigned int uFragIdx,
> > +                           unsigned int cbLastFragmentSize,
> > +                           unsigned int uMACfragNum,
> > +                           unsigned char byFBOption,
> > +                           unsigned short wCurrentRate,
> > +                           bool is_pspoll)
> >   {
> >       struct vnt_tx_datahead_ab *buf = pTxDataHead;
> >
> > @@ -555,19 +539,15 @@ s_uFillDataHead(
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
> > +static void s_vFillRTSHead(struct vnt_private *pDevice,
> > +                        unsigned char byPktType,
> > +                        void *pvRTS,
> > +                        unsigned int cbFrameLength,
> > +                        bool bNeedAck,
> > +                        bool bDisCRC,
> > +                        struct ieee80211_hdr *hdr,
> > +                        unsigned short wCurrentRate,
> > +                        unsigned char byFBOption)
> >   {
> >       unsigned int uRTSFrameLen = 20;
> >
> > @@ -750,19 +730,15 @@ s_vFillRTSHead(
> >       }
> >   }
> >
> > -static
> > -void
> > -s_vFillCTSHead(
> > -     struct vnt_private *pDevice,
> > -     unsigned int uDMAIdx,
> > -     unsigned char byPktType,
> > -     void *pvCTS,
> > -     unsigned int cbFrameLength,
> > -     bool bNeedAck,
> > -     bool bDisCRC,
> > -     unsigned short wCurrentRate,
> > -     unsigned char byFBOption
> > -)
> > +static void s_vFillCTSHead(struct vnt_private *pDevice,
> > +                        unsigned int uDMAIdx,
> > +                        unsigned char byPktType,
> > +                        void *pvCTS,
> > +                        unsigned int cbFrameLength,
> > +                        bool bNeedAck,
> > +                        bool bDisCRC,
> > +                        unsigned short wCurrentRate,
> > +                        unsigned char byFBOption)
> >   {
> >       unsigned int uCTSFrameLen = 14;
> >
> > @@ -868,21 +844,17 @@ s_vFillCTSHead(
> >    -
> >    * unsigned int cbFrameSize, Hdr+Payload+FCS
> >    */
> > -static
> > -void
> > -s_vGenerateTxParameter(
> > -     struct vnt_private *pDevice,
> > -     unsigned char byPktType,
> > -     struct vnt_tx_fifo_head *tx_buffer_head,
> > -     void *pvRrvTime,
> > -     void *pvRTS,
> > -     void *pvCTS,
> > -     unsigned int cbFrameSize,
> > -     bool bNeedACK,
> > -     unsigned int uDMAIdx,
> > -     void *psEthHeader,
> > -     unsigned short wCurrentRate
> > -)
> > +static void s_vGenerateTxParameter(struct vnt_private *pDevice,
> > +                                unsigned char byPktType,
> > +                                struct vnt_tx_fifo_head *tx_buffer_head,
> > +                                void *pvRrvTime,
> > +                                void *pvRTS,
> > +                                void *pvCTS,
> > +                                unsigned int cbFrameSize,
> > +                                bool bNeedACK,
> > +                                unsigned int uDMAIdx,
> > +                                void *psEthHeader,
> > +                                unsigned short wCurrentRate)
> >   {
> >       u16 fifo_ctl = le16_to_cpu(tx_buffer_head->fifo_ctl);
> >       bool bDisCRC = false;
> > @@ -954,11 +926,12 @@ s_vGenerateTxParameter(
> >       }
> >   }
> >
> > -static unsigned int
> > -s_cbFillTxBufHead(struct vnt_private *pDevice, unsigned char byPktType,
> > -               unsigned char *pbyTxBufferAddr,
> > -               unsigned int uDMAIdx, struct vnt_tx_desc *pHeadTD,
> > -               unsigned int is_pspoll)
> > +static unsigned int s_cbFillTxBufHead(struct vnt_private *pDevice,
> > +                                   unsigned char byPktType,
> > +                                   unsigned char *pbyTxBufferAddr,
> > +                                   unsigned int uDMAIdx,
> > +                                   struct vnt_tx_desc *pHeadTD,
> > +                                   unsigned int is_pspoll)
> >   {
> >       struct vnt_td_info *td_info = pHeadTD->td_info;
> >       struct sk_buff *skb = td_info->skb;
>
> Patch series coverletter is missing or the wrong one was send.
>
> Changelog is also missing.
>
oh the wrong cover letter was sent.

thanks for pointing it out
