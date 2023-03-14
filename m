Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C15B2CA6;
	Tue, 14 Mar 2023 21:31:25 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso11137137wmo.0;
        Tue, 14 Mar 2023 14:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678829483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3kosGJCuIsihwp7ZxBszW88vqGjIeKCLRbMuquEChy4=;
        b=HUOEJ5wA0yJ5PRwx0qukCBhFgKN2xGPawh/iC/MFtyTHMcrBq/Ekxa4mWByyM71mFd
         GquEWoz0UpyAwyDay9Jxm6qAnoSvkyWQLY4g5DkCxzx4jsQns9O7u1jmHnksoQa2rBgu
         JNEJQjMUhvdHgdKw9GYvWFWoYluzM6HPtLuJZqtItuqHgnuU74mjoOHM3PZnOzaf6Ubb
         zSUMyRu8BzgKsesW8hhKylsYfkA9+KJPlVPSu0HeWXeZFjMeuIg2PCRxf4gy/YpAfZBI
         MggcplOCWEYU+Ji3Gl6sukiPqUQ0RKyDmHftnVjqyAxHf85+fzmrOto6741Ezo2C73V/
         MtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678829483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3kosGJCuIsihwp7ZxBszW88vqGjIeKCLRbMuquEChy4=;
        b=CeEm33OSVbxIrMCU4Hj9LNHatUgPK5hS2RsV2bpkWZt/IDM9UIzyhD4UNIuM9bK9eS
         HkKnaamc5ADR1CibGPgCpkH73MxfXHoWPv3FS/OBVpvYOyvDJpBA6i9IMxi1G0HPITP7
         LLimCIX5BgQsejTwYEIWVPRnUPzfR2aJ+g4MhalURIi32CHWYYG8ZKRaLJwLZhR7LfJC
         N5kgqFEOjeq8+aQ/wCHQ/e7HJ6N0E2IcDoqZsL0+CBkIoIoNe83NcwpTds2Yh4bnElPj
         59BAet8m7Nf2Cag7bNfBUiijVuIUqqjEOElLTIzI2vegCu1j3nbdCvpzVeyVYgVHVRvE
         xbSQ==
X-Gm-Message-State: AO0yUKW4YN7/AJPCOlLZ5ih3NkgEXtdrb/A+kipZqkzwAnnv9tFaSwU5
	mEWdFSb7usICPmufkosDCgQ=
X-Google-Smtp-Source: AK7set9BMJIZWSpt2LeZg/JqmFIeOdAsbFqIMnDbl2gMHqQiodypTbMJRPuoI3GhGhoBCBi6tCGY6w==
X-Received: by 2002:a05:600c:4f91:b0:3ed:2c92:9f4f with SMTP id n17-20020a05600c4f9100b003ed2c929f4fmr3277198wmq.10.1678829483291;
        Tue, 14 Mar 2023 14:31:23 -0700 (PDT)
Received: from suse.localnet (host-79-35-102-94.retail.telecomitalia.it. [79.35.102.94])
        by smtp.gmail.com with ESMTPSA id z4-20020adff744000000b002c55de1c72bsm3058708wrp.62.2023.03.14.14.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 14:31:22 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>,
 Alison Schofield <alison.schofield@intel.com>
Cc: outreachy@lists.linux.dev,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: initialize timeouts in probe only
Date: Tue, 14 Mar 2023 22:31:21 +0100
Message-ID: <3376017.mWHT0XuiSF@suse>
In-Reply-To: <ZBDcfNOXmGeN2tlb@aschofie-mobl2>
References:
 <ZA9mThZ7NyRrQAMX@khadija-virtual-machine> <ZBDcfNOXmGeN2tlb@aschofie-mobl2>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On marted=EC 14 marzo 2023 21:43:40 CET Alison Schofield wrote:
> On Mon, Mar 13, 2023 at 11:07:10PM +0500, Khadija Kamran wrote:
> > Module parameter, read_timeout, can only be set at the loading time. As
> > it can only be modified once, initialize read_timeout once in the probe
> > function.
> > As a result, only use read_timeout as the last argument in
> > wait_event_interruptible_timeout() call.
> >=20
> > Same goes for write_timeout.
> >=20
> > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > ---
>=20
> Looks like this is [PATCH v5] and needs a changelog.
>
Alison,

In fact, this is only the second patch that addresses Greg's suggested=20
refactoring.=20

Khadija moved from v3 of "staging: axis-fifo: remove tabs to align argument=
s"=20
to v4 of this completely independent patch. And then back to v1, because (a=
t=20
the time of v4) I pointed out to her that she had started working on a proj=
ect=20
that has a completely different purpose than the previous one.

The best course of action would have been to ask Greg to drop the previous=
=20
patches and then reset the numbering of the new job to v1. Unfortunately I =
did=20
not pay attention to how she then managed the numbering following my=20
observation.

What would be the best course of action at this point?

=46abio


