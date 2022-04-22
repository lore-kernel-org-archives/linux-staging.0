Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899592564
	for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 09:52:29 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id bv19so15311948ejb.6
        for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 02:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EyCNAxW7fxCpYo+8/XOlOvDx4pR9WkjGCA8FR7X9kOw=;
        b=FvSgRcdW2TegRQ3vFjHmV6UcDlDioLiaPY+DGbTgl7TWVgQv5ju3EmwhzG9eR9eFVo
         7k4C+fRXIhndVwby2xj+6NB7zk4qhJtqk1/SsaeBpJtp/PdoqFpxJp9lEzST5uo0zD/V
         JH9NqgrIKb0Kg941XlEGDQFT6bjKQDbt07YmOeTjbml7LY/XFWjGcacbXlV3l1BUdTqr
         gAbLBwz1T2y+Iq3yxdBWV8Dmj4MxHwOkh9r3VqhxFP/kBSmLI4LWPIl08NGlkjjBbW4T
         0ulXoUAdYg4fFo1GsYJjFbIuWBX7BU/mJCPIKWddtYoaC4r4nLAP0/w6OQCPKXgWk3Dd
         bHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EyCNAxW7fxCpYo+8/XOlOvDx4pR9WkjGCA8FR7X9kOw=;
        b=LWdcbSPvRdKSdSm0tivZnx8Ecd6P6THCHpQ4w8MjoY8rYbwAe5YJuzVOde89n3wz9/
         GJx+e2jYb78a5N+4xegeuPo9W95XmimEJU99WkjGVdxRzzpjCQKGNfZGU16ZbB+T9Tht
         WLnQAOZNwTMSy5gUS0/M/WhHSz1JY1i6ToGRkWnhw433H11VMme+qO78/NYRFGYK6jpH
         iepHPV+dv98MigOXhkGKhqVywM49lJZSaPUNpz6Y1/X57JSsC+BRNRehhubIBbVnzcQP
         3FSmlQEUdd2gwfjvimmj/pLIEKJ91wPYtRdE5IuI0S1Y0FlWiVpGd6KSnSibgf2deIHa
         uacQ==
X-Gm-Message-State: AOAM530iSXl3TJdDPiPpKtWiDCkJYxSNqN+nEmvOSmaR/F2VTnP2KY7R
	sIAloB9cVGtZ+SFdPsVWvVo=
X-Google-Smtp-Source: ABdhPJyGntXRscaGFQmZ1wBglMYiCte6wZ/lfBlLEH3b1Kx9rE2rM61qbPcFhI4bRIdFK8GxE4vJ/w==
X-Received: by 2002:a17:907:1c8a:b0:6e9:2a0d:d7b7 with SMTP id nb10-20020a1709071c8a00b006e92a0dd7b7mr3291611ejc.572.1650621147862;
        Fri, 22 Apr 2022 02:52:27 -0700 (PDT)
Received: from leap.localnet (host-79-50-86-254.retail.telecomitalia.it. [79.50.86.254])
        by smtp.gmail.com with ESMTPSA id s20-20020a056402015400b00418f9574a36sm678644edu.73.2022.04.22.02.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 02:52:26 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho <mchehab@kernel.org>, Vihas Makwana <makvihas@gmail.com>, Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Pavel Skripkin <paskripkin@gmail.com>, Hans De Goede <hdegoede@redhat.com>, ira.weiny@intel.com
Subject: Re: [PATCH v2 0/7] drop some unnecessary wrappers
Date: Fri, 22 Apr 2022 11:52:24 +0200
Message-ID: <1789938.atdPhlSkOF@leap>
In-Reply-To: <20220422092915.GF2484@kadam>
References: <20220411102136.14937-1-makvihas@gmail.com> <2181149.iZASKD2KPV@leap> <20220422092915.GF2484@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On venerd=C3=AC 22 aprile 2022 11:29:15 CEST Dan Carpenter wrote:
> On Fri, Apr 22, 2022 at 11:21:21AM +0200, Fabio M. De Francesco wrote:
> > On venerd=C3=AC 22 aprile 2022 08:10:23 CEST Greg Kroah-Hartman wrote:
> > > On Fri, Apr 22, 2022 at 12:26:21AM +0530, Vihas Makwana wrote:
> > > > Did this patch series get lost?
> > >=20
> > > What series?  (hint, do not top post).
> > >=20
> > > My queue of staging patches was empty as of a few days ago (it's=20
filled
> > > up since then), so if they were not applied, please resend.
> >=20
> > Are you also talking about re-sending patches for media/atomisp?
>=20
> Heh.  No.  No one was discussing your patches or anything to do with
> media.  These are for staging: r8188eu.

Dan, got it now :)

I was confused by Greg's words talking about "My queue of staging..." . Now=
=20
you confirm that media/atomisp has never been in his queue.

Thanks,

=46abio M. De Francesco

> Vihas, please put the subsystem prefix in the PATCH 0/7 email next time.
>=20
> regards,
> dan carpenter
>=20
>=20




