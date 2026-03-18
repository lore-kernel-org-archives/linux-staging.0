Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01EB3D669C
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 16:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849747; cv=pass; b=BuApu3ISy8VXGN38nUMjAjarrj7oakfidYJkCvBMcinyZJuEv8ZD/r5Vq+Y/F93lbEAMXH7MQa1SovNux5YOjN0paODb127pqv5AsubevBaoQwWhIzdkgQtWmN7DQN1/BHVZoHBCUsKXs9yMFDu/DyQcQArxLEmC2wc+NW8XQwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849747; c=relaxed/simple;
	bh=Sn9jbrHlytwm6vm7UMn5Ci63+904PwFRZxmCisoVDck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mTnGaN0VLBcrboVje8cr4jTkIzdzT73fM0hFlDzr9sJqi6qP5D1Rp4RrLyDaYXc+fl7hk3owf/XjqnNFISGcFQ5s2y3Bz+ZUd/Q3zgEAU08jc+HazEvBtkHizUaguaKUXAQ9n/ZMIOj4iixno+F7gtZc6k/yNd5EvLzg5TtzKf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v+gC3Ar0; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v+gC3Ar0"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-509062d829dso620711cf.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 09:02:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773849738; cv=none;
        d=google.com; s=arc-20240605;
        b=cKHZYQ7Tq1hNxBu+/gErsEe6Gxzk81OoQ7KGXvc24pqdiMtrm8mTFlapxyYtHAXqgS
         HRHuklqHAiKiq81YqycyR3juysR07IM5h4VNMv5cP3Bs59Yj7XtemLvp3ARQHPDJNCdr
         Ia0UkOvWWJ8VmzEWELDEz8gPCg1+X4lYQdTJYV0/rrvpJTOvD5sfdBKW0gT6OsRXtRDY
         9uN9Sq7AnLmRSTSr4dvoHd0VkFB0fkrQfY1Trvu894XzStiCiF5OqYkkpajdW3Iq1ul5
         YNPz4YVb8XG7iQQFyTnRrroaEaEYnmMPQoMjuLSp3wyOdYM74Vt6Icn1/FLa9Xt+qHgP
         ynzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bBf0X4ZI8hrueKElVjOm/fdCiPNUuzJRpv2jzIUCVLI=;
        fh=qX2NLwrAuzMl5WMXX+IiEONnqpbq6UTOFb5JYQEc79U=;
        b=O3yVW5ox6yENsQ63Gbh8xvSYp58Gki1O3IdLkO67g8JWAy1GAoxTJ4/FStwIWzgkhd
         odiiMdJoV+2SuOu5wHaGq36qv1T6JrQII8iaOlqKonO7xM+uwSZZD3DtCiX5XOQ56y8a
         hbkWMDkgy0TFzBOB4Efy10X8E+Rc0koZBKxUqbn2Bt/nHf67EgjlLYPtRxrTgSWf9x2a
         qGEpG247LCnv8ZEGXOdT2pcR/IuGgG69XWFpZY3iq1JrcKcsnj0VixOBOo/zkEpvkC2O
         ozwMAA2uohyROoVWphJHfeb5zqZad1Rd+MLmBLJf/oNKsgHZsPCI5ZPJZVHAbD8jgNRA
         OWhQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773849738; x=1774454538; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBf0X4ZI8hrueKElVjOm/fdCiPNUuzJRpv2jzIUCVLI=;
        b=v+gC3Ar0kLKrgfB1+4f7UV/3sfAAVrdTGm5z3QXrJ6cbS9lXPm4UyKvati8Lw9X7xU
         sYPoSjGIELPQKzJZ9/jhjaUQle0xb991vxE5aM+lOi/Goti6o+12WG/q90y0y5QJQIM2
         klx6QQLU/mn6EleHJScpOqwuzvjyYEvg9u4Hujt29lmpCtD3ocAu049/PcQM9yNdOvgf
         nBfFtPDNgZ3aul+BHD/ouOYfH/UHAzvPr7iegQXS3IixBCVHE8JcAwri5DApcS1sfkGD
         M6dghBAznUb38B28Ybv04o2XXsFU7EG0xScdDM632/S7X8atqJx1gOIqxkYds/k1yvCl
         pCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773849738; x=1774454538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bBf0X4ZI8hrueKElVjOm/fdCiPNUuzJRpv2jzIUCVLI=;
        b=mlOKfXa5HX7X9xiR/ut0I7VoEJ937oxgMtfvI1fdyxaFBr+eucZRtMugTo5xjmUB8u
         dDY3wFAFNsI3vkiU+BeuTmEpMRLboyjatWMugqTrCYLEnGr7kaFXfh7VqIR0rlmgAyth
         usQkWzzhOyI1RZNiXDt+sK7YAYUHFjO0m6/xeQ6wVUks8krMSjClAkua43osgy+PKwTL
         OGuvl5vQ0dkIkup/wRSR374JVJthFKwhZ5Pdb4g6SJDEo2AxSF43Dka0RtBMhFNn32CR
         9JLsJ4K661/JYxyOAu1gA7+pYU8YL65WersejWWGjlEz2mu2XGazVVrRLERS3iUPfDHK
         a9EA==
X-Forwarded-Encrypted: i=1; AJvYcCU8TTFEoT1RYYn9bC8tDOUlmT2B+kM0uT3L2tDxkDTaB4duT3RKP9ezJu6XZNSOVMee4/FiFqXJPo5X4Wmz@lists.linux.dev
X-Gm-Message-State: AOJu0Ywjr0VKXDv5N8ckFz47A7hRRXntXYoX9XXEwuhE48HJFSvxBVeQ
	imO2cpGfJeJHnkzlFf9WMDmIhmyZdydccoL4qauhYFFjWumsK3v9XwjhtiKPC8s8Wy/ZrbtAAp4
	xdG5Zm7nnJVTILLOz2fcjatG5Am7VXav4vzX3dCJd
X-Gm-Gg: ATEYQzwn/2jF4eB1aSGRBNT/yShI9Ro3MgoPmt7jZ2cXrrlT/XCDbmRdzB6HvEzTq/C
	72WziJGBzm0ccObG91DpJeq5kmGVx/mnMcwmb1viYzbmwHhoeRJcMYdVTGbDu6W+eyxNix8nIiq
	XQBSN/+jAu7ypmENtR1gbIlCbT0tJ5PWGGk1UGXWayhxmvqC0vPhyo35SH9dO4dShrRmMVa+o2C
	vucb8CESzO5EXfatrmGNY4q4n0gMND8EeGZcd3NeOKmlBdIHxIA1QEWIisRGOsJq9IBJlL45uV2
	hWhKOEgFPqEwsTyyr0SK1oJDDk/JzT9il/uou+T+KVmp7LvW
X-Received: by 2002:ac8:5d4e:0:b0:4ff:c0e7:be9c with SMTP id
 d75a77b69052e-50b1462cacfmr16816931cf.0.1773849737454; Wed, 18 Mar 2026
 09:02:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org> <4e152e7b8e1a93baf0777628eef9409d031cf8f6.1773695307.git.ljs@kernel.org>
In-Reply-To: <4e152e7b8e1a93baf0777628eef9409d031cf8f6.1773695307.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 18 Mar 2026 09:02:04 -0700
X-Gm-Features: AaiRm52kf0p9Fxu6EolM9nhc_2BIDOLEzyHhrKwtGPKlzkXo42y6XvhNDeOCJ6g
Message-ID: <CAJuCfpFd-d-E24d5-G6=dSYDpyHkwS=aXzGd6+SzyMkgssyPAw@mail.gmail.com>
Subject: Re: [PATCH v2 16/16] mm: on remap assert that input range within the
 proposed VMA
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
> Now we have range_in_vma_desc(), update remap_pfn_range_prepare() to chec=
k
> whether the input range in contained within the specified VMA, so we can

s/in contained/is contained

> fail at prepare time if an invalid range is specified.
>
> This covers the I/O remap mmap actions also which ultimately call into th=
is
> function, and other mmap action types either already span the full VMA or
> check this already.
>
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  mm/memory.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/mm/memory.c b/mm/memory.c
> index 849d5d9eeb83..de0dd17759e2 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3142,6 +3142,9 @@ int remap_pfn_range_prepare(struct vm_area_desc *de=
sc)
>         const bool is_cow =3D vma_desc_is_cow_mapping(desc);
>         int err;
>
> +       if (!range_in_vma_desc(desc, start, end))
> +               return -EFAULT;
> +
>         err =3D get_remap_pgoff(is_cow, start, end, desc->start, desc->en=
d, pfn,
>                               &desc->pgoff);
>         if (err)
> --
> 2.53.0
>
