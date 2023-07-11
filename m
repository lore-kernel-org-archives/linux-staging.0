Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4F9174E5
	for <linux-staging@lists.linux.dev>; Tue, 11 Jul 2023 10:03:39 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6b5f362f4beso4846448a34.2
        for <linux-staging@lists.linux.dev>; Tue, 11 Jul 2023 03:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689069818; x=1691661818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+EdWg+i/tz1eYpH9ck9/qmxGmzdGcH8THqJbinUddk=;
        b=NyI0NAaMqg06KA6hwBSQgBEB85LCB8gClAXi9s9KdtyJxX2aBORKelElCulIdppHS6
         B2KpbjTxVS2+wUc9g/u+o+ZwR99AGXRU021BosfNDYuk/lbxfTcwf4poeCIl1pjSfmvJ
         5jkEpuK/djrhv1A7k5tWeHiTtBppXhqwoEPSSNpCFuvfRbFDru0owVW8nZGMH4e28CJA
         37otT/of6vfb688RtJjgE4uuPquRo2iO+FPZYJPBc0xkoWD8nJuSeik7gJXt88UxhuU5
         ynGI8Mdwz40F9nADl3/OzgmP0F+m9xzz5dHEj+Nekn9xjmNXbRk7FYYufVHEanQb1xEP
         DNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689069818; x=1691661818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+EdWg+i/tz1eYpH9ck9/qmxGmzdGcH8THqJbinUddk=;
        b=V9OswHDjChIGibIKiRgjjWBfn32wJI6iVgVyOb2EgWCnNQUHGo3HR1vG50C6AGcijX
         UV2P8tXpQrHsrF+aYM/M8awIVIz1pemIDZg/20+X0VBxwqUvZWn8YxkvL6kCj68O4KGP
         xV7wTZN3KIsRxbTZz8fJIk7oiblcv7aLFHYRjhWy40PGC9IBiB0NZaxXZEtn/f9EXsdy
         07cj4rULIi88jwJXzCGJtNmVOOa4WFI/x9ttCXZkOZzt6mImoIESOEKeNkQ/KmFoy9de
         FIeD4iIGVeGqqjWjojf+swQ2IO56UE6bOT8gMKoEyCQuvqMG8rW7wlapZczd1iiP4/vZ
         JswQ==
X-Gm-Message-State: ABy/qLYjtXdAnaJsUpN+8hRYTpbRVBaS2O7M2lXiO5iDViRyUesgIslK
	+4bbSg8du1bu/BZ+gYmgwZjh4i0wJos0GHJjaA4=
X-Google-Smtp-Source: APBJJlGGsUuf+V3qoT11Pogf+mqcTAutGtQX8L+sFbR9xMxcqCOg1dWiYkpNfhV8TDJxJAkM3OI/WYW3QCrNv2zauGo=
X-Received: by 2002:a05:6870:420f:b0:1a5:4e57:e5d1 with SMTP id
 u15-20020a056870420f00b001a54e57e5d1mr19457972oac.49.1689069818163; Tue, 11
 Jul 2023 03:03:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230710130113.14563-1-tzimmermann@suse.de> <20230710130113.14563-10-tzimmermann@suse.de>
 <CANiq72=9PoV3FOcXx9FdiSLePKXDG4BSY_5-jddBkqDL=ua3FA@mail.gmail.com>
 <733273ad-89e1-d952-37ee-bb75c3ab8188@suse.de> <CANiq72kPh2KE=ADUxhPyyr7noWhC0fkzmDu8EBn_20focnZqtw@mail.gmail.com>
 <745347ca-a369-eb01-eac4-75c09cf9e67f@suse.de>
In-Reply-To: <745347ca-a369-eb01-eac4-75c09cf9e67f@suse.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Jul 2023 12:03:27 +0200
Message-ID: <CANiq72kg_2PxmSnyj_X7Rak0-fmPP+W-+2EKFjyXCetw7w+mGA@mail.gmail.com>
Subject: Re: [PATCH 09/17] auxdisplay: Remove flag FBINFO_FLAG_DEFAULT from
 fbdev drivers
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: deller@gmx.de, javierm@redhat.com, linux-sh@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, linux-input@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-geode@lists.infradead.org, linux-nvidia@lists.surfsouth.com, 
	linux-hyperv@vger.kernel.org, linux-omap@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Robin van der Gracht <robin@protonic.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 11, 2023 at 8:10=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> I'd like to take the patchset into drm-misc. It's part of a larger
> cleanup of the fbdev modules and its interfaces.

Sounds good, thanks!

Cheers,
Miguel
