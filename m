Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EC26D24
	for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 19:19:31 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id 130so197915ybz.9
        for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 12:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=FXLyqGxgl949dQXd9+Y93zHcrMCOz6aSMQMInAwIeao=;
        b=Y1sysjOv33mISn1q70tz/ornMY+WsYjj8pwwOMNYoeEDrjz+CcDRAJILfFHrNzc1bo
         OkXD8KfGtJfYX+50rR+zUndJrqlLUHSBxc0Ij1HQ9PgWqZasdCMZTY5Ek86VBNsAupth
         /tPka1tNtGB4U2wibDQ7JqF2Bkj6lFVNNf7M2U+/Tzn7dg0ZB/SB12D6hLC6C6LQ1IfV
         CgflZeDxFIY2EE93V75DfNcueAvSnLNCOpu6Rtc6eBKqxLyFwMFU/hgrMJjoyC2vf7x0
         nmk41hm6TyRgk+c7Cqe73DJUU11K9zoP7mJfH5tZHo0YrNLlmN5EqerDHdEE9krQcnkL
         VDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=FXLyqGxgl949dQXd9+Y93zHcrMCOz6aSMQMInAwIeao=;
        b=ZTAJ194/hui46kueip/WBK+mowmGkRfLv6Q2FCijyAduDsDDCPKQd//7fNneRuJb63
         M52+H0hARarR3vhnb9xzqK/OnGcapUZEPtlsnTcIcwtWZvEfzG0X4j67qT7Su3cUHbw3
         YEdneZqq+rUPJvetFcUqDxSsJTS9y5naK8aFDkgu1Vdu/1LW69Bsx4w9NsOGjmk4zQjF
         +lN6Qizm+16XMw7x7iQ36fuqnlT/+2q+FCpCR9evxigMbKaDljWaW3sWvwHu94uHQStg
         ho57WlNDFLSnzSxEq3dXuPanHiouXH5qa+xIz24YL7SJSQBS2XkI4yOJtUrvT+B5Poyr
         7Rhw==
X-Gm-Message-State: ACrzQf20oaQ9gnemi2TdRMLl3gX0sYCBM992MkSES4xOM/bYoW6qvTIM
	Mt3Cmy/kb+QJnugEgRAgWkkUouKzIf9noIv9SHE=
X-Google-Smtp-Source: AMsMyM6cxcp910uQasBXZ2uu/YUuglapy5eHTqQW940vXB6HdiRB9HtxI0nM9Ze56dVuw/x6p5SifH40jDS62HqtpD8=
X-Received: by 2002:a25:389:0:b0:6a9:20da:fe68 with SMTP id
 131-20020a250389000000b006a920dafe68mr15145597ybd.49.1663615170238; Mon, 19
 Sep 2022 12:19:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220919135812.8307-1-aruna.hewapathirane@gmail.com> <590b49c9-5940-c7e6-0a23-9a82cd06fe62@gmail.com>
In-Reply-To: <590b49c9-5940-c7e6-0a23-9a82cd06fe62@gmail.com>
From: Aruna Hewapathirane <aruna.hewapathirane@gmail.com>
Date: Mon, 19 Sep 2022 15:19:19 -0400
Message-ID: <CAFSeFg-awEMyZjePcvO_Mo3k_pFX-Kq85Uvbub6bmA7XkQ7zZA@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging: rtl8192e: removes blank line
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, f3sch.git@outlook.com, guozihua@huawei.com, 
	linux-staging@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 19, 2022 at 2:41 PM Philipp Hortmann
<philipp.g.hortmann@gmail.com> wrote:
>
> On 9/19/22 15:58, Aruna Hewapathirane wrote:
> > This patch fixes a checkpatch CHECK issue
> > CHECK: Please don't use multiple blank lines
> >
> > Signed-off-by: Aruna Hewapathirane <aruna.hewapathirane@gmail.com>
> > ---
> >   drivers/staging/rtl8192e/rtllib_tx.c | 1 -
> >   1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
> > index d5275319a486..f651947f6b44 100644
> > --- a/drivers/staging/rtl8192e/rtllib_tx.c
> > +++ b/drivers/staging/rtl8192e/rtllib_tx.c
> > @@ -920,7 +920,6 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
> >                                       tcb_desc->bTxDisableRateFallBack = 1;
> >                               }
> >
> > -
> >                               tcb_desc->RATRIndex = 7;
> >                               tcb_desc->bTxUseDriverAssingedRate = 1;
> >                               tcb_desc->bdhcp = 1;
>
> Please avoid the 2/2 in the subject. This is only for patch series.

I will do so in future I did not know this. My apologies.

> Create a version 2 of this patch with change history.

I have no idea how to create a version2 with a change history but I am
going to Google and see what I can find.

> Removing blank lines is OK but do this for the entire document.

Ah.. of course makes  sense. Once again my apologies.

> Add the file name to the subject to make it more unique.

I will do so. Thank you Philipp.

>
>
> Bye Philipp


On Mon, Sep 19, 2022 at 2:41 PM Philipp Hortmann
<philipp.g.hortmann@gmail.com> wrote:
>
> On 9/19/22 15:58, Aruna Hewapathirane wrote:
> > This patch fixes a checkpatch CHECK issue
> > CHECK: Please don't use multiple blank lines
> >
> > Signed-off-by: Aruna Hewapathirane <aruna.hewapathirane@gmail.com>
> > ---
> >   drivers/staging/rtl8192e/rtllib_tx.c | 1 -
> >   1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
> > index d5275319a486..f651947f6b44 100644
> > --- a/drivers/staging/rtl8192e/rtllib_tx.c
> > +++ b/drivers/staging/rtl8192e/rtllib_tx.c
> > @@ -920,7 +920,6 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
> >                                       tcb_desc->bTxDisableRateFallBack = 1;
> >                               }
> >
> > -
> >                               tcb_desc->RATRIndex = 7;
> >                               tcb_desc->bTxUseDriverAssingedRate = 1;
> >                               tcb_desc->bdhcp = 1;
>
> Please avoid the 2/2 in the subject. This is only for patch series.
> Create a version 2 of this patch with change history.
> Removing blank lines is OK but do this for the entire document.
> Add the file name to the subject to make it more unique.
>
> Bye Philipp
