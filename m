Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89C5631;
	Tue,  1 Nov 2022 09:07:44 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id fz10so3209877qtb.3;
        Tue, 01 Nov 2022 02:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=th4xE1kbxGXhvqp58bQuwMXJRdHQ2h80CsaIeNEDNYA=;
        b=OYz9l1Y5jipEZRqi3+Ap+YOfsah2VQ9iMf7WNs3maEj3q6h/Dfs9GFi+QIO/psu+Ly
         DXAj6alXARPIVeyTfkRlpPghdYn9KjMcm3ZMakzXUYkbjmZ+TJK/PWU2fMrTxurvUL/a
         k5Z1RkaTdV618nCftw9T1JwbvCjipnbpcD8DKhv2tJ3oQWNqHhq/A09jHd6IMtkmsd1a
         yT/ZmFkNL90owGNyD0V2xpVNSiAA8cg0kFUSoxa+L/SQo0xc9+lxGFReNtdLKJgsYH1f
         8dLyNpX2GwhtFqMesZ74vzm/hZV+mc1E6BytoZE1AJP9l7humU+TKmx6sXgEk4kQOQYW
         Zr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=th4xE1kbxGXhvqp58bQuwMXJRdHQ2h80CsaIeNEDNYA=;
        b=3HOvN5AKnIEw+IzfMCy9ZgdvBFwVo5xof+0SiXPIkweN8Wq4dHYvv6OPdyvkIZssgw
         4mBGFAZAfu2Cb0uNXLGAiaAmUsH9rA1vKAW6wemfRibT3zOl0y6U5QTpOEmL6OGKtSek
         wvMK/glN+21DBSL4Wm7+FOTXyIvySQiAIMWd+2ENcLRlQNIFaM3uH4MZvDtIcYxk6Fdn
         7uwznX0Sq7eWYmx2QOQYUasaImTe4ZPzq7h7SMSoryRzwxcvZob0ak0BGtdoLhI3Ua8m
         W7RkYWkuOtplKHORxlgASi8KMcVNjmROM3zYEnqsSELYkA7vlEvcHMJXJ/BcSgL6gTy5
         gmeA==
X-Gm-Message-State: ACrzQf0SkY9Xe4TuCXT80XgSmQGkwpyu0SGV8FGPFZjVNZPpwc4f/yU4
	tRTA7h+DeoTNgv6kgpunBYkJOula4ae8Y4lsghA=
X-Google-Smtp-Source: AMsMyM7pD9BJESp5l+Gr6L3YVVtbGVqkbv2G+8523qeiuaN11uPGoMbnxqvZhSktFvZAwlbFmDbo+Ck0BfrJ1N/rVB8=
X-Received: by 2002:a05:622a:147:b0:39c:dc0d:7d0f with SMTP id
 v7-20020a05622a014700b0039cdc0d7d0fmr13847372qtw.281.1667293663598; Tue, 01
 Nov 2022 02:07:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y2DXsnrQjQeP2PfO@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
 <alpine.DEB.2.22.394.2211010942210.2834@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2211010942210.2834@hadrien>
From: Tanju Brunostar <tanjubrunostar0@gmail.com>
Date: Tue, 1 Nov 2022 10:07:31 +0100
Message-ID: <CAHJEyKW0wcY8sSZWG6CpF8p8e+i12vN9mtOYngQQBRh8zxRr7Q@mail.gmail.com>
Subject: Re: [PATCH v2] staging: vt6655: change variable name wTimeStampOff
To: Julia Lawall <julia.lawall@inria.fr>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 1, 2022 at 9:43 AM Julia Lawall <julia.lawall@inria.fr> wrote:
>
>
>
> On Tue, 1 Nov 2022, Tanjuate Brunostar wrote:
>
> > Change the variable name wTimeStampOff to adhear to Linux kernel coding
> > style, which does not allow naming variables in CamelCase. error is
> > reported by checkpatch
>
> adhear -> adhere
>
> error -> Error
>
> Actually, the variable is written in Hungarian notation, given the little
> w at the beginning of its name.
>
> Maybe
>
> "Remove the use of Hungarian notation, which is not used in the Linux
> kernel."
>
> julia
>
Thanks
> >
> > Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> > ---
> >  drivers/staging/vt6655/rxtx.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> > index 1e5036121665..9bdcf2337235 100644
> > --- a/drivers/staging/vt6655/rxtx.c
> > +++ b/drivers/staging/vt6655/rxtx.c
> > @@ -54,7 +54,7 @@
> >   */
> >  #define CRITICAL_PACKET_LEN      256
> >
> > -static const unsigned short wTimeStampOff[2][MAX_RATE] = {
> > +static const unsigned short time_stamp_off[2][MAX_RATE] = {
> >       {384, 288, 226, 209, 54, 43, 37, 31, 28, 25, 24, 23}, /* Long Preamble */
> >       {384, 192, 130, 113, 54, 43, 37, 31, 28, 25, 24, 23}, /* Short Preamble */
> >  };
> > @@ -130,7 +130,7 @@ static __le16 s_uFillDataHead(struct vnt_private *pDevice,
> >
> >  static __le16 vnt_time_stamp_off(struct vnt_private *priv, u16 rate)
> >  {
> > -     return cpu_to_le16(wTimeStampOff[priv->preamble_type % 2]
> > +     return cpu_to_le16(time_stamp_off[priv->preamble_type % 2]
> >                                                       [rate % MAX_RATE]);
> >  }
> >
> > --
> > 2.34.1
> >
> >
> >
