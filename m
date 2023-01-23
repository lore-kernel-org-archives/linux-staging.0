Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40B1A4F
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 08:51:35 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id s67so8428160pgs.3
        for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 00:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WiISKER2cajYz2bCimExOXsQ5HAHxxouMwQAgy2HZyI=;
        b=o2e4yRCob9Lq84tw2eyc3IGAPJWg1M40TrznoAKPdiucBrC1suvu9AbaL4Qmi3AGKa
         cMhoOAhREuZKcTBT7k5j3B3E9MKENRJPctcizcvdBv5hZSw1cKMiaOl7kNo/AOokum6x
         o5Zc7EGe2poi5/zaRpunao41udHvAIle2EOiAiauawE9AFGAvF8Z0XvmIdMK/EPHH7EQ
         5WUwrTYN1AqMdIvy8ihMAVX1WqbfxXd9BCm+TVUK9F610nc/Usn/Qbd+++hqkqxj9iwF
         wn2j57o0UQceEOcJLi1CxBofYe6TpoeYZI73LXc4S5B8hcMij/Op/DESYGGyuvx7tQHK
         kfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiISKER2cajYz2bCimExOXsQ5HAHxxouMwQAgy2HZyI=;
        b=RdNBLDguMqfv2UDDr4HoaGk9or3w1syKXOuoqK0w6iq63CS6NFxez3bpzR0//p1iIk
         O7Gjh7oO9OncYwL4+9XEgB3IN2WV+bLZNW4Pk0kTUBQbbSBXwh8J3OIwp4vtg79PBPXd
         FLQyIeMShx04dQxisPyrtejiop44UhZRt+p4UrxlkHqSkvFVb4xAviuuU3j5zok7Vgi+
         wiGUjZwXJW2iMyVXXIfa6loz0nUi2A1S/9zKuuSz/4xle/5fS5CFxrQOK11cxWnb15OZ
         5nM75DiMeXrRcxCR/epoLOq+vNAkDzqjtlRfdnVM2uam30amI0ofMm/WtDVB706s9Jpw
         ddtQ==
X-Gm-Message-State: AFqh2kq70yba3pLsC8g0hQAnbLu5ocMvF91RrqC2i20Cf3VFKpdsONnO
	ICv1o+Q8hwEPjTUwO/KEjPk=
X-Google-Smtp-Source: AMrXdXuHK6w4cF3R/SFl7OpVG7zs3vYJISShgo/qm+Yx/BHz2XpY93T21ZtRInUnsxxy2YnaeG0Kfw==
X-Received: by 2002:a05:6a00:f91:b0:583:319a:4413 with SMTP id ct17-20020a056a000f9100b00583319a4413mr25567175pfb.24.1674463895090;
        Mon, 23 Jan 2023 00:51:35 -0800 (PST)
Received: from debian.me (subs32-116-206-28-53.three.co.id. [116.206.28.53])
        by smtp.gmail.com with ESMTPSA id u197-20020a6279ce000000b005855d204fd8sm30934316pfc.93.2023.01.23.00.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 00:51:34 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
	id 62D3610504D; Mon, 23 Jan 2023 15:51:30 +0700 (WIB)
Date: Mon, 23 Jan 2023 15:51:29 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Diederik de Haas <didi.debian@cknow.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: wlan-ng: Fix full name of the GPL
Message-ID: <Y85Kkax5+U4AUedT@debian.me>
References: <20230122191047.58769-1-didi.debian@cknow.org>
 <Y84wk+sw/gR7gNW4@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ppj6caC0vtIGHezG"
Content-Disposition: inline
In-Reply-To: <Y84wk+sw/gR7gNW4@kroah.com>


--ppj6caC0vtIGHezG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 23, 2023 at 08:00:35AM +0100, Greg Kroah-Hartman wrote:
> - You did not specify a description of why the patch is needed, or
>   possibly, any description at all, in the email body.  Please read the
>   section entitled "The canonical patch format" in the kernel file,
>   Documentation/process/submitting-patches.rst for what is needed in
>   order to properly describe the change.
>=20

Hi Greg,

drivers/staging/wlan-ng/hfa384x.h (for example) has already SPDX identifier
that matches the verbose copyright notice below it.=20

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--ppj6caC0vtIGHezG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY85KiwAKCRD2uYlJVVFO
oyRsAP9r4fI1i+oYi5Wai/ioVqUCHtoFkiw37gNH//1ig2mrHAEAphOXT4HP2Ssy
VyoweJSiY1uiYjBEDfwg1jtf7xuG+gU=
=ij4J
-----END PGP SIGNATURE-----

--ppj6caC0vtIGHezG--
