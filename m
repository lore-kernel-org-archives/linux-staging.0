Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9631E1867;
	Wed, 20 Apr 2022 16:53:43 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id r13so4790230ejd.5;
        Wed, 20 Apr 2022 09:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rfm74VEUMWZeXlpuLUyC+UQS6WldzCAHTX0ZUV4DSls=;
        b=blpgcPwCTkxucUu2qZrWjwcq7sstE9xLRf5AbMMlxE8YZrJ0K0DNZxOq4mCHEiyIyZ
         XdoMlOsuUf/eyx3g2tt7V7BIGpKZARWCyw1YovPsqhkocExAa58e2kNc0dv0QBaUvZTa
         ObRRFqQ4FyNMmEiFGHCCqZyPP+x7gzFpMJbnyt2QOVwKfhkFb3cu+p9W2jcva0Vxo2JL
         lO9F9NUmdDYZfFpt3wm6+UBs1MD6omwNrsa9yUtpOxuAmZ8f7zy3kfQpG3afpx91hIaT
         XBh/sjnCyaTmpslP6liNlZldDuaPtD9AyVqE2rsH4dciA+m8PBxfVU+bGhG2acy4lRXn
         OzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rfm74VEUMWZeXlpuLUyC+UQS6WldzCAHTX0ZUV4DSls=;
        b=5w64N4Dou1vm9ycDo6mcdmTkdf2UZuqOS8RfBEInya1P5VzVEQnkD8OTQ0NR2yOGdM
         eNyAo/6v/ewsRkEEcTjpKLJVphDOaBc5zan6ztC+l7fmwS5zJW0iFAzkGJZGpJXbfF6G
         cMFbBBWslI1sEr2CFq8BGbaDYCtdmgZKRyuqZeOxLkMpTtLIRCLaQ4gQTPLFs7DkuJEq
         2GRX+Fy87AVdPzeZg8+KAezpq3YtPUvkOSRpYwy97kwcORVaCN7K0Jw4eL8UQezfOzkL
         OHRTHAIcrkHBRlnZEr3d6WWGOMYmY0Kv/APclLtvX0vRIXjYSUXM3rUBY3zvFAxd92QE
         7PoQ==
X-Gm-Message-State: AOAM530nVBke09lD8KEJ0Cyr1HVOXVEb/8UzemKYnAarhB38WeJQbjVj
	XP/nzi/YmnXsQ699OKeqoFM=
X-Google-Smtp-Source: ABdhPJxQ3uQH39NmcFzDqchDbenZC7Dj2C9W1dhPLDuReZA2QBfhi5bpkVEuZLM9fty7klo1viKK2g==
X-Received: by 2002:a17:907:6d96:b0:6e8:d7d9:d573 with SMTP id sb22-20020a1709076d9600b006e8d7d9d573mr19276189ejc.90.1650473621788;
        Wed, 20 Apr 2022 09:53:41 -0700 (PDT)
Received: from leap.localnet (host-79-50-86-254.retail.telecomitalia.it. [79.50.86.254])
        by smtp.gmail.com with ESMTPSA id ee17-20020a056402291100b0041fe1e4e342sm10006539edb.27.2022.04.20.09.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 09:53:40 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Jaehee Park <jhpark1013@gmail.com>, Kalle Valo <kvalo@kernel.org>
Cc: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jerome.pouiller@silabs.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, outreachy@lists.linux.dev, Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH] wfx: use container_of() to get vif
Date: Wed, 20 Apr 2022 18:53:39 +0200
Message-ID: <2258432.bcXerOTE6V@leap>
In-Reply-To: <87y200nf0a.fsf@kernel.org>
References: <20220418035110.GA937332@jaehee-ThinkPad-X1-Extreme> <87y200nf0a.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On mercoled=C3=AC 20 aprile 2022 13:57:57 CEST Kalle Valo wrote:
> Jaehee Park <jhpark1013@gmail.com> writes:
>=20
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
>=20
> [...]
>=20
> > +static inline struct ieee80211_vif *wvif_to_vif(struct wfx_vif *wvif)
> > +{
> > +	return container_of((void *)wvif, struct ieee80211_vif,=20
drv_priv);
> > +}
>=20
> Why the void pointer cast? Avoid casts as much possible.

In a previous email Jaehee wrote that she could compile her changes only by=
=20
using that "(void *)" cast.

I replied that probably this is a hint that something is broken, although=20
my argument is not necessarily a "proof". Might very well be that this cast=
=20
was needed in this particular situation but I cannot see why.

@Jaehee, please try to explain why this "(void *)" cast is actually=20
necessary and why your changes cannot avoid it.

Thanks,

=46abio M. De Francesco



