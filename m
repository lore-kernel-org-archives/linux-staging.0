Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C50321519
	for <linux-staging@lists.linux.dev>; Tue,  1 Aug 2023 12:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690893152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=okoYgmdKQn74JZXrYBaqgnqoE892hBw9NGFTzkSP/IY=;
	b=dBms0CaItadLZH4ttC1SKZb1+q30pnkHIkC9hN7SfYa1igcn6kEcaE22wyDJF7DSyT4Qbk
	LbWr5rkrhDGxIu2sAfnDiQiazn2XSmE6IEFmBQKuKmO3RkQ+1B1AdIsDgVE+FMvWCxIjvi
	P3rAj0Mz9b4zpnH15FP35yH0WFGzha4=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-bRjfOS50OmaWBlgah7Is2Q-1; Tue, 01 Aug 2023 08:32:30 -0400
X-MC-Unique: bRjfOS50OmaWBlgah7Is2Q-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-268727b3197so5276685a91.2
        for <linux-staging@lists.linux.dev>; Tue, 01 Aug 2023 05:32:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690893150; x=1691497950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=okoYgmdKQn74JZXrYBaqgnqoE892hBw9NGFTzkSP/IY=;
        b=V5Epuzp2+G7imnuZuHnBlFmd1J1NytnkRlhW3IwAm8gUv6VJij++wD2T1QmCDxV5Fb
         F6PA/KN705IRwxjYqkpwhUGnGLG5AW7P6wdPibpx2l/szOWnBSnUEwyYsMssHOgdQSDY
         30W9Dpwmif0Rr73IxcIpTulDc3ucjDPkhAvlbh//9D5GCG/Py8nYSxyyjRp/e3aSdM22
         oJLnpvvee9yjjNe5smKVPBOdr826QjcxgNk389rUMT4kQlRN9PKeyasw65nfQMmonqS6
         TL6THZc4HpEeXxUr9yd0wc4mmwpfR8hVD0DhXZ7icKlH/UnkQj4A4HG4qYwJqlSYnWu0
         7SjA==
X-Gm-Message-State: ABy/qLYgQbAYTEjsuVHnMOC/GtAU3HOuEexvOZhf04/8A15SBfs8rAkS
	2nhj8aLr2qO1SxA+ywY4rpdI7EwP+/5ZOmEFipXYl9xBabT1qbOssnuAOi6exj2IzeR7ij305gT
	9+Nih1UlZGd6U5Ao2OR567sZVlW/WSU/atxCzYTYJew==
X-Received: by 2002:a17:90b:897:b0:261:685:95b6 with SMTP id bj23-20020a17090b089700b00261068595b6mr12106645pjb.13.1690893149839;
        Tue, 01 Aug 2023 05:32:29 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE+s2eFV5EuurTO8k9V6frq5bcS/3gHhEu2C6+5FPjjz18mq0FptnP3pP6BOGHiwlkNzwMwsTYAitHPKWOAHDA=
X-Received: by 2002:a17:90b:897:b0:261:685:95b6 with SMTP id
 bj23-20020a17090b089700b00261068595b6mr12106625pjb.13.1690893149469; Tue, 01
 Aug 2023 05:32:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230730153343.22033-1-hdegoede@redhat.com>
In-Reply-To: <20230730153343.22033-1-hdegoede@redhat.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Tue, 1 Aug 2023 20:32:18 +0800
Message-ID: <CAEth8oFe1QFfbZ=COzT=BLJtoAXAgqVMZtTM6qe4aNvQ0ZNVPw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: atomisp: Fix smatch warnings caused by
 atomisp custom assert() usage
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>, 
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com, 
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Sun, Jul 30, 2023 at 11:33=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> The atomisp code base has a custom assert() macro, a couple of functions
> use this in a construction like the following:
>
>    assert(pipe);
>    assert(pipe->stream);
>    if ((!pipe) || (!pipe->stream)) {
>            ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
>                                "allocate_mipi_frames(%p) exit: ...\n",
>                                pipe);
>            return -EINVAL;
>    }
>
> The second assert is seen by smatch as dereferencing "pipe" in the above
> example (and dereferencing "dvs_6axis_config" in the other case).
>
> Following by the dereferenced variable being checked (a second time)
> in the following if () statement.
>
> This triggers the following smatch warnings:
> drivers/staging/media/atomisp/pci/sh_css_mipi.c:356 allocate_mipi_frames(=
) warn: variable dereferenced before check 'pipe' (see line 355)
> drivers/staging/media/atomisp/pci/sh_css_mipi.c:562 send_mipi_frames() wa=
rn: variable dereferenced before check 'pipe' (see line 561)
> drivers/staging/media/atomisp/pci/sh_css_param_dvs.c:208 free_dvs_6axis_t=
able() warn: variable dereferenced before check 'dvs_6axis_config' (see lin=
e 206)
>
> The custom assert() macro actually expands to a BUG() call and BUG()
> calls should not be used in the kernel.
>
> Remove the assert() calls to fix the smatch warnings and in case of
> [allocate|send]_mipi_frames() also remove the if () return -EINVAL
> block since these functions are never called with a NULL pipe.
>
> Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Note:
> 1. No Closes: tag since Hans Verkuil reported this in an offlist email.
> 2. All the other assert() calls really should also be removed.
>    I've put this on my todo list.
> ---
> Changes in v2:
> - Drop the sh_css_sp.c bits, just dropping the assert() calls is
>   not enough there
> ---
>  drivers/staging/media/atomisp/pci/sh_css_mipi.c  | 16 ----------------
>  .../staging/media/atomisp/pci/sh_css_param_dvs.c |  3 ---
>  2 files changed, 19 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/st=
aging/media/atomisp/pci/sh_css_mipi.c
> index b20acaab0595..ced21dedf7ac 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> @@ -351,15 +351,6 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
>         ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
>                             "allocate_mipi_frames(%p) enter:\n", pipe);
>
> -       assert(pipe);
> -       assert(pipe->stream);
> -       if ((!pipe) || (!pipe->stream)) {
> -               ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
> -                                   "allocate_mipi_frames(%p) exit: pipe =
or stream is null.\n",
> -                                   pipe);
> -               return -EINVAL;
> -       }

Thank you for working on this.

The NULL test for pipe could be kept here since the caller only tests
"stream" but not test "main_pipe" is NULL. (sh_css.c line: 1799)

The rest of the part is ok for me.

> -
>         if (IS_ISP2401 && pipe->stream->config.online) {
>                 ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
>                                     "allocate_mipi_frames(%p) exit: no bu=
ffers needed for 2401 pipe mode.\n",
> @@ -557,13 +548,6 @@ send_mipi_frames(struct ia_css_pipe *pipe)
>
>         IA_CSS_ENTER_PRIVATE("pipe=3D%p", pipe);
>
> -       assert(pipe);
> -       assert(pipe->stream);
> -       if (!pipe || !pipe->stream) {
> -               IA_CSS_ERROR("pipe or stream is null");
> -               return -EINVAL;
> -       }
> -
>         /* multi stream video needs mipi buffers */
>         /* nothing to be done in other cases. */
>         if (pipe->stream->config.mode !=3D IA_CSS_INPUT_MODE_BUFFERED_SEN=
SOR) {
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c b/drive=
rs/staging/media/atomisp/pci/sh_css_param_dvs.c
> index ff0082d02af3..5174bc210ae1 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
> @@ -202,9 +202,6 @@ generate_dvs_6axis_table_from_config(struct ia_css_dv=
s_6axis_config
>  void
>  free_dvs_6axis_table(struct ia_css_dvs_6axis_config  **dvs_6axis_config)
>  {
> -       assert(dvs_6axis_config);
> -       assert(*dvs_6axis_config);
> -
>         if ((dvs_6axis_config) && (*dvs_6axis_config)) {
>                 IA_CSS_ENTER_PRIVATE("dvs_6axis_config %p", (*dvs_6axis_c=
onfig));
>                 if ((*dvs_6axis_config)->xcoords_y) {
> --
> 2.41.0
>


--=20
BR,
Kate

