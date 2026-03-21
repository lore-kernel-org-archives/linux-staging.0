Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A0137416A
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 06:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774076059; cv=pass; b=Ka+K7dfdhfl2vAYTcoEQ1RPWd3TaQEZzsSmLielf9xYtm6YjtMB97F/iyc/aswSpMExE6+NeyyaxJkMjKu8Mq+V2gtNECzynE+oc7dsiIWJiksVrVfqkWEXo8h6nLGzNHygypP0XAASrKHrqwyH5P/q+zpSPXWLi+UZXNUF6AwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774076059; c=relaxed/simple;
	bh=MbIxk44fu2xuOaMBzYw8jG4/PPhvqs4IHRP9dDfBPzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gTZCMXIsPEqofzddSPVDzQ3mw3gzXBCKazIln0FPDvAgXFiGGRBuqoPSYkI0GAoGkDuHrLDY8aN9O35y62owGk4CrMDPOKHvmAiq+tqn6xlXJ77pXykv4DOc/uVC5ccfe4a44NIzqIc+hGvjJ49oAOgBkVdt2gKUiEHTabg4qS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZQKmF6k; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZQKmF6k"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b97ed4ad579so227685966b.3
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 23:54:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774076057; cv=none;
        d=google.com; s=arc-20240605;
        b=WlF/T80Ei9/4DSFXP7ARgkAOQIhOD39rPYcRz2nxFKnwFzkRRvsy7A0eI/3rWDNsY5
         A+a2grKV9jozIVUDsY75KjyCzBYd3BDgOSe28CmEdESeIfdtS46WWyr2r0h812A3Bnkj
         D81+lJcQxMxHNpfydgXgDRP5xmA9uLZlJFDhRQ979vp2aDbNrcTT+B51XckcSh6WKTMG
         2ihfVbE0vmUbjYS45duE0vGpRq9sL4UTEoSmKS6RM5URYNR5M7nq0u3In+ns7umAftNn
         4TKe/XRH7L8LVX0QD6JCD6c0x/2PZ9+lL4HpVIOoN1327wj2jQhuGXvwlDI2wllbwbcB
         Wacg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Tbl+o0FBCsTBj4CkROI9ysmcgdS1EFqniJjzP33wZX4=;
        fh=kV0Fy+DDWVjUJHbEGMv7ApIF/n/VVc3MnAg4z2Y28Vw=;
        b=fm5Etef6Mhhje1GA9gLX1jPw6A0Z44c2XerjoDHA2bGslq7YT2+Mn0arE+fe0wKp4O
         odNegeSuU9bR51PxoW5WMvaazFrKeb/p/BxYbpgGNAEMVBdGDy7xDSzUuts4s2UujwU4
         /YaHXlZkpFwmvWa1KNUrz44DyOr5ePVBEWt/CqK9pIeQ+9bXG5ApUDbhQTkaPx1TXMvJ
         Fu00rgpBwz0c3yniBKf76eCNpw4JggQTQTCnywK33RABkTgaHWh2KoxJ5Wjj2cMdCS+M
         /+FzfiEA8r+NYewwIej3eQVwJbcsM0ukaSZutVkqVtjiYYLN13MrF65Bi23SPX8tdE8i
         95UA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774076057; x=1774680857; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tbl+o0FBCsTBj4CkROI9ysmcgdS1EFqniJjzP33wZX4=;
        b=JZQKmF6k5rYg0j0+P6RcReaKDfDWviBBfuGbXwjdzoYML7KHZNbzGRl9DJ4Sn3xVsm
         YlkyGAN7IrOk16tA2GEJnGy/gSYLui8a1yWkhO8UY18plaWeew1bCH2FkbmGeYsgLKYL
         hVmiw+gbwiF4hqu5DwBo3YRSVU1mTpR0aGxrJGAboZGrscIclgEUXKMnLFDzZwkKfD3J
         1NhtoR7t54ZWxt4aa/zyvByyW/b4qSuGsK1RS6rk+aW5somftscHYPv6NQE9MIAh52qf
         yyfhGLnHpO3sJEsm6irNYn+uN5peYaleg9+Hokn1knqoNTJ+Ra5HkE8NIX9syr8W1O2a
         03XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774076057; x=1774680857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tbl+o0FBCsTBj4CkROI9ysmcgdS1EFqniJjzP33wZX4=;
        b=OdOli20GzkKkBvkypGJ9pV1uO/bObZIODukbTJZzH2NbKN82FlFT4kIx/YMgS7QFNt
         /wRpnU8kJQKRPyHJeDyzJpR2f/nbZAzcs91cdIPPdLcx/UOECG/C6etYOxVmy9OKYGHD
         PxwaSZA7t9kI6hwFqigqtI9gTSPdhqVQVv+anvodgMEHeAumrsYdfDLMOqfVgV+oSL+S
         8rWMfC8tpm8dBVDYxPMcduvh2A5MqqNGNVFj4PhA6BnAW3+4sEChTVLKrx2c2p7MyXEQ
         JnXhYhH9vcaz/IIaHxCT/rv5su1duPaWKgxa+v/yZHSryNSj8MrIn6MdtZpKGCXEpcyY
         bObA==
X-Forwarded-Encrypted: i=1; AJvYcCUdsx9lOftk9qGESaO2poZ0ZMAxWPCuXrlwH8n0A3X8CjLy5SPcCvjkx+AaKwtpNRBeWOVJ37Yt8HNi79uX@lists.linux.dev
X-Gm-Message-State: AOJu0YyposquAW7/p7nvK/DSm3lm159DJu+dwy4n4OVNyXRg/4KDfhsH
	x/wvmCLMP0PeMeMuqQgYcAIOM5AHY/GZjqmAsmYYaI465K40v9Tr+ByexUZByiyLY+AFvSXtOZp
	x6CEBZQPv3VYiufdmxgQ5lc2orp+bgfQ=
X-Gm-Gg: ATEYQzzq1WrAG2+rjr/eOKwXRmQhShEHYsoPqKqRg2IaIvqUqNDmTd8MhQHmSV/JX+W
	LZsfsqnzHjWYO06fKUMqWeP4ZpRD7lwYElP6E3JJD5r/obU0Q/uJd8i6GTz33ONJxZ2GBu8RbsK
	348QbgUHyAp9PQu+QYOCEdopQWzUGW4t9VxXlruvtpuJ/fqDjat+4cKwFMZrhUaBTpWGSu6L5b+
	N+YKh45V3j5BiJ6sf7zq3jYPdDSqeUYYzBaedIzFwjFqNcUjTqNHkQNhCIcFxZNPQmq/bhlYvjK
	4GdV1WQxyZ3zgrOe
X-Received: by 2002:a17:907:d109:b0:b96:f6f1:e7af with SMTP id
 a640c23a62f3a-b982f1ed7bdmr419710366b.9.1774076056402; Fri, 20 Mar 2026
 23:54:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260304100557.126488-1-linux.amoon@gmail.com> <9db109a657e18d1e5ead67d7db06cfaf68f7fa84.camel@ndufresne.ca>
In-Reply-To: <9db109a657e18d1e5ead67d7db06cfaf68f7fa84.camel@ndufresne.ca>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 21 Mar 2026 12:24:01 +0530
X-Gm-Features: AaiRm522SeNM1abZw4YAK4uXkmRkLpmLZXI60fMElcfZGsZpbYfOo6oOjvIO9yA
Message-ID: <CANAwSgQ0N3wmJF2s_fuQN8GWvoYrrgg09X2cMnGFiyM+5U641Q@mail.gmail.com>
Subject: Re: [PATCH v1] media: meson: vdec: Fix memory leak in error path of vdec_open
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Maxime Jourdan <mjourdan@baylibre.com>, 
	Hans Verkuil <hverkuil@kernel.org>, 
	"open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" <linux-media@vger.kernel.org>, 
	"open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	"moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

Thanks for your review comments.

On Fri, 20 Mar 2026 at 02:05, Nicolas Dufresne <nicolas@ndufresne.ca> wrote=
:
>
> Hi,
>
> Le mercredi 04 mars 2026 =C3=A0 15:35 +0530, Anand Moon a =C3=A9crit :
> > If vdec_init_ctrls(sess) fails, or any subsequent initialization step
> > during vdec_open fails, the control handler allocated for the session
> > is not released. This causes a memory leak of the v4l2_ctrl_handler
> > and its associated control objects.
> >
> > Add a call to v4l2_ctrl_handler_free() in the err_m2m_release error
> > path to ensure resources are properly reclaimed.
> >
> > unreferenced object 0xffff0000205d6878 (size 8):
> >   comm "v4l_id", pid 5289, jiffies 4294938580
> >   hex dump (first 8 bytes):
> >     40 d2 49 18 00 00 ff ff                          @.I.....
> >   backtrace (crc d3204599):
> >     kmemleak_alloc+0xc8/0xf0
> >     __kvmalloc_node_noprof+0x60c/0x850
> >     v4l2_ctrl_handler_init_class+0x1b4/0x2e8 [videodev]
> >     vdec_open+0x1f4/0x788 [meson_vdec]
> >     v4l2_open+0x144/0x460 [videodev]
> >     chrdev_open+0x1ac/0x500
> >     do_dentry_open+0x3f0/0xfe8
> >     vfs_open+0x68/0x320
> >     do_open+0x2d8/0x9a8
> >     path_openat+0x1d0/0x4f0
> >     do_filp_open+0x190/0x380
> >     do_sys_openat2+0xf8/0x1b0
> >     __arm64_sys_openat+0x13c/0x1e8
> >     invoke_syscall+0xdc/0x268
> >     el0_svc_common.constprop.0+0x178/0x258
> >     do_el0_svc+0x4c/0x70
> >
> > Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  drivers/staging/media/meson/vdec/vdec.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/=
media/meson/vdec/vdec.c
> > index 4b77ec1af5a7..a5ab0c2390f5 100644
> > --- a/drivers/staging/media/meson/vdec/vdec.c
> > +++ b/drivers/staging/media/meson/vdec/vdec.c
> > @@ -914,6 +914,7 @@ static int vdec_open(struct file *file)
> >       return 0;
> >
> >  err_m2m_release:
>
> This goto is used twice. The second time is when vdec_init_ctrls() fails,=
 and in
> that case the v4l2_m2m_ctx is leaded. Can you add the missing label and c=
all
> v4l2_m2m_ctx_release() accordingly. This way we don't have to revisit aga=
in.
>
Ok, understood, I will update this in the next version.

Thanks
-Anand
