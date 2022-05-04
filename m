Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2380D2596;
	Wed,  4 May 2022 17:08:22 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id j6so1394705qkp.9;
        Wed, 04 May 2022 10:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=1ExP0IoCJSKBfLJGM2r1Lejrv6O7f8KE1Vt8W0+bq2U=;
        b=ezup9NCYjJXcHBJ5M4LOeQ4cUJeocD+X94z2IL3y9xkFX+8d3jO4tzKCC30HQQgLq1
         etNaqyMVh2JWCj1nla/vpL+IbyzPQTDCMpl14+aByL2F1Qeeoj1kEyAvpH00wZD21bPE
         VwRocaKfSDpIc6Mg3gry3EgOd7xoj1jtG1toQ89nJC5E6vSKYDMm8eVUN8nknxtPJKBB
         TEm8yoQ2am2JxfA7vG6vTM1e+UMBTiQlws1hEi6o7P/iiY6t5LwjnBx44SVruF91gM7r
         XlXy+3LinuSqLsnNbTzWDQa1Fr97C0z5H23J/hcUSbaB67EuEfogA/8H5/Tb5RlMiMmk
         y/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=1ExP0IoCJSKBfLJGM2r1Lejrv6O7f8KE1Vt8W0+bq2U=;
        b=sr28TfeHHJpCVrZgUK2IbTC4Dc8nvwCgVFmAcotR046l8L92fV97Ofl09hsEvIF4mg
         UOvw8kG404dciC0K50x3UItaKhmmh2IXCr2abmQt4lh0WRTpzN0kP5luzAZDemXFe/TZ
         DEzbxSfjeOgoTOnW6JcS0hYBul6u6f0JWXLZoupfwClw+c/ZcfqK2MKiBLly42kS2F3c
         XXkAorjrUGuuASQSA2Y3juWoh+vgETYk7xUE0NCoMKYUfavEcnwfvicgcxUt3q7V4u50
         SxfsSmSci2ETlrzGfJ4N83WY5jYO9/nwtNOTMTeBJp3kFdWIFndb1p1LPFMHixTMmkA+
         O23g==
X-Gm-Message-State: AOAM530y8o0maV0Dslzi+5msen9RDae+22bj/Q9+bR9uUF77iLrZ9Kwm
	9OwhzE+HiynRC0aFvlYIOWcfxh5S7iKpkg==
X-Google-Smtp-Source: ABdhPJybBESpc1h1e5OdLRKc1tEyYNC7sq7jB9VLrygTJtXiSHU9sm/0A1VGdecQM2HybHo9hkRrbw==
X-Received: by 2002:a37:ad16:0:b0:6a0:1468:4513 with SMTP id f22-20020a37ad16000000b006a014684513mr3020239qkm.96.1651684101026;
        Wed, 04 May 2022 10:08:21 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id c197-20020ae9edce000000b0069fc13ce1fasm7780805qkg.43.2022.05.04.10.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 10:08:20 -0700 (PDT)
Date: Wed, 4 May 2022 13:08:16 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: =?iso-8859-1?B?Suly9G1l?= Pouiller <jerome.pouiller@silabs.com>
Cc: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev, Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH v5] wfx: use container_of() to get vif
Message-ID: <20220504170816.GB970146@jaehee-ThinkPad-X1-Extreme>
References: <20220503182146.GA886740@jaehee-ThinkPad-X1-Extreme>
 <16415431.geO5KgaWL5@pc-42>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16415431.geO5KgaWL5@pc-42>

On Wed, May 04, 2022 at 09:21:21AM +0200, Jérôme Pouiller wrote:
> On Tuesday 3 May 2022 20:21:46 CEST Jaehee Park wrote:
> > Currently, upon virtual interface creation, wfx_add_interface() stores
> > a reference to the corresponding struct ieee80211_vif in private data,
> > for later usage. This is not needed when using the container_of
> > construct. This construct already has all the info it needs to retrieve
> > the reference to the corresponding struct from the offset that is
> > already available, inherent in container_of(), between its type and
> > member inputs (struct ieee80211_vif and drv_priv, respectively).
> > Remove vif (which was previously storing the reference to the struct
> > ieee80211_vif) from the struct wfx_vif, define a function
> > wvif_to_vif(wvif) for container_of(), and replace all wvif->vif with
> > the newly defined container_of construct.
> > 
> > Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> > ---
> > v2
> > - Sequenced the wfx.h file (with the new defines) to show up first on
> > the diff, which makes the ordering of the diff more logical.
> > 
> > v3
> > - Made edits to the commit message.
> > - Shortened the macro name from wvif_to_vif to to_vif.
> > - For functions that had more than one instance of vif, defined one
> > reference vif at the beginning of the function and used that instead.
> > - Broke the if-statements that ran long into two lines.
> > 
> > v4
> > - Changed macro into function and named it back to wvif_to_vif
> > - Fit all lines in patch to 80 columns
> > - Decared a reference to vif at the beginning of all the functions
> > where it's being used
> > 
> > v5
> > - Placed longest declarations first
> > 
> > 
> >  drivers/net/wireless/silabs/wfx/wfx.h     |  6 +-
> >  drivers/net/wireless/silabs/wfx/data_rx.c |  5 +-
> >  drivers/net/wireless/silabs/wfx/data_tx.c |  3 +-
> >  drivers/net/wireless/silabs/wfx/key.c     |  4 +-
> >  drivers/net/wireless/silabs/wfx/queue.c   |  3 +-
> >  drivers/net/wireless/silabs/wfx/scan.c    | 11 ++--
> >  drivers/net/wireless/silabs/wfx/sta.c     | 71 ++++++++++++++---------
> >  7 files changed, 65 insertions(+), 38 deletions(-)
> > 
> [...]
> > diff --git a/drivers/net/wireless/silabs/wfx/sta.c b/drivers/net/wireless/silabs/wfx/sta.c
> > index 3297d73c327a..040d1f9fb03a 100644
> > --- a/drivers/net/wireless/silabs/wfx/sta.c
> > +++ b/drivers/net/wireless/silabs/wfx/sta.c
> > @@ -101,6 +101,7 @@ void wfx_configure_filter(struct ieee80211_hw *hw, unsigned int changed_flags,
> >         struct wfx_vif *wvif = NULL;
> >         struct wfx_dev *wdev = hw->priv;
> >         bool filter_bssid, filter_prbreq, filter_beacon;
> > +       struct ieee80211_vif *vif = wvif_to_vif(wvif);
> 
> wvif is modified later in the function, so this one is not correct.
> 

Hi Jerome, I'm so sorry about this. I'll check more carefully and
correct for any other occurrences. 

> 
> -- 
> Jérôme Pouiller
> 
> 
