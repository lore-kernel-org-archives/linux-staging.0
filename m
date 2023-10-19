Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89A919442;
	Thu, 19 Oct 2023 11:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7aLzExw"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6cd1918afb2so769874a34.0;
        Thu, 19 Oct 2023 04:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697714504; x=1698319304; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3SPNfk0MBZSGH8SXgS5730xn3GrjsvVhbuXYaMzrM4=;
        b=d7aLzExwBZwczZAECQi2oJl5ZJStk+8GxV5oVKHPTL1cH+/1IG+0sXofhHqjO3BTxO
         0a1NrTvyy8L7528aWq1STkQhl2I4X3vizwbTDMRChy979kVIhz2zsT4m+swMPoh1Efdo
         1YZFYUQBK/kQ4yQMABlt/NUB/KysDp7nPqrrmDDI5po4c3fcXxGEXGHbGmujc7hO3jqN
         lBtroTgcsnBntmLqXu5N+UT2hETzOaQE2ET1/a5B/mCMRERyX9eiBTV+g8MnZWnvuarO
         K/EtJXMRuHJ563IWU2kaMQpqFGfEJNzggtl75t+PZodywxGMt7kp03XGDmS5eINfjI0o
         n//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697714504; x=1698319304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3SPNfk0MBZSGH8SXgS5730xn3GrjsvVhbuXYaMzrM4=;
        b=cFpcVUbTIZZ2lcBz/+O8ljCwNV53M3bBiV69GTsfr1SDcUIn/HJPYadVJ7kLg0PeR5
         AWJxJkgqWw6tohcYZnZJgMmnrCsC0g+NxrVAbyME/SdDVQg2IEl0e5JhaxE3VXSfQWhj
         czuxVuOVYbjSjuQ7172pMljrlPk5pNVFSGWaciLe+N3ugcIJ/N6A7sUq4/4MtCcloJ4z
         jOQVJwyKlE+bPHtWsMIlInI/F60T/LFj6hgXl5LCp1UxaPLM0bHD9WWqsXUtjNBYFYNM
         HAxaePGs7DvLOpuwZ4x/FqcB5nLcR/kgKWai3ymeuse48jPFqwPlwDYSrbPYEpit2qXL
         IZsQ==
X-Gm-Message-State: AOJu0YyoRAC/qbAK/e0GTahLqRdoCuDg/JcQRmnsuSi6q3baFPuyYp+Q
	Y20vidcZgnejAWyskgFAIkMGeiSf46F9HXP4KTc=
X-Google-Smtp-Source: AGHT+IEyh2R89gb0G7TKWAFgHpET4HBGbIDd81JD9Rp9+cxsWVvXkJ+wOTKm4GEag1lO1HJhacHcX1Q2yxVtniNWbH8=
X-Received: by 2002:a05:6830:140a:b0:6cd:a9d:bc57 with SMTP id
 v10-20020a056830140a00b006cd0a9dbc57mr1939761otp.32.1697714503786; Thu, 19
 Oct 2023 04:21:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZTD677iqMkRPxT27@lab-ubuntu> <93a6d8b0-140c-983e-1b78-6f5a4e03e62e@intel.com>
In-Reply-To: <93a6d8b0-140c-983e-1b78-6f5a4e03e62e@intel.com>
From: Calvince Otieno <calvncce@gmail.com>
Date: Thu, 19 Oct 2023 14:21:32 +0300
Message-ID: <CADFX3OTHX=5jNm8aaUyC_RzDPntiL4ZC=Jj+8bZPjHNmZwUs9A@mail.gmail.com>
Subject: Re: [PATCH] staging: vc04_services: remove empty functions
To: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: outreachy@lists.linux.dev, gustavo@embeddedor.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2023 at 1:55=E2=80=AFPM Karolina Stolarek
<karolina.stolarek@intel.com> wrote:
>
> On 19.10.2023 11:46, Calvince Otieno wrote:
> > The functions vchiq_debugfs_init(), vchiq_debugfs_deinit(),
> > vchiq_debugfs_add_instance(), and vchiq_debugfs_remove_instance()
> > are declared and defined but contains no code or statements.
> > They do nothing.
> >
> > Signed-off-by: Calvince Otieno <calvncce@gmail.com>
> > ---
> >   .../interface/vchiq_arm/vchiq_arm.c              |  3 ---
> >   .../interface/vchiq_arm/vchiq_debugfs.c          | 16 ---------------=
-
> >   .../interface/vchiq_arm/vchiq_debugfs.h          |  8 --------
> >   .../interface/vchiq_arm/vchiq_dev.c              |  4 ----
> >   4 files changed, 31 deletions(-)
> >
> > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_ar=
m.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > index eef9c8c06e66..b802d1ecc8f6 100644
> > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > @@ -1806,8 +1806,6 @@ static int vchiq_probe(struct platform_device *pd=
ev)
> >       if (err)
> >               goto failed_platform_init;
> >
> > -     vchiq_debugfs_init();
> > -
> >       vchiq_log_info(vchiq_arm_log_level,
> >                      "vchiq: platform initialised - version %d (min %d)=
",
> >                      VCHIQ_VERSION, VCHIQ_VERSION_MIN);
> > @@ -1838,7 +1836,6 @@ static void vchiq_remove(struct platform_device *=
pdev)
> >   {
> >       vchiq_device_unregister(bcm2835_audio);
> >       vchiq_device_unregister(bcm2835_camera);
> > -     vchiq_debugfs_deinit();
> >       vchiq_deregister_chrdev();
> >   }
> >
> > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_de=
bugfs.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
> > index dc667afd1f8c..7e45076e5ebd 100644
> > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
> > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
> > @@ -228,20 +228,4 @@ void vchiq_debugfs_deinit(void)
> >
> >   #else /* CONFIG_DEBUG_FS */
> We need to have these definitions, so a kernel with no CONFIG_DEBUG_FS
> selected builds. Have you experimented with this config with your
> changes applied?
>
> All the best,
> Karolina
>
> >
> > -void vchiq_debugfs_init(void)
> > -{
> > -}
> > -
> > -void vchiq_debugfs_deinit(void)
> > -{
> > -}
> > -
> > -void vchiq_debugfs_add_instance(struct vchiq_instance *instance)
> > -{
> > -}
> > -
> > -void vchiq_debugfs_remove_instance(struct vchiq_instance *instance)
> > -{
> > -}
> > -
> >   #endif /* CONFIG_DEBUG_FS */
> > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_de=
bugfs.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.h
> > index e9bf055a4ca9..76424473c32b 100644
> > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.h
> > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.h
> > @@ -10,12 +10,4 @@ struct vchiq_debugfs_node {
> >       struct dentry *dentry;
> >   };
> >
> > -void vchiq_debugfs_init(void);
> > -
> > -void vchiq_debugfs_deinit(void);
> > -
> > -void vchiq_debugfs_add_instance(struct vchiq_instance *instance);
> > -
> > -void vchiq_debugfs_remove_instance(struct vchiq_instance *instance);
> > -
> >   #endif /* VCHIQ_DEBUGFS_H */
> > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_de=
v.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
> > index 841e1a535642..953f39f537a8 100644
> > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
> > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
> > @@ -1185,8 +1185,6 @@ static int vchiq_open(struct inode *inode, struct=
 file *file)
> >       instance->state =3D state;
> >       instance->pid =3D current->tgid;
> >
> > -     vchiq_debugfs_add_instance(instance);
> > -
> >       init_completion(&instance->insert_event);
> >       init_completion(&instance->remove_event);
> >       mutex_init(&instance->completion_mutex);
> > @@ -1297,8 +1295,6 @@ static int vchiq_release(struct inode *inode, str=
uct file *file)
> >
> >       free_bulk_waiter(instance);
> >
> > -     vchiq_debugfs_remove_instance(instance);
> > -
> >       kfree(instance);
> >       file->private_data =3D NULL;
> >

Could you kindly clarify what these definitions are doing.
At the moment they do absolutely nothing, I might be wrong

--=20
Kind regards,
Calvince Otieno
