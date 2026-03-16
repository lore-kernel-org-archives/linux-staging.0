Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E4812E1E9
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 02:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773628388; cv=pass; b=WHAl/HEyvj0aKav0Gq0OKLqe+Jln7g9NdoOwA1rQyuf80hNAO4nD8cx3stoJS6tafUBQnHcnNrSfeeu0Ir6HGuXiyZ/4+/zFGGULnak/JVhwvUWCHnTEVDW6/mMJSj81SRPuNsxo2Vw1pL63gRedGo24KP+XnCWLjeRCtODDH1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773628388; c=relaxed/simple;
	bh=P8upWlYrnSKRURZkcwVOV+h6+eQ68h1jm6EnGvbVBq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VWeBMN0bqY5AOvK2JaUy4FvL1WAM3qgJLXm3OHyZ6h524Mdi6jCDnqB7XbspD+GVsZnYGRvRKLzqPAs6HKAaSW1L4WFr4qij3IY2nBty2ZT5ANmBL6ZDjWS1mBuLU4YOOS4eFMWmVdPbcZXI3SAcKCzbnn22zNkilOAjx9g4bf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ha2qN2B9; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ha2qN2B9"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-509062d829dso709011cf.1
        for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 19:33:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773628385; cv=none;
        d=google.com; s=arc-20240605;
        b=P5rQ1E+y7KaPW9/NJzKDRuIYYi4L51qfyE5aBhzu2I5ovwGI96teWgNAFbNftTjhH6
         TAeJ6s8nz8ZdLpmoXwYEsyyHk7zDxDV/7HFioHIACSDVTYSnmLlnop2Z+1frlZ21ktF4
         oOGpn70QBcPmy9Qp3OwVGeVC3Uo9g3QOAcGFthniutIxiimp464O5v+aNLnqQu29WJlR
         tI9dISVvu9ceiHRnaE/SfMhsuiGI2il3KTss+tmeGnjmlFFGoWgtyiGDiNRsLLcUCnCs
         WcntliU7X46UrhXKHlwLKABHfGLqtb7cCmiuev6DXn62EATMvZ9M7kwCAuAUl2ms+4GW
         ZHPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SOxR7OMcrpIXquZYk6Fw42QRhAnf+JOcixO64waw3M8=;
        fh=ANrUD+y2u/1BH89qv+ocnszTkZSdjSWTstddVFaYSZw=;
        b=K/oYetwse5ZgY7Zu/Fc1pl9jmtmSz5+5kxlq/uF270pDU3Qqjz7bDBXPrTrXd/ysTF
         99Wa2HYFAQ4zEyOcN37PmmfYFrB6Xp7Ea4giVEQSB78mqUFInzI4oBpBCGrNzIN447B1
         Ut2rZJgw0FOP8OTfeSGPVai99t1E3vZu2pKhMUvmSquuBY+IWyejSKAw8TJf9DFGPuDR
         E/Vx3n1mrGidu7Ixms9TWtfsulnitI/LIsnArKayn81uPtgLL/sJoKVGX8dpUAWTqtVk
         6HolzqdeN7k3KJ11JzoGkDJiEZJgHCg6FcVUW/6zECuaU+8G06zTnLtkwElj6q9zKmw0
         2LJg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773628385; x=1774233185; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOxR7OMcrpIXquZYk6Fw42QRhAnf+JOcixO64waw3M8=;
        b=Ha2qN2B9RDa+r4bEBwqonsxjLtAiFwlupW+zE+qe1o8fs2CT7rKpvlsv4ED9D8f4VX
         wFSCzADeGZI3u/ZpeuaGU+5Tq6gls+Sy3MegtmLdI5zj3vxJe8A2fetQXMHd7RTJu9NU
         reRXQv9x4sKg+Th1e5xPgUBU44K4CBmWEctD0KI63jTukMW3CZcXURqqjKQnDu84sut5
         BG3mAnVwqqdNltagJ4BebhgPmiAZnr3Nx0vy8WIPkHNhdyeOipEvk+lp+n8qK0K+LJu4
         NR0u2cMipkkMs7XuGAXVeexHiZD9wuclrDBFUGJXbk9GLxpCQw82r1TnxyXCLn+SooXR
         E7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773628385; x=1774233185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SOxR7OMcrpIXquZYk6Fw42QRhAnf+JOcixO64waw3M8=;
        b=fqlEHP0nnT8WkgpfaI0wkkBXzLj0XY88x432KkHJkHNmZWV636XhN3H7+Jwg76x3Pk
         J2CgDOkLMYyUDw+9ZCffGi3PZQGwP3bfeWTX8SN4u6JMqNEysnB5FLU1pGsGbE2LiKyO
         teiShfIIjaE5TlJlV/JE5HBSqmhjB6la+KBM5bOEhM6tCoLo55Y9NLQRlKCiu0QLCzET
         NHRmyRR6wXTMmN0VRooDDkFUv8ecWRWzm9mwdXw2pu2bWJMJ4O0cxH4sOy82SIc87qL2
         md5RTSYpicezUzvEVgeCY7EA+oSiSTZPCuyo5LPlj0HJ97Q0TqEJVIReSgzxXGpfCAtn
         9p4w==
X-Forwarded-Encrypted: i=1; AJvYcCVgcS4ki/qEihd743jJi8tqg+wQt29l7glrxk5FvhG6rR2rH3LyvvQzrjFygdhEhH3GOnp4nqjQVTEFKowM@lists.linux.dev
X-Gm-Message-State: AOJu0YyQzGG2xL3z+Phc4+H9j2aQJpeLfkIw55JFnSsrB11aBS8gNgp/
	+oWnLJCb0ZG/RlDsp/VtQmTBSKy8bZwoUF/i01eDnDTcckxPF2fZqDx6OBJhkwqdT0K01XBc+pw
	ZFIlDDlj4EYKnmZFQ1SS98k7+C5rlhcxnFyu4D3mX
X-Gm-Gg: ATEYQzyBOa25AeUwADUatQhkaFRvO2MHzwXQE4JVVS2SZwTgJMKYyAFrONp5MZUaEbP
	TOqm9XMsC+lZchesX7Ab/m6VAAMex7ujmI1TUzzoE/lGFP+lW2Rx0K4DeYN+lC8GTex4YkkttFY
	gPi0YwE0+3S+mDHKatu9jm9AWCfO8JZfkHN/qJHrszLc01/zp0NhSCFxLOJdcIFVMv9uxkCWZAZ
	It0n2ru/qeBRb9uTDMnSxodMnTIpSGTCW1df5u3eo0GvkowRoTtSGJVrSIx7iB8v0Iipw+FWPAa
	uyZ3ow==
X-Received: by 2002:a05:622a:60c:b0:4fb:e3b0:aae6 with SMTP id
 d75a77b69052e-5096a92ebdbmr823271cf.1.1773628384887; Sun, 15 Mar 2026
 19:33:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4a5fa45119220b9d99ed72a36308aed01a30d2c1.1773346620.git.ljs@kernel.org>
 <20260313110745.2573005-1-usama.arif@linux.dev> <c62305d7-22c4-4cf7-969b-fbe214c93b64@lucifer.local>
In-Reply-To: <c62305d7-22c4-4cf7-969b-fbe214c93b64@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 15 Mar 2026 19:32:54 -0700
X-Gm-Features: AaiRm52_478_pqzpMaMH6nJQtQvcaF-xKuK5uDWZ-u00xGMYRYKMJPl6M-Q1q5E
Message-ID: <CAJuCfpFio6n-O-1NkPXrymV0o3UqvHYS8ZOyQtt=JXnZ5dTGhQ@mail.gmail.com>
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

On Fri, Mar 13, 2026 at 5:00=E2=80=AFAM Lorenzo Stoakes (Oracle) <ljs@kerne=
l.org> wrote:
>
> On Fri, Mar 13, 2026 at 04:07:43AM -0700, Usama Arif wrote:
> > On Thu, 12 Mar 2026 20:27:20 +0000 "Lorenzo Stoakes (Oracle)" <ljs@kern=
el.org> wrote:
> >
> > > Commit 9d5403b1036c ("fs: convert most other generic_file_*mmap() use=
rs to
> > > .mmap_prepare()") updated AFS to use the mmap_prepare callback in fav=
our of
> > > the deprecated mmap callback.
> > >
> > > However, it did not account for the fact that mmap_prepare can fail t=
o map
> > > due to an out of memory error, and thus should not be incrementing a
> > > reference count on mmap_prepare.

This is a bit confusing. I see the current implementation does
afs_add_open_mmap() and then if generic_file_mmap_prepare() fails it
does afs_drop_open_mmap(), therefore refcounting seems to be balanced.
Is there really a problem?

> > >
> > > With the newly added vm_ops->mapped callback available, we can simply=
 defer
> > > this operation to that callback which is only invoked once the mappin=
g is
> > > successfully in place (but not yet visible to userspace as the mmap a=
nd VMA
> > > write locks are held).
> > >
> > > Therefore add afs_mapped() to implement this callback for AFS.
> > >
> > > In practice the mapping allocations are 'too small to fail' so this i=
s
> > > something that realistically should never happen in practice (or woul=
d do
> > > so in a case where the process is about to die anyway), but we should=
 still
> > > handle this.

nit: I would drop the above paragraph. If it's impossible why are you
handling it? If it's unlikely, then handling it is even more
important.

> > >
> > > Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> > > ---
> > >  fs/afs/file.c | 20 ++++++++++++++++----
> > >  1 file changed, 16 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/fs/afs/file.c b/fs/afs/file.c
> > > index f609366fd2ac..69ef86f5e274 100644
> > > --- a/fs/afs/file.c
> > > +++ b/fs/afs/file.c
> > > @@ -28,6 +28,8 @@ static ssize_t afs_file_splice_read(struct file *in=
, loff_t *ppos,
> > >  static void afs_vm_open(struct vm_area_struct *area);
> > >  static void afs_vm_close(struct vm_area_struct *area);
> > >  static vm_fault_t afs_vm_map_pages(struct vm_fault *vmf, pgoff_t sta=
rt_pgoff, pgoff_t end_pgoff);
> > > +static int afs_mapped(unsigned long start, unsigned long end, pgoff_=
t pgoff,
> > > +                 const struct file *file, void **vm_private_data);
> > >
> > >  const struct file_operations afs_file_operations =3D {
> > >     .open           =3D afs_open,
> > > @@ -61,6 +63,7 @@ const struct address_space_operations afs_file_aops=
 =3D {
> > >  };
> > >
> > >  static const struct vm_operations_struct afs_vm_ops =3D {
> > > +   .mapped         =3D afs_mapped,
> > >     .open           =3D afs_vm_open,
> > >     .close          =3D afs_vm_close,
> > >     .fault          =3D filemap_fault,
> > > @@ -500,13 +503,22 @@ static int afs_file_mmap_prepare(struct vm_area=
_desc *desc)
> > >     afs_add_open_mmap(vnode);
> >
> > Is the above afs_add_open_mmap an additional one, which could cause a r=
eference
> > leak? Does the above one need to be removed and only the one in afs_map=
ped()
> > needs to be kept?
>
> Ah yeah good spot, will fix thanks!
>
> >
> > >
> > >     ret =3D generic_file_mmap_prepare(desc);
> > > -   if (ret =3D=3D 0)
> > > -           desc->vm_ops =3D &afs_vm_ops;
> > > -   else
> > > -           afs_drop_open_mmap(vnode);
> > > +   if (ret)
> > > +           return ret;
> > > +
> > > +   desc->vm_ops =3D &afs_vm_ops;
> > >     return ret;
> > >  }
> > >
> > > +static int afs_mapped(unsigned long start, unsigned long end, pgoff_=
t pgoff,
> > > +                 const struct file *file, void **vm_private_data)
> > > +{
> > > +   struct afs_vnode *vnode =3D AFS_FS_I(file_inode(file));
> > > +
> > > +   afs_add_open_mmap(vnode);
> > > +   return 0;
> > > +}
> > > +
> > >  static void afs_vm_open(struct vm_area_struct *vma)
> > >  {
> > >     afs_add_open_mmap(AFS_FS_I(file_inode(vma->vm_file)));
> > > --
> > > 2.53.0
> > >
> > >
>
> Cheers, Lorenzo
