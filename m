Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE7F1C03
	for <linux-staging@lists.linux.dev>; Wed, 23 Nov 2022 08:26:23 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id p81so12392538yba.4
        for <linux-staging@lists.linux.dev>; Wed, 23 Nov 2022 00:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+vdSZUc9Cdn1ZhJJ+Fng27BZDbqUH9AaKPQTnbAy+Bg=;
        b=M0XAuBQmpPt9pujQvqUHu35tYqAZwS+WBIzqVJH7bcdmzt3KK5cIHKAIL1da3c8AB4
         MD8lWbHSozfZZ3qQmWKJ6jPOXf3OrVEH9UrgGPmXHUM7pSkC5dk8sePdH85APmj5tGKZ
         sWrWKv15KtBcu4mkgN0gXtiNEz2Qstkh4+YMaXdzzcPBqc3+qU9jWhLKdFmQ/V8Yhs8W
         vVu79A+t9pLWywG7rMWx3OiXOjzbvxelGk17j1+405UfvWjNDj0zbesGTvPeYaNjNXIx
         LZa3gPXq/paolCcjOH86Gb0oLx+2RPvNdp8vinlAioi0J5Jx61Tuye8nByVgpnkq5UBt
         NnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+vdSZUc9Cdn1ZhJJ+Fng27BZDbqUH9AaKPQTnbAy+Bg=;
        b=JSD9bJAIfIP6HQdVN777tMjKn4YEyo6Q8CITn5v6ZL81Ry2R8mgu1KUXWEKlv18XtH
         Rh35O4VW6tn0Zo9eTsKTIwczfoC2osPmOEyJkpxYezecs3xBFYkmN44WoMOZBX46FHqm
         DS/SQNsRymvgpOF6DR+mEJSvtSuDKa6g9NMcBq8xbUqY8Etj4Hgn5xVT6aU+qAbMdqkb
         cDwnwFDMKjmn/p3NxbI1f5g5XCKXn27DvUqCPHk+m0ZSpIVMu6OGKQSnishM2UiALhtb
         y5xPnEsNZNgzKhgnJ6MBIXh8wCXXKZJ510CKiib4s7Q/Mi039MAOd8PllkYhzM7mXhGM
         Ft8A==
X-Gm-Message-State: ANoB5plmBQQowdwa/gWzRsKqfPTQr+RooLi9FpHlUHVojXRPmKXrMAiJ
	18/dCPByo4lQNZofzV95EapJgGDCLeT7ktKt56Q=
X-Google-Smtp-Source: AA0mqf7LtWV3L4qOZbf/svyFsK/ngz1Evoo8n+CSOf2TWrYIx7V+QH0FNPMCuKl9E67tRfAtXQ8DJFnAMP0oaX+QLtY=
X-Received: by 2002:a25:5cb:0:b0:6e7:868:405d with SMTP id 194-20020a2505cb000000b006e70868405dmr13744528ybf.389.1669191982012;
 Wed, 23 Nov 2022 00:26:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221122132330.30408-1-lukas.bulwahn@gmail.com>
 <20221122160937.GB39395@tom-ThinkPad-T14s-Gen-2i> <CAKXUXMxk-YoG4TdB8Em+cEMF8NA7rdMAboQz8nmhfVmVQ8oATA@mail.gmail.com>
 <Y33SxLh9xD8fQHAo@kadam>
In-Reply-To: <Y33SxLh9xD8fQHAo@kadam>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 23 Nov 2022 09:26:11 +0100
Message-ID: <CAKXUXMwZ=t0wW8FPSnsJ2EjFMQGv=nfADXzB=RKropHAyNhvRQ@mail.gmail.com>
Subject: Re: [PATCH] media: imx: remove code for non-existing config IMX_GPT_ICAP
To: Dan Carpenter <error27@gmail.com>
Cc: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>, 
	Steve Longerbeam <slongerbeam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 23, 2022 at 8:59 AM Dan Carpenter <error27@gmail.com> wrote:
>
> On Wed, Nov 23, 2022 at 08:56:06AM +0100, Lukas Bulwahn wrote:
> >
> > Strangely, my checkpatch invocation on next-20221116 did not show that
> > warning and I am unaware that I made any specific changes to
> > checkpatch or its configuration.
> >
>
> I think you need to apply the patch and retest with the -f option.
>

Thanks, Dan, for the hint. Now, I know. I need to see if this can
become part of my usual patch submission workflow.

Lukas

> regards,
> dan carpenter
>
