Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CC62CA2
	for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 18:54:39 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id d10so28083201eje.10
        for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 10:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1dIx/IqWiv/WWm7kyGBaD8OgAX89Qcfb4TRiFj5tbEo=;
        b=l1c+s/Ubw5dRxJadxh3PcbeOrd3x3kbo6i8JmXjzEQMZaSTO16HQdx3I0vUreojh8A
         5mIJ83BN5mNHZAgJg+INAsnQri3TGqmnQ0DBWeF1SpYfsvnH4MqLrQk5/AyrAHTAxEVo
         ZsArQrsEzOnLjRNP/UzelTlsxsZWzzCYjTeWwZZc+jSiBfdUzN5Kc0aoyB/jnJQ2JckI
         wJ3hKoBwta9a3ZHAD4DzsnZ3CGlwDYxl5cXszd76KYXPfWPsVZNfFaB1RS/A2W8ynhAk
         +/wPxXFt2IDRRhN1vsBtwXc8p8CP8DtCqFK/5wfdMjxXhZKhrfCXrx5hOY5wKo7TAFa2
         uB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1dIx/IqWiv/WWm7kyGBaD8OgAX89Qcfb4TRiFj5tbEo=;
        b=REf7tX11O+QVyDb9B6FLbSdsN7aURiJwZA9XkFAGv9IBZUfbv+1XwdbHLZGNuluBY8
         z121IJJHd565/kaof41wU0oo6dTrPSGsg2ffSn3yFyz2S2lUIYKKHMQFmISfdZOkrV8V
         BQSboxE+zqhZE2p9pmCEm0pUw9HPl46ozolq4oUZ3oFBYXbJZGplGNaMTEJiUz62pjcY
         Fg5Pe/2bq+jPxPiy9tqNG9VJi7AT7kwhgt8nQNMZ0QHNggaHn/6HfiPQOu5MiWjZzhXE
         bevul5A/b2ADHXqS9NsKtXezdW9CETHAQR2wbolFl34mlgYFjEYt9RE/GTvb2/DLZO/6
         p8vw==
X-Gm-Message-State: AOAM533x9ZrczxwnYf8JszT8EZgF90CccL4q2nglXmbvln23FExmMr9E
	vLZV8NxVIgf5RI7Wr+Fx2wAuhAcFL2V0LjSR6MQ=
X-Google-Smtp-Source: ABdhPJwUYgNNHPJYIUcBsTAd++MKr5tL+VooDz4sr2nMIPD4IgrE8R7vylTrJQW1Y+cutuXpRXb6G/sD0JTzSWu4TTs=
X-Received: by 2002:a17:906:eb8a:: with SMTP id mh10mr8511020ejb.492.1643482477674;
 Sat, 29 Jan 2022 10:54:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220128170722.1624767-1-usama.anjum@collabora.com>
In-Reply-To: <20220128170722.1624767-1-usama.anjum@collabora.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 29 Jan 2022 15:54:26 -0300
Message-ID: <CAOMZO5CSE8bwASsk8_Z3J_i1rSKoiENx96_bLaYxQnvghgWtyw@mail.gmail.com>
Subject: Re: [PATCH V2] media: imx: imx8mq-mipi_csi2: Remove unneeded code
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, 
	"open list:MEDIA DRIVERS FOR FREESCALE IMX" <linux-media@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, kernel@collabora.com, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 28, 2022 at 2:07 PM Muhammad Usama Anjum
<usama.anjum@collabora.com> wrote:
>
> ret is constant in imx8mq_mipi_csi_pm_suspend(). This function cannot
> return error. Remove the return variable. Simplify other functions which
> are using this function.
>
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
> Changes in V2:
> Removed fixes tag

Reviewed-by: Fabio Estevam <festevam@gmail.com>
