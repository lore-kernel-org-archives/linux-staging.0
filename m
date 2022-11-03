Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFBFA23;
	Thu,  3 Nov 2022 08:49:12 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id u7so665818qvn.13;
        Thu, 03 Nov 2022 01:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cxkWhtwmdAzTWE2PSj2tVH0t5eNv3MSowHRnjz5ll34=;
        b=nV6rbQh1zm8bfQjZG9h5vXfaHWStZ5A1R4OI/46LvkHZvAnluG74cg50Yr0ZIpGmiy
         UlONhLDhtGxphTAtyWnuZVtymDpckE/cO2HoKfNNQQn//gUoSAUD3UtmajbM27Vx6Cnd
         o/OQgq1dQRYtL7uVyd6M1/XFgmb7bkQeiSeipPiFAnBdUnM7AG6iRhVMP+g6u+lHUrvZ
         eqpVcv6DB4imLx8FBT1QpteBvKIeJfb7ty0XCl7lM4GArEMM1z+gtgH01cPVnT5fo34e
         9tredaiFuEhjSsxzGV0QfIvVGu2gnaWfUiBzoeE90aSAx4uBNXw9JIOsStZKa1IIwSkz
         c21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cxkWhtwmdAzTWE2PSj2tVH0t5eNv3MSowHRnjz5ll34=;
        b=V4Ni1SH2p67OVx59DigSHQuMM/WbU93HujsFz1cs4XbIHJM6mgoLBFCJkrQmDpxMrJ
         1dVYCjV2uMch4GLQ4TZTDGqI/QkRi+ZbIEHTTRo159jBp38OZmXqXt7S1sslM98teTnN
         x8jbOyaG3e4yzc01C679jlbH9E551iczz2pGIaBQl4/2bfLZuZuRzUsQt29yLxcMW65I
         5TaxCJs3tqPx13nlyTIkFCWDL+H73tHsJSzRBa1/zFT1zZ2n/RVjEXROm7WFlQz1Rwep
         sK6twWY/i+p1t7qZfAVrBI3yp1e977Z48oBTT9f8fJinbr9El2R7ZPdg0N1IhkgWxh5L
         UllA==
X-Gm-Message-State: ACrzQf3kmhzEWz1yvbVcJ0IgPVsMMiS5zAhPurBu1fx+qllIr25hhj+T
	PY3ZOGSER6294AO1dkXT9GUIZ+vpsTFdPnnYuSE=
X-Google-Smtp-Source: AMsMyM63t4Cz/ND8vX969NN0IjOpsv0dKbjL2+mkQqPckfoOSZr5YxpRVwdhtxFEt16uIa0qvLI5IXUAkY0tQfF1rqM=
X-Received: by 2002:ad4:5e8b:0:b0:4b9:98bf:92cc with SMTP id
 jl11-20020ad45e8b000000b004b998bf92ccmr25618663qvb.128.1667465351626; Thu, 03
 Nov 2022 01:49:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1667397591.git.tanjubrunostar0@gmail.com>
 <5a0649c6019f1717cb2e2e8fc4e262f3747d73a5.1667397591.git.tanjubrunostar0@gmail.com>
 <bfc8e714fbe80a16428a447768def5764083526d.camel@perches.com>
In-Reply-To: <bfc8e714fbe80a16428a447768def5764083526d.camel@perches.com>
From: Tanju Brunostar <tanjubrunostar0@gmail.com>
Date: Thu, 3 Nov 2022 09:48:59 +0100
Message-ID: <CAHJEyKV75q90E1OU2YOGK70EBLm8dQe181m_nS_qmPRsPaB8TQ@mail.gmail.com>
Subject: Re: [PATCH V4 1/2] staging: vt6655: change the function name s_vFillRTSHead
To: Joe Perches <joe@perches.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

The second commit under this patchset resolves this. please take a
look at it and let me know if I should change anything

On Wed, Nov 2, 2022 at 5:42 PM Joe Perches <joe@perches.com> wrote:
>
> On Wed, 2022-11-02 at 14:08 +0000, Tanjuate Brunostar wrote:
> > Remove the use of Hungarian notation, which is not used in the Linux
> > kernel. Reported by checkpatch
> []
> > diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> []
> > @@ -23,7 +23,7 @@
> >   *      s_uGetTxRsvTime- get frame reserved time
> >   *      s_vFillCTSHead- fulfill CTS ctl header
> >   *      s_vFillFragParameter- Set fragment ctl parameter.
> > - *      s_vFillRTSHead- fulfill RTS ctl header
> > + *      fill_rts_header- fulfill RTS ctl header
> >   *      s_vFillTxKey- fulfill tx encrypt key
> >   *      s_vSWencryption- Software encrypt header
> >   *      vDMA0_tx_80211- tx 802.11 frame via dma0
> > @@ -85,15 +85,15 @@ static const unsigned short fb_opt1[2][5] = {
> >  #define DATADUR_A_F1    13
> >
> >  /*---------------------  Static Functions  --------------------------*/
> > -static void s_vFillRTSHead(struct vnt_private *pDevice,
> > -                        unsigned char byPktType,
> > -                        void *pvRTS,
> > -                        unsigned int cbFrameLength,
> > -                        bool bNeedAck,
> > -                        bool bDisCRC,
> > -                        struct ieee80211_hdr *hdr,
> > -                        unsigned short wCurrentRate,
> > -                        unsigned char byFBOption);
> > +static void fill_rts_head(struct vnt_private *pDevice,
> > +                       unsigned char byPktType,
> > +                       void *pvRTS,
> > +                       unsigned int  cbFrameLength,
> > +                       bool bNeedAck,
> > +                       bool bDisCRC,
> > +                       struct ieee80211_hdr *hdr,
> > +                       unsigned short wCurrentRate,
> > +                       unsigned char byFBOption);
>
> Please compile the files modified by your patches _before_ submitting them.
>
> Note the mismatch in your naming for this function prototype and the
> actual function.
>
> fill_rts_head vs fill_rts_header.
>
> I believe this was already pointed out to you by the kernel robot.
