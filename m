Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD84A5B;
	Fri,  6 May 2022 16:50:43 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id gh6so15603836ejb.0;
        Fri, 06 May 2022 09:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kUvr4fMP2elRfDyGqxMyfJTTNp+E8ksaw8Lx5Viwtkc=;
        b=HF/DeaGJK5NSYoN64s/08h6x8B2rWgCMQQ+RA6RbZGQQmXGGQMSlunQ3xqaAdCYb7X
         pr/wPiGO9jDBXZhNQQG2dwtDUQUUhCwZ/FxADiY5usIK9V7FromCFGIuRt7ZVlMSgVgN
         vDYkAb7zu0JlfkxHRGxA3FBwNFf+vFaz2VLeLVdSjS0uEfSHiVdHYAOaIGf5ZQ9i/4d/
         crqkVJ27Wi5yI33qMjQ5wIswLFfPiVqVDn5sWN6s4AAlkhOPB17Aqq3H7z3ng/OuurS8
         eC9g0xOMt5S6r7BsBOP5gBc8+WFQQ8rBaeTewH7DWla3dgwGLsyVxjPeNvpij2qLdiGd
         4SlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kUvr4fMP2elRfDyGqxMyfJTTNp+E8ksaw8Lx5Viwtkc=;
        b=aT+N1qm+shZgJz840SR8lbWjHyOM2EYdGVLpscOErgsIMkuCzwWG6+QTOx/nss61Lk
         DudCCN/nsN2xQqAqAhzh+iyNtf/lOciFkrmvUzS7RIJby1cOve0Na7qszfdyxpZElTY7
         xVjC/pEYNAgvQLeenRpNfJjuJgy/3xi1x/y+IPL2PWVOrvEO9n3tgE+bxA4xAfW0K1i6
         KeiT7EGPM2saWtn7NafwqaxifQNa2vfo1l3+aNuiqfCV5xgsdHt7siprC8aIVarHtYBF
         HnzYrwfEdr0P/Kdg8Q03PJybFcC1rgUEY+iudcR9WWPEV/sD14YCxJCVUhCFVMfo4sZn
         vziQ==
X-Gm-Message-State: AOAM531R7JHxe3axMgXk9/EMc4N0MC9YhKnT8zPZc72+XMcYUlKYvPL3
	UR20qse9IzUdJFDG6YrHjxZXQEdsG1vPtgjP/Mg=
X-Google-Smtp-Source: ABdhPJx7dHmK9oHkI0ldCdTpG8JoA202u7A6O8PxK+0IKd3axIqD/BvP9TCwb5gbbinYDuTCGCQ7kW6WouY2cQdEOEs=
X-Received: by 2002:a17:907:86a7:b0:6f7:ea6:1acb with SMTP id
 qa39-20020a17090786a700b006f70ea61acbmr698109ejc.413.1651855841749; Fri, 06
 May 2022 09:50:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220503182146.GA886740@jaehee-ThinkPad-X1-Extreme>
 <16415431.geO5KgaWL5@pc-42> <20220504170816.GB970146@jaehee-ThinkPad-X1-Extreme>
In-Reply-To: <20220504170816.GB970146@jaehee-ThinkPad-X1-Extreme>
From: Jaehee <jhpark1013@gmail.com>
Date: Fri, 6 May 2022 12:50:30 -0400
Message-ID: <CAA1TwFBr=6P=ydfqr3hqcO-gLuSYreOME-yUkSL6==pLuzastw@mail.gmail.com>
Subject: Re: [PATCH v5] wfx: use container_of() to get vif
To: =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>
Cc: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, 
	Outreachy Linux Kernel <outreachy@lists.linux.dev>, Stefano Brivio <sbrivio@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 4, 2022 at 1:08 PM Jaehee Park <jhpark1013@gmail.com> wrote:
>
> On Wed, May 04, 2022 at 09:21:21AM +0200, J=C3=A9r=C3=B4me Pouiller wrote=
:
> > On Tuesday 3 May 2022 20:21:46 CEST Jaehee Park wrote:
> > > Currently, upon virtual interface creation, wfx_add_interface() store=
s
> > > a reference to the corresponding struct ieee80211_vif in private data=
,
> > > for later usage. This is not needed when using the container_of
> > > construct. This construct already has all the info it needs to retrie=
ve
> > > the reference to the corresponding struct from the offset that is
> > > already available, inherent in container_of(), between its type and
> > > member inputs (struct ieee80211_vif and drv_priv, respectively).
> > > Remove vif (which was previously storing the reference to the struct
> > > ieee80211_vif) from the struct wfx_vif, define a function
> > > wvif_to_vif(wvif) for container_of(), and replace all wvif->vif with
> > > the newly defined container_of construct.
> > >
> > > Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> > > ---
> > > v2
> > > - Sequenced the wfx.h file (with the new defines) to show up first on
> > > the diff, which makes the ordering of the diff more logical.
> > >
> > > v3
> > > - Made edits to the commit message.
> > > - Shortened the macro name from wvif_to_vif to to_vif.
> > > - For functions that had more than one instance of vif, defined one
> > > reference vif at the beginning of the function and used that instead.
> > > - Broke the if-statements that ran long into two lines.
> > >
> > > v4
> > > - Changed macro into function and named it back to wvif_to_vif
> > > - Fit all lines in patch to 80 columns
> > > - Decared a reference to vif at the beginning of all the functions
> > > where it's being used
> > >
> > > v5
> > > - Placed longest declarations first
> > >
> > >
> > >  drivers/net/wireless/silabs/wfx/wfx.h     |  6 +-
> > >  drivers/net/wireless/silabs/wfx/data_rx.c |  5 +-
> > >  drivers/net/wireless/silabs/wfx/data_tx.c |  3 +-
> > >  drivers/net/wireless/silabs/wfx/key.c     |  4 +-
> > >  drivers/net/wireless/silabs/wfx/queue.c   |  3 +-
> > >  drivers/net/wireless/silabs/wfx/scan.c    | 11 ++--
> > >  drivers/net/wireless/silabs/wfx/sta.c     | 71 ++++++++++++++-------=
--
> > >  7 files changed, 65 insertions(+), 38 deletions(-)
> > >
> > [...]
> > > diff --git a/drivers/net/wireless/silabs/wfx/sta.c b/drivers/net/wire=
less/silabs/wfx/sta.c
> > > index 3297d73c327a..040d1f9fb03a 100644
> > > --- a/drivers/net/wireless/silabs/wfx/sta.c
> > > +++ b/drivers/net/wireless/silabs/wfx/sta.c
> > > @@ -101,6 +101,7 @@ void wfx_configure_filter(struct ieee80211_hw *hw=
, unsigned int changed_flags,
> > >         struct wfx_vif *wvif =3D NULL;
> > >         struct wfx_dev *wdev =3D hw->priv;
> > >         bool filter_bssid, filter_prbreq, filter_beacon;
> > > +       struct ieee80211_vif *vif =3D wvif_to_vif(wvif);
> >
> > wvif is modified later in the function, so this one is not correct.
> >
>
> Hi Jerome, I'm so sorry about this. I'll check more carefully and
> correct for any other occurrences.
>

Hi Jerome,

Thank you for catching the mistake! I think this is the only place
where vif was set prematurely, but I could have missed something.

I will send a revised patch (now v6) with this edit today.

Thanks,
Jaehee

> >
> > --
> > J=C3=A9r=C3=B4me Pouiller
> >
> >
