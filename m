Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3119F1FD1;
	Wed, 13 Apr 2022 06:36:00 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id r13so1897193ejd.5;
        Tue, 12 Apr 2022 23:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xj3NkHVQDUDdPGRvpYOra85n0Y6fiRtoa7goWufEXwA=;
        b=IipliNokdRI0CsxMkUB9sqMWtAmv4DupWgoqxkLCSQ74xweyTK8fAwpOQVUumnb/Ps
         RbAND6snNPJ7LjU/cKI5mR1LHnBUScPIBtY1b9LdXQZr8nXcWSAg0bah4x94O0YrRguF
         BlgBtqBl147T4yDft3Oi7PchBTm7tXtUXSSa5S/jJTyk1L5nTAxYZT8i7KWkdZjqe6k1
         b7FxseDFhrdniTXrMTxGi/M0yuAxT5BJf4vhhg0uuqugoY/e/ExjL0moavcwzT9WBD+R
         0gAON8z7M3iIoccFr1CaYoVF89IfYGaExxy0PMKlakNuyAA2u35aswmnNaQ3TLB3YkpD
         9N8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xj3NkHVQDUDdPGRvpYOra85n0Y6fiRtoa7goWufEXwA=;
        b=vyfoIWRSBhUK0m6ht9jfWWTJpYoQLMAGsI/u1UdLpGbh/3gPq4DMh3WLHDD8SMLNKv
         pAd3G+Ezdn49bcMXYLRK6/+gdtLIdqvBizaR618x6RRb97ZgPGtmBsGzec1TNhM6CVni
         hoWWPcb0melR7lFMNQ41AP3C+Q8gSg34BfyT7pmgf7pEzY4voQrt3ptRqfs7RhiXuOiB
         t3AfiGEVK9jGKBufQeRX+1cAAvRBQqgbDBQ6LkYY5/SZ/g9vulaZhyilb+syTe1A1doL
         qE6EgHenRogtBx1gKhfaSswbeBvk6WW5M2z8767A2NfQsh5cG+ScQcTP3irRPdk8AN1b
         tT1A==
X-Gm-Message-State: AOAM531196qmAdwJiRofOeAnvVo6IA8fhcyU4K16SZKHVl9wEIwQJSb2
	nttHg25NwAo5Ti4uRz7XzA0=
X-Google-Smtp-Source: ABdhPJx/w+TNTuJBwku63yNpMxP+dSA7e5/ZFjDNFqRpJ4GmK5rwDjIRug4tZCtYGSnIImjhTWm1dw==
X-Received: by 2002:a17:906:1f11:b0:685:d50e:3bf9 with SMTP id w17-20020a1709061f1100b00685d50e3bf9mr39244987ejj.275.1649831758439;
        Tue, 12 Apr 2022 23:35:58 -0700 (PDT)
Received: from leap.localnet (host-79-43-11-75.retail.telecomitalia.it. [79.43.11.75])
        by smtp.gmail.com with ESMTPSA id s2-20020a1709066c8200b006e4e1b1f875sm13226169ejr.199.2022.04.12.23.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 23:35:57 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: johan@kernel.org, Jaehee Park <jhpark1013@gmail.com>, elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH v2 2/2] staging: greybus: remove unneeded return
Date: Wed, 13 Apr 2022 08:35:55 +0200
Message-ID: <6300782.K2JlShyGXD@leap>
In-Reply-To: <alpine.DEB.2.22.394.2204130815020.3470@hadrien>
References: <cover.1649793138.git.jhpark1013@gmail.com> <5792471.alqRGMn8q6@leap> <alpine.DEB.2.22.394.2204130815020.3470@hadrien>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"

On mercoled=EC 13 aprile 2022 08:16:20 CEST Julia Lawall wrote:
>=20
> On Tue, 12 Apr 2022, Fabio M. De Francesco wrote:
>=20
> > On marted=EC 12 aprile 2022 21:59:15 CEST Jaehee Park wrote:
> > > An empty function with void return type does not need an explicit
> > > return. Issue found by checkpatch.
> > >
> > > Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> > > ---
> > >  drivers/staging/greybus/audio_codec.c | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/
> > greybus/audio_codec.c
> > > index 0f50d1e51e2c..3e3a16568def 100644
> > > --- a/drivers/staging/greybus/audio_codec.c
> > > +++ b/drivers/staging/greybus/audio_codec.c
> > > @@ -1032,7 +1032,6 @@ static int gbcodec_probe(struct=20
snd_soc_component
> > *comp)
> > >  static void gbcodec_remove(struct snd_soc_component *comp)
> > >  {
> > >  	/* Empty function for now */
> > > -	return;
> > >  }
> > >
> > >  static int gbcodec_write(struct snd_soc_component *comp, unsigned=20
int
> > reg,
> > > --
> > > 2.25.1
> > >
> > Hi Jaehee,
> >
> > If I recall it correctly, Dan Carpenter suggested to remove this empty
> > function.
> >
> > When developers remove lines of code from a function which becomes=20
empty
> > after the removals, they also remove the resulting empty function and
> > delete all the calls (if there are any left) at the same time.
>=20
> It's probably not relevant in this case,=20

No, it's relevant :)
I should have been more exhaustive :(

> but the function could be needed
> if it is a branch of an ifdef.  Also if it is stored in a structure field
> and the user of the structure does not check for NULL.

Here we have one of special cases you've mentioned. The pointer to the=20
function is stored in a structure field _but_ we know that the user does=20
check for NULL.

Thanks,

=46abio

> julia




