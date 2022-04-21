Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3062923A0;
	Thu, 21 Apr 2022 19:16:08 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id v12so1202671wrv.10;
        Thu, 21 Apr 2022 12:16:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=AHLP1NJzIhUuorzbDM3B2ohS7cALSRAeCoZR22VkiWU=;
        b=BGGcjrCH4/ov0aL+uEO21oW2+L3dQ/2MVWbPExa3hZ4lyx5x5eNzPjSEHalM2VEDdc
         ikvrayV+K2gcbpU2F3ZEtzbZ0qtxk1pPBGoGxSbjKuYyLTvjYIP5ogFusnilWZShbvo9
         CJ+i7J2C5Zzw8bYpfIyTuokOUNucrtcfOBt+nyNEZwlsRghL+tyNXKFyqQDWi8NOk7Lx
         7CG49LR/eNsCUWebAA5e8TququcZcIQn1WYLEVX6i8Lpl16qDzPrAmB/7Ol9X93FpZVO
         +8SseEDt3y4pu4FQuoKwXnqJJMk9BbxQ14SdFZs7PU0MGMLb419Gok0sdvNCSXoBoV3i
         srkg==
X-Gm-Message-State: AOAM5326ZYST9HjNwQQhofJgTnzd9kyX7/iO1xBVmyTWuXf9kBz1D1uS
	ikZJD44HXlLtZbn8TfALSUg=
X-Google-Smtp-Source: ABdhPJwVWTrbptQ5HgW724jwGeCexvjlAE4JqlG/I3za3EqRCW4VVzxlGFXoXbiaA5dFfugGM/yAoQ==
X-Received: by 2002:adf:f508:0:b0:207:a8fe:c8bd with SMTP id q8-20020adff508000000b00207a8fec8bdmr857908wro.313.1650568566220;
        Thu, 21 Apr 2022 12:16:06 -0700 (PDT)
Received: from ?IPv6:2a00:23c6:c31a:b300:7e32:69f8:29ae:884a? ([2a00:23c6:c31a:b300:7e32:69f8:29ae:884a])
        by smtp.gmail.com with ESMTPSA id n42-20020a05600c3baa00b0038ffadd6e4asm2864364wms.30.2022.04.21.12.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 12:16:05 -0700 (PDT)
Message-ID: <3e91b72a86294b542acf460657d0fd94adeb252e.camel@welchs.me.uk>
Subject: Re: [PATCH v3 0/3] staging: vme: Cleanup driver tree old structures
From: Martyn Welch <martyn@welchs.me.uk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bruno Moreira-Guedes
	 <codeagain@codeagain.dev>
Cc: Manohar Vanga <manohar.vanga@gmail.com>, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, outreachy@lists.linux.dev, Bruno's Patch
 Watchbox <patch-reply@codeagain.dev>
Date: Thu, 21 Apr 2022 20:16:05 +0100
In-Reply-To: <YmA4QIRfx2QPhEJi@kroah.com>
References: <cover.1650321310.git.codeagain@codeagain.dev>
	 <YmA4QIRfx2QPhEJi@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2022-04-20 at 18:43 +0200, Greg Kroah-Hartman wrote:
> On Mon, Apr 18, 2022 at 08:29:49PM -0300, Bruno Moreira-Guedes wrote:
> > This patch series modify the vme_user driver's place in
> > menuconfig (1/3), fixes a missing `depends on` line in a Kconfig
> > file
> > (2/3), and rearrages the directory tree for the driver allowing a
> > more
> > straightforward comprehension of its contents (3/3).
> >=20
> > The 'vme_user/' driver is the only remaining vme-family driver in
> > the
> > 'staging/' tree, but its structure, entry in menuconfig and
> > building
> > routines are still attached to the 'vme/' subtree now outside
> > 'staging/'. The present patchset fixes it.
> >=20
> > Signed-off-by: Bruno Moreira-Guedes <codeagain@codeagain.dev>
>=20
> What about deleting the vme drivers entirely?

I assume you're suggesting deleting the "vme_user" driver from the
staging directory?

> Martyn, anyone still using these?
>=20

I'm fairly sure that the actual VME drivers for the hardware bridges
(the bits not in staging) are still being used based on the
conversations I've had today. I'm just trying to find out whether the
vme_user bit is actively being used.

Martyn

> thanks,
>=20
> greg k-h

