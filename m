Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BAEE4CC
	for <linux-staging@lists.linux.dev>; Mon, 20 Mar 2023 10:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679307188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GSnzwW7UPKuaqTZOLIpRiKigYq3lgNu+HAeDIr5Zgck=;
	b=eJeoh/by8DVonC3SGtV5WxI5rOP1exsMjtO9dYJdjvC6XNmNAaHMGL/EQH5E/qoO6jwqym
	r7JWinoeoNmwLci9kLQrJm3rNF2844k70fDVd0ek4UhvgDYJTDKZvh9wZwcdyVVjBSgPhs
	KLhmCs3cTkwsXPL25CkxtXsaBtCjy1A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-303-N5YLLU0XMmSzIYj7Qv8RRA-1; Mon, 20 Mar 2023 06:13:06 -0400
X-MC-Unique: N5YLLU0XMmSzIYj7Qv8RRA-1
Received: by mail-wm1-f71.google.com with SMTP id fm14-20020a05600c0c0e00b003edd7388c79so518926wmb.1
        for <linux-staging@lists.linux.dev>; Mon, 20 Mar 2023 03:13:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679307185;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GSnzwW7UPKuaqTZOLIpRiKigYq3lgNu+HAeDIr5Zgck=;
        b=moSDjh3UOfw+/E511NMp8OYf8jc4ghcn/hdQNg7SxfKvaSz8S81sjEI7CrV/lr4x6T
         0n17ZBIxOPGXr5pWNE6BQmUPgIQwA98oj12/rqrAjU537m7fjmNtkm6JYBFIYoe9UEtB
         UCUEIb9clRpBTsQhCZtOyckx2c8EISV5UokvXpqOdlhU1oc+yR1JA1nyDAesxiXgfrDq
         LVPL3vKk8BYZfkHCap31KKlqZeokWI0rSJ2xgnJ81Msmjy55mrTLtnOWgy0ghqgszA0q
         mUNdsUZOhyWMQVv044HZeCWwh/mJ4Sl1YUtSKjec+fpPLlhUCIqWVYSTGs1UEWvFr6H5
         JHgQ==
X-Gm-Message-State: AO0yUKUCQik3E85LNhHc9/+tW4UXDhOhNCoasygGGBAjgTd4bvmYOby1
	lyUKaCa8Xt0ULVTQCvtxoTN1B7yD7ecqPsEW+79IlFJcmUE+m9hDKZKYPiu2Wst4kqUtRfIebA/
	8gBN+R4WKKjwELe6iH01+LaRpsQ==
X-Received: by 2002:a5d:6641:0:b0:2cf:ee25:18ce with SMTP id f1-20020a5d6641000000b002cfee2518cemr12035358wrw.27.1679307185470;
        Mon, 20 Mar 2023 03:13:05 -0700 (PDT)
X-Google-Smtp-Source: AK7set9OeXpxkU5FURZ6oRBmhf/UzB6dC4DewSocuWG17weImBIk36LE0SaKHYby/aSC/aNU62Rn7Q==
X-Received: by 2002:a5d:6641:0:b0:2cf:ee25:18ce with SMTP id f1-20020a5d6641000000b002cfee2518cemr12035341wrw.27.1679307185135;
        Mon, 20 Mar 2023 03:13:05 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id b18-20020adff912000000b002c567881dbcsm8451733wrr.48.2023.03.20.03.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 03:13:04 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Samuel =?utf-8?Q?=C4=8Cavoj?=
 <samuel@cavoj.net>
Cc: deller@gmx.de, daniel@ffwll.ch, sam@ravnborg.org, maxime@cerno.tech,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Zack Rusin <zackr@vmware.com>, Daniel
 Vetter <daniel.vetter@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Zhen Lei <thunder.leizhen@huawei.com>, Changcheng Deng
 <deng.changcheng@zte.com.cn>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2 07/11] video/aperture: Disable and unregister sysfb
 devices via aperture helpers
In-Reply-To: <e881f6d6-0d2b-5775-68f2-35cc4d666d63@suse.de>
References: <20220718072322.8927-1-tzimmermann@suse.de>
 <20220718072322.8927-8-tzimmermann@suse.de>
 <9f682c15a5484b4a94f63e20d41f67d0@cavoj.net>
 <e881f6d6-0d2b-5775-68f2-35cc4d666d63@suse.de>
Date: Mon, 20 Mar 2023 11:13:03 +0100
Message-ID: <874jqfpw7k.fsf@minerva.mail-host-address-is-not-set>
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

[...]

>>> +=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * If a driver asked to unregister a platform =
device registered by
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * sysfb, then can be assumed that this is a d=
river for a display
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * that is set up by the system firmware and h=
as a generic driver.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Drivers for devices that don't have a gener=
ic driver will never
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * ask for this, so let's assume that a real d=
river for the display
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * was already probed and prevent sysfb to reg=
ister devices later.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0 sysfb_disable();
>>=20
>> This call to sysfb_disable() has been causing trouble with regard to
>> VFIO. VFIO has been calling aperture_remove_conflicting_pci_devices to
>> get rid of any console drivers (d173780620792c) using the device in
>> question, but now even unrelated drivers are getting killed. Example
>> situation:
>
> Which drivers do you use?
>

Also, what kernel version?

[...]

>>=20
>> Machine has two GPUs and uses efifb for the console. Efifb registers
>> with the aperture system the efi framebuffer region, which is covered
>> by a BAR resource of GPU 1. VFIO grabs GPU 2 and calls
>> aperture_remove_conflicting_pci_devices(GPU 2). GPU 2 has no overlap
>> with the efifb on GPU1 but the efifb is killed regardless due to
>> the unconditional call to sysfb_disable(). The console switches
>> to dummy and locks up from the user perspective.
>> This seems unnecessary, as the device is unrelated.
>>=20

That's a bug indeed but I thought that was already fixed...

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

