Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC4BECB;
	Mon, 18 Jul 2022 20:34:41 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id bp15so23480139ejb.6;
        Mon, 18 Jul 2022 13:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SgQ3vg69XrKG4SLCrmfnrR9gARtMXL/8P6uqVwUjR3c=;
        b=VxWwXRXdCUcsrKmUjNBAHYCWburQdbxY7b81p9Yht9MSbBsge4pGwUZNohHpUSWRFi
         SUdz+Hcs+7ifQSWy/OBNqjMDwmgV3Uqj2u4MlNqGrCjZdmFzXkzI5/3hvG5F8LZrCmmC
         zVSAv9N++OTVah8O5gecqRvRO1WuigyMu+j8AcfENxfYCpbbSx54E/71kKir1jWuv8UP
         8ddcGUmWt4psg0OckI1yLQCePjydWmUNCnJPsDhi05V9zgTN3dMzWdbXWlEMXzhBJSVg
         Bb4/I5mwxTFy1n5mwtURwCG/I7Iydua3PeQDgYE+znOjrxAEjkeAUcJ+I3Uz4NeI4RM+
         Wi6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SgQ3vg69XrKG4SLCrmfnrR9gARtMXL/8P6uqVwUjR3c=;
        b=QWLpFtpoQU7+9SNx8N0EyC27Rihwt+G3C+J6aTuGLRHuTj5UrgFUJLqiYbqHFnXyP3
         DpNvCQDR5RxFiu5HfDwQ7ybMSX1H0AtZydw5aNe8kk+Ow6GoS5iO95ytkbF5ehKuMd9C
         pQzs0XiQtxWUYZx8dDLa+pV+rsvthc09Xf5VM1CHO/tmVik20PvZ99C12Ez6eKUtVvHg
         nQj9aYR1UPas1yiCOBlPLwUe3DIJ2Ehg4n6lMGgS1KZk2cw9s/RvU1OM/l9WIod0GSIH
         schzTG/WJW9vOs/gDjWl7w4R81dwzJh7gdzZI0BpdjQG8AVZSGeDOcSJ38CKRS1pXWqm
         z5/w==
X-Gm-Message-State: AJIora9ejp8pK6SS1Yf18ne63YCUISvsOsahkPrbw/cevp5eHCDvK/Xf
	DaFKdpQHHKA473Y3xeUpN6o=
X-Google-Smtp-Source: AGRyM1tGC2mf5OL95/Xi8XsQYmNIKA2K5q/KcUfriX7AvcRKc6Sa4cckzxTSNZj7ebXoHk11R9xhPg==
X-Received: by 2002:a17:907:761c:b0:6d6:e553:7bd1 with SMTP id jx28-20020a170907761c00b006d6e5537bd1mr27853505ejc.5.1658176479423;
        Mon, 18 Jul 2022 13:34:39 -0700 (PDT)
Received: from jernej-laptop.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id b17-20020a1709063cb100b00722fadc4279sm5856158ejh.124.2022.07.18.13.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 13:34:38 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mripard@kernel.org, paul.kocialkowski@bootlin.com, Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org, wens@csie.org, samuel@sholland.org, hverkuil-cisco@xs4all.nl, ezequiel@vanguardiasur.com.ar, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: cedrus: hevc: Add check for invalid timestamp
Date: Mon, 18 Jul 2022 22:34:37 +0200
Message-ID: <1795344.atdPhlSkOF@jernej-laptop>
In-Reply-To: <b588b53fcfe539692a0a55b9fd0e97528def1d96.camel@collabora.com>
References: <20220718165649.16407-1-jernej.skrabec@gmail.com> <4725382.GXAFRqVoOG@kista> <b588b53fcfe539692a0a55b9fd0e97528def1d96.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne ponedeljek, 18. julij 2022 ob 21:37:31 CEST je Nicolas Dufresne=20
napisal(a):
> Le lundi 18 juillet 2022 =C3=A0 19:57 +0200, Jernej =C5=A0krabec a =C3=A9=
crit :
> > Dne ponedeljek, 18. julij 2022 ob 19:41:48 CEST je Nicolas Dufresne
> >=20
> > napisal(a):
> > > Le lundi 18 juillet 2022 =C3=A0 18:56 +0200, Jernej Skrabec a =C3=A9c=
rit :
> > > > Not all DPB entries will be used most of the time. Unused entries w=
ill
> > > > thus have invalid timestamps. They will produce negative buffer ind=
ex
> > > > which is not specifically handled. This works just by chance in
> > > > current
> > > > code. It will even produce bogus pointer, but since it's not used, =
it
> > > > won't do any harm.
> > > >=20
> > > > Let's fix that brittle design by skipping writing DPB entry altoget=
her
> > > > if timestamp is invalid.
> > > >=20
> > > > Fixes: 86caab29da78 ("media: cedrus: Add HEVC/H.265 decoding suppor=
t")
> > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > ---
> > > >=20
> > > >  drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >=20
> > > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> > > > b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c index
> > > > 1afc6797d806..687f87598f78 100644
> > > > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> > > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> > > > @@ -147,6 +147,9 @@ static void
> > > > cedrus_h265_frame_info_write_dpb(struct
> > > > cedrus_ctx *ctx,>
> > > >=20
> > > >  			dpb[i].pic_order_cnt_val
> > > >  	=09
> > > >  		};
> > > >=20
> > > > +		if (buffer_index < 0)
> > > > +			continue;
> > >=20
> > > When I compare to other codecs, when the buffer_index does not exist,
> > > the
> > > addr 0 is being programmed into the HW. With this implementation is is
> > > left
> > > to whatever it was set for the previous decode operation. I think its=
 is
> > > nicer done the other way.
> >=20
> > It's done the same way as it's done in vendor lib. As I stated in commit
> > message, actual values don't matter for unused entries. If it is used by
> > accident, HW reaction on all zero pointers can only be worse than using
> > old, but valid entry.
> >=20
> > Due to no real documentation and Allwinner unwillingness to share detai=
ls,
> > we'll probably never know what's best response for each error. Some thi=
ngs
> > can be deduced from vendor code, but not all.
> >=20
> > I would rather not complicate this fix, especially since it's candidate
> > for
> > backporting.
>=20
> I am simply trying to highlight that this is not consistant with how the
> H264 part is done. Why do we reset the register for one codec and not the
> other ?

While H264 and HEVC are similar in many ways, Cedrus uses two different cor=
es=20
or in Cedrus slang, engines, for them. They have their own quirks. One of t=
he=20
most apparent is handling of DPB array. H264 requires that same entry is=20
always at the same position in HW DPB. That's not required by HEVC.

Additional reasons for differences come from the fact that it's from two=20
different authors (Maxime and Paul). Those differences were created at the=
=20
beginning and it is what it is.

>=20
> Perhaps you should sync to your preference the driver as a whole. It also
> seems that before your patch, some bits would be 0 and some other would be
> very large values. Between this and leaving random value, I don't really
> see any gain or reason for a backport. It neither break or fix anything as
> far as I understand.

Maybe there is no need to backport, but the change is nevertheless useful. =
As=20
I explained, current code works only by chance, as we noticed with Ezequiel=
's=20
rework. It's certainly worthwhile to make code less brittle. As far as I'm=
=20
concerned, fixes tag can be dropped or even Ezequiel can squash this change=
=20
into his commit, with appropriate adjustments, of course.

I'm not completely sure what do you mean by syncing driver preference. Code=
=20
changes always need a good reason to be accepted. Moving code around and=20
renaming things just to be similar with something else is not.

Best regards,
Jernej

>=20
> My general opinion, is that we fixe the unused address (like to 0) then w=
hen
> something goes wrong, as least it will go wrong consistently.
>=20
> > Best regards,
> > Jernej
> >=20
> > > > +
> > > >=20
> > > >  		cedrus_h265_frame_info_write_single(ctx, i,
> >=20
> > dpb[i].field_pic,
> >=20
> >=20
> > pic_order_cnt,
> >=20
> > buffer_index);




