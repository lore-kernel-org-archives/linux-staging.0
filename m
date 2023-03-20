Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E75184C
	for <linux-staging@lists.linux.dev>; Mon, 20 Mar 2023 12:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679314364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XDRN9XADCHW4KobnBjZyGXmUoJLZGTdT1A6DRUh7Iug=;
	b=AnamrtCy0ec9Jjrq4nAb2ognJwUBYo//j6Zgv8qtemnQbSUZVLZZjlPGPaUckt3XUk0wJa
	A05bPkaFBOorfgXOAX3g9qy85k1E/7RFoGj6g+Cy4XHq8UJKSwyKnAwt6dmQLcw4p/RFCp
	haMj9VxFswiKcPh6CIZZth9xBj5iZdg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-LyGK68_jPXOcwE5A7jqY1A-1; Mon, 20 Mar 2023 08:12:43 -0400
X-MC-Unique: LyGK68_jPXOcwE5A7jqY1A-1
Received: by mail-wr1-f71.google.com with SMTP id c3-20020adfa303000000b002d5737d3835so362557wrb.21
        for <linux-staging@lists.linux.dev>; Mon, 20 Mar 2023 05:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679314361;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDRN9XADCHW4KobnBjZyGXmUoJLZGTdT1A6DRUh7Iug=;
        b=uGiAqdHNwBI6oferrTzNUwrQubOZwVvCr126GJL4pHmF4rvA2nbMkzxJYziyYPnkS8
         AqVU84oh2a+yD4OZDotj4/2CdFz10iw9nzHVL1iFTpP2MsCasbTOjh3n75MYw3WgFEFD
         e+tIh8qDwSwZJhsb0K7YT3yvzZRLzQfzbfTOD2sFCO+KikkXQsDnOqeD76NAJPEX5eZl
         rQAVSN56XoejzqocDGknofM+8Dhvl9UZvTOmWqkyjtFiYK71MsnqHrVhTwqWaAuA+3qj
         SYv1ZbwC3JqWfGuwumaf+iX5yFihOO016pZjtgx8kdSJtx3f3IEb64JeKd+sVC56DyJB
         pNJA==
X-Gm-Message-State: AO0yUKWJuQAw6R4o6T5ZFWV9juY1SZP+jJ9lTFuZj15iT0RZKQKLoavB
	nSXlF32xSMY8G36kl85j/1KinaO3u77L1DAXmtZjeN4g8HuFSaiTxiNMVoTgg/p0xMxc2z1BvjZ
	IEDLi54xw/7h6WSjQbmeRN1eMRQ==
X-Received: by 2002:a05:600c:2299:b0:3ee:da1:135f with SMTP id 25-20020a05600c229900b003ee0da1135fmr1095247wmf.7.1679314361794;
        Mon, 20 Mar 2023 05:12:41 -0700 (PDT)
X-Google-Smtp-Source: AK7set+umOOuG5X2xVwy2+bTR0qTb8LXpCVn0AZ49wk1ROM/wu6oxM+7I2UIaZAV5omtJqUkTfXqew==
X-Received: by 2002:a05:600c:2299:b0:3ee:da1:135f with SMTP id 25-20020a05600c229900b003ee0da1135fmr1095226wmf.7.1679314361535;
        Mon, 20 Mar 2023 05:12:41 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id f20-20020a7bcd14000000b003e203681b26sm10324306wmj.29.2023.03.20.05.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 05:12:41 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Samuel =?utf-8?Q?=C4=8Cavoj?= <samuel@cavoj.net>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, maxime@cerno.tech, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org, Zack Rusin
 <zackr@vmware.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Alex Deucher
 <alexander.deucher@amd.com>, Zhen Lei <thunder.leizhen@huawei.com>,
 Changcheng Deng <deng.changcheng@zte.com.cn>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2 07/11] video/aperture: Disable and unregister sysfb
 devices via aperture helpers
In-Reply-To: <87706a167c1e490a12371e2edf0f34e3@cavoj.net>
References: <20220718072322.8927-1-tzimmermann@suse.de>
 <20220718072322.8927-8-tzimmermann@suse.de>
 <9f682c15a5484b4a94f63e20d41f67d0@cavoj.net>
 <e881f6d6-0d2b-5775-68f2-35cc4d666d63@suse.de>
 <874jqfpw7k.fsf@minerva.mail-host-address-is-not-set>
 <87706a167c1e490a12371e2edf0f34e3@cavoj.net>
Date: Mon, 20 Mar 2023 13:12:40 +0100
Message-ID: <87v8ivoc3r.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Samuel =C4=8Cavoj <samuel@cavoj.net> writes:

[...]

>>>> This call to sysfb_disable() has been causing trouble with regard to
>>>> VFIO. VFIO has been calling aperture_remove_conflicting_pci_devices=20
>>>> to
>>>> get rid of any console drivers (d173780620792c) using the device in
>>>> question, but now even unrelated drivers are getting killed. Example
>>>> situation:
>>>=20
>>> Which drivers do you use?
>
> This happens with either no drivers loaded or the proprietary nvidia
> driver. Nouveau is fine as it doesn't rely on efifb but brings its own.
>

Which is what all DRM drivers should do. If they want to make sure that a
fbdev will be present after the DRM driver probes, then should register an
emulated fbdev.

There was an attempt to workaround that in [0], in particular patch [1]
but that effort was not continued since the only DRM driver that would be
affected is the Nvidia proprietary driver that relies on efifb/simpledrm
to have a VT.

[0]: https://patchwork.kernel.org/project/dri-devel/list/?series=3D711019&a=
rchive=3Dboth
[1]: https://patchwork.kernel.org/project/dri-devel/patch/20230111154112.90=
575-11-daniel.vetter@ffwll.ch/

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

