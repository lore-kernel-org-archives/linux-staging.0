Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4843FC7
	for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 09:13:21 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id v18so10597037edc.11
        for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 02:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r4X3zgqJoNQc3RX/YtXmI2AyNwIuqhCGtXgdq74+d/8=;
        b=YqOudozNjg0sBSf7e6li0FLb3sxy7ozGt59ooI2RIvU8/Koo8rSYFf1Zkq439aaq26
         4fz6APCCEhKFytGUSUsowRjlfbB2T4fW602FCETQC0bbRQQeV8AffS76OdYZc0ZMIuQS
         Tpa280d+VNGTVNFbVqtNZXF2zaJH1013HkdHrUfiVBWLLo9qzh2UsKTrjG9unnH3kpKM
         IwkZ0rJITkOKpy0O9MlAsO9W8AvClMjcwzzXWbJ45SwvuZVZf5suoW2+b5jzSuYROw8N
         H3oCgcBluN4Bz+VDoMY2Ww2geX0P5kn0FnZ94ucZWQTnYy5efI/Fx9IpkvrZIXJ9iOMh
         AkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r4X3zgqJoNQc3RX/YtXmI2AyNwIuqhCGtXgdq74+d/8=;
        b=c2sIbgCqUVvMCFbcf+7mAFycBnLIZqDU+tt0n3N504SQ4kYJC0kJpx87EzrSM31SoG
         +dYdvxvxJqSLuyDJT2AM3LPnkk29WZCfuyBkR0R6JlQnbIE/NBqzPPtRpV19wirXSyqV
         EdTG+vjxK7RFNJMzAdLiscmihLWw4+URJRrTTuV2pjOqW+q+ub6aD/Dt9NFXn2sLxHr+
         Gtg/5aUoYSFfZPgPKhyp5+lTDmbrNO+CIWaC9zJ1SSllAy7JaHPG0F8QCJh4nynEOojk
         a+0WaejmQVzWchqocdBmglYP7xnuk8uJmTKrDt23R6+Jz+/J2AvAijJv7G2mwL0waEBV
         2tAw==
X-Gm-Message-State: AOAM532bFC0MiJD1nHNix5Yrwaau/EFas9wJs3Es8ln84ZwPLyLVkHQt
	iy3MKSyHR8FCQxxlt5xfpc0=
X-Google-Smtp-Source: ABdhPJyVp2AzOE3J1rakjH0fen02VuZq18GYfSi89eFcxCu8xNGTx8MCdSBtNJ71OurvRxN870yn+Q==
X-Received: by 2002:a50:d9ce:: with SMTP id x14mr5179701edj.175.1632561200328;
        Sat, 25 Sep 2021 02:13:20 -0700 (PDT)
Received: from localhost.localdomain (host-212-171-30-160.retail.telecomitalia.it. [212.171.30.160])
        by smtp.gmail.com with ESMTPSA id z24sm453102edr.56.2021.09.25.02.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 02:13:19 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: tomm.merciai@gmail.com, Forest Bond <forest@alittletooquiet.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yujia Qiao <rapiz@foxmail.com>, Lucas Henneman <lucas.henneman@linaro.org>, Madhumitha Prabakaran <madhumithabiw@gmail.com>, Marcos Antonio de Jesus Filho <mdejesusfilho@gmail.com>, Aldas =?utf-8?B?VGFyYcWha2V2acSNaXVz?= <aldas60@gmail.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Deepak R Varma <mh12gx2825@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] staging: vt6655: replace camel case b_short_slot_time instead of bShortSlotTime.
Date: Sat, 25 Sep 2021 11:13:17 +0200
Message-ID: <2635701.kFDcI0R34J@localhost.localdomain>
In-Reply-To: <20210925074531.10446-2-tomm.merciai@gmail.com>
References: <20210925074531.10446-1-tomm.merciai@gmail.com> <20210925074531.10446-2-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, September 25, 2021 9:45:22 AM CEST Tommaso Merciai wrote:
> Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> ---
> Changes since v2:
>  - Add changelog.
> 
> Changes since v1:
>  - Make the commit message more clearer.
> ---
>  drivers/staging/vt6655/baseband.c    | 4 ++--
>  drivers/staging/vt6655/card.c        | 2 +-
>  drivers/staging/vt6655/device.h      | 2 +-
>  drivers/staging/vt6655/device_main.c | 4 ++--
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/
baseband.c
> index f73f3fad3e05..170c4056946f 100644
> --- a/drivers/staging/vt6655/baseband.c
> +++ b/drivers/staging/vt6655/baseband.c
> @@ -2200,7 +2200,7 @@ bb_set_short_slot_time(struct vnt_private *priv)
>  
>  	bb_read_embedded(priv, 0x0A, &by_bb_rx_conf); /* CR10 */

Well, it's pretty clear that you didn't read the document whose link you've 
been provided by Gustavo A.R. Silva and Greg Kroah-Hartman. Furthermore you 
also ignored Gustavo's suggestions about how a patch should be made. :(

If you had read that document you should have noticed that your patches 
doesn't comply with the Linux kernel development rules.

In section "Revising your patches/Versioning one patch revision" there's a 
sample patch ("fix the number of endpoint parameter"). If you look at that 
patch you see what your patches are missing.

Patches have at least three logical entities, but in your case they must be 
four because you are sending new versions of the initial one.

1) A "Subject". Along with information about the version and the position in 
a series, you must always write the subsystem prefix and the driver name. 

The text in the "Subject" should  summarize with _few_ _words_ the "Commit 
message" or "Changelog". Few words means that you don't need "replace camel 
case b_short_slot_time instead of bShortSlotTime." because it is too long. 

No full stop at the end of the line. 

Just something like "Fix camelcase in bShortSlotTime" is enough (you may also 
add "[] variable", if you want to.

2) A "Commit message" (or "Changelog"). You must explain "what" you did and 
"why". You didn't provide it and Greg Kroah-Hartman complained.

He won't ever accept patches without it. If you had read "Start creating your 
first patch / Git post-commit hooks", you would have known of the "post-
commit" hook and so, you had not submitted patches without messages because 
that hook would have warned you.

3) A "Versions list" (or a "List of changes between versions"). Where in the 
list of 3/3 you recorded that you changed "port_off_set" to "post_offset"?

4) A "diff" of the changes that shows the changes you have made, one line a a 
time. This is the only part that is not up to you because Git adds it 
automatically.

Again, please read the documentation.

Thanks,

Fabio


