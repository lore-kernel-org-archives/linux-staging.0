Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4ED2F26
	for <linux-staging@lists.linux.dev>; Tue,  8 Feb 2022 08:56:55 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id v12so677695wrv.2
        for <linux-staging@lists.linux.dev>; Tue, 08 Feb 2022 00:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uFHu5hccvMsF7o2tu2U34+ZB4v04LjByM/vohLM1Hos=;
        b=aua/lLM29hlA2EW20MciGDxo6kSzKs1ShqohU6FEZbdY5WLoRRoDL7ebR2JO0cF+oh
         wkIrJ0UBqiDGFL8PwmGoHRqSnLEQmZ5Z6XMuxU8aNtoJbOJM6NJ7pa60AgZ7AhTHEjFi
         r3odVwT6OaxSNlvXWmYX3DRmsw2YQyeUXzWkJUQmrO1Q2Bi/1aqMN0uB++77G7lcPV7E
         crmmvn2hp++MUAs6ygCjD7y2qMVyW2wJbXEm1/B/GZ6ka+iQL7KGHf8atLTlC66RtY2A
         4ZtWcaknXVU8ZJkh04X7IHREQBGv4O67W9DIBqj+4qn7LzAmHBaNwFOeldWf81ngD/Rq
         KCvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uFHu5hccvMsF7o2tu2U34+ZB4v04LjByM/vohLM1Hos=;
        b=NMD4ybWwiLX6L9ac+w5ouTYGeq9ZHUnVsXQUGxh7YuXulDBtPREavDmii7VgyYTxAm
         NG84srIzChM2WPoS2O37xG2ZT62LBVFvB5sYJ/StXoriGYVM9/02Lq50waWj0Li3tOBR
         wkXJoldIffZq4pJsGZ0Sl4vdsHPLvP1jiUCXC8ITyErGPGRMByJ6EEMyNjbS+dmvGCpd
         SzliXaSDBGOLQK3J2fNaUDeIa7vL1lCZ2/+q9miHcL2fxqaeByzeZYuMvyzsdF2VvHF/
         F6Zug5Ki2rZ4k40DJ9QtCiKAyfIAronkR+QgYAIMqRKpDYKV1niL67oSlEV4egUXXlVt
         Z3Dg==
X-Gm-Message-State: AOAM531euT7sXZiNCYE3KlaqwdiUjN6Vq+s7QLHA/CWRu0x7ZcGl4sZV
	P+/ery2vDUzUlyLZr64jHW4=
X-Google-Smtp-Source: ABdhPJzcjRB5ryj93ByKb+iLvzPIzvNewL5R2090HkYH0pfHPHuv1PHY+jyAwrOJSDmMgjTGKWdOWA==
X-Received: by 2002:a05:6000:11cd:: with SMTP id i13mr2522322wrx.318.1644310614006;
        Tue, 08 Feb 2022 00:56:54 -0800 (PST)
Received: from leap.localnet (host-95-245-2-16.retail.telecomitalia.it. [95.245.2.16])
        by smtp.gmail.com with ESMTPSA id p8sm13652398wrr.16.2022.02.08.00.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 00:56:53 -0800 (PST)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, Leonardo Araujo <leonardo.aa88@gmail.com>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] Staging: r8188eu: core: 'associcated' may be misspelled - perhaps 'associated'?
Date: Tue, 08 Feb 2022 09:56:51 +0100
Message-ID: <2023396.KlZ2vcFHjT@leap>
In-Reply-To: <YgIpMuShlOamHV68@kroah.com>
References: <20220207234210.26097-1-leonardo.aa88@gmail.com> <2122312.NgBsaNRSFp@leap> <YgIpMuShlOamHV68@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On marted=EC 8 febbraio 2022 09:26:26 CET Greg KH wrote:
> On Tue, Feb 08, 2022 at 09:09:10AM +0100, Fabio M. De Francesco wrote:
> > On marted=EC 8 febbraio 2022 00:42:10 CET Leonardo Araujo wrote:
> > > This patch fixes the following checkpatch.pl warning:
> > >=20
> > > CHECK: 'associcated' may be misspelled - perhaps 'associated'?
> > >=20
> > > Signed-off-by: Leonardo Araujo <leonardo.aa88@gmail.com>
> > > ---
> > >  drivers/staging/r8188eu/core/rtw_ap.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >=20
> > "Staging: r8188eu: core: 'associated' may be misspelled - perhaps 'asso=
ciated'?"=20
> > it's not the way patch subjects are created for inclusion in Linux.
>=20
> I do not see anything wrong with this.  What do you think is not
> acceptable?

My opinion is that the formal construction of a patch is important not less=
 than
the code in it. However it's not that big deal, in this case. But for what =
my=20
opinion is worth, having a subject that says what the patch must do and usi=
ng an
imperative language is quite important.

I specified that it is not my job to accept or reject and said "if I were y=
ou []".
If you think that new contributor may be creative with the subjects of patc=
hes, this
is up to you to decide (obviously).

My intent was just to provide help to improve how to write subjects. I hope=
 that=20
Leonardo is going to become a productive member of this Community, so I tho=
ught=20
that a little help for improving how to write subjects wouldn't hurt. =20

>=20
> > Please follow what is clearly described in the "Philosophy of Linux ker=
nel=20
> > patches" document at https://kernelnewbies.org/PatchPhilosophy...
>=20
> The in-kernel documentation describes this well also.
>=20
> > "In patch descriptions and in the subject, it is common and preferable =
to use=20
> > present-tense, imperative language. Write as if you are telling git wha=
t to do=20
> > with your patch.".
> >=20
> > It's not my job to accept or reject patches for this subsystem and I do=
n't want=20
> > to tell you what to write but, if I were you, I'd send a v2 with a subj=
ect like=20
> > "Fix misspelled word in comments" (or something else similar to this su=
bject).
> >=20
> > Furthermore, please take note that the name of this subsystem is "stagi=
ng" (it=20
> > is not "Staging").
>=20
> Either is fine, I will not reject a change for an upper-case letter like
> this.
>=20
> > Decide by yourself whether or not the other two patches that you submit=
ted this=20
> > morning have to be sent anew as v2 with due changes in the subjects.
>=20
> I do not see a problem with this change at all, nothing needs to be
> resubmitted.

You are the maintainer, so it's up to you. Nothing needs to be resubmitted =
but=20
I hope that next time his subjects will better conform to the guidelines.

Thanks,

=46abio

>=20
> greg k-h
>=20




