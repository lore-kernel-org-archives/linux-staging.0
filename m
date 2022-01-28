Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6942C82
	for <linux-staging@lists.linux.dev>; Fri, 28 Jan 2022 16:23:57 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id s13so17753263ejy.3
        for <linux-staging@lists.linux.dev>; Fri, 28 Jan 2022 08:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sbZKWsHJkalKhUpXu01Uv/vjdYsALlFDBYcY+6MyeMQ=;
        b=QzCBjF31P01lAnXfncXg51KSZ75EHiN6F92VXUsfEGTcw+KfdYSKZex/ygYm3fMI6U
         9k185flwZIQiTF7Lm0dCNYOM0b1xn4qRzUfBqwzajNNwMcDdxLAWDLtw19NZpPmW73F4
         pkGQqlFTeJUZOaaGGBOUyKyCC/lTgWESisGBOvCG6Qt8Yg8IC5L2NL6UOH/FgwflXxPx
         MrQuqSZZze4Xgq73WshcZBuudO2UdOJwIPEgmLf+ucnCvalzczdhkEcK96qPZHlMUrCD
         qi8h7Fg53g/KCQh0e8afQQK4i+9jKVcbF4Xx4lidr9koUQuWJk5ISr9ksyh/EmZsEroC
         Ck0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sbZKWsHJkalKhUpXu01Uv/vjdYsALlFDBYcY+6MyeMQ=;
        b=ouXAbe0sm2y0VJ1a8/68VLswUwrtTZ02tR1HRAquUlLWx5HSgwbCIEu5tlTZnPyI07
         3PAr46A0kBoxSm5dYO+Y1VRWWb/Kfz32BnkwEPkkLKXkyZVXidkyBtOn4NfcA15jWZ+w
         WtXt8ploHBXRUPRY7agXwv2FLFjPy9EqpgdwpM1WIVhJGBkmFLtTRNfW3LzvH93hGaLi
         7mHr/ApZsHQU01ijJlO/9yjHzB8Q7Q8nWe6gzchwz1qTFSNh2xLIGxZ4AX43vssdZhIF
         UJgg1hiagUhgKY7o3m3LktROrtffZ7h8xOnQC1CWoAkXSRoXApnsjiNXPoTB6OunNLiX
         PJXw==
X-Gm-Message-State: AOAM532yQH9U2DukuunyOp2MMfA/gcWJizfJKr/vzHB6QI8VIQIwdbvz
	No8oGCOseUSnKuCBfULeU7zXJ0fgeMBVQppmTm4=
X-Google-Smtp-Source: ABdhPJwahl9ko5x+1BNqmFCRg8p0YyfdODE/JnyFQiQNl5j3ldPcUEGELox4ncL00U/q5JWJvFP7JqHpivc5xYyWlaU=
X-Received: by 2002:a17:906:99c3:: with SMTP id s3mr7712428ejn.696.1643387035286;
 Fri, 28 Jan 2022 08:23:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220128133649.1393201-1-usama.anjum@collabora.com>
In-Reply-To: <20220128133649.1393201-1-usama.anjum@collabora.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 28 Jan 2022 13:23:43 -0300
Message-ID: <CAOMZO5DaNpZbO2JS7KUOHJLAZNqpnY_ub8H_UF2sSHuQp-Ki0g@mail.gmail.com>
Subject: Re: [PATCH] media: imx: imx8mq-mipi_csi2: Remove unneeded code
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, 
	Martin Kepplinger <martink@posteo.de>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, kernel@collabora.com, 
	kernel-janitors@vger.kernel.org, linux-media <linux-media@vger.kernel.org>, 
	linux-staging@lists.linux.dev, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Muhammad,

On Fri, Jan 28, 2022 at 10:38 AM Muhammad Usama Anjum
<usama.anjum@collabora.com> wrote:
>
> ret is constant in imx8mq_mipi_csi_pm_suspend(). This function cannot
> return error. Remove the return variable. Simplify other functions which
> are using this function.
>
> Fixes: f0c2ba1ed4ad ("media: imx: imx8mq-mipi_csi2: fix system resume")

The patch looks good.

I would suggest removing the Fixes tag though as this is more of a
clean-up rather than a bug fix.
