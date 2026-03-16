Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4571C5486
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 00:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773621835; cv=pass; b=O1K6yQnw86hto9YBgcxWj8aYEjNOIhonW6BTCe9JFAiWZBw53cYCZVP9A7H5LSipGlWLHBlQZ/rgQx1hkTPxle+q75aqlPhRuayH8XjkNLTSrLtaJDpwBMYKVwHVxDBtRh1jQVDBFMLOv22tM7LbPcDWjKcQtyOFj290aeGcCGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773621835; c=relaxed/simple;
	bh=7LEG6GSfAF3VAhLmKNS+zMMoXAkVfIwRn9mYIfi1rWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WbmMh/oi7ZaP/zthQiMRzkSY3AsZNBwrdnHQ0T1vlaTTlwqVxyg13uUQnb8xLD7fDG3FrJJEOcvBmrqYs/HLYskeJbLece2XQ+iHOCzh8Evj6VjtxsxLIOuU1rL4ktQESDMtQkDEMf2YQoOBxgDSGwDtadldg/ezXjEfs75f6E0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oLPrnNrU; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oLPrnNrU"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-509062d829dso680131cf.1
        for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 17:43:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773621834; cv=none;
        d=google.com; s=arc-20240605;
        b=I4wEVbLZH3YsBR5Xfo2aYdI+jfA3V7o3i5e8tFmrgx4jCIwH+9JF8nI4gWF/p9JXm2
         OPCDZmLFrcZqhaBMdSg2WIhruGvCdbJZSFlr9mbDZofjhhcU78P+P29ulrw1V8iAzHkR
         aK9yGY1JssgPgvdihsBG8wxOsIKToNknCKDzcaMRmJZSuN8PVjHKOZZfagyx48NQD14o
         y5XUCeJXu205hhb3Q2JttuysYSW4UY7wgoVlZeJp3lZKMsbcX3jOQ/imU2zKnAxnoVEG
         kT+35EE5FeRlDMzqnkPbbusFq4oZwWDi/dw6LC2qHgPzWpIcfEntBfzVhVcVA2RvERgI
         Y+GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B4iLbVdU6UwNcjWJZqb9n6er3BcFb6HsfZvwCgpauBo=;
        fh=CybE7cE9Txo9xseDNglg9qKQ3wvosDxU7hZybk/L1io=;
        b=AjnqlS1jeuPrGh+bM8RBFcB+TJm7HouRNy8B+Bj7ogO95GpZBUpcyzOdNn9NPugNDG
         o6wNWMPJmQOX86+ASj31JXiB5iq7zGlTscMevpedL+fsf772Q7NlHdKQyU4do/QoBq1Z
         O5MdcI2rLl08juOBnOwvbkcdpRmoX0vwZnX5HEbdhBL1bOQY4T94AfCdSgA1lx4kQyAn
         5i6yL4gpA7eNG2fxTBHoWYVuA0sVB16WG7JUzBU5RbRsLZzXc+slpJVfA+q4CYMbwF/L
         OhazVquwDpk6PnSYaDVe1lv5X01fSkQWCyVrcTXOKjs3ktH1uevXv9r6IDiuMM03ZOPE
         wHiw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773621834; x=1774226634; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4iLbVdU6UwNcjWJZqb9n6er3BcFb6HsfZvwCgpauBo=;
        b=oLPrnNrUHET3ySLSgc3eCH2ritpw6u0C9Fz/WJCKc/18CvtGBMQJMglK7Jy1S6ROQk
         bsger3JPocGNyoZ0BxDfuFpA9rJ1kat9B+dyrm7GP4slB5P4KMwOOFDqZqPXQ/hP3RKu
         UHN4dHoNXpCB5361jU5HndY4H/4+QkB36+Vl6vT2arX6MeI0800F2OyYOV6S89eh9tFd
         ZpUg7dp3C3R0xxD+EZSEmMk/DamhmZ232oBeXr8wSygdUqj5LU9kGeWEu9nBksGbNdQE
         yYAd1gbaLQP4J1NBx1iAhDZfiQq9XlulyjXGzrtJNPcpVQVH9oz+Zdd5NfgekUV3Gp3U
         EAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773621834; x=1774226634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B4iLbVdU6UwNcjWJZqb9n6er3BcFb6HsfZvwCgpauBo=;
        b=PMmZ/cuTYLKDLDKX8QFabhd5U8fV5EUa2k1edrkTFAcjpIYPZOkrT02XZSWn9GwKba
         atZYh2p9/xT1UbijkR9nbm1eB8TwDf3Wto77cJWSE/LqRsX+Fs4olsWji16ZEyp03PdI
         TEO8vNcW5tNg79y7TRLYC6xokSVp9d2ZNaZi0ZHHAdhK6WJVa4TuOmKh/0I0+uo9blpd
         Ac+ws9GbVY3pMxzK2gFVNg/wXgvyvJ7/1z4q1OK+dcqYOB/fMWf9+ZArWeVQs5t3kg0s
         wE6rSMC8P1O5rJM20VHlYMk84RzYpFvfqS6vZYKRogPwU+Jh1/BWCKDct9awIBep+erz
         hWnA==
X-Forwarded-Encrypted: i=1; AJvYcCXQxpxcVUPG2/d8O9pek80oHXBC8Wtj5utvV5h6wwJym9SUtqKsSMWimicHZ5m0YNL3ySSOgF7Nr65jzHGE@lists.linux.dev
X-Gm-Message-State: AOJu0Yzb90ucwN64zYJNq6M4eoW3wgHV9/x/tMNSj95ebMUV4o1alFN1
	XpxfYYtFqtaE1OAR9Hcdsbm0OG6I3Db06/pmX+7hLLpBv4RtbhpzcL7bON+gI1ud/NLjqxq1e+d
	DnZ3NnNV3iZNqcFNyXvXGr3k7QTA7eT4lM4mGxtwP
X-Gm-Gg: ATEYQzwaz6UAlc+wri1CH3r5PyMippTWmbyYMZeWiai37icr0hyvIEi2lTAv6EQ125C
	b1HGiTQPFGhb0mLnHTce0dSJ7JpRjmiMCHS7YnPoHkgCF2gWjQBRWqkWdcnLwCEG8lnXC780Vsl
	9SfdoGOKH5hEzatqphNb8kUw3/mJJHzc5J2vb6gfmzypBPw9lTBcCLS4NCG2Dkxvo2b03OdGHsw
	Bpv/XJXdlafwbyxpiWZP2OabuUBLzY6x5Mj292DJACTx+Qj2EgENyyKCGjeXdh3fAGPIofi1Azv
	FG8HAQ==
X-Received: by 2002:ac8:590e:0:b0:503:4bc:c925 with SMTP id
 d75a77b69052e-5096aa2ae2cmr17578141cf.13.1773621833001; Sun, 15 Mar 2026
 17:43:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1773346620.git.ljs@kernel.org> <52a7b9a003ea51521ab3c0baf30337a7800a3af7.1773346620.git.ljs@kernel.org>
In-Reply-To: <52a7b9a003ea51521ab3c0baf30337a7800a3af7.1773346620.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 15 Mar 2026 17:43:41 -0700
X-Gm-Features: AaiRm51H9IsCynzRpnxAc6_DrzYXD9cjd8fR558hmylwDQfMj5FrJzUnU5dorNw
Message-ID: <CAJuCfpHVN66abFrJgorXKBsjv7Ut=CP-E4NpLMC4SW613tJwtw@mail.gmail.com>
Subject: Re: [PATCH 03/15] mm: document vm_operations_struct->open the same as close()
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

On Thu, Mar 12, 2026 at 1:27=E2=80=AFPM Lorenzo Stoakes (Oracle) <ljs@kerne=
l.org> wrote:
>
> Describe when the operation is invoked and the context in which it is
> invoked, matching the description already added for vm_op->close().
>
> While we're here, update all outdated references to an 'area' field for
> VMAs to the more consistent 'vma'.
>
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> ---
>  include/linux/mm.h | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index cc5960a84382..12a0b4c63736 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -748,15 +748,20 @@ struct vm_uffd_ops;
>   * to the functions called when a no-page or a wp-page exception occurs.
>   */
>  struct vm_operations_struct {
> -       void (*open)(struct vm_area_struct * area);
> +       /**
> +        * @open: Called when a VMA is remapped or split. Not called upon=
 first
> +        * mapping a VMA.

It's also called from dup_mmap() which is part of forking.

> +        * Context: User context.  May sleep.  Caller holds mmap_lock.
> +        */
> +       void (*open)(struct vm_area_struct *vma);
>         /**
>          * @close: Called when the VMA is being removed from the MM.
>          * Context: User context.  May sleep.  Caller holds mmap_lock.
>          */
> -       void (*close)(struct vm_area_struct * area);
> +       void (*close)(struct vm_area_struct *vma);
>         /* Called any time before splitting to check if it's allowed */
> -       int (*may_split)(struct vm_area_struct *area, unsigned long addr)=
;
> -       int (*mremap)(struct vm_area_struct *area);
> +       int (*may_split)(struct vm_area_struct *vma, unsigned long addr);
> +       int (*mremap)(struct vm_area_struct *vma);
>         /*
>          * Called by mprotect() to make driver-specific permission
>          * checks before mprotect() is finalised.   The VMA must not
> @@ -768,7 +773,7 @@ struct vm_operations_struct {
>         vm_fault_t (*huge_fault)(struct vm_fault *vmf, unsigned int order=
);
>         vm_fault_t (*map_pages)(struct vm_fault *vmf,
>                         pgoff_t start_pgoff, pgoff_t end_pgoff);
> -       unsigned long (*pagesize)(struct vm_area_struct * area);
> +       unsigned long (*pagesize)(struct vm_area_struct *vma);
>
>         /* notification that a previously read-only page is about to beco=
me
>          * writable, if an error is returned it will cause a SIGBUS */
> --
> 2.53.0
>
