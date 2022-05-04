Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0771F2569
	for <linux-staging@lists.linux.dev>; Wed,  4 May 2022 11:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651665067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tavZwp8BQxfV8UeYb9Xzxs1vfyyi2W9B0pF5sD/TmHM=;
	b=WI5pX6tG4lNc7dxOy93ZoXp5L7SbxxBiHZTdWQ7MpkZ7AVZDNgiBAGXnOzNLJig3OzuJsv
	vYreRLanyHBZijceZxPN3ixLSrVDkK2ZBqPvePrO+9xf/S1FrYaE9EAdPP7tnmPq9aLKjs
	q7fXdz0qdMlw6d19gDNG1i61E+ET5j8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-I92bNWMMPHeYcaf2XyGiwQ-1; Wed, 04 May 2022 07:51:06 -0400
X-MC-Unique: I92bNWMMPHeYcaf2XyGiwQ-1
Received: by mail-ej1-f69.google.com with SMTP id i14-20020a17090639ce00b006dabe6a112fso688306eje.13
        for <linux-staging@lists.linux.dev>; Wed, 04 May 2022 04:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=tavZwp8BQxfV8UeYb9Xzxs1vfyyi2W9B0pF5sD/TmHM=;
        b=oYs5R33VFIqla2BtPwJh1Nn654dPznx82uIIhvd61rvX9gFtEAw/ict1946e1qdQ61
         rmF0+gpSfp09vkaG5Ez1eZQzV2/N4Q3NLX7qVz6gF2esIQK5jCf3pmh5nbtmHI9Ve7cz
         FtNW+peHUSCALXoRVrXdP6iSKH59wMdGXGerSVykxH/RLOD8eHtPqSb1lTKiACc1mqZe
         2qDMBArGrWwa9szuxUg3lgNtZ/kZggx0Gf7FEPfAFSMpvGfFJ78E8UblPOQr5OpeKPnv
         7HK5mxR4jAopgYt7J3b14/3zYJyQc7ZsXBMPldbntpLdmdLon5jq2paK66xPqmtdmrKe
         vMuA==
X-Gm-Message-State: AOAM5312Nnei6UCoL6k76tGRDXoL8kUmq1n0yQFL8YozJx2sr0BwCpq8
	FOGg5Z+WbPWKatDAA9iQ3WY9um8FRp0WFtsIpVibEyNxVrEkDjWLRpxcxAaszyvygDn7ycUO8/p
	vh2PVmufO41XLOu4/dEixTJ8FNg==
X-Received: by 2002:a17:906:3fd1:b0:6ef:606f:e5c5 with SMTP id k17-20020a1709063fd100b006ef606fe5c5mr19216835ejj.441.1651665065700;
        Wed, 04 May 2022 04:51:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfylvO+VKVVbzY5ASXCx0ehCojnDyP/xtWqHiM66c5/brxEnt1fwNb2R3LeYpLzPIIxvzLhQ==
X-Received: by 2002:a17:906:3fd1:b0:6ef:606f:e5c5 with SMTP id k17-20020a1709063fd100b006ef606fe5c5mr19216817ejj.441.1651665065489;
        Wed, 04 May 2022 04:51:05 -0700 (PDT)
Received: from maya.cloud.tilaa.com (maya.cloud.tilaa.com. [2a02:2770:5:0:21a:4aff:fe98:d313])
        by smtp.gmail.com with ESMTPSA id el8-20020a170907284800b006f3ef214e12sm5674426ejc.120.2022.05.04.04.51.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 May 2022 04:51:04 -0700 (PDT)
Date: Wed, 4 May 2022 13:50:59 +0200
From: Stefano Brivio <sbrivio@redhat.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jaehee <jhpark1013@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 =?UTF-8?B?SsOpcsO0bWU=?= Pouiller <jerome.pouiller@silabs.com>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, Outreachy Linux Kernel
 <outreachy@lists.linux.dev>
Subject: Re: [PATCH] wfx: use container_of() to get vif
Message-ID: <20220504135059.7132b2b6@elisabeth>
In-Reply-To: <20220504093347.GB4009@kadam>
References: <20220418035110.GA937332@jaehee-ThinkPad-X1-Extreme>
	<87y200nf0a.fsf@kernel.org>
	<CAA1TwFCOEEwnayexnJin8T=Fc2HEgHC9jyfj5HxfiWybjUi9GA@mail.gmail.com>
	<20220504093347.GB4009@kadam>
Organization: Red Hat
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sbrivio@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Dan,

On Wed, 4 May 2022 12:33:48 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> On Mon, May 02, 2022 at 02:10:07PM -0400, Jaehee wrote:
> > On Wed, Apr 20, 2022 at 7:58 AM Kalle Valo <kvalo@kernel.org> wrote:  
> > >
> > > Jaehee Park <jhpark1013@gmail.com> writes:
> > >  
> > > > Currently, upon virtual interface creation, wfx_add_interface() stores
> > > > a reference to the corresponding struct ieee80211_vif in private data,
> > > > for later usage. This is not needed when using the container_of
> > > > construct. This construct already has all the info it needs to retrieve
> > > > the reference to the corresponding struct from the offset that is
> > > > already available, inherent in container_of(), between its type and
> > > > member inputs (struct ieee80211_vif and drv_priv, respectively).
> > > > Remove vif (which was previously storing the reference to the struct
> > > > ieee80211_vif) from the struct wfx_vif, define a function
> > > > wvif_to_vif(wvif) for container_of(), and replace all wvif->vif with
> > > > the newly defined container_of construct.
> > > >
> > > > Signed-off-by: Jaehee Park <jhpark1013@gmail.com>  
> > >
> > > [...]
> > >  
> > > > +static inline struct ieee80211_vif *wvif_to_vif(struct wfx_vif *wvif)
> > > > +{
> > > > +     return container_of((void *)wvif, struct ieee80211_vif, drv_priv);
> > > > +}  
> > >
> > > Why the void pointer cast? Avoid casts as much possible.
> > >  
> > 
> > Hi Kalle,
> > 
> > Sorry for the delay in getting back to you about why the void pointer
> > cast was used.
> > 
> > In essence, I'm taking private data with a driver-specific pointer
> > and that needs to be resolved back to a generic pointer.
> > 
> > The private data (drv_priv) is declared as a generic u8 array in struct
> > ieee80211_vif, but wvif is a more specific type.
> > 
> > I wanted to also point to existing, reasonable examples such as:
> > static void iwl_mvm_tcm_uapsd_nonagg_detected_wk(struct work_struct *wk)
> > {
> >         struct iwl_mvm *mvm;
> >         struct iwl_mvm_vif *mvmvif;
> >         struct ieee80211_vif *vif;
> > 
> >         mvmvif = container_of(wk, struct iwl_mvm_vif,
> >                               uapsd_nonagg_detected_wk.work);
> >         vif = container_of((void *)mvmvif, struct ieee80211_vif, drv_priv);
> > 
> > in drivers/net/wireless$ less intel/iwlwifi/mvm/utils.c, which does the
> > same thing.
> > 
> > There are fifteen of them throughout:  
> 
> The cast is fine, but this email is frustrating.
> 
> It sounds like you are saying that you copied it from other code and
> that's not a good answer...  :/  It's easiest if you just copy and paste
> the build error and we can figure out why the cast is need for our
> selves...

...my bad, then.

I suggested to Jaehee she would *also* point out that there are already
a pile of usages (which I grepped for myself, by the way).

And that it's *obvious* that container_of() would trigger warnings
otherwise. Well, obvious just for me, it seems.

-- 
Stefano

