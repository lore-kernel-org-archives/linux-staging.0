Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0B623BD;
	Wed, 13 Apr 2022 03:01:33 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id k5so1125082lfg.9;
        Tue, 12 Apr 2022 20:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9B5Bgd6y+D2b5bf/PHddV0cYSTfDz/gFBZ7J53x9Nsk=;
        b=WaEkr27rG3OburA2d8oeVHK+sc+92BI3Fi8YwcbmOJarjbuxfDpU5zcriwVKazSCMV
         jJAHJtwJvXbuSuTpY53KBCWbJzVtbOqrriaveJQvxC9YvU1ps6PNDRte1i8VvEn2um+F
         d+trcmOQr6u6qU/DaDttRbpQdntee43gnU1afWpkBm9JEfLYhr2pxjyDdaOpwWcK19mW
         7sqo/QYK+juQCRRqXa/Ewl+PlSZJu94q7i55c1uf7DXLc8mdeYNkSXs0pQ/PBmqX2jPh
         VOEg9oBGqi1ZIHOYtGZnNn+PZ0bXxgClI44hK3qa9Lh8duUZM6WU5OQpO5b13WeF6PPC
         3ROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9B5Bgd6y+D2b5bf/PHddV0cYSTfDz/gFBZ7J53x9Nsk=;
        b=ACIw+iSCzb1wzjx3YsA8NpAiYfIjcUgEIgjqunIomNblPhSUbt9jva2W7YIbelECzq
         J9E92Ve0GC/a4OTxc13jqIW8a3XPwLRAkyQfFBBPnZVxTFOIeXJN6g/iZHSzGJFbVKBI
         8Opz73adIWFAh4JOVQWv2Hcf5x8tEYf4EKpK3vuVVsB3v3ZFhlgV2nQ365r16SkBYWrq
         Nn2T/f0C1CdkC7KohOv64iQpWyyUHsF8S2Ghd8AUDlImZ/Hw3jkrnewIBGYW9lh0JDlL
         mBba90XpvCf6Tfn9CI6s/spKmjeIn9MYx6h49upQW5zb8ad1uJOtl/98JiEzHiER1//t
         14sA==
X-Gm-Message-State: AOAM533Wc4vXCvIGhKgHNZvNcoEeJnN0bS8BP/YRhMWtiD0J729rLhS9
	lEDFrZecdQSNFcJ05R+NQmWiERPgLgZDje/V0z8=
X-Google-Smtp-Source: ABdhPJxOEF8VtmULdkpXg0dHuKyT/hBLh6OzeysI154DZ2PZKJFsgIPyxdD2/h7K01/pce23CdfNtapUk14Pk4Snq5c=
X-Received: by 2002:a05:6512:12d6:b0:44a:4a14:a19a with SMTP id
 p22-20020a05651212d600b0044a4a14a19amr27792636lfg.619.1649818891444; Tue, 12
 Apr 2022 20:01:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220403224207.GA397480@euclid> <YlYPuIMr8mq66Lea@iweiny-desk3> <CAMWRUK6FaOC1+3ZP+af7uSyfAHjZ3KWwNqM1GjRYth+OyA-8EQ@mail.gmail.com>
In-Reply-To: <CAMWRUK6FaOC1+3ZP+af7uSyfAHjZ3KWwNqM1GjRYth+OyA-8EQ@mail.gmail.com>
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Date: Tue, 12 Apr 2022 23:01:20 -0400
Message-ID: <CAMWRUK4785GQt2UYVbXmEkUVuf0j+mv8977hYe=XT22FnecpSA@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: simplify control flow
To: Ira Weiny <ira.weiny@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, 
	outreachy linux kernel <outreachy@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Resending again in plain-text mode.]


On Tue, Apr 12, 2022 at 10:59 PM Sevinj Aghayeva
<sevinj.aghayeva@gmail.com> wrote:
>
>
>
> On Tue, Apr 12, 2022 at 7:48 PM Ira Weiny <ira.weiny@intel.com> wrote:
>>
>> On Sun, Apr 03, 2022 at 06:42:07PM -0400, Sevinj Aghayeva wrote:
>> > Checkpatch issues "WARNING: else is not generally useful after a break
>> > or return" for the following code:
>> >
>> > while (1) {
>> >       do_join_r =3D rtw_do_join(padapter);
>> >       if (do_join_r =3D=3D _SUCCESS) {
>> >               break;
>> >       } else {
>> >               rtw_dec_to_roam(padapter);
>> >
>> >               if (rtw_to_roam(padapter) > 0) {
>> >                       continue;
>> >               } else {
>> >                       rtw_indicate_disconnect(padapter);
>> >                       break;
>> >               }
>> >       }
>> > }
>> >
>> > We simplify this code in multiple steps. First, we remove do_join_r
>>
>> I can't say how Greg would like to see a change like this but my gut say=
s that
>> each of these steps should be a patch in a series...
>>
>> > variable because it is only used right after it is assigned. Second,
>> > we remove the unnecessary else statement right after break:
>> >
>> > while (1) {
>> >       if (rtw_do_join(padapter) =3D=3D _SUCCESS)
>> >               break;
>> >       rtw_dec_to_roam(padapter);
>> >
>> >       if (rtw_to_roam(padapter) > 0) {
>> >               continue;
>> >       } else {
>> >               rtw_indicate_disconnect(padapter);
>> >               break;
>> >       }
>> > }
>> >
>> > Next, we move the call to rtw_do_join into the while test because the
>> > while will loop only until the call is successful:
>> >
>> > while (rtw_do_join(padapter) !=3D _SUCCESS) {
>> >       rtw_dec_to_roam(padapter);
>> >       if (rtw_to_roam(padapter) > 0) {
>> >               continue;
>> >       } else {
>> >               rtw_indicate_disconnect(padapter);
>> >               break;
>> >       }
>> > }
>> >
>> > Finally, looking at the code above, it is clear that the code will
>> > break out of the loop if rtw_to_roam call is <=3D 0. Hence:
>> >
>> > while (rtw_do_join(padapter) !=3D _SUCCESS) {
>> >       rtw_dec_to_roam(padapter);
>> >       if (rtw_to_roam(padapter) <=3D 0) {
>> >               rtw_indicate_disconnect(padapter);
>> >               break;
>> >       }
>> > }
>>
>> ...  that said, this commit message made reviewing the change much easie=
r,
>> thanks.
>
>
> This has landed a week ago, but thanks for the review anyway!
>
>>
>> Did you submit a patch for the r8188eu driver too?  I just noticed it ha=
s a
>> similar loop in _rtw_roaming().
>
>
> Right, there is also another similar loop in the same file as well. I thi=
nk I wasn't sure that this patch was going to get accepted since it was a b=
ig change, so I didn't fix the others before this one got it. In the meanti=
me I hit slightly more than 10 cleanup patches and moved on to working with=
 my mentors. But I can fix the other loops if you think I should do it.
>
>>
>> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
>>
>> >
>> > Signed-off-by: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
>> > ---
>> >  drivers/staging/rtl8723bs/core/rtw_mlme.c | 18 ++++--------------
>> >  1 file changed, 4 insertions(+), 14 deletions(-)
>> >
>> > diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/stagi=
ng/rtl8723bs/core/rtw_mlme.c
>> > index 3eacf8f9d236..a45df775d535 100644
>> > --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
>> > +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
>> > @@ -2594,30 +2594,20 @@ void _rtw_roaming(struct adapter *padapter, st=
ruct wlan_network *tgt_network)
>> >  {
>> >       struct mlme_priv *pmlmepriv =3D &padapter->mlmepriv;
>> >       struct wlan_network *cur_network =3D &pmlmepriv->cur_network;
>> > -     int do_join_r;
>> >
>> >       if (rtw_to_roam(padapter) > 0) {
>> >               memcpy(&pmlmepriv->assoc_ssid, &cur_network->network.ssi=
d, sizeof(struct ndis_802_11_ssid));
>> >
>> >               pmlmepriv->assoc_by_bssid =3D false;
>> >
>> > -             while (1) {
>> > -                     do_join_r =3D rtw_do_join(padapter);
>> > -                     if (do_join_r =3D=3D _SUCCESS) {
>> > +             while (rtw_do_join(padapter) !=3D _SUCCESS) {
>> > +                     rtw_dec_to_roam(padapter);
>> > +                     if (rtw_to_roam(padapter) <=3D 0) {
>> > +                             rtw_indicate_disconnect(padapter);
>> >                               break;
>> > -                     } else {
>> > -                             rtw_dec_to_roam(padapter);
>> > -
>> > -                             if (rtw_to_roam(padapter) > 0) {
>> > -                                     continue;
>> > -                             } else {
>> > -                                     rtw_indicate_disconnect(padapter=
);
>> > -                                     break;
>> > -                             }
>> >                       }
>> >               }
>> >       }
>> > -
>> >  }
>> >
>> >  signed int rtw_linked_check(struct adapter *padapter)
>> > --
>> > 2.25.1
>> >
>
>
>
> --
>
> Sevinj.Aghayeva



--=20

Sevinj.Aghayeva
