Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA881A6817
	for <linux-staging@lists.linux.dev>; Sat, 13 Jun 2026 19:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781378121; cv=pass; b=Uka7whruiinVAeDbJJ5MNNgEuCvIkklVTBFIKcXs4c7RcH9urnDTGCeLsxNNZVnEhBVrXhXKukYSDbuMjGpIv21I0/A0NfBNgLOdvIeasAkZhZ5GUbVreNnN/5EKcQ0+wm/3IA7Od6TjfihqMKkn3lTWIVo/vCizPLujMacOFp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781378121; c=relaxed/simple;
	bh=KM5Qf8IcukoP9exOeIUkV1KLefZ/AF3fZN4wnS0EUeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TyFmZbn/+SR90wy/JV/vtu6L+ZSKzWtsnq8ycK1zwJJLkz2VTbmt27DwTnUNroxT2QJMR4/yK8g4MlwAat6mXrP6RjABGk8ZUrZG61dvKmwE/n7GsowuJu3hWT9e3WQ8LBXd1Hk70mtO3HfWYFiqkdL69sI3ofg4kCZvPWKakng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XpNfaKyU; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XpNfaKyU"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bec429c2bb1so293703366b.1
        for <linux-staging@lists.linux.dev>; Sat, 13 Jun 2026 12:15:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781378118; cv=none;
        d=google.com; s=arc-20240605;
        b=AvJfbhotfIBlpNTnIQkiBrIfU3rmAhjARUSOSdOIwCAsTmZrcxuJvs0nccMkEyLHin
         2wCXqfC7Gb45/YGMaD8qbzWqNTyYuusnP8xw3RkHtlcx1j93FesJZajBDCSPs6blnXxv
         /qJKeiZw3t4Ti3EQYITaJH3Iuos710nLsq4RgzWarh7eOL9fedpFm+e8UU1/OtoPLOM2
         /ftLfbgJ2eYXQFoy7LeAy/jcs0fS+Rdq3GWaDKciHWAyIlx4ECd7U6wdCOqtYRQ5j8tv
         WsIRCuK7K472V5muSJSzdltcB6ltEaaPIc+SksxCdapGfTlKVeqnLUwkLU6qWZv14zzz
         VEVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gRrXmp1TB9x8FhYANwmYNqe1NtmxJ8SE9yU4lYafYsA=;
        fh=1MwDfc3C1GnPJPYrYRCsQTVbnC4dGhGgcEQpAvCF5Ys=;
        b=Hb/H+TCpYsYu8Lzej9O1meaeRY/KuuCMejGU8nuTFcoF8YFoqaFF8Q7ZREpVKmbSLT
         7qugNVCMot7khMbAI5lvTH++qw9DsRuDl3LlCllwmuglPR9G08jwNJrb9orWNa0iXPRs
         BikYUusczpO3wGY6UX7rEGiYXxvrPczR8ppg4O3hljghrqmxWGM2VC8o6cHoVYNar44V
         Zga9H3PwtrO7feqvDMSoy3yhkF9UT+JVumT/KkidxmH6oiobSpG/bLpkkKR9JoOg6FVF
         fH9JV69PpzTGdteGVLTYZ4fPnvjS6kSW/eK5OSswyeTSfiLDpmjL3N4NDIHYEdWLXjIF
         GcUw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781378118; x=1781982918; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRrXmp1TB9x8FhYANwmYNqe1NtmxJ8SE9yU4lYafYsA=;
        b=XpNfaKyUOvFIL8C6h5dNWB6kbqT9+EYe7QQDp789sA6Z950LmV56ccTGZZ4PziVfan
         AgS/iaythBNl0LkJvGr0Jw4B6PeO4We6aiEMrfGwn0nhB6kGYI5Ei3hxoqsc6CpZ2f/y
         Qx1xe3wmrSt9oZnj+lichx/n1GFIsIkou6zEfW0QsQM2OqMT93WvHKgphXNxIrzEhmBy
         TaCju1ULiE8VJmNyqWthjH0haJ6o54rxWhXD2p4kqcuepJVOTFTRGezlQmNDoOXI2rdW
         /Mp3BJK4TEgtwNqgNDdy8XMfwGT92TDgzAow8ePZP6Jg8dbCKbk+6kYMN5tS1dPbvO54
         2toA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781378118; x=1781982918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gRrXmp1TB9x8FhYANwmYNqe1NtmxJ8SE9yU4lYafYsA=;
        b=cO3DTIYZDmC+Ca5sHI7TfS4reW+fIxi92j/xpqyuzvoFjAjIHNpcWgzizI6dkugRSB
         /thmha7Ei8P1rjohczOqYNJnze4/w5t+2taFWkq+F7aAkUYCKl8Omr50AVEBh6sNTRN+
         /zAGUwJq4eDXcPLUl28j5cOGej3p+mhSXc/9shEiVLyV36iUe1QZsuf0hHI/ZsiqY0K/
         zDa0Yf4T06CgMEZLoxO6FCkpk3p6LIGcAUygKBNwICVoyg11WoacEaldqCW8nC1twvFP
         vwqs17dH2I0G/Qe3VfsY3kF6vEKUv+bHU549ZtZVvy+sQvH3r4Whtap/jTTGVMgQ92dO
         /OfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xxesTKjDRSBrqUy+ehSN7knpxB3yXAem/C5HZtdLFC/Av7NSqRH+ItkOwVNycREHRm+5JDgB6ZARlWcFY@lists.linux.dev
X-Gm-Message-State: AOJu0YxqNueGPjiljj8Ne/O2tAWMrsS9O5GFriBpJ0QVCjD7VbFYpwZo
	l9XPHeYeI1JqUEnNw+9VrD9LWseN+Yci8r3I8Y8fYSP+FglF2FqErZS8ZqGLkNTAa3UIjOuHa0q
	MMG4U65mlGUc5VVSewQlL4vnI3e09M+M=
X-Gm-Gg: Acq92OEe8xzz/JTYGSmsyJqRTPlVM4lXV5c5EadvAecE0ojLim6qP5ze2h3geZcmDcT
	y7q5gtT2Smi+8OZiRM4Y/+gXac5vS+IXHannywg92VI/qKcY0X5PLbEYpbJ3RGU4lNssRpu6kOe
	/wskGdTmrytnXCXH3Z5y1pkvs+Y12c7JaN12ya1PhUjBiru4f8n8KzqIiF9robfLlo8JnmauWXZ
	5U5M+BmnJy4/TfeIYffz484P4fLMjRyjvNB+LG1Mljbq8HQAMHdh2qnrntf3V8pLJJtBYOIPIGz
	ak4+rZtBkIRbR4sx7InPfwoMaXXMzCFcJtNEww==
X-Received: by 2002:a17:907:7ba2:b0:bee:9809:3ccd with SMTP id
 a640c23a62f3a-bff499220e7mr230874866b.4.1781378117955; Sat, 13 Jun 2026
 12:15:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529111927.14138-1-neharora23587@gmail.com> <CAOWJOptv1JcOGcEt39HVy7LkpAsvzbw9yj64kJG+X5J=VbWrMA@mail.gmail.com>
In-Reply-To: <CAOWJOptv1JcOGcEt39HVy7LkpAsvzbw9yj64kJG+X5J=VbWrMA@mail.gmail.com>
From: neha arora <neharora23587@gmail.com>
Date: Sun, 14 Jun 2026 00:45:05 +0530
X-Gm-Features: AVVi8CdZ2hBYy2R3pen1MThHg0ehnRxeApw9ackzpdndzMPMAZnrBSG0y53Dj9g
Message-ID: <CAOWJOps9RBNAGsPFsBCbzFkEUN1=75YvwmqJX6RdQBbt1C6W-Q@mail.gmail.com>
Subject: Re: [PATCH v3] staging: sm750fb: rename pv_reg to io_base
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, 
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

Just following up on this patch to ensure it didn't get lost in the queue.
Please let me know if any changes or a V4 are needed.

Thanks,
Onish


On Sat, Jun 13, 2026 at 11:29=E2=80=AFAM neha arora <neharora23587@gmail.co=
m> wrote:
>
> Hi everyone,
>
> Just following up on this patch to ensure it didn't get lost in the queue=
.
> Please let me know if any changes or a V4 are needed.
>
> Thanks,
> Onish
>
> On Fri, May 29, 2026, 4:49=E2=80=AFPM Onish Sharma <neharora23587@gmail.c=
om> wrote:
>>
>> Rename pv_reg to io_base to follow kernel naming style and improve
>> readability.
>>
>> No functional changes intended.
>>
>> Signed-off-by: Onish Sharma <neharora23587@gmail.com>
>> ---
>> Changes in v3:
>> - Added mandatory Signed-off-by line.
>> - Rename pv_reg to io_base to remove hungarian notation
>>
>>  drivers/staging/sm750fb/sm750.c    |  4 ++--
>>  drivers/staging/sm750fb/sm750.h    |  2 +-
>>  drivers/staging/sm750fb/sm750_hw.c | 12 ++++++------
>>  3 files changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/s=
m750.c
>> index 716a8935f58d..c2d2864f135b 100644
>> --- a/drivers/staging/sm750fb/sm750.c
>> +++ b/drivers/staging/sm750fb/sm750.c
>> @@ -743,7 +743,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, i=
nt index)
>>          * must be set after crtc member initialized
>>          */
>>         crtc->cursor.offset =3D crtc->o_screen + crtc->vidmem_size - 102=
4;
>> -       crtc->cursor.mmio =3D sm750_dev->pv_reg +
>> +       crtc->cursor.mmio =3D sm750_dev->io_base +
>>                 0x800f0 + (int)crtc->channel * 0x140;
>>
>>         crtc->cursor.max_h =3D 64;
>> @@ -1047,7 +1047,7 @@ static void lynxfb_pci_remove(struct pci_dev *pdev=
)
>>         sm750fb_framebuffer_release(sm750_dev);
>>         arch_phys_wc_del(sm750_dev->mtrr.vram);
>>
>> -       iounmap(sm750_dev->pv_reg);
>> +       iounmap(sm750_dev->io_base);
>>         iounmap(sm750_dev->vmem);
>>         pci_release_region(pdev, 1);
>>         kfree(g_settings);
>> diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/s=
m750.h
>> index e8885133da2e..c42800313c6a 100644
>> --- a/drivers/staging/sm750fb/sm750.h
>> +++ b/drivers/staging/sm750fb/sm750.h
>> @@ -97,7 +97,7 @@ struct sm750_dev {
>>         unsigned long vidreg_start;
>>         __u32 vidmem_size;
>>         __u32 vidreg_size;
>> -       void __iomem *pv_reg;
>> +       void __iomem *io_base;
>>         unsigned char __iomem *vmem;
>>         /* locks*/
>>         spinlock_t slock;
>> diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750f=
b/sm750_hw.c
>> index 95f797e5776a..dc1118808b4f 100644
>> --- a/drivers/staging/sm750fb/sm750_hw.c
>> +++ b/drivers/staging/sm750fb/sm750_hw.c
>> @@ -23,18 +23,18 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct=
 pci_dev *pdev)
>>         }
>>
>>         /* now map mmio and vidmem */
>> -       sm750_dev->pv_reg =3D
>> +       sm750_dev->io_base =3D
>>                 ioremap(sm750_dev->vidreg_start, sm750_dev->vidreg_size)=
;
>> -       if (!sm750_dev->pv_reg) {
>> +       if (!sm750_dev->io_base) {
>>                 dev_err(&pdev->dev, "mmio failed\n");
>>                 ret =3D -EFAULT;
>>                 goto err_release_region;
>>         }
>>
>> -       sm750_dev->accel.dpr_base =3D sm750_dev->pv_reg + DE_BASE_ADDR_T=
YPE1;
>> -       sm750_dev->accel.dp_port_base =3D sm750_dev->pv_reg + DE_PORT_AD=
DR_TYPE1;
>> +       sm750_dev->accel.dpr_base =3D sm750_dev->io_base + DE_BASE_ADDR_=
TYPE1;
>> +       sm750_dev->accel.dp_port_base =3D sm750_dev->io_base + DE_PORT_A=
DDR_TYPE1;
>>
>> -       mmio750 =3D sm750_dev->pv_reg;
>> +       mmio750 =3D sm750_dev->io_base;
>>         sm750_set_chip_type(sm750_dev->devid, sm750_dev->revid);
>>
>>         sm750_dev->vidmem_start =3D pci_resource_start(pdev, 0);
>> @@ -58,7 +58,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct p=
ci_dev *pdev)
>>         return 0;
>>
>>  err_unmap_reg:
>> -       iounmap(sm750_dev->pv_reg);
>> +       iounmap(sm750_dev->io_base);
>>  err_release_region:
>>         pci_release_region(pdev, 1);
>>         return ret;
>> --
>> 2.54.0
