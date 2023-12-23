Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF81D51D
	for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 13:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqBCAl5a"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3bb98e61b59so253817b6e.2
        for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 05:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703339959; x=1703944759; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gFN/JWUQNBbz2Rt0TnEnzTMVqwHhg8TmRPTdu1IMZhk=;
        b=iqBCAl5aQUU97hQhJ15yhUkek9jVpBX0P344KDHXQiZodyEVyxfdPM1sg1K547Q9Zk
         f6WcL/gcYswWejbES7k5LjtYU58FXpeILzqt6wbPYYA/viulNZOccRqRI7FDgr8QzLSX
         k4w2YEUThvSDMhuPLjZ/fkCZwL8wxHecY8yyXo9za41Ue2K4/0g3EHabsSrx3E0Dml7S
         U2j6GJW+cuqU4hZamvaQp0tbQzUCnuiY3U+JLgCmcXKFQyowWhAPXEoWL8JZhQWGESIx
         aD70WknOy9z73X6EXatA0yWs1jHnc68kVbMxeHADPS7GMLM1mOPIKMGfFMR3+ThK6y/Y
         ZApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703339959; x=1703944759;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gFN/JWUQNBbz2Rt0TnEnzTMVqwHhg8TmRPTdu1IMZhk=;
        b=Yb6/ohiXcFnYOKHJi7vU4hEvzqvnn8j6X1z4bXjbzOV0NpIffVnqk7aMPzOTPzjpAB
         cUNEV7iL1763PV4TyEjNe5u8b4Jg4FxvLw/xcPaeiZ3Pc04UgBWmFR3QE4fNIv5m089F
         rzYgPbYPeW0l68Qtg/JBGmXXIDf9NBIcG2ZN9s8dMoZahaucUqlsjLHuvBi1sbRbWSaM
         QVCHcoMfQlFGOZ+TYMyAZPohnmezFJRaiqgOk/1eng7OUaYNs1ILERxmrDJnBhuASvax
         oJ5n3e9HzZZ8c314bMUa/dKDFrT8zqL1JkrGnv53TdtODB142jLXExF3r4L2QUW4KA2w
         eXmA==
X-Gm-Message-State: AOJu0YyqrMXgC59UKCT9u5WQvG2waNizUJ1mP9utcNUiGTgLDQu8234w
	+uAdY2OesRUsjv4aetxesYTRUojilMN6wVwZkn8=
X-Google-Smtp-Source: AGHT+IHwz+pyBOWd/p0WXliaxQNFzW48D6/37njGjyW5fHA3ep7uDmOJXRWiBiR23Yq9jf7X7MRC/eVJww1g5qgf9YI=
X-Received: by 2002:a05:6808:1303:b0:3b8:b063:6665 with SMTP id
 y3-20020a056808130300b003b8b0636665mr2526149oiv.92.1703339959003; Sat, 23 Dec
 2023 05:59:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231223051108.74711-1-kdipendra88@gmail.com> <d1c18155-9c8e-4164-a2bf-5eab3d42995d@infradead.org>
 <e7a46035-9c5e-495d-8f20-73dca4fec068@redhat.com>
In-Reply-To: <e7a46035-9c5e-495d-8f20-73dca4fec068@redhat.com>
From: Dipendra Khadka <kdipendra88@gmail.com>
Date: Sat, 23 Dec 2023 19:44:07 +0545
Message-ID: <CAEKBCKPA0-VKA_r+YsGVb0cTKEQpV0dXwU8ARZ07LGmWuH2_OQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: pci: Fix spelling mistake in ia_css_acc_types.h
To: Hans de Goede <hdegoede@redhat.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	gregkh@linuxfoundation.org, hpa@redhat.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Sat, 23 Dec 2023 at 16:10, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 12/23/23 06:18, Randy Dunlap wrote:
> > Hi Dipendra,
> >
> > On 12/22/23 21:11, Dipendra Khadka wrote:
> >> codespell reported spelling mistakes in
> >> ia_css_acc_types.h as below:
> >>
> >> '''
> >> ia_css_acc_types.h:87: cummulative ==> cumulative
> >> ia_css_acc_types.h:411: descibes ==> describes
> >> '''
> >>
> >> This patch fixes these spelling mistakes.
> >>
> >> Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
> >
> > This patch is an improvement so it could be merged as is IMO.
> > But...
> >
> >> ---
> >> v2:
> >>  - Previously only corrected spelling  mistake reported by checkpatch.pl.
> >>  - All spelling mistakes reported by codespell are fixed.
> >> v1: https://lore.kernel.org/lkml/20231222200350.2024-1-kdipendra88@gmail.com/
> >>
> >>  drivers/staging/media/atomisp/pci/ia_css_acc_types.h | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
> >> index d6e52b4971d6..1dc2085ecd61 100644
> >> --- a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
> >> +++ b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
> >> @@ -84,7 +84,7 @@ struct ia_css_blob_info {
> >>              memory_offsets;  /** offset wrt hdr in bytes */
> >>      u32 prog_name_offset;  /** offset wrt hdr in bytes */
> >>      u32 size;                       /** Size of blob */
> >> -    u32 padding_size;       /** total cummulative of bytes added due to section alignment */
> >> +    u32 padding_size;       /** total cumulative of bytes added due to section alignment */
> >
> > I apologize for not looking at your v1 patch carefully.
> > The comment above would be much better as
> >
> >                               /** total accumulation of bytes added due to section alignment */
>
> I agree that that is better. Dipendra can you please send a v3
> using the new text suggested by Randy ?

Sure,let me send a v3 with the new text suggested by Randy.

Regards,

Dipendra

>
> Regards,
>
> Hans
>
>
>
> >>      u32 icache_source;      /** Position of icache in blob */
> >>      u32 icache_size;        /** Size of icache section */
> >>      u32 icache_padding;/** bytes added due to icache section alignment */
> >> @@ -408,7 +408,7 @@ struct ia_css_acc_sp {
> >>  };
> >>
> >>  /* Acceleration firmware descriptor.
> >> -  * This descriptor descibes either SP code (stand-alone), or
> >> +  * This descriptor describes either SP code (stand-alone), or
> >>    * ISP code (a separate pipeline stage).
> >>    */
> >>  struct ia_css_acc_fw_hdr {
> >
>
