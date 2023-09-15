Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D97D295
	for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 07:56:43 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1c43166b7e5so3653475ad.3
        for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 00:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694764602; x=1695369402; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sa23m9Sh+czmtoCmVFBbzydEhVvJnPH9LtopoO7enGk=;
        b=bTDMbsKcdxSoGkmtZ8EXX3q0/1viRMP+yE5aGJsuO4Miosxr2rp7UF6VLLytiGNWak
         fOObwcaLi9MoV+bhNBCjzJCAsWvBXGQN1Wy057AmmHFvIhgZGnblgBGvqQb+ORpkyY5M
         okQW2NWkKz+UmbuWHXUeF5vswJQynS/Me0XuAoqqkwL4KvIrSxuBHL58TpmjsKbvqqZY
         NGVqnpG35f6Y49FPWf3CSGhQ4DWboajC1uGxuMqKcJ8g4AUBY3tW/svNH8dJvLQkFKQk
         YM85QHLBmI9uIbUV2YXJhFdwif8D8c5f9vvjuZ3c3k/cnRGtQ7AtoMwS9Pts32Ic4l6d
         3XOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694764602; x=1695369402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sa23m9Sh+czmtoCmVFBbzydEhVvJnPH9LtopoO7enGk=;
        b=XNTe4xM3/8J7+5oEO3rwnwnpboTWIELM8Jb1Pat01PmZJHHgbJ4oT+jkJqb6R26DAp
         lKn+l7qtOq4meBTJ6POQrI773myXCHTFQLgOTRAbBBuajU7PSVG/sb+HuEiMRvLQR3Bt
         VOZfxpFjvqloi3OJ9oBE9CU3XX4nxihtTagWb8UZY1G9lHBcTq6BERR16SfKNTbspHrD
         z+GVKLGW5jYmWx3lNfOYpFj8B+3i748ymp5/ErScJXFzNji4jAw5Lb99orXnmlih5nBC
         JV3/Bl15ERiIcpdHD+9+BVzPSf1gtMGR0mXNa816DCYCE0Y/UzY0tXY2ePTzjmLJ5c1b
         FlrA==
X-Gm-Message-State: AOJu0Yx+t/gmK3T+kdH5OY45/yeFl751QAGUFCCwxe+QoiAu4ZXP+v1r
	LSfyht6SRMIPURcEQK7/Mpt5oFLBN+s=
X-Google-Smtp-Source: AGHT+IE9RcRJ910CnL7JvJNrqjoaC0IFvFSCZdBwD31Y9Swflcx2melRR4bsTZgiId84hdnlKqufcA==
X-Received: by 2002:a17:903:1210:b0:1bb:7f71:df43 with SMTP id l16-20020a170903121000b001bb7f71df43mr1107314plh.34.1694764602592;
        Fri, 15 Sep 2023 00:56:42 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id u5-20020a170902b28500b001bb750189desm2836147plr.255.2023.09.15.00.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 00:56:42 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 88F408AA8414; Fri, 15 Sep 2023 14:56:38 +0700 (WIB)
Date: Fri, 15 Sep 2023 14:56:38 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: angus gardner <angusg778@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: Removed unnecessary parenthesis around
 conditions to comply with the checkpatch coding style.
Message-ID: <ZQQONo8biMWlCiG3@debian.me>
References: <ZQEKFR1OPoXGI2lO@midnight>
 <ZQERJIGOOeYxgX3E@debian.me>
 <CAC5tM5u8L50fAhReAmP0dqexSmv-PdZJKa_ES2hxZMp41MJjGQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jzeagO5P9A3kQsYx"
Content-Disposition: inline
In-Reply-To: <CAC5tM5u8L50fAhReAmP0dqexSmv-PdZJKa_ES2hxZMp41MJjGQ@mail.gmail.com>


--jzeagO5P9A3kQsYx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 15, 2023 at 11:58:47AM +1000, angus gardner wrote:
> Thanks for the feedback Bagas,
>=20
> "Then checkpatch is wrong, " lol
>=20
> Ill double check my SoB.
>=20

tl;dr:

> A: http://en.wikipedia.org/wiki/Top_post
> Q: Were do I find info about this thing called top-posting?
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
>=20
> A: No.
> Q: Should I include quotations after my reply?
>=20
> http://daringfireball.net/2007/07/on_top

Also, don't send HTML emails as mailing lists reject them away.

Last but not least, this is the third time you do parentheses fixup, for
which Greg's bot said:

>   You sent a patch that has been sent multiple times in the past few
>   days, and is identical to ones that has been recently rejected.
>   Please always look at the mailing list traffic to determine if you are
>   duplicating other people's work.

Again, read all Documentation/process/*.rst docs so that you won't make
mistakes again as kernel developer.

Bye!

--=20
An old man doll... just what I always wanted! - Clara

--jzeagO5P9A3kQsYx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZQQOMQAKCRD2uYlJVVFO
ozABAP9f4cJ4x4CFW0UEkBJrggxsKLo1ON0XZG0LmZPzzQI2JQD/fEkTFsH2KkSP
z0qFevhjEpUHaH2/N4WS6Tya9TaUdwo=
=iIZ2
-----END PGP SIGNATURE-----

--jzeagO5P9A3kQsYx--
