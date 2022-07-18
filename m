Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B3633CC;
	Mon, 18 Jul 2022 17:57:54 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id ss3so22665614ejc.11;
        Mon, 18 Jul 2022 10:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7pbvqadJLQpegf3D+q21OLRSwQXILX31lmjWX8Hj/GY=;
        b=b5g1vKxnKuvfgRtkVJm2ZXoQeRwcrMtRwhAUX6uZINrXGcu1pchJpyVw/M+Hd96mMW
         hBnhrH90clc05gcS5xguvYuXAGGVTRgb2MtagArPyUBzQMXRRTF3+UeTrgm5aQtc7WH0
         gpM0cb86dwOJgcVLHBYBFb3coPCCRYdQMlM1aTMCSDyWF/nXhz45jInNoMz6EDG3RACh
         /JvFVFUV/xzYNrwmkgRUVSv84j7TfdAn2jVQLe+Y47YxLRDolNTtKYG/JXv4pVdxudRt
         ogFPFLbj7UZm55bLbrKLKcXoWIwCYWfPAYISmktzpu6AHpzo/yhByLrn7csRxF7QmJhE
         5qEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7pbvqadJLQpegf3D+q21OLRSwQXILX31lmjWX8Hj/GY=;
        b=6LE6hGhVD1IMB6XbCrQ28G2chVBigA8hnbtORpx2L5H5brjjXObeoqoSsL69Y/Rsa8
         7qJtGlBFwEJrPTGwenk63fYKAaNjdyCkLaAYWoazodjifEBuexdUtudlcrRjXYxhhde4
         rwWyUM+lrI/ZBGFx2yKxdDXtTRZSbHyY4sExPhR/XLSICrv59srgTUlO7EC48RnR4US0
         3AlkUS2o76KV29np60TacvamzhKMtmiwbXoU04PM4du/UkQvkNmtCh9yI39bZm64vlQu
         NCyhrBtMhe4css0DnUc5i3QTGm4yYF46X9R549DpBexj/q5FKB88cGEAG/55OYRUYpI3
         wZCQ==
X-Gm-Message-State: AJIora8t6W5T5iAKWy+GlXIKqtfCXyCsehSCSfNTEEOKMt7GibGNnJl/
	0GfWbyofcfCRTDoO6yzRevU=
X-Google-Smtp-Source: AGRyM1s2xe9DqszGwO+egWgTy28gEFT166qISo4hJQn4LN8S+JzN/Y/mXSMgNsQz/8KSTLeTxLt8gw==
X-Received: by 2002:a17:906:58c9:b0:72f:4646:1f6f with SMTP id e9-20020a17090658c900b0072f46461f6fmr2253952ejs.181.1658167072750;
        Mon, 18 Jul 2022 10:57:52 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id eg52-20020a05640228b400b0043a6fde6e7bsm8823482edb.19.2022.07.18.10.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 10:57:51 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mripard@kernel.org, paul.kocialkowski@bootlin.com, Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org, wens@csie.org, samuel@sholland.org, hverkuil-cisco@xs4all.nl, ezequiel@vanguardiasur.com.ar, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] media: cedrus: hevc: Add check for invalid timestamp
Date: Mon, 18 Jul 2022 19:57:49 +0200
Message-ID: <4725382.GXAFRqVoOG@kista>
In-Reply-To: <d58e8624e9703e5dbbc54908aa142d10ef7f5a22.camel@collabora.com>
References: <20220718165649.16407-1-jernej.skrabec@gmail.com> <d58e8624e9703e5dbbc54908aa142d10ef7f5a22.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne ponedeljek, 18. julij 2022 ob 19:41:48 CEST je Nicolas Dufresne=20
napisal(a):
> Le lundi 18 juillet 2022 =E0 18:56 +0200, Jernej Skrabec a =E9crit :
> > Not all DPB entries will be used most of the time. Unused entries will
> > thus have invalid timestamps. They will produce negative buffer index
> > which is not specifically handled. This works just by chance in current
> > code. It will even produce bogus pointer, but since it's not used, it
> > won't do any harm.
> >=20
> > Let's fix that brittle design by skipping writing DPB entry altogether
> > if timestamp is invalid.
> >=20
> > Fixes: 86caab29da78 ("media: cedrus: Add HEVC/H.265 decoding support")
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >=20
> >  drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> > b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c index
> > 1afc6797d806..687f87598f78 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> > @@ -147,6 +147,9 @@ static void cedrus_h265_frame_info_write_dpb(struct
> > cedrus_ctx *ctx,>=20
> >  			dpb[i].pic_order_cnt_val
> >  	=09
> >  		};
> >=20
> > +		if (buffer_index < 0)
> > +			continue;
>=20
> When I compare to other codecs, when the buffer_index does not exist, the
> addr 0 is being programmed into the HW. With this implementation is is le=
ft
> to whatever it was set for the previous decode operation. I think its is
> nicer done the other way.

It's done the same way as it's done in vendor lib. As I stated in commit=20
message, actual values don't matter for unused entries. If it is used by=20
accident, HW reaction on all zero pointers can only be worse than using old=
,=20
but valid entry.

Due to no real documentation and Allwinner unwillingness to share details,=
=20
we'll probably never know what's best response for each error. Some things =
can=20
be deduced from vendor code, but not all.

I would rather not complicate this fix, especially since it's candidate for=
=20
backporting.

Best regards,
Jernej

>=20
> > +
> >=20
> >  		cedrus_h265_frame_info_write_single(ctx, i,=20
dpb[i].field_pic,
> >  	=09
> >  						   =20
pic_order_cnt,
> >  						   =20
buffer_index);


