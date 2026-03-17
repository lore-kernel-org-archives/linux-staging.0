Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82ABF391825
	for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 21:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773782797; cv=pass; b=gHvxAXhkBL7BakR1Q87mV+vO07yE/4Jxi2rKdfy6QpYbGmxrA2TYZgBnqudpPOrsTEG8yPNnOk6SalyLq9muy7qLeNQCX7T+KImfH6iGb6c0lxEH4xlf4qgVSx5b9UQCKp9T59ESwAEfCObPQcBZrOa6WqBTWPW9yPQ7Z/4vG4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773782797; c=relaxed/simple;
	bh=LDRxpmDHqVACRLxJTnLszzlV2/NLpmV53JWM+2p1hpQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bo+7oO9rmAP1Ntlcxf4xUWZgq/Y0z/ebxud/4tdFcRKYxQNnBej+1Lfpg++staIApkldN1lp+DR43VWNZoyTTC/7fUhWAGyDxxL1n2S8LPCdajPogRin3WVipfUiMv/+ePohEoX25Jsy2MspRQ+46dpKJXWUnBA9ytlxgFYP7nY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XmUnBCk6; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XmUnBCk6"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5091ed02c54so85881cf.1
        for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 14:26:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773782793; cv=none;
        d=google.com; s=arc-20240605;
        b=GT2XEFxl8o2HGXWsmz+bad/q1r56tdtuzDm5pV03Tm9juYPWh/WVGQmmxlPl/SGQVV
         KtztnWyw0cx6RMZaN1ol7a0WCTvwnY6EVHCJCzDaXfZJpLRFhYz2Xj0IsC7NUVTzrRcz
         j/bxEVEK1JfLfPrqwjPgjOq8ieLJiKfDgKwD9pc2aI7w1rYWNqz/04VbP9ZWIM4FWYeU
         wj6Q+y4/ZvxHsjocUzh1XlwZqM9uyIMyJFMY5YT3gJGLOF62hfL+qXnezxVAwbuHb4sP
         S6aH4OgrTAZMMdGeGasCIoVRVvs8mznHYBGNXXEDd0O5++Eyd2RoFKbdMeQCVuweE6EC
         3t7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O9MljJMIpne7nbSW7i1x1Or1SMzjT+hBLrQOgGeQvrk=;
        fh=lfI2fAg1ovz44ZviLIBsVtN2O5YYEm9xeVIRzrWkJVk=;
        b=OsraIMW4xwCTPRkXpdRM3ANpY/RcUcOM4Qm1ZYLZ6rkZhF2qZYDOnhvKvzpjlit9AF
         T1KSQL0hjDJ8IzAApPT4ae+8g6UREgfFQCJ7BuYX1QqPZ4foPhG+SZGRxVoghOAt152t
         jQzrxzKv+NLXTWiuZhk1uJ1xGxyJ4O+cCEwxaO9opXRgdRE22GSjyyE8paLSLNRoSgUn
         GRAcL+CqU9AVxU9RIUIJrsuY5TfS/U4PIP1nCE68NPV8m0tO5b0pQu8Mzh765d3hPeev
         PC+E1vYI+y1doXURBSpuwSNzopx9kXyYRrdBSVe8cuy8KLzHeRPeyYR8S0/tV4FuQhlO
         unWw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773782793; x=1774387593; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9MljJMIpne7nbSW7i1x1Or1SMzjT+hBLrQOgGeQvrk=;
        b=XmUnBCk6aK8ACiOTTX9Vx6f+bnUo3/P4ApVHt9Q2v17Sk/KrTz5eiJRdtbUTjuZo5r
         7WIiPcDncfb6RQR8iz5s1Enkr4qvFjvSTsQ6Xb2i29IepL9HCA9f7Z+hdTu8DEB6Y47I
         4xAhfY4Is7m1jyYHQsi8eqMpKTf6OZt63eYKmQ9zMJz7g9T9XX9cgRhdasQ9Hd9ylust
         0qHI1rNbg4Xfcd3ASYK0ZgzO7YjsBgvuprG1bMvenfZcZbVPgMiLt7FFMCnPFuZZUmtd
         /2eS3LzsNAnmiT7eFYWbmD40urnD4GUUlGL4aY0+JbNQ7u0834IToK4wgKk4JtpSHNKi
         UaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773782793; x=1774387593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O9MljJMIpne7nbSW7i1x1Or1SMzjT+hBLrQOgGeQvrk=;
        b=UD7NPrkjzQvXa9iDa31zxGFq73+6/feOZxRHC3NdT5krphTbQHRe/zMZ7XzSq3FkuU
         lwxmT8nMvzmlrFE64izNEbmpXu50nS0SqI9iA8lRShnI3HWxnMiHwbwo1806z0C/P+Pw
         ZQcoJ9hplg4UZgz0RrexE/oGQtoXCLkcOX9blkigtPa4kPTGZR5LspPR5SardJ6XjHvd
         nM5Km+GKsKJ2e46nXG5c4y2+hdTYD3djEd88ThwsxTACVHbI4dk9iNZxPBk1fcTnFdf6
         tf1M0p0nT8pAXT/7H9n/dwSau5jxDr9F87ILuqiH4iyfOZD/IUPc8A1YSZ/p5GiJ1E93
         Zdiw==
X-Forwarded-Encrypted: i=1; AJvYcCXPEnTc/9gBOUV9kQMd6VUlzXyblxLpTseqM+RXnfuGrdT/ibAGh0ed+eoygaR2lRB7Pfqu+hVGxlCAP9Ro@lists.linux.dev
X-Gm-Message-State: AOJu0Yzpu/Wc/ILTicMrkcP6LLAqc4BQXSO904gLJwOpk4PFJOXZNJ+2
	XtUXy7aCDP4Nb1v+J/FRQHe3Xgh7hQQvjkjD2v+6Q1CXWHKoIQp3mUTjlP5T7/+uUNza2PRtCEP
	B+TeHx+cwmwS4oFmQya6Tl05KocHoI1m40EZCFNZz
X-Gm-Gg: ATEYQzzV30qtxO7pxXDvZSuxSzvqqwR50ubgeKB2bc/pXT4t4iz28G+KsvPJyVW5d2N
	SPenhXtNzaYzIQo5a/a5JFZgI1Wlxyc/4IRQS8kWHN+Kgqx7QRiGOXbvBSmxECll+UMjmA6m5Qf
	ZFlzSm2cAN/O63KXBzYwelwJiI2bTxAnW1twD3CcU7y8ktf9rK0wniDAyBWjYXTLXmkwPCBWpQF
	XzJdZz4cYJH8Lxyyml/cixSLiXZTc9rbEbHFL3QScW5M3ARExvjfUMUz7Nfm8UAziwSoSOPucLA
	e8BlXFLeR7A22Uiry8gusrsw0PtC9k4oBI8TVg==
X-Received: by 2002:a05:622a:614:b0:509:1eca:6d24 with SMTP id
 d75a77b69052e-50b1470ee58mr4568251cf.2.1773782792685; Tue, 17 Mar 2026
 14:26:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org> <48c6d25e374b57dba6df4fdddd4830d3fc1105be.1773695307.git.ljs@kernel.org>
In-Reply-To: <48c6d25e374b57dba6df4fdddd4830d3fc1105be.1773695307.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Mar 2026 14:26:21 -0700
X-Gm-Features: AaiRm51SJauRxJyG8YD3YuiOnfN0s_6akSz6AhkIFbo6vEz-Gt-mAXyXfHq04tA
Message-ID: <CAJuCfpFXuHg4KPY27pqMC-xV5y9ZY2W72_R8_rxO0DvrJ=_yvw@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] staging: vme_user: replace deprecated mmap hook
 with mmap_prepare
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
> Functions that wrap mmap() are also converted to wrap mmap_prepare()
> instead.
>
> Also update the documentation accordingly.
>
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> ---
>  Documentation/driver-api/vme.rst    |  2 +-
>  drivers/staging/vme_user/vme.c      | 20 +++++------
>  drivers/staging/vme_user/vme.h      |  2 +-
>  drivers/staging/vme_user/vme_user.c | 51 +++++++++++++++++------------
>  4 files changed, 42 insertions(+), 33 deletions(-)
>
> diff --git a/Documentation/driver-api/vme.rst b/Documentation/driver-api/=
vme.rst
> index c0b475369de0..7111999abc14 100644
> --- a/Documentation/driver-api/vme.rst
> +++ b/Documentation/driver-api/vme.rst
> @@ -107,7 +107,7 @@ The function :c:func:`vme_master_read` can be used to=
 read from and
>
>  In addition to simple reads and writes, :c:func:`vme_master_rmw` is prov=
ided to
>  do a read-modify-write transaction. Parts of a VME window can also be ma=
pped
> -into user space memory using :c:func:`vme_master_mmap`.
> +into user space memory using :c:func:`vme_master_mmap_prepare`.
>
>
>  Slave windows
> diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vm=
e.c
> index f10a00c05f12..7220aba7b919 100644
> --- a/drivers/staging/vme_user/vme.c
> +++ b/drivers/staging/vme_user/vme.c
> @@ -735,9 +735,9 @@ unsigned int vme_master_rmw(struct vme_resource *reso=
urce, unsigned int mask,
>  EXPORT_SYMBOL(vme_master_rmw);
>
>  /**
> - * vme_master_mmap - Mmap region of VME master window.
> + * vme_master_mmap_prepare - Mmap region of VME master window.
>   * @resource: Pointer to VME master resource.
> - * @vma: Pointer to definition of user mapping.
> + * @desc: Pointer to descriptor of user mapping.
>   *
>   * Memory map a region of the VME master window into user space.
>   *
> @@ -745,12 +745,13 @@ EXPORT_SYMBOL(vme_master_rmw);
>   *         resource or -EFAULT if map exceeds window size. Other generic=
 mmap
>   *         errors may also be returned.
>   */
> -int vme_master_mmap(struct vme_resource *resource, struct vm_area_struct=
 *vma)
> +int vme_master_mmap_prepare(struct vme_resource *resource,
> +                           struct vm_area_desc *desc)
>  {
> +       const unsigned long vma_size =3D vma_desc_size(desc);
>         struct vme_bridge *bridge =3D find_bridge(resource);
>         struct vme_master_resource *image;
>         phys_addr_t phys_addr;
> -       unsigned long vma_size;
>
>         if (resource->type !=3D VME_MASTER) {
>                 dev_err(bridge->parent, "Not a master resource\n");
> @@ -758,19 +759,18 @@ int vme_master_mmap(struct vme_resource *resource, =
struct vm_area_struct *vma)
>         }
>
>         image =3D list_entry(resource->entry, struct vme_master_resource,=
 list);
> -       phys_addr =3D image->bus_resource.start + (vma->vm_pgoff << PAGE_=
SHIFT);
> -       vma_size =3D vma->vm_end - vma->vm_start;
> +       phys_addr =3D image->bus_resource.start + (desc->pgoff << PAGE_SH=
IFT);
>
>         if (phys_addr + vma_size > image->bus_resource.end + 1) {
>                 dev_err(bridge->parent, "Map size cannot exceed the windo=
w size\n");
>                 return -EFAULT;
>         }
>
> -       vma->vm_page_prot =3D pgprot_noncached(vma->vm_page_prot);
> -
> -       return vm_iomap_memory(vma, phys_addr, vma->vm_end - vma->vm_star=
t);
> +       desc->page_prot =3D pgprot_noncached(desc->page_prot);
> +       mmap_action_simple_ioremap(desc, phys_addr, vma_size);
> +       return 0;
>  }
> -EXPORT_SYMBOL(vme_master_mmap);
> +EXPORT_SYMBOL(vme_master_mmap_prepare);
>
>  /**
>   * vme_master_free - Free VME master window
> diff --git a/drivers/staging/vme_user/vme.h b/drivers/staging/vme_user/vm=
e.h
> index 797e9940fdd1..b6413605ea49 100644
> --- a/drivers/staging/vme_user/vme.h
> +++ b/drivers/staging/vme_user/vme.h
> @@ -151,7 +151,7 @@ ssize_t vme_master_read(struct vme_resource *resource=
, void *buf, size_t count,
>  ssize_t vme_master_write(struct vme_resource *resource, void *buf, size_=
t count, loff_t offset);
>  unsigned int vme_master_rmw(struct vme_resource *resource, unsigned int =
mask, unsigned int compare,
>                             unsigned int swap, loff_t offset);
> -int vme_master_mmap(struct vme_resource *resource, struct vm_area_struct=
 *vma);
> +int vme_master_mmap_prepare(struct vme_resource *resource, struct vm_are=
a_desc *desc);
>  void vme_master_free(struct vme_resource *resource);
>
>  struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 route);
> diff --git a/drivers/staging/vme_user/vme_user.c b/drivers/staging/vme_us=
er/vme_user.c
> index d95dd7d9190a..11e25c2f6b0a 100644
> --- a/drivers/staging/vme_user/vme_user.c
> +++ b/drivers/staging/vme_user/vme_user.c
> @@ -446,24 +446,14 @@ static void vme_user_vm_close(struct vm_area_struct=
 *vma)
>         kfree(vma_priv);
>  }
>
> -static const struct vm_operations_struct vme_user_vm_ops =3D {
> -       .open =3D vme_user_vm_open,
> -       .close =3D vme_user_vm_close,
> -};
> -
> -static int vme_user_master_mmap(unsigned int minor, struct vm_area_struc=
t *vma)
> +static int vme_user_vm_mapped(unsigned long start, unsigned long end, pg=
off_t pgoff,
> +                             const struct file *file, void **vm_private_=
data)
>  {
> -       int err;
> +       const unsigned int minor =3D iminor(file_inode(file));
>         struct vme_user_vma_priv *vma_priv;
>
>         mutex_lock(&image[minor].mutex);
>
> -       err =3D vme_master_mmap(image[minor].resource, vma);
> -       if (err) {
> -               mutex_unlock(&image[minor].mutex);
> -               return err;
> -       }
> -

Ok, this changes the set of the operations performed under image[minor].mut=
ex.
Before we had:

mutex_lock(&image[minor].mutex);
vme_master_mmap();
<some final adjustments>
mutex_unlock(&image[minor].mutex);

Now we have:

mutex_lock(&image[minor].mutex);
vme_master_mmap_prepare()
mutex_unlock(&image[minor].mutex);
vm_iomap_memory();
mutex_lock(&image[minor].mutex);
vme_user_vm_mapped(); // <some final adjustments>
mutex_unlock(&image[minor].mutex);

I think as long as image[minor] does not change while we are not
holding the mutex we should be safe, and looking at the code it seems
to be the case. But I'm not familiar with this driver and might be
wrong. Worth double-checking.

>         vma_priv =3D kmalloc_obj(*vma_priv);
>         if (!vma_priv) {
>                 mutex_unlock(&image[minor].mutex);
> @@ -472,22 +462,41 @@ static int vme_user_master_mmap(unsigned int minor,=
 struct vm_area_struct *vma)
>
>         vma_priv->minor =3D minor;
>         refcount_set(&vma_priv->refcnt, 1);
> -       vma->vm_ops =3D &vme_user_vm_ops;
> -       vma->vm_private_data =3D vma_priv;
> -
> +       *vm_private_data =3D vma_priv;
>         image[minor].mmap_count++;
>
>         mutex_unlock(&image[minor].mutex);
> -
>         return 0;
>  }
>
> -static int vme_user_mmap(struct file *file, struct vm_area_struct *vma)
> +static const struct vm_operations_struct vme_user_vm_ops =3D {
> +       .mapped =3D vme_user_vm_mapped,
> +       .open =3D vme_user_vm_open,
> +       .close =3D vme_user_vm_close,
> +};
> +
> +static int vme_user_master_mmap_prepare(unsigned int minor,
> +                                       struct vm_area_desc *desc)
> +{
> +       int err;
> +
> +       mutex_lock(&image[minor].mutex);
> +
> +       err =3D vme_master_mmap_prepare(image[minor].resource, desc);
> +       if (!err)
> +               desc->vm_ops =3D &vme_user_vm_ops;
> +
> +       mutex_unlock(&image[minor].mutex);
> +       return err;
> +}
> +
> +static int vme_user_mmap_prepare(struct vm_area_desc *desc)
>  {
> -       unsigned int minor =3D iminor(file_inode(file));
> +       const struct file *file =3D desc->file;
> +       const unsigned int minor =3D iminor(file_inode(file));
>
>         if (type[minor] =3D=3D MASTER_MINOR)
> -               return vme_user_master_mmap(minor, vma);
> +               return vme_user_master_mmap_prepare(minor, desc);
>
>         return -ENODEV;
>  }
> @@ -498,7 +507,7 @@ static const struct file_operations vme_user_fops =3D=
 {
>         .llseek =3D vme_user_llseek,
>         .unlocked_ioctl =3D vme_user_unlocked_ioctl,
>         .compat_ioctl =3D compat_ptr_ioctl,
> -       .mmap =3D vme_user_mmap,
> +       .mmap_prepare =3D vme_user_mmap_prepare,
>  };
>
>  static int vme_user_match(struct vme_dev *vdev)
> --
> 2.53.0
>
