Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D504A15
	for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 05:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WdBc+zDp"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-466e51243beso539227137.0
        for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 21:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703309386; x=1703914186; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2rOcyFfxflN36gMhvNpR/DHK+BxldNKzckHr4V32hdY=;
        b=WdBc+zDpCqGB6ieBtreuZb99WDtK8RfVnzJ6lls+YnWl2roLVTHG/bcNXBfp2jsJj9
         5GeDODIF5i0IWKfst2CuIDNUg3a11rMuJrQ1r2MX92ZZGu2COIhxGUw7TGgVMa9d5qqX
         w5QqRZIfWEBV/X0S1fxa2fFpMn515xIcyCpEuKb07e3SP9ywttKcC82q25rDwzXBP+bz
         VHB4U+SFKIg0JoaGx84iOyDS+pOB17gZBNw5Mo450L4oqKT1DXpqI1o+hG0gFt4Pcjx5
         msjK3+PXLbMuBKm4BiycHrAM4yqoRPshbTZKklMa1UkjG3nreRiaI3/WSeEv2JIn2C3+
         MV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703309386; x=1703914186;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2rOcyFfxflN36gMhvNpR/DHK+BxldNKzckHr4V32hdY=;
        b=OWBtUZYSV3PKjXkW6uVhf2cd+RA3Gxji6TyUXj4ZJGPir58OjBnNtdkS9Qn3AyB3ZJ
         ou9zQAAfptayezxaahFubCDAKRtATnuZxoIfhZhkFZvJUlwR9gJartDkTaibOCX5bAFM
         rsmi0TabUOmV+DMujFOzMaTQe3uJ4n5V+gbtnp3Sxlrm810RIgk+oX1zDKvyoDkM5vzY
         O4JJU9+3Q0SUXg3BTahGNUVVxb6l3E1dQe700GkKgi6w3OlxqJ+ZL40tJlNmPjwi44jd
         6F+2mnmgsSrOjroaaKqmZftwg9LRW2wYSIEK5BiHCnh1WoZ9+ky92vpMaryGl1xU/qUJ
         GSFw==
X-Gm-Message-State: AOJu0YxzVaZX/viJK2m/qWzOmCsUmHePIBa1lKooq6PtsapxVG5qumop
	j8CC+6kt05vnuIJZA0UEAQI8BhgLdHJxbwjftWo=
X-Google-Smtp-Source: AGHT+IGcwfl+nZgyqOI3mjw5SJycNNKtCTspNzLxl1V2itEH0srYxfsVRjfqZNbeYjSLhf1B+i9CeGZg5QXIxjJvYLE=
X-Received: by 2002:a05:6102:2ed:b0:466:e5af:2384 with SMTP id
 j13-20020a05610202ed00b00466e5af2384mr1195497vsj.23.1703309386228; Fri, 22
 Dec 2023 21:29:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231223051108.74711-1-kdipendra88@gmail.com> <d1c18155-9c8e-4164-a2bf-5eab3d42995d@infradead.org>
In-Reply-To: <d1c18155-9c8e-4164-a2bf-5eab3d42995d@infradead.org>
From: Dipendra Khadka <kdipendra88@gmail.com>
Date: Sat, 23 Dec 2023 11:14:35 +0545
Message-ID: <CAEKBCKP+-6=JuRYtHU7YVstfZzzbTdvm9L4PBvOWAgKj2xaOrA@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: pci: Fix spelling mistake in ia_css_acc_types.h
To: Randy Dunlap <rdunlap@infradead.org>
Cc: hdegoede@redhat.com, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	gregkh@linuxfoundation.org, hpa@redhat.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

Hi Randy,

On Sat, 23 Dec 2023 at 11:03, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi Dipendra,
>
> On 12/22/23 21:11, Dipendra Khadka wrote:
> > codespell reported spelling mistakes in
> > ia_css_acc_types.h as below:
> >
> > '''
> > ia_css_acc_types.h:87: cummulative ==> cumulative
> > ia_css_acc_types.h:411: descibes ==> describes
> > '''
> >
> > This patch fixes these spelling mistakes.
> >
> > Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
>
> This patch is an improvement so it could be merged as is IMO.
> But...
>
> > ---
> > v2:
> >  - Previously only corrected spelling  mistake reported by checkpatch.pl.
> >  - All spelling mistakes reported by codespell are fixed.
> > v1: https://lore.kernel.org/lkml/20231222200350.2024-1-kdipendra88@gmail.com/
> >
> >  drivers/staging/media/atomisp/pci/ia_css_acc_types.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
> > index d6e52b4971d6..1dc2085ecd61 100644
> > --- a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
> > +++ b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
> > @@ -84,7 +84,7 @@ struct ia_css_blob_info {
> >               memory_offsets;  /** offset wrt hdr in bytes */
> >       u32 prog_name_offset;  /** offset wrt hdr in bytes */
> >       u32 size;                       /** Size of blob */
> > -     u32 padding_size;       /** total cummulative of bytes added due to section alignment */
> > +     u32 padding_size;       /** total cumulative of bytes added due to section alignment */
>
> I apologize for not looking at your v1 patch carefully.
> The comment above would be much better as
>
>                                 /** total accumulation of bytes added due to section alignment */
>

So, would you like me to change "cummulative" to accumulation or
should I wait what other maintainer(s) would say?

Thanks.

> And if the maintainer(s) want to take it as is:
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
>
> Thanks.
>
>
> >       u32 icache_source;      /** Position of icache in blob */
> >       u32 icache_size;        /** Size of icache section */
> >       u32 icache_padding;/** bytes added due to icache section alignment */
> > @@ -408,7 +408,7 @@ struct ia_css_acc_sp {
> >  };
> >
> >  /* Acceleration firmware descriptor.
> > -  * This descriptor descibes either SP code (stand-alone), or
> > +  * This descriptor describes either SP code (stand-alone), or
> >    * ISP code (a separate pipeline stage).
> >    */
> >  struct ia_css_acc_fw_hdr {
>
> --
> #Randy
> https://people.kernel.org/tglx/notes-about-netiquette
> https://subspace.kernel.org/etiquette.html
