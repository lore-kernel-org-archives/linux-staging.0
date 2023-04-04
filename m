Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0B17C
	for <linux-staging@lists.linux.dev>; Tue,  4 Apr 2023 11:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680608206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ojOFhnhp4SsyD0rEUsce5/2jxSoNGXx6ELi80cUBriI=;
	b=P0cgxf+G5VInhk/EbrcA/bbDZ3f4XrwrL0KoHfPqvKBU/r1dDtcJWRGqXLEQIx7TeOguwi
	HxbgHeLcrYBRYs8rkyRoiW62Q14UHtT2U6dvdkhfoapJkgIUUaxfnzizQXort4CYRgqlrK
	TANzUewYPIf5UeHwsP3TW8Yt1tqYUXo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204--nClAz4cNv-5sBAp_-TCGA-1; Tue, 04 Apr 2023 07:36:45 -0400
X-MC-Unique: -nClAz4cNv-5sBAp_-TCGA-1
Received: by mail-wm1-f70.google.com with SMTP id r11-20020a05600c458b00b003eea8d25f06so16181979wmo.1
        for <linux-staging@lists.linux.dev>; Tue, 04 Apr 2023 04:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680608204;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojOFhnhp4SsyD0rEUsce5/2jxSoNGXx6ELi80cUBriI=;
        b=ysWv1TtKa2m6SWLg5sumySpC/w83+WUwc4tUtVcgGGldbA82Ma3Xfc4ekNAiFkRiBo
         NbUeppx4KNtcdu89+52OEAZRcr9INc8xU7iU/q2uiSm9I9BompTCft5V3VyPKuB5IX5F
         xft0EI8zEMSfLDju/JF7BOxDGVpK/VKWdKLnKqLCHlMGgOoRtrq5p8zijaP/U7BIyZ6S
         9Kph1JwfslFECyxtLQHd05Ee+H70/I9d6MI2wJUsCTkIr6TEyVZAtT/uLmdzN0mY+RUz
         20Ufy/umzFduV6gJv8exjhM8+hnpTT6HuO6Zx3fsOVRri0sZt2PD6CvHyJWx5eWmAF0h
         HeHg==
X-Gm-Message-State: AAQBX9emS0QrT/AsRePizRUNGjw8SzGUy/QJXdbQVqU3HV42saOUAGNp
	nwDh+xmMQKBS+1CKkqEK3ESclWizJeglkGg3N2MD8ijAyRIVnXqzJWPz0PY9I3d1CSCYYnriizC
	2shJrL+u2wmE31KUf+SIR8K3nHQ==
X-Received: by 2002:a7b:ce99:0:b0:3ea:e4f8:be09 with SMTP id q25-20020a7bce99000000b003eae4f8be09mr1997463wmj.30.1680608204167;
        Tue, 04 Apr 2023 04:36:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZBl7sxG9qT96buUn7fCxResMaGdQnJeglH7Vd76qcVabWIRkxQ82wcbXV5wbZuVW0Aj/hJaw==
X-Received: by 2002:a7b:ce99:0:b0:3ea:e4f8:be09 with SMTP id q25-20020a7bce99000000b003eae4f8be09mr1997442wmj.30.1680608203876;
        Tue, 04 Apr 2023 04:36:43 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id y5-20020a05600c364500b003ee0d191539sm15036395wmq.10.2023.04.04.04.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 04:36:43 -0700 (PDT)
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
In-Reply-To: <e556191a3cc9730f3d83c7aaea7d3b3e@cavoj.net>
References: <20220718072322.8927-1-tzimmermann@suse.de>
 <20220718072322.8927-8-tzimmermann@suse.de>
 <9f682c15a5484b4a94f63e20d41f67d0@cavoj.net>
 <e881f6d6-0d2b-5775-68f2-35cc4d666d63@suse.de>
 <874jqfpw7k.fsf@minerva.mail-host-address-is-not-set>
 <87706a167c1e490a12371e2edf0f34e3@cavoj.net>
 <87v8ivoc3r.fsf@minerva.mail-host-address-is-not-set>
 <e556191a3cc9730f3d83c7aaea7d3b3e@cavoj.net>
Date: Tue, 04 Apr 2023 13:36:42 +0200
Message-ID: <87wn2rdgl1.fsf@minerva.mail-host-address-is-not-set>
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

Hello Samuel,

> On 2023-03-20 13:12, Javier Martinez Canillas wrote:
>> Samuel =C4=8Cavoj <samuel@cavoj.net> writes:
>>=20
>> [...]
>>=20
>>>>>> This call to sysfb_disable() has been causing trouble with regard=20
>>>>>> to
>>>>>> VFIO. VFIO has been calling aperture_remove_conflicting_pci_devices
>>>>>> to
>>>>>> get rid of any console drivers (d173780620792c) using the device in
>>>>>> question, but now even unrelated drivers are getting killed.=20
>>>>>> Example
>>>>>> situation:
>>>>>=20
>>>>> Which drivers do you use?
>>>=20
>>> This happens with either no drivers loaded or the proprietary nvidia
>>> driver. Nouveau is fine as it doesn't rely on efifb but brings its=20
>>> own.
>>>=20
>>=20
>> Which is what all DRM drivers should do. If they want to make sure that=
=20
>> a
>> fbdev will be present after the DRM driver probes, then should register=
=20
>> an
>> emulated fbdev.
>
> I don't see how this is specific to Nvidia or DRM drivers.
>

Not specific to Nvidia per se but as mentioned it only affected Nvidia due
that driver relying on a different graphics driver to get a VT console.

> The efifb is killed if vfio-pci (or another driver which uses the
> aperture system to remove conflicting drivers) is bound to ANY pci
> device, regardless of whether it's nvidia's fault for not implementing
> a framebuffer. Fair enough, I agree that they should, but
> I for one expect my efifb to not die at a random time
> when a random unrelated driver does a random thing with another
> unrelated GPU.
>

There was a patch series to address that:

https://patchwork.kernel.org/project/dri-devel/list/?series=3D711019&archiv=
e=3Dboth

In particular, this patch:

https://patchwork.kernel.org/project/dri-devel/patch/20230111154112.90575-1=
1-daniel.vetter@ffwll.ch/

> Or is the efifb considered a stop-gap solution the only purpose of
> which is early boot--before another GPU driver is loaded?
>

All the firmware-provided graphics drivers are really a best effort IMO,
that is something only to be used to get early video output and any in the
case of "nomodeset" (i.e: some distros have a "Safe graphics mode" boot
entry that prevents DRM drivers to be loaded but used for troubleshooting.

But as soon as a real DRM driver is probed (either in the host or a guest
when the device is passed-through), I believe that is very likely that it
won't work anymore. In other words, is not a robust way to get output and
is just a best effort.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

