Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA2063B5;
	Fri, 10 Mar 2023 12:25:53 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id m25-20020a7bcb99000000b003e7842b75f2so3290558wmi.3;
        Fri, 10 Mar 2023 04:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678451152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHl+AGoIadXu/jEHuWQbNUD1NdGyTe9l6pWhk1p94DQ=;
        b=H44JNO2BWh725FN2ZYYZRSQV7Yga5fxC4w/R7S2Wv4lGP/0V/zYen8/3i2IYXlx/ky
         1Q2jlTpNDVekWV7+C2H/qaIkldkRi/8C4uX3W00XtPiFPqNP9Yu0LdlvSquxqnIit4iZ
         dihwuNmSf4e2mBc0HJyMz4f1v67gCnZ8s3ecfJgRYhsMyNivL3iG/+hdrHiOt/H4zYfM
         Lp7K2Tv01C/xlAEvgdmEXD88c66i1oDr2p4L+7chfCgJtMt9wJP1ML2JY+0K3zw5datk
         XWQcGp+5Ri261+VlrsKne0QQiZiby+QzENFPP/zHNDbxPq68xEjke7yiQO4jaf1CmiWz
         1p6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678451152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHl+AGoIadXu/jEHuWQbNUD1NdGyTe9l6pWhk1p94DQ=;
        b=0xpQ8qEMVduccxBKhPauRTvT4vduQKcEcxYzcmADoeMsKTdFBN7YoP4E4SDEp1JYit
         YhdcAqJbN3Ve/TWT6E00B5eO8H7NE5dxxKUQZfACEHKkeC5Q/9who6XnlxNLDSeHjuaS
         w96M7Lwg1R9/yPt5ha/OjL8FajXj9dO9oZA7/DAvxUvdyTDpbvYPOueAI+20yYDv7oam
         O3HlX1OVN/buPy7U9nuRK6t3BQR6qmCGOu+orl2XGU2g6J7P9ky+/PinpL3ZNJUyEEfg
         4/NKfV1nCfr2VNWN0bw+D8iIyUDDZ/nSIIRPG0OH0V9qDgKtksHXf3PWzJngxcUbg0PA
         IQhA==
X-Gm-Message-State: AO0yUKWkYbwAzRDFURjdVLc+oReqndW1Wh0CpmmHh951Kp/kQhU0D3NQ
	r46DI7S2CyOmV6RW3t6ZFr91Q9PhVox3UA==
X-Google-Smtp-Source: AK7set/kEV7hq38ykRFtbYi+1WWB5H9MDXeg/UhyAGEyIAm7diXnIw8C0IrGGDzPPbDoMLxUZ0Iv7A==
X-Received: by 2002:a05:600c:a11:b0:3dc:433a:e952 with SMTP id z17-20020a05600c0a1100b003dc433ae952mr2451081wmp.33.1678451152189;
        Fri, 10 Mar 2023 04:25:52 -0800 (PST)
Received: from suse.localnet (host-95-235-93-126.retail.telecomitalia.it. [95.235.93.126])
        by smtp.gmail.com with ESMTPSA id t15-20020a05600c198f00b003e21dcccf9fsm3078157wmq.16.2023.03.10.04.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 04:25:51 -0800 (PST)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Khadija Kamran <kamrankhadijadj@gmail.com>, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, paskripkin@gmail.com, gregkh@linuxfoundation.org,
 outreachy@lists.linux.dev
Subject: Re: [PATCH] Staging: r8188eu: Fixed block comment
Date: Fri, 10 Mar 2023 13:25:50 +0100
Message-ID: <3436236.som1txNFv6@suse>
In-Reply-To: <bb4e7ac8-5ddf-46c7-8c5a-08839794c5d0@kili.mountain>
References:
 <Y+8p7Hyaf4LhO/Sw@khadija-virtual-machine> <10238267.qUNvkh4Gvn@suse>
 <bb4e7ac8-5ddf-46c7-8c5a-08839794c5d0@kili.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On venerd=EC 10 marzo 2023 13:09:54 CET Dan Carpenter wrote:
> On Fri, Mar 10, 2023 at 12:52:55PM +0100, Fabio M. De Francesco wrote:
> > On venerd=EC 17 febbraio 2023 08:17:00 CET Khadija Kamran wrote:
> > > Fixed block comment by adding '*' in each line. The Check message was
> > > shown by using checkpatch.pl script.
> > >=20
> > > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > > ---
> > >=20
> > >  drivers/staging/r8188eu/core/rtw_br_ext.c | 19 ++++++++++---------
> > >  1 file changed, 10 insertions(+), 9 deletions(-)
> >=20
> > Hi Khadija,
> >=20
> > As Greg said this driver is not here any longer. This makes me think th=
at
> > you
> > forgot at least two things...
> >=20
> > 1) Please pull and rebase the staging tree every day while working on
> > patches
> > during this period of the Outreachy project. If you had done so, you wo=
uld
> > have noticed that your patch cannot any more be applied.
>=20
> This patch was sent long before the driver was deleted...  The patch was
> fine and would have been applied if the driver hadn't been removed.
>=20
> regards,
> dan carpenter

I'm sorry I did not look at the day of the submission.
I took for granted that this patch had been sent after the contribution per=
iod=20
start date, March 6th 2023.

Thanks Dan for making me notice this mistake.

Regards,

=46abio



