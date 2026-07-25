Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E5330216D
	for <linux-staging@lists.linux.dev>; Sat, 25 Jul 2026 15:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784994228; cv=pass; b=puTIYzEg1dRjbIQ27vfQzbC2sggo5CcabT6+0rA/0UEEFTGwP54bzdVhnQT1/zt0+P4FkHNZ/7q5a1JHuTvr1DXyLki84vL3MtjQjK3oljfXxRrRRTv7KHba7gdVJZd74cwpMxdO5zuQ25zQoLYSloZhwaFcDLd6SJNdvQh4lNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784994228; c=relaxed/simple;
	bh=cNipdWbRL0RLaXct4u339AQMI2rFd1YBas+o6tFPqz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SJGSMK0mw63yJfbXfwqZIcxP1y74PG6J+Xi16dVfjbepLf6ogPehi5aJWxZnZj/EmGqF8N2Biilt5TcpAhIHzziluf4sSjIPOOciLieoZYulbO1Fk/e3dCS+wftqhoILhntbvNn5G551cq2YVTvTO7JUKSS0N9x032eomWtvEnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LRS21RAy; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRS21RAy"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c197e7e4e94so251794566b.2
        for <linux-staging@lists.linux.dev>; Sat, 25 Jul 2026 08:43:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784994225; cv=none;
        d=google.com; s=arc-20260327;
        b=XPr5y8PfERKw8eon5j11XHVBfw8HLyZB4Q34s3OSAEc3DFJv3E9Aqemj8/Md2xnomQ
         BtDAF3y2YIyAamJ1YSCzuMItjSMZ4qi7HIrQe0wuUimUMb4jNx7lT2QlefvxkXvc2JsN
         crQcSVin/t4G//wKfd4x+MtfddftVV/ZW8SYMXFPY1t/Z408uB6Wa3PHyua9sjvICqOm
         hfBRBXiEiIDPA1P+NsVM76yDrcUPkEZ4+6dkk8broWRfzDhcI1Q5ZIhdJySdGIehnlH9
         lC0VfI9NX1snadvCAr2DdgvceMRr06CvlgUx4BCt7ydoEBOXW/k665FU4mNldouhxily
         Ruug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w8EIFn4+KsoG/JHN5+P2G8HXXuxo8xeQ3dS5xqmdx1U=;
        fh=KoRgW+10WkAJOlvMVKrs9sny/Zozu7l/7560otxR1VY=;
        b=I2BX6eVpk5TwzeYoKZlrklRcHVYWLw5zJ+0f2HPsoX4KkNyuNELr+wrK6DUnBVOa9/
         +DU+UiCYjPLOH4GoNL/HUdEsfCBFBCzqq2MYtUUaZyVZN4UnYh5GUnfZzWUtaH1UtFKR
         4Cg6i2GgqJqHx6FTsxyJxyR2dkls7hztD+F+PgXGkbQ+cpP8R6MhnwqkkIYRiMPLhQaG
         ho86LO0jXgUS5p/hOP71u3Ac0fsScQFCCqYyZLGJNzfXyHODLITxkS2pVJrV16Ay0Shh
         v4Ot4e6ecVb4D3iR9CvmMpe11dkkN0I3NRpEVDb9N8Ir0xKqeS38IBl4VSKMzZK4w/e4
         x38A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784994225; x=1785599025; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w8EIFn4+KsoG/JHN5+P2G8HXXuxo8xeQ3dS5xqmdx1U=;
        b=LRS21RAyGlRXPsAF2MKDYuVNXGCewOYiNNddoA41+jXjvJ/m9LCeh3js85PPTzh1Gx
         UqaRjmjzLs4zKnjoMFjc6xFWyYErhza7ULjWsn16EtOBNfoDVrLnHcmjKSvx0vi2j+dS
         SS981G9gP5VI6Mefla+eU3H+u+bABFGu1rTyBoyLuTJq3xba6sik3xJBhMwFp6z0GWHG
         n2Tc/UOKEHiMPzx7Rg617qu6DmbCHbfW5+PfQJPSzZpO/uR+SDN+SwlIIeVdrMoPuLNR
         zBA3KaGiLU0tFXC0efp5NXatF7hdJctmZIbij85ZheLcCvjzfz7Vg9vuj5eUZWY2E9P+
         j+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784994225; x=1785599025;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w8EIFn4+KsoG/JHN5+P2G8HXXuxo8xeQ3dS5xqmdx1U=;
        b=jpHrRY42I+9ph6rb/uyy+w0bZzI0dc0GOqlLe/htpRdFply7aKZ6qm1BJbg94VHfmZ
         xahaYJtMzfkkcgnOHUaFFRGA3J+csiSj8uW/nuIpJ8tQ/stUdcU6dvBXQ4uFAPh6mk7b
         uNx6j4LodmiCsaUHNfEC2SqVWEu0H4FqY/r0lDPXqOnKBIuV5ltYhJ73zJqVd8/g3G9H
         JSH4CIVVDp3Zsf50/Qk4vRLosDpIdRRA/0G5yU++AG+5KQbE9oR98kxCC40Cz+cKJX4U
         LP46HTR61D71xNiV8RiAmFQh4kSul+cx+6irJBXmq0EVQfiCwsddeXRRwUQtNFsqPDNz
         2SEQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro7OtbGrPpgBDFUThvByNGPpVWuqUignwd1kmHjn+HqGjIJ9a5iEjVcS7mcxlAxQ1sbbEMBWn5gqhnWoNqx@lists.linux.dev
X-Gm-Message-State: AOJu0YyRcqi4HBwTY7QzZkYajCbhkcTkFQ5x51W/ys+6FqY7e2GmX50T
	I3UEOTLqwLQ1+xVRPyG5aw5uaXcMKqrJ0dX5jed3uPiBUJuG277wb+38PYXuW83S9bWePxp4O4n
	/48hpPkqyOASnvKWj9KSLZC39gXptkUc=
X-Gm-Gg: AR+sD12VqJJaio8anNlfvSrLTWf40SPkWnvoOihbM4GD0kpKm1fzao+qIA5qOugPXmC
	9kVsJQuQarQHgMzxRX230YVP4NFFVzFKGI7UbWT7IsAJNLn/mdxbIXME7GLI/VkrN9ehwynOwOF
	1m5GQciEHVco7s21llnn/2lyAgJ45qun0BxK1yQP8GKzsNHOPikfm5O+VgJZUxyfQpd3Oaim2iJ
	xHiq+ESfXCPWYafPNiWtcKO4VRDSipsgptkphbIB5kh8P0GbMq8ULQleZ6PSltQ4B4hukJ67Tc6
	fhG5GetpOhSOHPuFZriIn5MGFk2U+bt6qXZMcRxAQazL8AsuA9w/sDtl/eaefHVYoy+qVw==
X-Received: by 2002:a17:907:6d0a:b0:c15:ca4c:a3aa with SMTP id
 a640c23a62f3a-c1f1f1b57ccmr98303066b.49.1784994224811; Sat, 25 Jul 2026
 08:43:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260725143721.5908-1-adi25charis@gmail.com> <amTRrR1ly_GuV5Vp@stanley.mountain>
In-Reply-To: <amTRrR1ly_GuV5Vp@stanley.mountain>
From: Aditya Chari S <adi25charis@gmail.com>
Date: Sat, 25 Jul 2026 21:13:31 +0530
X-Gm-Features: AUfX_mwjaOHJoQ6iRArpCbBr45hZjKMoOgnLjVN56Mg2Ph_ZEGriMy2_orrH5WY
Message-ID: <CAKt_FXtn4xk4sOAyRY-GeJSHNgdeRbM8O5PBpUsLVjynYdyVYA@mail.gmail.com>
Subject: Re: [PATCH v3] greybus: audio: Split gb_audio_gb_get_topology() into
 size query and data fetch
To: Dan Carpenter <error27@gmail.com>
Cc: gregkh@linuxfoundation.org, vaibhav.sr@gmail.com, mgreer@animalcreek.com, 
	johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 25, 2026 at 08:39:xx PM, Dan Carpenter wrote:
> These should be in chronological order.
> > ---
> Why are you sending a v3 of this? ...

Thanks for the review, Dan.

I sent v3 mainly to rebase against the latest staging-next as told in
the earlier version

I've now prepared v4 with the tag order corrected (Signed-off-by before
Reviewed-by) as you suggested, and included the full changelog in the
patch.

Regards,
Aditya

On Sat, Jul 25, 2026 at 8:39=E2=80=AFPM Dan Carpenter <error27@gmail.com> w=
rote:
>
> On Sat, Jul 25, 2026 at 08:07:21PM +0530, Aditya Chari wrote:
> > `gb_audio_gb_get_topology()` combined three separate responsibilities i=
nto
> > a single call: querying the topology size, allocating a buffer for it, =
and
> > fetching the topology data into that buffer. This left callers with no
> > way to perform any of these steps independently, and forced the kzalloc=
()
> > allocation to live inside the protocol=E2=80=91layer driver rather than=
 the
> > caller, as already flagged by a FIXME comment at the call site
> > in `audio_module.c`.
> >
> > Split the function into two:
> > - `gb_audio_gb_get_topology_size()` =E2=80=93 queries only the topology=
 size
> > - `gb_audio_gb_get_topology()`      =E2=80=93 fetches topology data int=
o a
> >                                       caller=E2=80=91supplied buffer
> >                                     of a given size
> >
> > Update the only caller, `gb_audio_probe()` in `audio_module.c`, to
> > query the size first, allocate the topology buffer itself,
> > then fetch the data into it, freeing the buffer via the existing
> > `free_topology` error path on failure. The topology size is now
> > stored as `size_t` and validated in the caller before allocation,
> > addressing the earlier TODO and FIXME comments.
> >
> > This resolves both the "TODO: Split into separate calls" comment
> > above the original function in `audio_gb.c` and the FIXME comment
> > at the call site in `audio_module.c`, both of which are removed
> > as part of this change.
> >
> > No functional change in behavior for the existing probe path.
> >
> > Reviewed-by: Dan Carpenter <error27@gmail.com>
> > Signed-off-by: Aditya Chari <adi25charis@gmail.com>
>
> These should be in chronological order.
>
> > ---
>
> Why are you sending a v3 of this?  Presumably I missed some
> critical stuff when I reviewed it but I can't be bothered to
> search my inbox to find out what...
>
> So partially laziness but also I would hate to miss this
> opportunity for SEO so it's also greed.
> https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/
>
> regards,
> dan carpenter
>
