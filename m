Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2027E118
	for <linux-staging@lists.linux.dev>; Sat, 17 Feb 2024 18:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708195962; cv=none; b=VfF3yOGaiw5wUrVJahuXgIjGFInwE2bDA8fAI8CQYJTxUQ0vT2AL/vlN8lFpxzul1VEUsGnf9xEbTSz5ReO6ssjtpy5MkfLO3n+95U8AcMtxnm4oS9mxb11oH3WwUdSt3ZGvg5B8XdbxAcwMcSkaZTTBSBYER2gkEpfQR3eK318=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708195962; c=relaxed/simple;
	bh=KipOexH33htOrzQEQmLokDnFmCCEq4+QRpagcTCh1XU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l7F9e2IpFM2imv7lxdsAZGJHF/PJ5Kg30s7j0Qmfw4t0kMheGb5Of1szXdwTHHr3jFRNiD1WMsM84bhF0JDmPC1QdL3Szm4WvB6NJabIbaRQngSo6VjnjesdUOOqCEyQ+yVtDxGL4v9FwVZEuZdhp5bNfstpS7LS1Bco4CZx1BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HVp6XMps; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVp6XMps"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a3de25186fbso188754066b.0
        for <linux-staging@lists.linux.dev>; Sat, 17 Feb 2024 10:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708195959; x=1708800759; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMNffA4WqZEbROkhcpNHlmsMPMcjgDEcPug0Glzy7r0=;
        b=HVp6XMps19kKLyQPHl/+U/qSUMY26dUgpgqGBqRXf3pdbjbyfrQvkNICelRlIrBjZF
         eatKEz5psswzGk6PQ3o6a5IbnIL7Qfm6oQbAEkEjUEy+vsSbBA5iT82jGevj1PFnFgl0
         mCnqYsPu6ocBMgj4bPqMAalkfQgmk0OyuITA3rLC8l1t9tJzQpyf4ZOV5fgW7lLZCGvA
         OS2hwn+yWMlctvpV4nMvuDR1xOgVBSWwlA2n3sOquRwcKW9IdPwjhRLsugv5Udm4KmmX
         K1hTntKrzP6NLK0fXMY5NU25hwOJV1iAqLr8acbL2Qz7Z2FTodg3ug7J/IDChNQc7HVX
         aniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708195959; x=1708800759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMNffA4WqZEbROkhcpNHlmsMPMcjgDEcPug0Glzy7r0=;
        b=mGrrq6Em4titAZ250Lx2wjjzfvJvkP8T8UhDGgkiHbUr0m2OrQkuuBGnD1HIZ8kvDp
         aoY1sMN4pEBk5hYBkvgcocgTgpT9ClPIPmwQi1Syga9TcNoTgqPfIy+8ivqv6962t5Pd
         IMl6DCOBoqIvCr7DufyP1sBylU0qNENbjeHpmxAxhE37r0srytZ19CHslv+RTYQ6isDs
         9W3Gtrl9UK+uTHvf5mlNBviursCOl+CLZFRe6hx490OVdZDHLDIBtPPBlphn+EMBiBNg
         cxeEV73QJrh20Qqt5oeneLDHnD8W9l05HNnqHaBzOInqZXnV3MoCDovv11izd3SGz/3N
         0mTg==
X-Forwarded-Encrypted: i=1; AJvYcCVc9h8NoZhQfMko/5k8CziCLxWHRhGMpQiCDa0f0YePU2314lGAucETaHTbbey1SrQmhR6zpLCBtbygvcxqKSRlgLMAE3TLahryETdbAA==
X-Gm-Message-State: AOJu0Yz3/o8zFCaq1+mXaqM3qr/LBz2B7A2Eazj5oMVqxXStMwF81GDc
	CPLmyG4xJKYkRxzeGbitR7i1aqs4swkK/I7+3/gG0a/Jwfx0LCLh/TN+e9/ivFgXV80jKYxK7rv
	ALyRJFw8dND0G/QWRlZGcVm+q43w=
X-Google-Smtp-Source: AGHT+IFuJhBp4H8u73NOQexEjnexPNfyJ7Kh37DyHXeZYFWiK6xBW2x3kHXUImsWuIOHXTY1/Wu3ii/sK31DfOlDGbo=
X-Received: by 2002:a17:906:1718:b0:a3c:e81a:9c35 with SMTP id
 c24-20020a170906171800b00a3ce81a9c35mr6096404eje.73.1708195958636; Sat, 17
 Feb 2024 10:52:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240217112438.15240-1-hdegoede@redhat.com> <20240217112438.15240-10-hdegoede@redhat.com>
In-Reply-To: <20240217112438.15240-10-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 17 Feb 2024 20:52:02 +0200
Message-ID: <CAHp75VfK6QKA4hq0_LNe1_i44M_6j65aYGnU7XSEF0M-NWLs7A@mail.gmail.com>
Subject: Re: [PATCH 9/9] media: atomisp: Implement link_setup op for ISP
 subdev MC entity
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 17, 2024 at 1:25=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> The atomisp driver's Android heritage makes it weird in that
> even though it uses MC + subdev-s it is designed to primarily
> be controlled through its /dev/video# node.
>
> It implements s_input on /dev/video# to select which sensor to use,
> while ignoring setup_link calls to enable a link to another sensor.
>
> Add support for selecting the active sensor the MC way by adding
> setup_link support.

->link_setup()

> The implementation is a bit convoluted due to the atomisp driver's
> heritage.

...

>  #include "atomisp_common.h"
>  #include "atomisp_compat.h"
>  #include "atomisp_fops.h"
> +#include "atomisp_ioctl.h"
>  #include "atomisp_internal.h"

Hmm... Perhaps keep it ordered?

...

> +       mutex_lock(&isp->mutex);

Side note: Are you planning to use cleanup.h at some point?

> +       ret =3D atomisp_pipe_check(&asd->video_out, true);
> +       if (ret =3D=3D 0)
> +               asd->input_curr =3D i;
> +       mutex_unlock(&isp->mutex);
> +
> +       return ret;


--=20
With Best Regards,
Andy Shevchenko
