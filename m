Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A9329A9
	for <linux-staging@lists.linux.dev>; Tue, 13 Sep 2022 16:31:36 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id m65so13038573vsc.1
        for <linux-staging@lists.linux.dev>; Tue, 13 Sep 2022 09:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=b+i0B3ku/YO/EcXnChNUofdhqeEHpLaRr2L2r6UJT7c=;
        b=l5Hp0rmC1Fq0LJKuvVko9BV3X4/MX5moJYSnrrKwurcmsaiSSLzFz66xBxLIaKpV0v
         2K5kkLPcUVbRsyWDLnM0k2hPfSPw+FY9/XltEh/OWPjZw51uHATAwm4NiKIAjX85I1My
         OF9uTtnxMl5JV1/5k5JugMIxUejADlv/ufPNii1Nobs/7PYHRFM457LrwXSM6d4ZA1BB
         4hYkHMwUkEponLIDA6E2qILIiKLhEkwaKhfQ/6K7/yLOKY5acawmiEZycDFTLChMwHjG
         AuDQBVc/APJLwWZ5sWYhht7txlSs+icKIhVeiQDz5pH1ihhxxmAkt4DoRKC+eiEkonkX
         Oh+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=b+i0B3ku/YO/EcXnChNUofdhqeEHpLaRr2L2r6UJT7c=;
        b=UG4WXM6DlC/x+Z8nhG34wfz7/XERwl92s/AlsHys+lcyRYhpOBJLZEZanhr5KvMCOn
         Ks/rlC3M86A8FyMw2djejZb7UsNgdUbGKK/z4xJgku/EaMsxEfses6GXzN7yDCCvn9uY
         fI0KRSrCv9DIvV+guix8ssbHilDsKLv8KUHQ8z3/tf/NT9YZZV22G2C6s5YIAHVKMxDj
         uIljvCBxUurkgZw5Av+7oODxM0Fq+h1FiMGl1SY5BOkPKcDQw49yorbXMKB5E55Z8805
         EeLqiQGtV0qsf8WQYeo6wo05DpbmwKZ+OGiIMBJFHq2MAyQjRCpqq4+o+CVyvMm6hb9s
         879g==
X-Gm-Message-State: ACgBeo3mglVIb3uh4X6QUDd+4foCSSQ153ESuY0Z4UPHEYvB4r17uIKw
	kzUi0/3+JKb7H8rqpLQ94Vw2eiPE/SKs/+RJ56774jP+YKrnfA==
X-Google-Smtp-Source: AA6agR4h56m18NSYfYsZsscdfN4a6c/rOAB7BnJWZznr9c0Gdd+WEzKS/CCiC1ntLpHiylU9nDEp6cW5aDqTBAKpsBo=
X-Received: by 2002:a67:c90f:0:b0:398:8f83:e4d with SMTP id
 w15-20020a67c90f000000b003988f830e4dmr3536687vsk.24.1663086693943; Tue, 13
 Sep 2022 09:31:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6cb85919-878a-73a5-0f2a-669d6062727b@redhat.com> <20220913162510.3134430-1-tegongkang@gmail.com>
In-Reply-To: <20220913162510.3134430-1-tegongkang@gmail.com>
From: =?UTF-8?B?6rCV66+87LKg?= <tegongkang@gmail.com>
Date: Wed, 14 Sep 2022 01:31:22 +0900
Message-ID: <CA+uqrQCQBSh+JGwXd+PF58r1LGZj3sSbRCWebdvysZ-Z58dBug@mail.gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: remove braces in single statement blocks
To: gregkh@linuxfoundation.org, hdegoede@redhat.com
Cc: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for your kind review!

Regards,

Kang


2022=EB=85=84 9=EC=9B=94 14=EC=9D=BC (=EC=88=98) =EC=98=A4=EC=A0=84 1:25, K=
ang Minchul <tegongkang@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> This commit cleans up checkpatch warning as follows:
> WARNING: braces {} are not necessary for single statement blocks
>
> Signed-off-by: Kang Minchul <tegongkang@gmail.com>
> ---
> Reverted erased code which invokes error.
>
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/=
rtl8723bs/core/rtw_recv.c
> index d8d394b67eeb..f360c7c631cb 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -1374,9 +1374,8 @@ static signed int validate_80211w_mgmt(struct adapt=
er *adapter, union recv_frame
>                         /* actual management data frame body */
>                         data_len =3D pattrib->pkt_len - pattrib->hdrlen -=
 pattrib->iv_len - pattrib->icv_len;
>                         mgmt_DATA =3D rtw_zmalloc(data_len);
> -                       if (!mgmt_DATA) {
> +                       if (!mgmt_DATA)
>                                 goto validate_80211w_fail;
> -                       }
>                         precv_frame =3D decryptor(adapter, precv_frame);
>                         /* save actual management data frame body */
>                         memcpy(mgmt_DATA, ptr+pattrib->hdrlen+pattrib->iv=
_len, data_len);
> @@ -1385,9 +1384,8 @@ static signed int validate_80211w_mgmt(struct adapt=
er *adapter, union recv_frame
>                         /* remove the iv and icv length */
>                         pattrib->pkt_len =3D pattrib->pkt_len - pattrib->=
iv_len - pattrib->icv_len;
>                         kfree(mgmt_DATA);
> -                       if (!precv_frame) {
> +                       if (!precv_frame)
>                                 goto validate_80211w_fail;
> -                       }
>                 } else if (IS_MCAST(GetAddr1Ptr(ptr)) &&
>                         (subtype =3D=3D WIFI_DEAUTH || subtype =3D=3D WIF=
I_DISASSOC)) {
>                         signed int BIP_ret =3D _SUCCESS;
> @@ -1651,14 +1649,12 @@ static int check_indicate_seq(struct recv_reorder=
_ctrl *preorder_ctrl, u16 seq_n
>         u16 wend =3D (preorder_ctrl->indicate_seq + wsize - 1) & 0xFFF;/*=
  4096; */
>
>         /*  Rx Reorder initialize condition. */
> -       if (preorder_ctrl->indicate_seq =3D=3D 0xFFFF) {
> +       if (preorder_ctrl->indicate_seq =3D=3D 0xFFFF)
>                 preorder_ctrl->indicate_seq =3D seq_num;
> -       }
>
>         /*  Drop out the packet which SeqNum is smaller than WinStart */
> -       if (SN_LESS(seq_num, preorder_ctrl->indicate_seq)) {
> +       if (SN_LESS(seq_num, preorder_ctrl->indicate_seq))
>                 return false;
> -       }
>
>         /*  */
>         /*  Sliding window manipulation. Conditions includes: */
> @@ -2084,10 +2080,8 @@ s32 rtw_recv_entry(union recv_frame *precvframe)
>         precvpriv =3D &padapter->recvpriv;
>
>         ret =3D recv_func(padapter, precvframe);
> -       if (ret =3D=3D _FAIL) {
> +       if (ret =3D=3D _FAIL)
>                 goto _recv_entry_drop;
> -       }
> -
>
>         precvpriv->rx_pkts++;
>
> --
> 2.34.1
>
