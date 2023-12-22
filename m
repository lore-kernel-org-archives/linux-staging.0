Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F752E841
	for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 20:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UrzMRiiO"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6dbd445f395so16380a34.2
        for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 12:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703276964; x=1703881764; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ma5xrM90AVaZ9gvSq4/3m7j8Wtpi322oe0vwjTHYLoY=;
        b=UrzMRiiOiGBupWzG3V6c/XtTbvTF5IoqZ2tIxAPFjLGivCqPxhjR65NmVlLuqExyCq
         boRrsTemyMSaKHUmpK2tgzQB55fU/gCUVXCEhYg8PXMKUbsFvsXxnCgqbOGf/EqBn6i9
         P2WLmOm6MZFqb1Yb9ffWK2csgogBlCLjM8VxvnR9fvWOoQW6L9U1YHwOeNkrAmr5d4Or
         xqlokuu0s2V9jlvH4++D9UAp1WhZ4Y/nYjYzB3IGL5RISedgYYmBQOE0Whl+W5AHdvdQ
         6pCtiIEHuXoLJNNRKqmIjxcglZydJwpRIyJX7Qh1E7PBjTyaL2R6q7cS2Dumln1wd9LR
         HpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703276964; x=1703881764;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ma5xrM90AVaZ9gvSq4/3m7j8Wtpi322oe0vwjTHYLoY=;
        b=B45i9DkU2wMVN2/kaZLMHhS37+laG+m/99gSKj2YICefv/yVvwRxCUBF2x71riDbxN
         LtyO995WcYQayxZ5/fSVVnIJERBnmX+csv0aFFQvp7PuCupmCq2ixz8F8vG0aVcmWhS6
         L+w0sblQwVfO6VUm4OZLBmtWVuXfq/2yucyRK7z60A/q5SldP8Lw103tAixFaRgYez+p
         tMGn/LWglbt/Du7Q/Lp7ovnsm+h3L7BEr128ySC2IS+vKsmMr6f4NLeRR5sJ4+Stal3u
         lqhPRJF5jDPJMib8xMvRKZV1BTcCcy6ex+3mRPUNUO9nJ7shmNW69/XA+t5iJYQHeTR0
         G8Jw==
X-Gm-Message-State: AOJu0Yyg0Hx8GM0RbXs3vAtDQJdscycOu+X27dA1yuxfsLQoqUHfE7MK
	mtjFvBYrJLEFIyTQIAG3yGOxMusDtxkXGlmWf/w=
X-Google-Smtp-Source: AGHT+IEsIZ+rGop40x8sg+JUQu1HomFUt1JRxpCMluno/bDXoAig9/vIAsdBJPvCyV2nKOBjRgUQBqNs44KX21GqnQg=
X-Received: by 2002:a05:6830:1190:b0:6db:c20f:9070 with SMTP id
 u16-20020a056830119000b006dbc20f9070mr1415779otq.31.1703276964657; Fri, 22
 Dec 2023 12:29:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231222200350.2024-1-kdipendra88@gmail.com> <b4ad9a64-53cf-449a-aa18-d19ff3c72c52@infradead.org>
In-Reply-To: <b4ad9a64-53cf-449a-aa18-d19ff3c72c52@infradead.org>
From: Dipendra Khadka <kdipendra88@gmail.com>
Date: Sat, 23 Dec 2023 02:14:13 +0545
Message-ID: <CAEKBCKO4uGKxXPZHO9iqYZ_8ibgY3HS3C8Rsogcv1XU+qGkudA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: pci: Fix spelling mistake in ia_css_acc_types.h
To: Randy Dunlap <rdunlap@infradead.org>
Cc: hdegoede@redhat.com, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	gregkh@linuxfoundation.org, hpa@redhat.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 23 Dec 2023 at 01:57, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi--
>
> On 12/22/23 12:03, Dipendra Khadka wrote:
> > The script checkpatch.pl reported a spelling error
> > in ia_css_acc_types.h as below:
> >
> > '''
> > WARNING: 'cummulative' may be misspelled - perhaps 'cumulative'?
> >         u32 padding_size;       /** total cummulative of bytes added due to section alignment */
> >                                           ^^^^^^^^^^^
> > '''
> >
> > This patch corrects a spelling error,
> > changing "cummulative" to "cumulative".
> >
>
> 'codespell' reports this one as well:
>
> drivers/staging/media/atomisp/pci/ia_css_acc_types.h:411: descibes ==> describes
>
> Thanks.
>

Thanks for the reply. Do you want the spelling mistakes reported by
codespell in the same patch with this change as well or you will
consider
it in the next patch?

> > Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
> > ---
> >  drivers/staging/media/atomisp/pci/ia_css_acc_types.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
> > index d6e52b4971d6..ac6fb0eb990a 100644
> > --- a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
> > +++ b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
> > @@ -84,7 +84,7 @@ struct ia_css_blob_info {
> >               memory_offsets;  /** offset wrt hdr in bytes */
> >       u32 prog_name_offset;  /** offset wrt hdr in bytes */
> >       u32 size;                       /** Size of blob */
> > -     u32 padding_size;       /** total cummulative of bytes added due to section alignment */
> > +     u32 padding_size;       /** total cumulative of bytes added due to section alignment */
> >       u32 icache_source;      /** Position of icache in blob */
> >       u32 icache_size;        /** Size of icache section */
> >       u32 icache_padding;/** bytes added due to icache section alignment */
>
> --
> #Randy
> https://people.kernel.org/tglx/notes-about-netiquette
> https://subspace.kernel.org/etiquette.html
