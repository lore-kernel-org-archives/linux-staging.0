Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29372F49;
	Fri, 10 Mar 2023 11:52:59 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso3265253wmo.0;
        Fri, 10 Mar 2023 03:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678449177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vnnitKm8ItU8z8UrLfELFTzSkVG2XnAG/fMiiC7+9Kw=;
        b=Wz0mqDYqd17E6Wn7L3/29NOx03d1Pqhz9S3gEmC6srrIH0w/inGiKDVH3OW99iGsp1
         idNHqx0KLHxiXvRmEHMzkKoqLslBjgBc10bciShO7DJkyKrlPGB2Q9Gh5bX+vGXWPRCi
         aW8Ol13JUNUlH26E+f7SobZSoMAFRunTcTLBwucLlY7NJXC4+qDa0k3k/e/eUdiNA3mN
         twyMAjC2MZCdO2GX173ex6jxe6/RmfdOCDL/oNlOWScn2AGbL0m2/Ex8hbDs+UrHyVXe
         955auGgApdlM29wm439j7ukwW5qlz6PqnPxvtj2IuRPoGy5lDpK5gSVGN74xdVv2odCK
         XUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678449177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vnnitKm8ItU8z8UrLfELFTzSkVG2XnAG/fMiiC7+9Kw=;
        b=myEdHU2Gr4KGJq5ifccYLX2NMKQA7bHYqlCaHNb8eik5FOCce/1mMDX1VYolIUw9y2
         nf/NZcmnu/J1I09axLhlOpFxSPz0KrB+P/oKepJSh6uR8eQKlvBHonUdvxTTlW9q0dIj
         vsB/QpUHSdwStq0pbeZc/gw0Pnxa4cctsBunr0R3JUdKXxQ+HEAUzwy6s4bunEg0MEOU
         7PoFktGXTRi+ijJuYeuXJ6p34zL0ptRyzSwZavMapAmIiRLHa6r0Trmu7lklioi8afkM
         xHRkP6zHDYLFTG4pPZfRkV0ebLCOW9CyXlPA12H1pxbJIz1QPHfwS0EksiHze0EyuKM5
         mZmQ==
X-Gm-Message-State: AO0yUKX9N3FEjDakd1YM8wH7X90vc8TgvPa6u4HH6Z2FujX+gd47i+kx
	Hug+HwaZmuvxJkOnbCZjtJGo7NJotjp7MA==
X-Google-Smtp-Source: AK7set8E+XSGSa2CFpzjmVNdJGqPvK4JPcy5i1Xt68mjbNUB8UxMiBGww5GdmStnIKmwkCL2gZQ7KA==
X-Received: by 2002:a05:600c:5104:b0:3ea:dbdd:66df with SMTP id o4-20020a05600c510400b003eadbdd66dfmr2458024wms.2.1678449177369;
        Fri, 10 Mar 2023 03:52:57 -0800 (PST)
Received: from suse.localnet (host-95-235-93-126.retail.telecomitalia.it. [95.235.93.126])
        by smtp.gmail.com with ESMTPSA id r26-20020a05600c2f1a00b003e11f280b8bsm2801519wmn.44.2023.03.10.03.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 03:52:56 -0800 (PST)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, paskripkin@gmail.com,
 gregkh@linuxfoundation.org, outreachy@lists.linux.dev
Subject: Re: [PATCH] Staging: r8188eu: Fixed block comment
Date: Fri, 10 Mar 2023 12:52:55 +0100
Message-ID: <10238267.qUNvkh4Gvn@suse>
In-Reply-To: <Y+8p7Hyaf4LhO/Sw@khadija-virtual-machine>
References: <Y+8p7Hyaf4LhO/Sw@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On venerd=EC 17 febbraio 2023 08:17:00 CET Khadija Kamran wrote:
> Fixed block comment by adding '*' in each line. The Check message was
> shown by using checkpatch.pl script.
>=20
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_br_ext.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>=20

Hi Khadija,

As Greg said this driver is not here any longer. This makes me think that y=
ou=20
forgot at least two things...

1) Please pull and rebase the staging tree every day while working on patch=
es=20
during this period of the Outreachy project. If you had done so, you would=
=20
have noticed that your patch cannot any more be applied.

2) I saw this patch by pure luck because you forgot to Cc the Outreachy lis=
t.=20
Therefore, please don't ever forget to Cc that list. Most mentors don't=20
subscribe the linux-staging list.

Thanks,

=46abio

P.S.: Please use an imperative tone, both in the subject and in the commit=
=20
message. For example this patch could have been written the following way:

staging: axis-fifo: Add "*" to multi-line comment

Add asterisks to each line of a multi-line comment to conform to the Linux=
=20
development guidelines. Warning reported by checkpatch.pl.

Signed-off-by: [...]




