Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9B22598
	for <linux-staging@lists.linux.dev>; Mon, 10 Apr 2023 09:35:52 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id bn8so3769717qtb.2
        for <linux-staging@lists.linux.dev>; Mon, 10 Apr 2023 02:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681119351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pj4u/VM2tLafsVTTHqQ6bFQ/JVOaZ1YbRnbgt9nw2r0=;
        b=Z1ouqlr5JcO/3VI3aYIxywOdWZfpPVHqNs+VEqPdQWkbfvbjLqtBXXluhRNG6tyh+C
         jaL/EkbaeBymLQwFYIEBr6koTTihAP3MpMhyn2s/L0g0o5KiaNmcq6bfIlxEl4m7BOEC
         BClZtR5bE806gNKo7mSYenJih2dn8KctHYBd09faZHbhXsCq54EdTUEardsqjTRgLZ4m
         i36SI1h94cM/cewyLHolhqvJJoKGVnFCbYBZ/33xj4XPYm/poUf5umLojdZdIufb0mnM
         89iDNWlb2PKnDUb8h0wXOCuzqZVHEyFYxV2n2iVS4x8zY4ZVpee9KkRYHIGUnhpZpeWm
         2r5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681119351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pj4u/VM2tLafsVTTHqQ6bFQ/JVOaZ1YbRnbgt9nw2r0=;
        b=GcwBT3IY1kSfJeMpPXJi/aM+HuUOrmGXX5zi00Gsji4qYdv7yTWJEDt6U/+Aa2LIMg
         w9G2uz6cqqLS8nB+HpgubEdRZw97YdPuNI7QRQEjR3Wc51PiwfDvMOd5n2ywgfB+UJJs
         B63z23Dk6PGOw75IKH+vriuh2stfsn806kSBK9L6egwFW8ID6y8qxAkmvCIKFYuElj6M
         kY2GN8RJ3EWVriksjmQUeIEYdoJF3EcDrWbBJPPDD2NTkVOp+/wCFTI09t1Zqq3NYe5k
         l/CCbgkc5e3BAfDpDzMIixfyHAblnIt7vkiMFtw8F9g4WxqH6rZwwtrozXph1389TToa
         VSsQ==
X-Gm-Message-State: AAQBX9dwMgZ1IOiX/N7ZQlCvCvW9FKqpAoUCRZPLifNWoPyOIOqBal+H
	pxFxuMeMgsoIxqVp0lcYQTeXYlXD3GCvfiPy5QM=
X-Google-Smtp-Source: AKy350aXAPmea4HxO+UOCzhAuoxDYmCSq1YsgvoixMFMX+4pyD4lfB3dLbXlU9mSbJnNXDTfFkh38aaEUXF97eOBukM=
X-Received: by 2002:a05:622a:152:b0:3de:d15a:847f with SMTP id
 v18-20020a05622a015200b003ded15a847fmr3750305qtw.0.1681119351225; Mon, 10 Apr
 2023 02:35:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230401145926.596216-1-hdegoede@redhat.com> <20230401145926.596216-29-hdegoede@redhat.com>
 <CAHp75VcOpL=aL9suDvBxiCK3cqm4vqCwVfwUp9SSFc31H+15cQ@mail.gmail.com> <7a7d442b-938d-4d99-a368-a6ce917d571b@redhat.com>
In-Reply-To: <7a7d442b-938d-4d99-a368-a6ce917d571b@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 10 Apr 2023 12:35:15 +0300
Message-ID: <CAHp75Vdoha0WT0fvt8_+AtCPRvQYQ0ucRjNHu+qgbRC_BTzedw@mail.gmail.com>
Subject: Re: [PATCH 28/28] media: atomisp: gmin_platform: Add Lenovo Ideapad
 Miix 310 gmin_vars
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 9, 2023 at 4:01=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
> On 4/2/23 21:12, Andy Shevchenko wrote:
> > On Sat, Apr 1, 2023 at 5:00=E2=80=AFPM Hans de Goede <hdegoede@redhat.c=
om> wrote:

...

> > MRD7 and FFD8 are the reference designs. At least MRD7 is what we have
> > in the lab and we can run some tests there. That's, for example, one
> > which I used to run atomisp before it got removed from the kernel a
> > few years ago.
>
> Right, but do these need the quirks ? Or is our auto-detection code
> good enough to get the right values ?

I will try to allocate some time to check it against the latest
AtomISP code. Do you have a branch where you have been collecting the
all related patches?

--=20
With Best Regards,
Andy Shevchenko
