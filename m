Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A064424
	for <linux-staging@lists.linux.dev>; Wed, 14 Sep 2022 19:14:15 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id d15so11648762qka.9
        for <linux-staging@lists.linux.dev>; Wed, 14 Sep 2022 12:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=LfkhmSmZlv7MTBgKYoDZ1uG5kIlxP0nQaqCNbV6G8cQ=;
        b=Dn9mmNxksHUvVHl0pIxrz1ABcy0LaFAY1PRdBPDU0JgfVgdc4cH5CrLx4LVlTMNZ6h
         UE1M83T2Rc6+yQUTkP8iZK1exokKDi1KZPUjt/XfanFohGqKKBnbHKKdWC3ZHdbBinP2
         GE7jo7Nj45MKmXR77bIWqHKkId/ytSRGEX/0yv00VhvqPS0jtrA5tlC+x1O656SZ6fWP
         ZbZZ9qNcLV5/ocvlxCGM2pYZvDcqdOkvcAFY/v+bTQOFBaVWoga0Gtujo0O+PmQI+74Q
         1QY2npKKQ6V2j9pP5v81N7RbdC+ipldC27P+xeQE5WbnpKV1h6h7WakOldQ6yMEdHRMX
         tlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=LfkhmSmZlv7MTBgKYoDZ1uG5kIlxP0nQaqCNbV6G8cQ=;
        b=gCI//e6UVDag5hSMWBnoKFYY8YLzcQBMgzoZh8H9llqkoDTQWiLVIFIKcqPW26y5YW
         AgA4nZLwOvURgjgAw6AdIwA8qFQ8Ll9j9Gk+0j/uTmlteETNg56X1sgZCM6yCR4Eakkx
         ntJXIglU9MJLJ7eCPkEL5mNgmq3sJfbuGWeLI10AVsltkUXQYsSwAeJGPFdkRk+hJ93B
         CN5wJlwxCRYdZeVd34v5pSahztugZi6VaO8iSIhJQ1KEFJ+ckaL5JdG25xzVR9WT90cm
         aQtBUiRJ2jBr4bIdHuotTZLJovHA8UhHdW0qqwHTRjWsBlrJuV2/I98piKQvSMQdOqzK
         p7Hw==
X-Gm-Message-State: ACgBeo0SEmTvUMzxykfmZawzBoNenOncnN8I0mWdxlqdSQ01uWZgZ9ho
	e9NlpqrvYYEdq2sbhkh+G26NXAf22+i4SkjyuGdODA==
X-Google-Smtp-Source: AA6agR6mTM7/LOyAY3+2AfaAH3ubmnPpGOmGQdppjrjxHWlT5jX+s9P7i51XQmJa6lcLD8OOueeGxHN7ID7C7elvWr4=
X-Received: by 2002:a05:620a:2588:b0:6c9:2daa:9c6d with SMTP id
 x8-20020a05620a258800b006c92daa9c6dmr27798976qko.630.1663182854112; Wed, 14
 Sep 2022 12:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220912214607.929211-1-nhuck@google.com> <YyEOZ+u/T8rP6o9S@dev-arch.thelio-3990X>
In-Reply-To: <YyEOZ+u/T8rP6o9S@dev-arch.thelio-3990X>
From: Nathan Huckleberry <nhuck@google.com>
Date: Wed, 14 Sep 2022 12:13:00 -0700
Message-ID: <CAJkfWY60NSy382-Px-Xqj_r-57fREMhvyDx8rMJvJ3Q+CsHwrw@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8712: Fix return type of r8712_xmit_entry
To: Nathan Chancellor <nathan@kernel.org>
Cc: Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, 
	Larry Finger <Larry.Finger@lwfinger.net>, 
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Sathish Kumar <skumark1902@gmail.com>, 
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Looks like this was already fixed in 307d343620e1fc7a6a2b7a1cdadb705532c9b6a5

Ignore this patch.


On Tue, Sep 13, 2022 at 4:12 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Mon, Sep 12, 2022 at 02:46:03PM -0700, Nathan Huckleberry wrote:
> > The ndo_start_xmit field in net_device_ops is expected to be of type
> > netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).
> >
> > The mismatched return type breaks forward edge kCFI since the underlying
> > function definition does not match the function hook definition.
> >
> > The return type of r8712_xmit_entry should be changed from int to
> > netdev_tx_t.
> >
> > Reported-by: Dan Carpenter <error27@gmail.com>
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1703
> > Cc: llvm@lists.linux.dev
> > Signed-off-by: Nathan Huckleberry <nhuck@google.com>
>
> The prototype in drivers/staging/rtl8712/xmit_osdep.h should be updated
> as well. With that:
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> > ---
> >  drivers/staging/rtl8712/xmit_linux.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8712/xmit_linux.c b/drivers/staging/rtl8712/xmit_linux.c
> > index 4a93839bf947..e84b9fa231cd 100644
> > --- a/drivers/staging/rtl8712/xmit_linux.c
> > +++ b/drivers/staging/rtl8712/xmit_linux.c
> > @@ -140,7 +140,7 @@ void r8712_xmit_complete(struct _adapter *padapter, struct xmit_frame *pxframe)
> >       pxframe->pkt = NULL;
> >  }
> >
> > -int r8712_xmit_entry(_pkt *pkt, struct  net_device *netdev)
> > +netdev_tx_t r8712_xmit_entry(_pkt *pkt, struct  net_device *netdev)
> >  {
> >       struct xmit_frame *xmitframe = NULL;
> >       struct _adapter *adapter = netdev_priv(netdev);
> > @@ -165,11 +165,11 @@ int r8712_xmit_entry(_pkt *pkt, struct  net_device *netdev)
> >       }
> >       xmitpriv->tx_pkts++;
> >       xmitpriv->tx_bytes += xmitframe->attrib.last_txcmdsz;
> > -     return 0;
> > +     return NETDEV_TX_OK;
> >  _xmit_entry_drop:
> >       if (xmitframe)
> >               r8712_free_xmitframe(xmitpriv, xmitframe);
> >       xmitpriv->tx_drop++;
> >       dev_kfree_skb_any(pkt);
> > -     return 0;
> > +     return NETDEV_TX_OK;
> >  }
> > --
> > 2.37.2.789.g6183377224-goog
> >
