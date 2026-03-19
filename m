Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BD33E1CFE
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 15:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773933593; cv=pass; b=YZyxGFnyNJYXLX44qx8pgRypbKxkfLOCx3MdTosBY2pEL+thCIO8PwUx3/uWZo64PZGaE7IWRrczsbWzSKTlE3QPgIeYmnBfaZwgYR3l3A7zC3bj/whshIxUESg1SiliEc9rNIJnqdvbt/opm5WN4Yv6yija+vOI1PswUwRK6mc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773933593; c=relaxed/simple;
	bh=cd2Yc6Pq+XjnR/Goq5WKVux5mwTDBBwiKIMMeMo1T34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pkjLskg7bETlgYfz3bJbJnSPmR35eDU8cftQHDXmB30gt5HKWDEIYT3Du05SUJXSP6Z8/zSFz/oPcPqAuQAc2/Mvil5xZXodCMw7bUiXv/MSlhjKy6UqiE4IQG0Kbkp0C0VJcwllLRLKyM60oq0K48+ro4MwjC5Uc6mr14GGXwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p2AgpHf2; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p2AgpHf2"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-667cde0fc88so10034a12.1
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 08:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773933590; cv=none;
        d=google.com; s=arc-20240605;
        b=Lv1E2cNdFUGHaMcvssjhmckZBtcnyiTUzPXq6qDk/t7s91ZW3QhBPAZ4tYFRw+xnvJ
         zQq79mDclnqIdS4e1VWEdaasXXaoJ2jjbUJccyA0YUfuKz9OkufN4k9IKm5xMHKFvXMc
         YMV4EjGOLij6u3JnBuhZ3wotTLfgLugTFYIJywrhaaKk39wjn8SuXPWgSmfE5uCqQbyp
         xpuuFNyL0cLhIIHsj0Ih9kWSNB05NnPUBSUDAry94LV6Dal/ffoMmh1pcvJ7ipgTl2WT
         8PxMuYT0Pm0JjNWbyExUd4PV+ddaF+i9tYrxngbFCPW8dH+LlhlIG31A/xcz1hFucOrh
         F0OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OfH8Q5Td26D2zz2vaWeEEQdnUyXBLu9cQNzXDyggGWs=;
        fh=Ke4weL15UQh4FQhiAgYHUNhiEPysjN4GRo/hs9uaZt4=;
        b=W3XaGsc6uKAi/z9jj5KQCMyruGv7jeIOD7+hNJt7RAiLMvOn50rJhNAR2DF9xbhTIs
         xTjjZ18O4RO27hMoJ3mseq1F54ZF4WDhYKSDt9TWl4T4gPbZ9iyQQW6yROHRF7fFIS8M
         amwuCZdk41sTk7yAX1wIbMVxugB+61apGF/g14O8veHLENrRdbUc27G1nRLvP3xfk0yI
         vcXJSOoh84zrW4B8lEQRS28lEG0gckrqt448QITBHOGKMdaP0WahVGa4JvQd4yEwGt3H
         cRs3Nh5XrLJWLp7kjokdjHyfLWxVdJo1pyISVIRVHAbxmPejGn2oZCn1hbDbid/4+raV
         wpxw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773933590; x=1774538390; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfH8Q5Td26D2zz2vaWeEEQdnUyXBLu9cQNzXDyggGWs=;
        b=p2AgpHf26tyk3EmoGaOlU6oUsCqujQsT2XaMXnuqM0MLMu6Kld0Xisk1qyf8ijtWRJ
         hhqhpe3h2j+R+a/vHJM14ITDy75aVx+qq3NLfvrRyHhRWQEv/kGrh+91nPtyz0YKQ/yU
         zdBZ9FZ59nEfeW3NLeb13K2FtrAQoFM0OBmCu0EbzEAuv4PkNR/CMRacq/viwcotJyKf
         JrU+Hv4q3YDz1D6hF7O7stjC7KFl4TktzwrHsAGqy2kTPa0mLengv9fMYzyCC2xbRqQM
         oYAU+R/1QVbGyWOAF5Tq7wnatHohQIXKOpXXVHcCxiPjNSF9/soWgpOBRgvFvwzmJboC
         JR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773933590; x=1774538390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OfH8Q5Td26D2zz2vaWeEEQdnUyXBLu9cQNzXDyggGWs=;
        b=NzovaQISHBvhvr8V/Um6EMqDeiQ801lxXUpXepUxFX14GDlBubvamB2b8PDYEyqnab
         5sXIRB0ulcEcs9BH1H1O8NJFacYQ2j40R6pk36YnEbiv7WZ/u2NqhyR5U9e8XTDVedh6
         ciwL2nmc24MzcDsLRBwwrkT/V5JthzIyBKUCwe/l+6MpjV3xHPiQXAdVCBP63cu78FDm
         DffNbcdwSW9qmjMZyUL3YNtC4cDgUBTB3bT8LhhHzgGfjfrPcuLrwRm2RVH3x9jKXLCZ
         eLwUTWXV5XO91ArGsy5a1BUUKWL+EYlBB7K6gmHxpuLnb3Xnvw3xaqOBk+CStomY0oyZ
         4fvA==
X-Forwarded-Encrypted: i=1; AJvYcCWAVwGRWOest4PH74xCElPXfCZVfGtptbjJ0LWFixubFYwHu4HfdO1vtsi+aIhVC7T/CDW8i4S1hDRz3F4X@lists.linux.dev
X-Gm-Message-State: AOJu0YxydjRinVXaYBCmquDus/q7U6PIH0d+IberQnfYTAehNSx6Q72n
	j4/Dsxc9bOqS9bKDrtkdIJhUUi4EddCD643RODIWhTCADA9kbcGKAWlCgrsfeecH5flt/6/D4pF
	NUV/Wk1wAYjAC2zByWWqWpTXNon4zJlbiMGuQpC4Q
X-Gm-Gg: ATEYQzx2/4QeMiINrwtAHwnugiVuG7rZ872EcevWfWzHxroGbbpWrwNQEMInK1eXnmu
	W00zMGDALr6rQnhVvpAuStc9YwIHKIN8K6UXSdWye2IUzOoslMksL5f5xM8i7O+E47U+Si3I9cz
	69C299ccG801JZ0dZET55k20xQq2OGUm94Abkf2PzBBCQbVKDoaf0GB1ttfxXGnnAs5ayKZqEzl
	KUpYtyaT6MUE8Zw6Ly9lg09VVYzdUBGCcvokIA7vqu1dyEmORQVDqTlv4W2XLVGrqkKFJuObywa
	5BKGEdfS2FkljAm886XlWaAyeqV384bJTCQB
X-Received: by 2002:a05:6402:46c5:b0:665:d39:4b18 with SMTP id
 4fb4d7f45d1cf-66852d6c8abmr48783a12.8.1773933589136; Thu, 19 Mar 2026
 08:19:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org> <48c6d25e374b57dba6df4fdddd4830d3fc1105be.1773695307.git.ljs@kernel.org>
 <CAJuCfpFXuHg4KPY27pqMC-xV5y9ZY2W72_R8_rxO0DvrJ=_yvw@mail.gmail.com>
 <CAJuCfpE5qZmi43EeZiRcy78pD6YvJb5n_xnoUJfwEjomowu0=A@mail.gmail.com>
 <8cdad898-b306-40fe-a367-efe7147f83b9@lucifer.local> <CAJuCfpHXqtxZr5s84jCcz513a2pgMeDoobsLBJH9pSON49cM+w@mail.gmail.com>
In-Reply-To: <CAJuCfpHXqtxZr5s84jCcz513a2pgMeDoobsLBJH9pSON49cM+w@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 19 Mar 2026 08:19:35 -0700
X-Gm-Features: AaiRm51bFJ7jnCWExjTkTJWtl61x7cY-2jhtQRDi8xxndWDLsjo0Sko90eA6oXU
Message-ID: <CAJuCfpG4F7r=AMTBRkazFeQsnKocu9OPFyV2TsQccLQc=oLwNA@mail.gmail.com>
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

On Thu, Mar 19, 2026 at 8:19=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Thu, Mar 19, 2026 at 7:55=E2=80=AFAM Lorenzo Stoakes (Oracle) <ljs@ker=
nel.org> wrote:
> >
> > On Tue, Mar 17, 2026 at 02:32:16PM -0700, Suren Baghdasaryan wrote:
> > > On Tue, Mar 17, 2026 at 2:26=E2=80=AFPM Suren Baghdasaryan <surenb@go=
ogle.com> wrote:
> > > >
> > > > On Mon, Mar 16, 2026 at 2:14=E2=80=AFPM Lorenzo Stoakes (Oracle) <l=
js@kernel.org> wrote:
> > > > >
> > > > > The f_op->mmap interface is deprecated, so update driver to use i=
ts
> > > > > successor, mmap_prepare.
> > > > >
> > > > > The driver previously used vm_iomap_memory(), so this change repl=
aces it
> > > > > with its mmap_prepare equivalent, mmap_action_simple_ioremap().
> > > > >
> > > > > Functions that wrap mmap() are also converted to wrap mmap_prepar=
e()
> > > > > instead.
> > > > >
> > > > > Also update the documentation accordingly.
> > > > >
> > > > > Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

> > > > > ---
> > > > >  Documentation/driver-api/vme.rst    |  2 +-
> > > > >  drivers/staging/vme_user/vme.c      | 20 +++++------
> > > > >  drivers/staging/vme_user/vme.h      |  2 +-
> > > > >  drivers/staging/vme_user/vme_user.c | 51 +++++++++++++++++------=
------
> > > > >  4 files changed, 42 insertions(+), 33 deletions(-)
> > > > >
> > > > > diff --git a/Documentation/driver-api/vme.rst b/Documentation/dri=
ver-api/vme.rst
> > > > > index c0b475369de0..7111999abc14 100644
> > > > > --- a/Documentation/driver-api/vme.rst
> > > > > +++ b/Documentation/driver-api/vme.rst
> > > > > @@ -107,7 +107,7 @@ The function :c:func:`vme_master_read` can be=
 used to read from and
> > > > >
> > > > >  In addition to simple reads and writes, :c:func:`vme_master_rmw`=
 is provided to
> > > > >  do a read-modify-write transaction. Parts of a VME window can al=
so be mapped
> > > > > -into user space memory using :c:func:`vme_master_mmap`.
> > > > > +into user space memory using :c:func:`vme_master_mmap_prepare`.
> > > > >
> > > > >
> > > > >  Slave windows
> > > > > diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme=
_user/vme.c
> > > > > index f10a00c05f12..7220aba7b919 100644
> > > > > --- a/drivers/staging/vme_user/vme.c
> > > > > +++ b/drivers/staging/vme_user/vme.c
> > > > > @@ -735,9 +735,9 @@ unsigned int vme_master_rmw(struct vme_resour=
ce *resource, unsigned int mask,
> > > > >  EXPORT_SYMBOL(vme_master_rmw);
> > > > >
> > > > >  /**
> > > > > - * vme_master_mmap - Mmap region of VME master window.
> > > > > + * vme_master_mmap_prepare - Mmap region of VME master window.
> > > > >   * @resource: Pointer to VME master resource.
> > > > > - * @vma: Pointer to definition of user mapping.
> > > > > + * @desc: Pointer to descriptor of user mapping.
> > > > >   *
> > > > >   * Memory map a region of the VME master window into user space.
> > > > >   *
> > > > > @@ -745,12 +745,13 @@ EXPORT_SYMBOL(vme_master_rmw);
> > > > >   *         resource or -EFAULT if map exceeds window size. Other=
 generic mmap
> > > > >   *         errors may also be returned.
> > > > >   */
> > > > > -int vme_master_mmap(struct vme_resource *resource, struct vm_are=
a_struct *vma)
> > > > > +int vme_master_mmap_prepare(struct vme_resource *resource,
> > > > > +                           struct vm_area_desc *desc)
> > > > >  {
> > > > > +       const unsigned long vma_size =3D vma_desc_size(desc);
> > > > >         struct vme_bridge *bridge =3D find_bridge(resource);
> > > > >         struct vme_master_resource *image;
> > > > >         phys_addr_t phys_addr;
> > > > > -       unsigned long vma_size;
> > > > >
> > > > >         if (resource->type !=3D VME_MASTER) {
> > > > >                 dev_err(bridge->parent, "Not a master resource\n"=
);
> > > > > @@ -758,19 +759,18 @@ int vme_master_mmap(struct vme_resource *re=
source, struct vm_area_struct *vma)
> > > > >         }
> > > > >
> > > > >         image =3D list_entry(resource->entry, struct vme_master_r=
esource, list);
> > > > > -       phys_addr =3D image->bus_resource.start + (vma->vm_pgoff =
<< PAGE_SHIFT);
> > > > > -       vma_size =3D vma->vm_end - vma->vm_start;
> > > > > +       phys_addr =3D image->bus_resource.start + (desc->pgoff <<=
 PAGE_SHIFT);
> > > > >
> > > > >         if (phys_addr + vma_size > image->bus_resource.end + 1) {
> > > > >                 dev_err(bridge->parent, "Map size cannot exceed t=
he window size\n");
> > > > >                 return -EFAULT;
> > > > >         }
> > > > >
> > > > > -       vma->vm_page_prot =3D pgprot_noncached(vma->vm_page_prot)=
;
> > > > > -
> > > > > -       return vm_iomap_memory(vma, phys_addr, vma->vm_end - vma-=
>vm_start);
> > > > > +       desc->page_prot =3D pgprot_noncached(desc->page_prot);
> > > > > +       mmap_action_simple_ioremap(desc, phys_addr, vma_size);
> > > > > +       return 0;
> > > > >  }
> > > > > -EXPORT_SYMBOL(vme_master_mmap);
> > > > > +EXPORT_SYMBOL(vme_master_mmap_prepare);
> > > > >
> > > > >  /**
> > > > >   * vme_master_free - Free VME master window
> > > > > diff --git a/drivers/staging/vme_user/vme.h b/drivers/staging/vme=
_user/vme.h
> > > > > index 797e9940fdd1..b6413605ea49 100644
> > > > > --- a/drivers/staging/vme_user/vme.h
> > > > > +++ b/drivers/staging/vme_user/vme.h
> > > > > @@ -151,7 +151,7 @@ ssize_t vme_master_read(struct vme_resource *=
resource, void *buf, size_t count,
> > > > >  ssize_t vme_master_write(struct vme_resource *resource, void *bu=
f, size_t count, loff_t offset);
> > > > >  unsigned int vme_master_rmw(struct vme_resource *resource, unsig=
ned int mask, unsigned int compare,
> > > > >                             unsigned int swap, loff_t offset);
> > > > > -int vme_master_mmap(struct vme_resource *resource, struct vm_are=
a_struct *vma);
> > > > > +int vme_master_mmap_prepare(struct vme_resource *resource, struc=
t vm_area_desc *desc);
> > > > >  void vme_master_free(struct vme_resource *resource);
> > > > >
> > > > >  struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 r=
oute);
> > > > > diff --git a/drivers/staging/vme_user/vme_user.c b/drivers/stagin=
g/vme_user/vme_user.c
> > > > > index d95dd7d9190a..11e25c2f6b0a 100644
> > > > > --- a/drivers/staging/vme_user/vme_user.c
> > > > > +++ b/drivers/staging/vme_user/vme_user.c
> > > > > @@ -446,24 +446,14 @@ static void vme_user_vm_close(struct vm_are=
a_struct *vma)
> > > > >         kfree(vma_priv);
> > > > >  }
> > > > >
> > > > > -static const struct vm_operations_struct vme_user_vm_ops =3D {
> > > > > -       .open =3D vme_user_vm_open,
> > > > > -       .close =3D vme_user_vm_close,
> > > > > -};
> > > > > -
> > > > > -static int vme_user_master_mmap(unsigned int minor, struct vm_ar=
ea_struct *vma)
> > > > > +static int vme_user_vm_mapped(unsigned long start, unsigned long=
 end, pgoff_t pgoff,
> > > > > +                             const struct file *file, void **vm_=
private_data)
> > > > >  {
> > > > > -       int err;
> > > > > +       const unsigned int minor =3D iminor(file_inode(file));
> > > > >         struct vme_user_vma_priv *vma_priv;
> > > > >
> > > > >         mutex_lock(&image[minor].mutex);
> > > > >
> > > > > -       err =3D vme_master_mmap(image[minor].resource, vma);
> > > > > -       if (err) {
> > > > > -               mutex_unlock(&image[minor].mutex);
> > > > > -               return err;
> > > > > -       }
> > > > > -
> > > >
> > > > Ok, this changes the set of the operations performed under image[mi=
nor].mutex.
> > > > Before we had:
> > > >
> > > > mutex_lock(&image[minor].mutex);
> > > > vme_master_mmap();
> > > > <some final adjustments>
> > > > mutex_unlock(&image[minor].mutex);
> > > >
> > > > Now we have:
> > > >
> > > > mutex_lock(&image[minor].mutex);
> > > > vme_master_mmap_prepare()
> > > > mutex_unlock(&image[minor].mutex);
> > > > vm_iomap_memory();
> > > > mutex_lock(&image[minor].mutex);
> > > > vme_user_vm_mapped(); // <some final adjustments>
> > > > mutex_unlock(&image[minor].mutex);
> > > >
> > > > I think as long as image[minor] does not change while we are not
> > > > holding the mutex we should be safe, and looking at the code it see=
ms
> > > > to be the case. But I'm not familiar with this driver and might be
> > > > wrong. Worth double-checking.
> >
> > The file is pinned for the duration, the mutex is associated with the f=
ile,
> > so there's no sane world in which that could be problematic.
> >
> > Keeping in mind that we manipulate stuff on vme_user_vm_close() that
> > directly acceses image[minor] at an arbitary time.
>
> That was my understanding as well. Thanks for confirming.
>
> >
> > >
> > > A side note: if we had to hold the mutex across all those operations =
I
> > > think we would need to take the mutex in the vm_ops->mmap_prepare and
> > > add a vm_ops->map_failed hook or something along that line to drop th=
e
> > > mutex in case mmap_action_complete() fails. Not sure if we will have
> > > such cases though...
> >
> > No, I don't want to do this if it can be at all avoided. You should in
> > nearly any sane circumstance be able to defer things until the mapped h=
ook
> > anyway.
> >
> > Also a merge can happen too after an .mmap_prepare, so we'd have to hav=
e
> > some 'success' hook and I'm just not going there it'll end up open to a=
buse
> > again.
> >
> > (We do have success and error filtering hooks right now, sadly, but the=
y're
> > really for hugetlb and I plan to find a way to get rid of them).
> >
> > The mmap_prepare is meant to essentially be as stateless as possible.
>
> Yes, I also hope we won't encounter cases requiring us to keep any
> state information between the mmap_prepare and mapped stages.
>
> >
> > Anyway I don't think it's relevant here.
> >
> > >
> > > >
> > > > >         vma_priv =3D kmalloc_obj(*vma_priv);
> > > > >         if (!vma_priv) {
> > > > >                 mutex_unlock(&image[minor].mutex);
> > > > > @@ -472,22 +462,41 @@ static int vme_user_master_mmap(unsigned in=
t minor, struct vm_area_struct *vma)
> > > > >
> > > > >         vma_priv->minor =3D minor;
> > > > >         refcount_set(&vma_priv->refcnt, 1);
> > > > > -       vma->vm_ops =3D &vme_user_vm_ops;
> > > > > -       vma->vm_private_data =3D vma_priv;
> > > > > -
> > > > > +       *vm_private_data =3D vma_priv;
> > > > >         image[minor].mmap_count++;
> > > > >
> > > > >         mutex_unlock(&image[minor].mutex);
> > > > > -
> > > > >         return 0;
> > > > >  }
> > > > >
> > > > > -static int vme_user_mmap(struct file *file, struct vm_area_struc=
t *vma)
> > > > > +static const struct vm_operations_struct vme_user_vm_ops =3D {
> > > > > +       .mapped =3D vme_user_vm_mapped,
> > > > > +       .open =3D vme_user_vm_open,
> > > > > +       .close =3D vme_user_vm_close,
> > > > > +};
> > > > > +
> > > > > +static int vme_user_master_mmap_prepare(unsigned int minor,
> > > > > +                                       struct vm_area_desc *desc=
)
> > > > > +{
> > > > > +       int err;
> > > > > +
> > > > > +       mutex_lock(&image[minor].mutex);
> > > > > +
> > > > > +       err =3D vme_master_mmap_prepare(image[minor].resource, de=
sc);
> > > > > +       if (!err)
> > > > > +               desc->vm_ops =3D &vme_user_vm_ops;
> > > > > +
> > > > > +       mutex_unlock(&image[minor].mutex);
> > > > > +       return err;
> > > > > +}
> > > > > +
> > > > > +static int vme_user_mmap_prepare(struct vm_area_desc *desc)
> > > > >  {
> > > > > -       unsigned int minor =3D iminor(file_inode(file));
> > > > > +       const struct file *file =3D desc->file;
> > > > > +       const unsigned int minor =3D iminor(file_inode(file));
> > > > >
> > > > >         if (type[minor] =3D=3D MASTER_MINOR)
> > > > > -               return vme_user_master_mmap(minor, vma);
> > > > > +               return vme_user_master_mmap_prepare(minor, desc);
> > > > >
> > > > >         return -ENODEV;
> > > > >  }
> > > > > @@ -498,7 +507,7 @@ static const struct file_operations vme_user_=
fops =3D {
> > > > >         .llseek =3D vme_user_llseek,
> > > > >         .unlocked_ioctl =3D vme_user_unlocked_ioctl,
> > > > >         .compat_ioctl =3D compat_ptr_ioctl,
> > > > > -       .mmap =3D vme_user_mmap,
> > > > > +       .mmap_prepare =3D vme_user_mmap_prepare,
> > > > >  };
> > > > >
> > > > >  static int vme_user_match(struct vme_dev *vdev)
> > > > > --
> > > > > 2.53.0
> > > > >
> >
> > Cheers, Lorenzo
