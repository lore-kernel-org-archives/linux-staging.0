Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251BC6110;
	Fri, 21 Oct 2022 17:32:08 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id a5so2468316qkl.6;
        Fri, 21 Oct 2022 10:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8YsPJ6YAEeb+wvwrd2DUY6/tG224J3XS2r7bRlx+/Ns=;
        b=FRyyiO85auQ2mjd1N9YVBg+1RctotWb+KPqF019ikZ6jcJ9+Y0cGsMxgDfZU9jjB2B
         XybCONEp8KgybtPD1wolhfjV4hslgrjjlyX7sdZV1VvHuVtwbDlqQaoW0fjIwobR90au
         Giyzl2eloPif2IbcLVUy6UkY7F7xUUWEGS9mTXDbP0/SopZFA+9stxbB5XWwRxU6g7QV
         YDf4k+YvEhNOq+IzETXbX02l8Jy4R060beofSk1Htm2eCDwaEROprviJAaLhF+KSp/hd
         JZFqwcVjSNljxm10p+WXGK+77Q9XuRIic6b9xGPq/JALUPC/gX/JU0S9Y7Bk9wm9R0n0
         LdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8YsPJ6YAEeb+wvwrd2DUY6/tG224J3XS2r7bRlx+/Ns=;
        b=CoyKEDcGgHltn6Za/pJ56EjqgrbcORBql66zF8XEHPo5eGh3G7Q2jvCcsayuza5H+W
         Q4Q61B24jalTgsJ3A4L6acSblvn8NFb4dUTv95vHfmW3QFNMsdOkHK9w0R2LtSe+jZ39
         TFHXvK+XQHxeEcJiPVtXBesY9z5qJFee6bc++n6neOKHr6pwLHTdHvK2/5ZLBmZvpmUI
         t8konNjzhzq/lw4FpzbSIP5aBXemr1CwTTLu8tLUQNr4xF5y9SUchZcSjI3/uC8SbatY
         92IU6zrRsbdtkFXArR3IXPnidWsKFihg6FSqnvHcD+Poqo/D1QQnilaiyGWLmVIIpfdI
         oJgQ==
X-Gm-Message-State: ACrzQf3VDJg6HZ67kT9PSdXntCeDokp4ITbyDIQK3KrqsI0RZsFcXpFs
	DAt55kqygJJkZ4bKNL+UfLBBZeFXof5uwfME7us=
X-Google-Smtp-Source: AMsMyM4xV/hfGYrXACJL6TzKjc3tD8Fk/yxCpSYr9hqTCdiR1yHLvtnvMAXP+xm7ftQhuQK1vg+QJFgE04ISGOiamKs=
X-Received: by 2002:a05:620a:2699:b0:6cf:3a7f:5fe6 with SMTP id
 c25-20020a05620a269900b006cf3a7f5fe6mr15093597qkp.103.1666373526980; Fri, 21
 Oct 2022 10:32:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y1JlnJ/UpBgm9XEC@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
 <1db48b50-6dac-5f36-315d-72208156f196@linux.microsoft.com>
In-Reply-To: <1db48b50-6dac-5f36-315d-72208156f196@linux.microsoft.com>
From: Tanju Brunostar <tanjubrunostar0@gmail.com>
Date: Fri, 21 Oct 2022 18:31:54 +0100
Message-ID: <CAHJEyKVxBNm+3hVy605+HJ6M6qa2nSONZ-aHc62B7eeRwowQiw@mail.gmail.com>
Subject: Re: [PATCH v4] staging: vt6655: Fix Lines should not end with a '('
To: Praveen Kumar <kumarpraveen@linux.microsoft.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 21, 2022 at 11:49 AM Praveen Kumar
<kumarpraveen@linux.microsoft.com> wrote:
>
> On 21-10-2022 14:55, Tanjuate Brunostar wrote:
> > Code style warnings reported by checkpatch.
> > Improve the layout of a function header:
> > Put the first parameter immediately after the '(' and align the other
> > parameters underneath it.
> >
> > Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> >
> > ---
> > v2: put static and void on the same line and adjusted the indentation as
> > suggested by Greg KH
> > ---
> > v3: Reformat the code by inserting tabs and white space as recommended
> > by Nam Cao and Julia Lawall
> > ---
> > v4: final version of this patch
> >
> >  drivers/staging/vt6655/rxtx.c | 78 +++++++++++++++--------------------
> >  1 file changed, 33 insertions(+), 45 deletions(-)
> >
> > diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> > index 5bdb5176772c..1e5036121665 100644
> > --- a/drivers/staging/vt6655/rxtx.c
> > +++ b/drivers/staging/vt6655/rxtx.c
> > @@ -85,35 +85,27 @@ static const unsigned short wFB_Opt1[2][5] = {
> >  #define DATADUR_A_F1    13
> >
> >  /*---------------------  Static Functions  --------------------------*/
> > -static
> > -void
> > -s_vFillRTSHead(
> > -     struct vnt_private *pDevice,
> > -     unsigned char byPktType,
> > -     void *pvRTS,
> > -     unsigned int    cbFrameLength,
> > -     bool bNeedAck,
> > -     bool bDisCRC,
> > -     struct ieee80211_hdr *hdr,
> > -     unsigned short wCurrentRate,
> > -     unsigned char byFBOption
> > -);
> > -
> > -static
> > -void
> > -s_vGenerateTxParameter(
> > -     struct vnt_private *pDevice,
> > -     unsigned char byPktType,
> > -     struct vnt_tx_fifo_head *,
> > -     void *pvRrvTime,
> > -     void *pvRTS,
> > -     void *pvCTS,
> > -     unsigned int    cbFrameSize,
> > -     bool bNeedACK,
> > -     unsigned int    uDMAIdx,
> > -     void *psEthHeader,
> > -     unsigned short wCurrentRate
> > -);
> > +static void s_vFillRTSHead(struct vnt_private *pDevice,
> > +                        unsigned char byPktType,
> > +                        void *pvRTS,
> > +                        unsigned int cbFrameLength,
> > +                        bool bNeedAck,
> > +                        bool bDisCRC,
> > +                        struct ieee80211_hdr *hdr,
> > +                        unsigned short wCurrentRate,
> > +                        unsigned char byFBOption);
> > +
> > +static void s_vGenerateTxParameter(struct vnt_private *pDevice,
> > +                                unsigned char byPktType,
> > +                                struct vnt_tx_fifo_head *,
> > +                                void *pvRrvTime,
> > +                                void *pvRTS,
> > +                                void *pvCTS,
> > +                                unsigned int cbFrameSize,
> > +                                bool bNeedACK,
> > +                                unsigned int uDMAIdx,
> > +                                void *psEthHeader,
> > +                                unsigned short wCurrentRate);
> >
> >  static unsigned int
> >  s_cbFillTxBufHead(struct vnt_private *pDevice, unsigned char byPktType,
> > @@ -121,22 +113,18 @@ s_cbFillTxBufHead(struct vnt_private *pDevice, unsigned char byPktType,
> >                 unsigned int uDMAIdx, struct vnt_tx_desc *pHeadTD,
> >                 unsigned int uNodeIndex);
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
> > -);
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
> > +                           bool is_pspoll);
> >
> >  /*---------------------  Export Variables  --------------------------*/
> >
>
> Can we also work upon the naming convention from pDevice -> p_device and other places if that make sense here.
>
> Regards,
>
> ~Praveen.
>
I intend to do this as a separate patch
