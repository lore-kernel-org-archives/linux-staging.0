Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF87E3093DD
	for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 03:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773718926; cv=pass; b=Hrhv7Y163pmz+qV2d3T1Qc9HL7HKdov65o7jtMieJH2pbIgvQUYJKeFgnnsyq8dR0gqz3fHNgxAJjoXw865Cv1b4LtguvZgCGvUD8j6eLyn6lSAE4pjmPzMkKof5JvLjPUqrlzWf98T9eMEVP5MtNM6tivIFdFkr7NoHmzbMvL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773718926; c=relaxed/simple;
	bh=WMHI6RHUC26ebl9/TVkwR2rJeC5kBjFPfSnTY/Oar1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QFIIimuqic385iTO8W8kg0cuE7r8eZtYh9oStWkOEwAxYZw89C870oV+MqahE3MaIlRbOm4vDtGql51jlzEKbJ+66UHp3ychR3xUj8eH2Rq5D/AU4krEJyxl5zDgn8CojAJZvQC19mU8GIZF8+IWWpg3MR7WVkuUAco9Yq46Jio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mygflDRm; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mygflDRm"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-667365131b0so2783a12.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 20:42:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773718922; cv=none;
        d=google.com; s=arc-20240605;
        b=f26wgV8y0EFF3a05Nc5oqMaFCzubMKMb20XWhcJWKl0yLz90+Y6RXNKS7yB0tIZuFF
         hdRz1Cmvp230J1+1vgapm0QPePL/W/C4nw73QUCCkIOziOTk31NwS29B89POrp5m5uD7
         f2wbgqMi+EatWQaKvZ1rVPn3zwQyuCcZ/yzji7dCUcIcP2IGvYHLn+miG7pAy5QivWgU
         TVLnZmVnfyczeh8U3LI3nxVUP8AMXJTktVh6oL+/3fbSpaVbCUGEYAUgRX0tFOy6DX7x
         LHrMcLNy+rCQkJCB0rnDeCZOKBeDrVcHddDxs/bU4PQF7ltQPqTla4Gy/QbYA9i7aK8m
         5RFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SDjcbstE7vaBgKzikVP/a05WleFr4Bi6N01Q1DpO7Ng=;
        fh=mEP3pwTH7s0PjGETiDQZg1eSK1evvgGavblraP+Zi1g=;
        b=G4EBTTTu0fowY1tlXHM+mXnxCEeavBKekgRtd8A183EhUtC+FXFRGei7fkmSD4nh6C
         zwe/iEHMz+QlxyKNg+YODtfAA9y0d3xLafD0pcHugRb6T5daattS+6eQR91N2AwiaRqa
         WwY1m+6f/xm6LpBXigAJfYGj7pcn74Mdh71LeZ7DdXc5NlEd3iuXFuNnGCDN+DRQ2P3R
         NJjLIF6Yi+mgs0D5R1hPUocpy9SqAkvIVM6FISpPerSHo5Uioy5WIpzs/rvujQY1//Yr
         RvvY34CTgCyaToB5FVue1t9IYL6Yu5G6sNcs2BOKpIVz3dbkY1LuqJqKyXTKl823nmuT
         SevA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773718922; x=1774323722; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDjcbstE7vaBgKzikVP/a05WleFr4Bi6N01Q1DpO7Ng=;
        b=mygflDRmt/9F4CifzT3PSIi7npjxVx8m15MJPQOQUme/WMJFZ+DuitV1emgcu7mqAu
         fEbUR581cazyEKR13u06j+67NRR6dYz6k5fViIlfnTIrLHKIIq8/gHdKYEyhVa2X+Dy/
         AVmQXOGVsjm25VwGIxJlSqOolLSvICpZc8XhxTIQESf9BIqSafUesdQqHy2YZAUL15Rn
         8dJBqAVjVO731Bph7SpB4iqXKxPanVd7sOen/kBWaszOiZC49rPnuKW1Pf/XxR/SwZKa
         G6NqtCsCklbzQcj+8Y1rEeIek9JrH4XhIHcFKOYqb58lxjTjiQBMR41E2tttUfhzNHnH
         OADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773718922; x=1774323722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SDjcbstE7vaBgKzikVP/a05WleFr4Bi6N01Q1DpO7Ng=;
        b=c1tbe3riAo3edsvxJ/lwKq1Z3RrdVs33nOqVLtfh2eyy3CKDGEhRGaVM49x8fRKHhQ
         JpazIYUT2FSti2z3mBv+9ojNKxp4kZVmH7vxdCZYJjbwD5F9omZs7uQ/nrUQzLOiUJAt
         SDCi1SKG3AAjP/51ocwb/U5ffKiJySrz0fhCPB7Grz/m65CO0++v3f2zd5hpXm9XS35N
         nE0FmGWwE5go+xEuUnlcaVtRGsakMScJ2t9he5v38EJk/GK57XPiTv0Tf0rQK0LY7njI
         iy/uBe7Is7Me33MaGNsT0mnHLSIKz3B/wBYEcFz4Sgqe1sssEngWZ4VOnVEoz9NCjHVw
         rGeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQxdJFiMK4jnJaItgsoEB/BP76dI0ouH4yrWT9vHi0XrDIiz2qFBCIDSfSJStREaAVbKU0F+UbzfQcolmn@lists.linux.dev
X-Gm-Message-State: AOJu0YwOVgBUhRuERC7dQ+Bw/mzijD63WPshbLLdkh/v3ne1WHIqs4oc
	2+nhsRSLvDf66HXtfMGZ2YntXtFUt5ijaFg0FcpTzKznw5nvRh3VuSzx2cDrT5AWF2DykSjCFVM
	8S3liFfYvQANXpBBh5XxCu09OLC6GlZHEQuDvWvbU
X-Gm-Gg: ATEYQzz5tEGOF3Bh/Oi61r1VkOHKOJjf4wTXKdLqambfAMtZ0VU9FxIetj+aVdb7U4n
	cLEHU3d5bGTI82ssGzk+0K3z/UTHcYLFg8Ip6uHtMcxfRNNyOQruVahaOSMQ5HN+gQjN+qjH7j1
	ZjOLrNRFPbvJrOlsvkORD5zrjTu/cDEgWpvXoz2pTlZu3UOSnjP9wVEJ4jobY/iRAhfZ2xXLMG5
	nuvCrhlRpwdzYm225ZDLuDSl5flmLYak+AzQ6piP7uWJcG2Bo1v3QWFDetUINVTHayzmQWvaX2M
	SFj+Bw==
X-Received: by 2002:a05:6402:5047:b0:667:926:56e with SMTP id
 4fb4d7f45d1cf-6671449f938mr28406a12.2.1773718921655; Mon, 16 Mar 2026
 20:42:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4a5fa45119220b9d99ed72a36308aed01a30d2c1.1773346620.git.ljs@kernel.org>
 <20260313110745.2573005-1-usama.arif@linux.dev> <c62305d7-22c4-4cf7-969b-fbe214c93b64@lucifer.local>
 <CAJuCfpFio6n-O-1NkPXrymV0o3UqvHYS8ZOyQtt=JXnZ5dTGhQ@mail.gmail.com> <2536c05e-e228-404f-9916-906c0447b114@lucifer.local>
In-Reply-To: <2536c05e-e228-404f-9916-906c0447b114@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 16 Mar 2026 20:41:48 -0700
X-Gm-Features: AaiRm51L9yY6IK4TcJFLhN8NGwQS7Z64sx0O9EJzSXirWOtaRRhN6Ww7XVogluY
Message-ID: <CAJuCfpH2XyAJOFKCZnviVV_UbF4O0wzj3QgJieo+LD=Cvr71jA@mail.gmail.com>
Subject: Re: [PATCH 05/15] fs: afs: correctly drop reference count on mapping failure
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Usama Arif <usama.arif@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
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

On Mon, Mar 16, 2026 at 7:29=E2=80=AFAM Lorenzo Stoakes (Oracle) <ljs@kerne=
l.org> wrote:
>
> On Sun, Mar 15, 2026 at 07:32:54PM -0700, Suren Baghdasaryan wrote:
> > On Fri, Mar 13, 2026 at 5:00=E2=80=AFAM Lorenzo Stoakes (Oracle) <ljs@k=
ernel.org> wrote:
> > >
> > > On Fri, Mar 13, 2026 at 04:07:43AM -0700, Usama Arif wrote:
> > > > On Thu, 12 Mar 2026 20:27:20 +0000 "Lorenzo Stoakes (Oracle)" <ljs@=
kernel.org> wrote:
> > > >
> > > > > Commit 9d5403b1036c ("fs: convert most other generic_file_*mmap()=
 users to
> > > > > .mmap_prepare()") updated AFS to use the mmap_prepare callback in=
 favour of
> > > > > the deprecated mmap callback.
> > > > >
> > > > > However, it did not account for the fact that mmap_prepare can fa=
il to map
> > > > > due to an out of memory error, and thus should not be incrementin=
g a
> > > > > reference count on mmap_prepare.
> >
> > This is a bit confusing. I see the current implementation does
> > afs_add_open_mmap() and then if generic_file_mmap_prepare() fails it
> > does afs_drop_open_mmap(), therefore refcounting seems to be balanced.
> > Is there really a problem?
>
> Firstly, mmap_prepare is invoked before we try to merge, so the VMA could=
 in
> theory get merged and then the refcounting will be wrong.

I see now. Ok, makes sense.

>
> Secondly, mmap_prepare occurs at such at time where it is _possible_ that
> allocation failures as described below could happen.

Right, but in that case afs_file_mmap_prepare() would drop its
refcount and return an error, so refcounting is still good, no?

>
> I'll update the commit message to reflect the merge aspect actually.

Thanks!

>
> >
> > > > >
> > > > > With the newly added vm_ops->mapped callback available, we can si=
mply defer
> > > > > this operation to that callback which is only invoked once the ma=
pping is
> > > > > successfully in place (but not yet visible to userspace as the mm=
ap and VMA
> > > > > write locks are held).
> > > > >
> > > > > Therefore add afs_mapped() to implement this callback for AFS.
> > > > >
> > > > > In practice the mapping allocations are 'too small to fail' so th=
is is
> > > > > something that realistically should never happen in practice (or =
would do
> > > > > so in a case where the process is about to die anyway), but we sh=
ould still
> > > > > handle this.
> >
> > nit: I would drop the above paragraph. If it's impossible why are you
> > handling it? If it's unlikely, then handling it is even more
> > important.
>
> Sure I can drop it, but it's an ongoing thing with these small allocation=
s.
>
> I wish we could just move to a scenario where we can simpy assume allocat=
ions
> will always succeed :)

That would be really nice but unfortunately the world is not that
perfect. I just don't want to be chasing some rarely reproducible bug
because of the assumption that an allocation is too small to fail.

>
> Vlasta - thoughts?
>
> Cheers, Lorenzo
>
> >
> > > > >
> > > > > Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> > > > > ---
> > > > >  fs/afs/file.c | 20 ++++++++++++++++----
> > > > >  1 file changed, 16 insertions(+), 4 deletions(-)
> > > > >
> > > > > diff --git a/fs/afs/file.c b/fs/afs/file.c
> > > > > index f609366fd2ac..69ef86f5e274 100644
> > > > > --- a/fs/afs/file.c
> > > > > +++ b/fs/afs/file.c
> > > > > @@ -28,6 +28,8 @@ static ssize_t afs_file_splice_read(struct file=
 *in, loff_t *ppos,
> > > > >  static void afs_vm_open(struct vm_area_struct *area);
> > > > >  static void afs_vm_close(struct vm_area_struct *area);
> > > > >  static vm_fault_t afs_vm_map_pages(struct vm_fault *vmf, pgoff_t=
 start_pgoff, pgoff_t end_pgoff);
> > > > > +static int afs_mapped(unsigned long start, unsigned long end, pg=
off_t pgoff,
> > > > > +                 const struct file *file, void **vm_private_data=
);
> > > > >
> > > > >  const struct file_operations afs_file_operations =3D {
> > > > >     .open           =3D afs_open,
> > > > > @@ -61,6 +63,7 @@ const struct address_space_operations afs_file_=
aops =3D {
> > > > >  };
> > > > >
> > > > >  static const struct vm_operations_struct afs_vm_ops =3D {
> > > > > +   .mapped         =3D afs_mapped,
> > > > >     .open           =3D afs_vm_open,
> > > > >     .close          =3D afs_vm_close,
> > > > >     .fault          =3D filemap_fault,
> > > > > @@ -500,13 +503,22 @@ static int afs_file_mmap_prepare(struct vm_=
area_desc *desc)
> > > > >     afs_add_open_mmap(vnode);
> > > >
> > > > Is the above afs_add_open_mmap an additional one, which could cause=
 a reference
> > > > leak? Does the above one need to be removed and only the one in afs=
_mapped()
> > > > needs to be kept?
> > >
> > > Ah yeah good spot, will fix thanks!
> > >
> > > >
> > > > >
> > > > >     ret =3D generic_file_mmap_prepare(desc);
> > > > > -   if (ret =3D=3D 0)
> > > > > -           desc->vm_ops =3D &afs_vm_ops;
> > > > > -   else
> > > > > -           afs_drop_open_mmap(vnode);
> > > > > +   if (ret)
> > > > > +           return ret;
> > > > > +
> > > > > +   desc->vm_ops =3D &afs_vm_ops;
> > > > >     return ret;
> > > > >  }
> > > > >
> > > > > +static int afs_mapped(unsigned long start, unsigned long end, pg=
off_t pgoff,
> > > > > +                 const struct file *file, void **vm_private_data=
)
> > > > > +{
> > > > > +   struct afs_vnode *vnode =3D AFS_FS_I(file_inode(file));
> > > > > +
> > > > > +   afs_add_open_mmap(vnode);
> > > > > +   return 0;
> > > > > +}
> > > > > +
> > > > >  static void afs_vm_open(struct vm_area_struct *vma)
> > > > >  {
> > > > >     afs_add_open_mmap(AFS_FS_I(file_inode(vma->vm_file)));
> > > > > --
> > > > > 2.53.0
> > > > >
> > > > >
> > >
> > > Cheers, Lorenzo
