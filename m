Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1875516CD33
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 22:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773701981; cv=pass; b=lTFIBfkP2O3tIZHa68ldVdcxP7PvSUW4HSCvclkGPAacO4ouweFoXvmmyz3H7PoNi4XKFrK1/1SwARdxGXTT23rEH4VCpyKDr7tvdW9ErkgTVilEs4Z46aKovRcBCzCJMqPlrGt100+YNY/20Ypdh5O1EVfpU0yEyCwXuPAp1Wc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773701981; c=relaxed/simple;
	bh=n5yqztpjRLufPkj5VJdYxT7NEGdWEh93DgrTEzhQ/40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oAEDMGpz0EM8yidV42Nptu8P9L3CgRy8njZMPqydC7jTtYp77j7jxQBxf6tREfX7lGej6zD3jWlZOoUUTuhtWOTifdCvZfXQJfBx23nDIm838lCcPFkvxzxAE5Vqqr3oVB7Eq6b1+5HljYP4mGT66/l1VSq61KixGspdNE0aqQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LfjWg1iQ; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LfjWg1iQ"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5091ed02c54so96261cf.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 15:59:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773701978; cv=none;
        d=google.com; s=arc-20240605;
        b=ffC3fZ/YwQvrjI+IsbLbfPY4LzRR3Tz85efXbcJIWcXA5OftbqeiAIoHZW529mmSFH
         qGvol/EZh3DWTF4KPcCxscNyjebhbTCOXRMNcifcaY0tbt8we/bteAv+Wm2BvlIk/ICD
         F7WZVyjREYnvGGIapkGLvJOIm3HLeqmi1XQxSs4B2E6+Ai2ywkMpjcWgA+njoWqyv6QI
         RMZczqoN/8i3tbY8yKkGphzGlxFyaMxWXjuDSfi5r6FroLd8zob/oM2YbBrMQfnLOA1v
         3hBmIVwhYRHrzOBI/CszP1tJeiSkgZtDeJPKqYb/KL+o9R7dTe0JbtslE098SAEfyH8s
         O/xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q4cJcFtf4hpm0T0e+VviEvUx2ruLtbnKyeEs5ldKrcs=;
        fh=xrF1+BDF3BJ4Q96bR+p2CY53rUba5DGULp1M3S3jthk=;
        b=hA4wTS0sPeXNxpEiQPT1lYoYufVksxkFr/Qj8JlY+U3FmjX84+15CAe49qgkvwGNWe
         fg1oy53+2/tXcYZi+f9TBK9JR6sUmePgygE6LZxQTSDmLs7MlojomahxC6doo6hFcM7G
         eBcaJycj9GuqfnOBx/0DeJdtPzCyIv5jRn1+OBgVpAmssTufE+uNTqM8AxkRvu/I8InE
         T0kPIuU61Gky+YiBin4f/8Af9pNldXmYxSMeSBXZ6lnDz+X2mU91yx/gZBybqwxvm58a
         MQDG856Rs2PtE0xPSw6I216lPurdDJs9SKiubQxhcaKBU0vDclCVAQ4Y84h0iUXFA0+e
         pCLg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773701978; x=1774306778; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4cJcFtf4hpm0T0e+VviEvUx2ruLtbnKyeEs5ldKrcs=;
        b=LfjWg1iQY0/v+GcYRIp6SsaocCcGQk72Z+Wjkd6RzrC0recOGml9cI6I0Ofdmwbp8W
         LyvIv123nf7Mdq300jkKJvcAw86XwtbczytFLGmM6aOqY5jsLu9S2Z1l+dmaQrVQ4D29
         TSjd65AvviR+LXH5UdfSCaic5D8cMAmJ52BF2UyoIoln1nkNZLXav085zQpMTJreabeE
         L7nWPv6X9fw9GYMnRVnyIoOURwucclUxfJUHMqwf9YlT0oj77KUpxRkk6BFSv6eok702
         FgTBE3EGakvlK+RcmsQ3xCJiL6cHEeQX5E5dOYY8k3Ymz/NZJ0MmdUbTZWA95fAC55ZS
         DVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773701978; x=1774306778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q4cJcFtf4hpm0T0e+VviEvUx2ruLtbnKyeEs5ldKrcs=;
        b=ANeqzz1iE3Slpp95qs0qwU2P+4zOj6OglR5s8AhNFYhM4NmhSFNpjZIlFDV0+Jc8D1
         erzFkVyL5vVLDY07Ca2vlA/dpY1UBocnMQNlN8W9LwJgbfait9BHLjTZaxUw926MsZKW
         BZGXgbt3H/AFtjQhM47XPbFx78vNytusXh3XNpUH/8p/zo7shh5lvezQvJAmyZIl8Dz2
         ZyVYjwGWZIhIuM+B2RN+GceDRo4CeM8Q2upeU4y3mQDhlkw+6I7r7+ld3l4+uazqDdzi
         9XYIrELdp1jGiES5B6OXJFrJOAdhCwcOmkrn3u/cjCBbDX2r+IJJwuAk1W3ZEMMjS1LC
         thIg==
X-Forwarded-Encrypted: i=1; AJvYcCUgj69LQIfkEEcPpylZYPi/WTnT+VUFaEVQnEMuF0Y5GnsauNJOuu9XjxDlj9LLPlJtYFMwxQn7W/B4k5iy@lists.linux.dev
X-Gm-Message-State: AOJu0Yw06tQethvDV1bgkvhrTXXBNkUrr0tWZxrc8DBvd+JVyG7LiztF
	J/BpZ0pCVAsW0Z0daJuduYico9JpzaPezN0BWIjz0+JY7Kkk6GUY8H/T7CY5JDeJYH4R7BxgWYk
	4+tVB+cjuqaoeoU/vGo2oQk7WoKyq3Md5aa8fG14P
X-Gm-Gg: ATEYQzymnBN8h11w4z5fPoeX4Y/CpgOEfDpws8TpDgdmKntXrwO7rAyrQOT+ek2GCBW
	ooP2d0DuZ7etMedtzhlS2v7SzFyL/p4TcB8dW4mLmJSL5BDjSrDRn8ZUFXYvslprdq14xv4SGSZ
	dVsUOTt6iEsAK/zERhWr0U1EZq0rTNNe5Iar478YI5MGHM9AZ3CxAoQo9T0lsVM0+kGVHyVY79n
	7nStz8SkCLBkJ4T7JcIRumDjcAdQSIAw5yxo3gCNV8TXmmYUpoy8O+DxKxP+euhH22u8On5vrex
	rK5N2KWBc1slx1aX
X-Received: by 2002:ac8:5e12:0:b0:4f3:54eb:f26e with SMTP id
 d75a77b69052e-5099ac78738mr2798501cf.1.1773701977490; Mon, 16 Mar 2026
 15:59:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1773346620.git.ljs@kernel.org> <c5bb61cf789df1ecb32facc29df9749987c7ddfc.1773346620.git.ljs@kernel.org>
 <CAJuCfpGd702=Xop3X5Aop9rrScdiAOQEEooTu1gcJqR9pmO5GA@mail.gmail.com> <6a0e73a5-519e-49ca-9f76-2f6cc5a1577c@lucifer.local>
In-Reply-To: <6a0e73a5-519e-49ca-9f76-2f6cc5a1577c@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 16 Mar 2026 15:59:26 -0700
X-Gm-Features: AaiRm5118TD3MF16DHCGoLHkzYMnffHjhVhwrz0uUgfCnERLy0ui_OLbleubf-w
Message-ID: <CAJuCfpEjTw1nQik_HWXHg2su2DwzPrn5NPGpeAVPrjJK0tOSkg@mail.gmail.com>
Subject: Re: [PATCH 02/15] mm: add documentation for the mmap_prepare file
 operation callback
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

On Mon, Mar 16, 2026 at 12:17=E2=80=AFPM Lorenzo Stoakes (Oracle)
<ljs@kernel.org> wrote:
>
> On Sun, Mar 15, 2026 at 04:23:14PM -0700, Suren Baghdasaryan wrote:
> > On Thu, Mar 12, 2026 at 1:27=E2=80=AFPM Lorenzo Stoakes (Oracle) <ljs@k=
ernel.org> wrote:
> > >
> > > This documentation makes it easier for a driver/file system implement=
er to
> > > correctly use this callback.
> > >
> > > It covers the fundamentals, whilst intentionally leaving the less lov=
ely
> > > possible actions one might take undocumented (for instance - the
> > > success_hook, error_hook fields in mmap_action).
> > >
> > > The document also covers the new VMA flags implementation which is th=
e only
> > > one which will work correctly with mmap_prepare.
> > >
> > > Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> > > ---
> > >  Documentation/filesystems/mmap_prepare.rst | 131 +++++++++++++++++++=
++
> > >  1 file changed, 131 insertions(+)
> > >  create mode 100644 Documentation/filesystems/mmap_prepare.rst
> > >
> > > diff --git a/Documentation/filesystems/mmap_prepare.rst b/Documentati=
on/filesystems/mmap_prepare.rst
> > > new file mode 100644
> > > index 000000000000..76908200f3a1
> > > --- /dev/null
> > > +++ b/Documentation/filesystems/mmap_prepare.rst
> > > @@ -0,0 +1,131 @@
> > > +.. SPDX-License-Identifier: GPL-2.0
> > > +
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > > +mmap_prepare callback HOWTO
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > > +
> > > +Introduction
> > > +############
> > > +
> > > +The `struct file->f_op->mmap()` callback has been deprecated as it i=
s both a
> > > +stability and security risk, and doesn't always permit the merging o=
f adjacent
> > > +mappings resulting in unnecessary memory fragmentation.
> > > +
> > > +It has been replaced with the `file->f_op->mmap_prepare()` callback =
which solves
> > > +these problems.
> > > +
> > > +## How To Use
> > > +
> > > +In your driver's `struct file_operations` struct, specify an `mmap_p=
repare`
> > > +callback rather than an `mmap` one, e.g. for ext4:
> > > +
> > > +
> > > +.. code-block:: C
> > > +
> > > +    const struct file_operations ext4_file_operations =3D {
> > > +        ...
> > > +        .mmap_prepare    =3D ext4_file_mmap_prepare,
> > > +    };
> > > +
> > > +This has a signature of `int (*mmap_prepare)(struct vm_area_desc *)`=
.
> > > +
> > > +Examining the `struct vm_area_desc` type:
> > > +
> > > +.. code-block:: C
> > > +
> > > +    struct vm_area_desc {
> > > +        /* Immutable state. */
> > > +        const struct mm_struct *const mm;
> > > +        struct file *const file; /* May vary from vm_file in stacked=
 callers. */
> > > +        unsigned long start;
> > > +        unsigned long end;
> > > +
> > > +        /* Mutable fields. Populated with initial state. */
> > > +        pgoff_t pgoff;
> > > +        struct file *vm_file;
> > > +        vma_flags_t vma_flags;
> > > +        pgprot_t page_prot;
> > > +
> > > +        /* Write-only fields. */
> > > +        const struct vm_operations_struct *vm_ops;
> > > +        void *private_data;
> > > +
> > > +        /* Take further action? */
> > > +        struct mmap_action action;
> >
> > So, action still belongs to /* Write-only fields. */ section? This is
> > nitpicky, but it might be better to have this as:
> >
> >         /* Write-only fields. */
> >         const struct vm_operations_struct *vm_ops;
> >         void *private_data;
> >         struct mmap_action action; /* Take further action? */
>
> Absolutely not. This field is not to be written to by the user.
>
> We sadly have to allow hugetlb to do some hacks, but these are things we =
don't
> want to point out.

Ack.

>
> Users should use mmap_action_xxx() functions.
>
> >
> > > +    };
> > > +
> > > +This is straightforward - you have all the fields you need to set up=
 the
> > > +mapping, and you can update the mutable and writable fields, for ins=
tance:
> > > +
> > > +.. code-block:: Cw
> > > +
> > > +    static int ext4_file_mmap_prepare(struct vm_area_desc *desc)
> > > +    {
> > > +        int ret;
> > > +        struct file *file =3D desc->file;
> > > +        struct inode *inode =3D file->f_mapping->host;
> > > +
> > > +        ...
> > > +
> > > +        file_accessed(file);
> > > +        if (IS_DAX(file_inode(file))) {
> > > +            desc->vm_ops =3D &ext4_dax_vm_ops;
> > > +            vma_desc_set_flags(desc, VMA_HUGEPAGE_BIT);
> > > +        } else {
> > > +            desc->vm_ops =3D &ext4_file_vm_ops;
> > > +        }
> > > +        return 0;
> > > +    }
> > > +
> > > +Importantly, you no longer have to dance around with reference count=
s or locks
> > > +when updating these fields - __you can simply go ahead and change th=
em__.
> > > +
> > > +Everything is taken care of by the mapping code.
> > > +
> > > +VMA Flags
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +Along with `mmap_prepare`, VMA flags have undergone an overhaul. Whe=
re before
> > > +you would invoke one of `vm_flags_init()`, `vm_flags_reset()`, `vm_f=
lags_set()`,
> > > +`vm_flags_clear()`, and `vm_flags_mod()` to modify flags (and to hav=
e the
> > > +locking done correctly for you, this is no longer necessary.
> > > +
> > > +Also, the legacy approach of specifying VMA flags via `VM_READ`, `VM=
_WRITE`,
> > > +etc. - i.e. using a `VM_xxx` macro has changed too.
> > > +
> > > +When implementing `mmap_prepare()`, reference flags by their bit num=
ber, defined
> > > +as a `VMA_xxx_BIT` macro, e.g. `VMA_READ_BIT`, `VMA_WRITE_BIT` etc.,=
 and use one
> > > +of (where `desc` is a pointer to `struct vma_area_desc`):
> > > +
> > > +* `vma_desc_test_flags(desc, ...)` - Specify a comma-separated list =
of flags you
> > > +  wish to test for (whether _any_ are set), e.g. - `vma_desc_test_fl=
ags(desc,
> > > +  VMA_WRITE_BIT, VMA_MAYWRITE_BIT)` - returns `true` if either are s=
et,
> > > +  otherwise `false`.
> > > +* `vma_desc_set_flags(desc, ...)` - Update the VMA descriptor flags =
to set
> > > +  additional flags specified by a comma-separated list,
> > > +  e.g. - `vma_desc_set_flags(desc, VMA_PFNMAP_BIT, VMA_IO_BIT)`.
> > > +* `vma_desc_clear_flags(desc, ...)` - Update the VMA descriptor flag=
s to clear
> > > +  flags specified by a comma-separated list, e.g. - `vma_desc_clear_=
flags(desc,
> > > +  VMA_WRITE_BIT, VMA_MAYWRITE_BIT)`.
> > > +
> > > +Actions
> > > +=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +You can now very easily have actions be performed upon a mapping onc=
e set up by
> > > +utilising simple helper functions invoked upon the `struct vm_area_d=
esc`
> > > +pointer. These are:
> > > +
> > > +* `mmap_action_remap()` - Remaps a range consisting only of PFNs for=
 a specific
> > > +  range starting a virtual address and PFN number of a set size.
> > > +
> > > +* `mmap_action_remap_full()` - Same as `mmap_action_remap()`, only r=
emaps the
> > > +  entire mapping from `start_pfn` onward.
> > > +
> > > +* `mmap_action_ioremap()` - Same as `mmap_action_remap()`, only perf=
orms an I/O
> > > +  remap.
> > > +
> > > +* `mmap_action_ioremap_full()` - Same as `mmap_action_ioremap()`, on=
ly remaps
> > > +  the entire mapping from `start_pfn` onward.
> > > +
> > > +**NOTE:** The 'action' field should never normally be manipulated di=
rectly,
> > > +rather you ought to use one of these helpers.
> >
> > I'm guessing the start and size parameters passed to
> > mmap_action_remap() and such are restricted by vm_area_desc.start
> > vm_area_desc.end. If so, should we document those restrictions and
> > enforce them in the code?
>
> I mean it's the same restrictions as all of the functions already apply i=
f you
> were to use them with a VMA descriptor.
>
> I think implicitly a remap will fail if you try it out of the VMA range a=
t the
> point of applying the change.
>
> But it might be worth adding range_in_vma_desc() checks at prepare time, =
will
> see if I can do that for the respin.
>
> I think it's pretty obvious that you shouldn't be trying to remap totally
> unrelated memory, so I'm not sure that's at a level of granularity that's=
 suited
> to this document though.

I just saw you already have WARN_ON_ONCE() inside mmap_action_remap()
to check for these limits, so codewise I think we are already good.

For documentation I'll rely on your judgement whether to mention this or no=
t.

>
> >
> > > +    struct vm_area_desc {
> > > +        /* Immutable state. */
> > > +        const struct mm_struct *const mm;
> > > +        struct file *const file; /* May vary from vm_file in stacked=
 callers. */
> > > +        unsigned long start;
> > > +        unsigned long end;
> >
> >
> > > --
> > > 2.53.0
> > >
