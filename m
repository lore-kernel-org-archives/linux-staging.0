Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1E0389DFF
	for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 20:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773780409; cv=pass; b=YyaKyDZ17msdyT90tvpNSeh8Zuj25fgS8I+Xjb895FKg/OuU0ng7/6x9pzV244FDzs0FyTao6t6cJ1qoaigSGSvPI+CBdF7SeLaoYcWIt2xQRuj1GPQamB/HPqQGuaWhN1Gp60rggvQKSgXM4vB1TpHPaNZNk8hvBaBe9dlT0kk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773780409; c=relaxed/simple;
	bh=RK/TCms+LvhqFMYFVVVIbiPX2SpvDGczeYFrHJlFfsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hwMbLWDHTyq8V5nWzvvm55V0C8C8vJ5Z87uAbHe00qdIrNSBzvyUpp6ImNA5IfDt9v0BWvbWVtwrSz4imx1mMFQnOzVSUDdPutnInszHOlxQqg3owoBH+ona/udObROKPajjh7Ev7Ft+QEd0BBAo6iAfcpBDbi7eMylXzTvaFB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sTzcJWXI; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sTzcJWXI"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5091ed02c54so60351cf.1
        for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 13:46:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773780407; cv=none;
        d=google.com; s=arc-20240605;
        b=ONillSlbWu1tAqkNBfZ83qXhM0uL+uYUHK9Kv4JjWWFWnj648XV6fK8f/viBcu30ao
         oBPT3b2owkAdfWByrrWVD00ak63fTpJhh1w+RM43ZN/Rd313PflW/FFB/1tc3O2ApnI5
         TTWgcNqFqq8zPorgeW4vfFcTb6spkl6BThwYXLRZf6YWzm8cWJPJGG9SLvYBx7YiwJi2
         to8AcqAW3bXja0I2yIfXL6XWyBS4M9EV0erOFEP8EIxVBnlvDMbn7ijYo48Aq776W06j
         QA8ozP/zh+W54DLWksvJtceXPKJ1WbrGtgDMqEesMa2DUUjDiZtRv+Jv5aMKGbjvzY8O
         KHvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=puh87Pmz2QIedt98QmYFqHshzK8OJIco1FTLmkjNO+s=;
        fh=a+3YUHfcMyFhy8h80+9PJ+z9V6TUIHgLEF6epVLAV3I=;
        b=RKFlVD73fmxuD6jLW02eFwwCkq5tOJ0M6Ukh2+PjWQFgRwcBAmhREBHMOn9WKmHqQE
         CRyhES/hHC61Zn6aaOhMEuxmFdKK8bD+OExA0JMVgAX/eFNCAETQaN64P7+TWypSUMrT
         1QwrJX7s8h26XYJQJcRaDpzKunlMONFf2Q+t3D9FgopplKoitZafoIu0jAJuae6zTe0S
         /K+CtJeQzMnGniC7aaJilnTWczqS4RWWGytW1YvkalNyF8dYinKWEntpqEvExDKw6F9D
         KrSJ2H6DIsR8rsb5LDW1AXTXz2IahrkoT8eLGyU8GypgORHzBiyOA2+6LTdR/FSMDJSd
         PcEQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773780407; x=1774385207; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puh87Pmz2QIedt98QmYFqHshzK8OJIco1FTLmkjNO+s=;
        b=sTzcJWXIvvh0ZP+LbgG3oARfmRAodd2hlR0qHRc8QZ8nVD4m37Ncn5Mqy8FGSH/ddo
         GMeNXto7DCBC2wFfPlD4uaMlqggTQq+Q3VX3BxaGZOsV2LYD/Z1HVTFMpfglymlzQXtb
         4Zn0M8mZWL7EXKZV7POGbDB/6LpZeJfbM0A9Mgarmhl6zNw8Ysi1ZpiUwpvqx5IQSoxm
         kcrkV7yiM2f3Z9BExPaNFXCJhtvpG91lTOKR3LbeafoRplgWqStpD8kXQUEtJHIX04Ib
         lbGrt7QjlYrP1256viGzG7vwhGBgTKT5Hy3idGTaZC0E+HPWol5gj/thq+/sj5vC5c80
         EUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773780407; x=1774385207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=puh87Pmz2QIedt98QmYFqHshzK8OJIco1FTLmkjNO+s=;
        b=qNdvSWJmjgbOVdkSl1M0GucNhfpAsY7usFHD7+9pXHQ5LON2sg5eBh+7pMGtzxjfqr
         Fj+gPNPbLmsIxeqdKZDKIxEsgOwGgiYqY2JYYywrtQIHJc+VAGoSGfum8HmG6yuE2z1U
         s1eL6g2JRbOF0c5jtcQriRyJHNIcdovFuu1LMz3A6Dl3XPwsP2r2vQH7JlaPUh/hL3x8
         wK6mu908HGRaPawBx870r8I1zF8CGN7eqNbaf0iM6lmW8NiEl4U23UCRKPfs5Lu2BOnB
         9HDJEfP2Q+hXatMBkO6no4nLJgDs68ZnSE153JIZ2KztcXzKCCwgEW4rXIodbimW4nSq
         XEEw==
X-Forwarded-Encrypted: i=1; AJvYcCWELGu0kplfi77mQsN6NS8x9h5VHPp0q6SzRNONKdWZthRJnPVvwO3epKLmIEmI9q7pFof9RZO6IsVrzXcQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5Y8BibNIFh4eobdBLWG4q5W9uJmI4J5wPjLuwrpoClA0Mw8dy
	22I4ShAo8hoTwGVM2naev3yw23hj9o5bFk/HKLYuMAUWC4W8wvboItenyafE7xHu1nzjLWYzbGF
	1TObUdF4rtkfRcXg9ni7ak3FP9rsQJlT47vofDjnn
X-Gm-Gg: ATEYQzyVnBWF2Jvs0YoNJLmp2Lfld4y7maH5SB4kYjkdm4nsX2uorpQQMrsug/OeYzD
	95l8wCvl2Guz3X8AMqq2oW2KvAytpv2gAd5K5FhtWtxRjNhTFmYAUZYCot3msR0+oZQ+cbXPLLn
	D0k5VzFXhaL13iHRZTZrwg9I5z85zAP+NUpT2fqu0GxouISzwb6LbykxIg01YxxacjFS9xpR4s+
	rfsQcyTyJGxomdFdT33b6VoTRER+YBSLjPfjUZP+fuRBY9Gsc33q8veIIRuCvsz9KIpepmbedN0
	tRlZ2AYCxJCXRFZKEEXX8RL/xtHpv/0JPNhHKA==
X-Received: by 2002:a05:622a:130f:b0:509:371:f2ab with SMTP id
 d75a77b69052e-50b14848d70mr3924821cf.16.1773780406374; Tue, 17 Mar 2026
 13:46:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org> <d34056a65bd387286f4e155d52449106ddc99f78.1773695307.git.ljs@kernel.org>
In-Reply-To: <d34056a65bd387286f4e155d52449106ddc99f78.1773695307.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Mar 2026 13:46:34 -0700
X-Gm-Features: AaiRm50ZSv0JOBEsyaTpLpUZLAlSOUqng_UaLNmSO0lPuUbLHyEvRlv0uikpAUM
Message-ID: <CAJuCfpH653zdE=mXArpx8BUszVVC1PoN+rvp+WxdM3aAUbpqRw@mail.gmail.com>
Subject: Re: [PATCH v2 10/16] stm: replace deprecated mmap hook with mmap_prepare
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "K . Y . Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Bodo Stroesser <bostroesser@gmail.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, David Howells <dhowells@redhat.com>, 
	Marc Dionne <marc.dionne@auristor.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, David Hildenbrand <david@kernel.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	Ryan Roberts <ryan.roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 2:14=E2=80=AFPM Lorenzo Stoakes (Oracle) <ljs@kerne=
l.org> wrote:
>
> The f_op->mmap interface is deprecated, so update driver to use its
> successor, mmap_prepare.
>
> The driver previously used vm_iomap_memory(), so this change replaces it
> with its mmap_prepare equivalent, mmap_action_simple_ioremap().
>
> Also, in order to correctly maintain reference counting, add a
> vm_ops->mapped callback to increment the reference count when successfull=
y
> mapped.
>
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  drivers/hwtracing/stm/core.c | 31 +++++++++++++++++++++----------
>  1 file changed, 21 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
> index 37584e786bb5..f48c6a8a0654 100644
> --- a/drivers/hwtracing/stm/core.c
> +++ b/drivers/hwtracing/stm/core.c
> @@ -666,6 +666,16 @@ static ssize_t stm_char_write(struct file *file, con=
st char __user *buf,
>         return count;
>  }
>
> +static int stm_mmap_mapped(unsigned long start, unsigned long end, pgoff=
_t pgoff,
> +                          const struct file *file, void **vm_private_dat=
a)
> +{
> +       struct stm_file *stmf =3D file->private_data;
> +       struct stm_device *stm =3D stmf->stm;
> +
> +       pm_runtime_get_sync(&stm->dev);
> +       return 0;
> +}
> +
>  static void stm_mmap_open(struct vm_area_struct *vma)
>  {
>         struct stm_file *stmf =3D vma->vm_file->private_data;
> @@ -684,12 +694,14 @@ static void stm_mmap_close(struct vm_area_struct *v=
ma)
>  }
>
>  static const struct vm_operations_struct stm_mmap_vmops =3D {
> +       .mapped =3D stm_mmap_mapped,
>         .open   =3D stm_mmap_open,
>         .close  =3D stm_mmap_close,
>  };
>
> -static int stm_char_mmap(struct file *file, struct vm_area_struct *vma)
> +static int stm_char_mmap_prepare(struct vm_area_desc *desc)
>  {
> +       struct file *file =3D desc->file;
>         struct stm_file *stmf =3D file->private_data;
>         struct stm_device *stm =3D stmf->stm;
>         unsigned long size, phys;
> @@ -697,10 +709,10 @@ static int stm_char_mmap(struct file *file, struct =
vm_area_struct *vma)
>         if (!stm->data->mmio_addr)
>                 return -EOPNOTSUPP;
>
> -       if (vma->vm_pgoff)
> +       if (desc->pgoff)
>                 return -EINVAL;
>
> -       size =3D vma->vm_end - vma->vm_start;
> +       size =3D vma_desc_size(desc);
>
>         if (stmf->output.nr_chans * stm->data->sw_mmiosz !=3D size)
>                 return -EINVAL;
> @@ -712,13 +724,12 @@ static int stm_char_mmap(struct file *file, struct =
vm_area_struct *vma)
>         if (!phys)
>                 return -EINVAL;
>
> -       pm_runtime_get_sync(&stm->dev);
> -
> -       vma->vm_page_prot =3D pgprot_noncached(vma->vm_page_prot);
> -       vm_flags_set(vma, VM_IO | VM_DONTEXPAND | VM_DONTDUMP);
> -       vma->vm_ops =3D &stm_mmap_vmops;
> -       vm_iomap_memory(vma, phys, size);
> +       desc->page_prot =3D pgprot_noncached(desc->page_prot);
> +       vma_desc_set_flags(desc, VMA_IO_BIT, VMA_DONTEXPAND_BIT,
> +                          VMA_DONTDUMP_BIT);
> +       desc->vm_ops =3D &stm_mmap_vmops;
>
> +       mmap_action_simple_ioremap(desc, phys, size);
>         return 0;
>  }
>
> @@ -836,7 +847,7 @@ static const struct file_operations stm_fops =3D {
>         .open           =3D stm_char_open,
>         .release        =3D stm_char_release,
>         .write          =3D stm_char_write,
> -       .mmap           =3D stm_char_mmap,
> +       .mmap_prepare   =3D stm_char_mmap_prepare,
>         .unlocked_ioctl =3D stm_char_ioctl,
>         .compat_ioctl   =3D compat_ptr_ioctl,
>  };
> --
> 2.53.0
>
