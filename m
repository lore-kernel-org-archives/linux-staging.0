Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ADB33FB
	for <linux-staging@lists.linux.dev>; Sun, 27 Aug 2023 22:47:22 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1c4d8eaa8ebso1964918fac.0
        for <linux-staging@lists.linux.dev>; Sun, 27 Aug 2023 15:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693176441; x=1693781241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epUIiVqABeIowLt4jzYenygYHrRc/gN9x8tk0ImlTJ0=;
        b=PmSImoLKfQrb+YbDPW/g1JLVResIS4mOist3R9UtVGvDptAEbIRXxhgXf7N1jX6tQ1
         HUSGkozPR6SMa4NGt/TTIrywgzSkzg88XdCqaMMR8MMFNm+zE8E2XZ+a0dkGV9vBaBIv
         2T33JsFrtJ0oTw+zHOmxJFeygPCDUCtE34sMB/4Bo0L0P1HTyWvHHbO3U54hEDMmEW6x
         QJIfn0xeNRuWX3ibvK4IjLiN3Er1X5ey4wk0y33m4KrOp8eO5fVkXgKO2QbUL3Q2K4MO
         bvoH8txA9/ygilxSC0QtHxNFmIS29wXfWHueSqwfMUDPoidzwJpr5OG0Ymflvmi6je4j
         xZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693176441; x=1693781241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=epUIiVqABeIowLt4jzYenygYHrRc/gN9x8tk0ImlTJ0=;
        b=Nspz1FohPs7lVhFvkqdwnX2bc6s7cFnssgwKvUeGlTk0XMBatcz8mV9KpxnKDZ1NFC
         oa/DRQOcg/0PLVXyZAMZDZgqprvx8YA17Wb5IUIh/nMUJ4nSl09bsmDO32WPDgN6Dtx3
         FhJDaIujOKfd0x3e7pJZz9URTodUb68CJ+5/z9ezV2t197MJP1rdjBDtXIBrW+jR9Qe2
         Rt2XI+CktI2rOpWQ5/8ZrjT6LuZyvj06msOhNxA6vBv151HyTgE9o4mpbSxrU9/lpimY
         UYcUdxdfudH8lDsHnh2TNG2EtoTUJGnHvjCiFfSKhCng6rLOMJ5Vosdenh7Q+U0RjEbZ
         AsZw==
X-Gm-Message-State: AOJu0YwKLsvmF1EbCmZbG26yzXc4iYU/ThR3T/J/lT3KwxN3GujMZWUG
	S6+OYOwTLlL54iWUcFztRa8puWLQxuKQKcdXiG4=
X-Google-Smtp-Source: AGHT+IGytyXnjNFz5kjqSOpNXpmyYRksnRPkEAAwdAEzTMcmMXeJd+xh02gz2541f/Y2MmWW/g5a3mj/MF1Aw2g49uc=
X-Received: by 2002:a05:6871:14a:b0:1ba:d044:8a4 with SMTP id
 z10-20020a056871014a00b001bad04408a4mr11353149oab.18.1693176441471; Sun, 27
 Aug 2023 15:47:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <PH7PR11MB76436F3A05897D8F8DC9F967BCE1A@PH7PR11MB7643.namprd11.prod.outlook.com>
 <ZOvNvkRJstLt4ghx@nam-dell> <PH7PR11MB764320782B13A53D79F3DF69BCE1A@PH7PR11MB7643.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB764320782B13A53D79F3DF69BCE1A@PH7PR11MB7643.namprd11.prod.outlook.com>
From: Nam Cao <namcaov@gmail.com>
Date: Mon, 28 Aug 2023 00:47:10 +0200
Message-ID: <CA+sZ8B_inWKE6_zk4ghVtcxXXdP4NBkkQs5qb6Uu7BygY5UMvQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] staging: octeon: clean up the octeon ethernet driver
To: ozlinux@hotmail.com
Cc: gregkh@linuxfoundation.org, colin.i.king@gmail.com, sumitraartsy@gmail.com, 
	u.kleine-koenig@pengutronix.de, geert@linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 28, 2023 at 12:32=E2=80=AFAM <ozlinux@hotmail.com> wrote:
>
> On Mon, Aug 28, 2023 at 12:27:10AM +0200, Nam Cao wrote:
> > On Sun, Aug 27, 2023 at 05:12:04PM -0400, Oliver Crumrine wrote:
> > > Make the octeon ethernet driver better adhere to the
> > > kernel coding standard
> > >
> > > Signed-off-by: Oliver Crumrine <ozlinux@hotmail.com>
> >
> > See this conversation about a similar mistake that you also made with y=
our
> > patch series:
> > https://lore.kernel.org/linux-staging/ZOpq4t22iRXewekD@alolivei-thinkpa=
dt480s.gru.csb/T/#t
> >
> > Best regards,
> > Nam
>
> That is totally my bad. Should I leave it as is? Should I resend the
> whole patch set? Should I resend just the last five, but attach them to
> the first one? This is my first kernel patch, so I'll take any advice I
> can get.

You should resend everything. Don't forget to add the "v2" tag ;-)

Best regards,
Nam
