Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCEF7E0;
	Mon, 18 Apr 2022 04:56:14 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id b189so10475780qkf.11;
        Sun, 17 Apr 2022 21:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=JSM9SdrFUTAovVgeSarEZ7lWJ+tUtJrb5COXjMipts8=;
        b=hcxSBT7Y4uINQckQUhi/zVwpnO4gr1EAByktEbg3d3YSI1qAL0Q0rNhvGRwpAPWhvI
         TRpOewOULwfm0o/Ts4jt/BErMda9nr2etp8l2NfZvKaPxxI3MkMU6D+QKj1zzEzeZYzD
         xRzNgu1diGfVO0HOTlcskFs5nbLO2EUl8/AeQhtMz2qEvfe/thnODZWUOdwVhG5nVU5B
         JzaTIcfaW18Tr8Xl5gQc/OP1lnOH07h4Cz0fvQplU957chgKEE7ssYOvSqABbhyUgObt
         2Kx+ppz87+sbCE8sfDYUA1RchL2xBhI+wvkvI3lxCLF9LBER10qze1Q/hnIN1CZ2iIcy
         gKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=JSM9SdrFUTAovVgeSarEZ7lWJ+tUtJrb5COXjMipts8=;
        b=2gyTDsHqTdnRujXc6j3RdR1i+xXPdojnvZZgbUcNGudtKQ2Pwvk03AMWoxTFSOk9Ci
         78K4WBiTC9Buiv1I7Q94wvRmltfxIWc/rRV028ADZEZUyHvOG8SllI/f7yDnRh167Q/a
         jWnv+IAPRlJJMeK+gqq8ByuEn7KaZcZWV1YlLxdoFEWuv6DlArsNu4jcXJYvYWIBWOZs
         +6lP89vUl01upRSXUpC6Dl3iYwLT7MRtF6lbaetlIRIaG9jcqSNfXw3lcVjYG1R7vtJn
         ZyLnPzFGqnHKqo8kfcL9nIH4GRJ3jBF5Ol8m982J49Q+yEK2MtgUBKsF6HhQmE83184t
         61aQ==
X-Gm-Message-State: AOAM532hR5iv6HEBQto8S9pQ0Lar356l6AvKV75NxJGrE1EvMfQrtldv
	Y/9dwH6K+w/FV4P6LclPduDiAXtwgCVXG7CI
X-Google-Smtp-Source: ABdhPJyJcJ+kx8THK/+S8yjK8H3towHv4h08lfw/sAW95LKwcrV0CSlqjiHqG3XSzTwsLREoFC1mag==
X-Received: by 2002:a05:620a:f0d:b0:67e:1c14:bc5e with SMTP id v13-20020a05620a0f0d00b0067e1c14bc5emr5587814qkl.502.1650257773273;
        Sun, 17 Apr 2022 21:56:13 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([2607:fb90:50e6:61ed:4df2:ed9f:52ea:476e])
        by smtp.gmail.com with ESMTPSA id p4-20020a05620a132400b0069e9d8697b4sm1100635qkj.46.2022.04.17.21.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Apr 2022 21:56:12 -0700 (PDT)
Date: Mon, 18 Apr 2022 00:56:10 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: =?iso-8859-1?B?Suly9G1l?= Pouiller <jerome.pouiller@silabs.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev, Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH V3] wfx: use container_of() to get vif
Message-ID: <20220418045610.GB1127014@jaehee-ThinkPad-X1-Extreme>
References: <20220412041218.GA2859599@jaehee-ThinkPad-X1-Extreme>
 <2778504.mvXUDI8C0e@pc-42>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2778504.mvXUDI8C0e@pc-42>

On Wed, Apr 13, 2022 at 09:26:45AM +0200, Jérôme Pouiller wrote:
> Hello Jaehee,
> 
> On Tuesday 12 April 2022 06:12:18 CEST Jaehee Park wrote:
> > 
> > Currently, upon virtual interface creation, wfx_add_interface() stores
> > a reference to the corresponding struct ieee80211_vif in private data,
> > for later usage. This is not needed when using the container_of
> > construct. This construct already has all the info it needs to retrieve
> > the reference to the corresponding struct from the offset that is
> > already available, inherent in container_of(), between its type and
> > member inputs (struct ieee80211_vif and drv_priv, respectively).
> > Remove vif (which was previously storing the reference to the struct
> > ieee80211_vif) from the struct wfx_vif, define a macro
> > wvif_to_vif(wvif) for container_of(), and replace all wvif->vif with
> > the newly defined container_of construct.
> > 
> > Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> > ---
> > 
> > Changes in v3:
> > - Made edits to the commit message.
> > - Shortened the macro name from wvif_to_vif to to_vif.
> 
> hmm... wvif_to_vif() was fine for me (while to_vif() is a bit too
> generic).
> 
> > - For functions that had more than one instance of vif, defined one
> > reference vif at the beginning of the function and used that instead.
> 
> I suggest to declare a new variable even if there is only one instance
> of vif. So:
>   - the code is unified
>   - it avoids the syntax foo(var)->bar
> 
> > - Broke the if-statements that ran long into two lines.
> > (There are 3 lines that exceed 80 by less than 4 characters. Two of
> > those lines of code could be shorted but it involved defining two more
> > variables, and could potentially make the code less readable.)
> > 
> > Note: I will mail this patch to the wireless-next tree after testing.
> > 
> > 
> >  drivers/staging/wfx/wfx.h     |  2 +-
> >  drivers/staging/wfx/data_rx.c |  5 ++--
> >  drivers/staging/wfx/data_tx.c |  2 +-
> >  drivers/staging/wfx/key.c     |  2 +-
> >  drivers/staging/wfx/queue.c   |  2 +-
> >  drivers/staging/wfx/scan.c    | 10 +++++---
> >  drivers/staging/wfx/sta.c     | 46 +++++++++++++++++++----------------
> >  7 files changed, 38 insertions(+), 31 deletions(-)
> > 
> > diff --git a/drivers/staging/wfx/wfx.h b/drivers/staging/wfx/wfx.h
> > index 78f2a416fe4f..a07baadc5e70 100644
> > --- a/drivers/staging/wfx/wfx.h
> > +++ b/drivers/staging/wfx/wfx.h
> > @@ -25,7 +25,7 @@
> >  #define USEC_PER_TXOP 32 /* see struct ieee80211_tx_queue_params */
> >  #define USEC_PER_TU 1024
> > 
> > -#define wvif_to_vif(ptr)(container_of((void *)ptr, struct ieee80211_vif, drv_priv))
> > +#define to_vif(wvif)container_of((void *)wvif, struct ieee80211_vif, drv_priv)
> 
> It seems you have stacked up this v3 on your v2. So this v3 does not apply
> on any public tree. You have to merge your v2 and your v3.
> 
> > 
> >  struct wfx_hwbus_ops;
> > 
> > diff --git a/drivers/staging/wfx/data_rx.c b/drivers/staging/wfx/data_rx.c
> > index 98c2223089b8..3677b3431467 100644
> > --- a/drivers/staging/wfx/data_rx.c
> > +++ b/drivers/staging/wfx/data_rx.c
> 
> The wfx driver has moved, you have to rebase your work.
> 
> [...]
> 
> -- 
> Jérôme Pouiller
> 
> 
>

Hi Jérôme, Sorry about the delay! I have sent a revised patch to the
wireless-next mailing list for your review.
Thanks,
Jaehee
