Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A2C331EB8
	for <linux-staging@lists.linux.dev>; Thu,  3 Sep 2026 03:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788404899; cv=pass; b=l15xZV9rcSTfSVcrqN1KgXZ/2j+PoMrYyKgH8UrqSF7fcErFN8aaDAV4NaB7SiXEO9XdtrJtCt0ukCbHHc0+0wFxUUrqMzDPFmfDG5o9TRdL1FkyyEe0zYNtNtgLzmnJuh5SD13jnjM/LvU5Nz2KujIqDhHw8lBEDg6q1lzGkMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788404899; c=relaxed/simple;
	bh=ZQN9NJXDj89uzGf2iFwIqxTSP9mMueIpc4XZFDO0eY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aVgs9H83xkt+t40C/xiGGEsw1KIvABGM408Mtqym7Ry25LAY16JriJgH97Zho9lCxMP4Mfmg2k2JSmFvGQtnZ5jnPvBYmeRo4dy4wDeVq+t0FhONv6hT1ARvaMd//PX4LSZp3tNaimIlSx+LniY64fq2MmtX2SabIUgNuhFIKK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BvpH1C3t; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BvpH1C3t"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7dbcb505578so23543867b3.3
        for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 20:08:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788404895; cv=none;
        d=google.com; s=arc-20260327;
        b=THEIBIDahpYhwrUQK2o4HCPnTcWS3nSQtHWZgxfiGfb06wkRR7/4CKmXos9yAbplDw
         eJtTGK2RpM+mjedPA7s7gcclqg+NTZwJ2djRE3w7efHTbaMaK5NFNqjE4wYmhQKzNZ91
         6N/Vz3jpHQ6M9FnsALdRJvNFZX228whJ/K8DTPYMu4n5O3ZK9XBgWwHYtFrqYqYlWQQf
         67pJvxxroFrOauEn0pUgtpNeZnkMpBrAubZBzF06JBXhbL/1n2ZjRkgwxHEwi9CY1z05
         QJKvewzK/3h++ys9Xxsza/uvnlTfwe9NT2iNKlDeto3TNmr5WYMVOYd3wRR62YctGBrC
         9J6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SnzwBfRZpBf2cJeykyMmu4E583GVHfgU8A+PMrUbmFE=;
        fh=Jwg3QSDvsSCB09e/o+V8S/AhIwoV7XoFipA6Mkhs/08=;
        b=VgTuO1fHIh15+3oo7d21FhZB84zNJ7AyRyssOLypcn1gxQXRfVvnkhVsYSnf3dh5wr
         tjjlXbdxsB+ln6T0rykhc6Xcgm6ukkCARcRyMJ4vZGYpovKrBPxw6V81dUvJg3j6d8nw
         6XqVR3KqWvI5tofiKjsy7E6FJosMMOL3DJiXaxv/9EtS5Dbp2ziOm2yVx2NxSux1ADFS
         /bmvKwa8xTYTzJpyz5bVU4J4n1Ldq4RiIBduKArXzddmLSW7jFNhJq80Es0AKtNm/w+e
         vOGEFzdUNFbjci94nqzYoqoP99MEFbjKUO8fSQhKePqdvqCNQN9Zf0+RgREh7XKvntzL
         9nDg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788404895; x=1789009695; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SnzwBfRZpBf2cJeykyMmu4E583GVHfgU8A+PMrUbmFE=;
        b=BvpH1C3tfLx5SQHjf3iuKC1MY2nn1K+hItgqaX9FvFxMBVrYFKPaGYbkpnK81m9Kqf
         hdqKyZkvSa2LHPFOKganKiMRMTDoZBmc+FlAEPy7zvrEOakh4N4AH4UY2EeKu7RjoVOB
         itzdLgps6jQR99ubvxBtH6l6j/X5JrOIVdyfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788404895; x=1789009695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SnzwBfRZpBf2cJeykyMmu4E583GVHfgU8A+PMrUbmFE=;
        b=nE2eSJDTBheqeKzgGRhpPJuqGnW7+W+UN1XORYTbqAeotkoXqhOxPGE3zE0x8+OUJU
         8/uy9r3Lc0DDfVU75clQgBwhm5muXp+FmkOz4jMjxaeUPSkp2h3LmgD0hb//B51pQzhN
         DhMQN8JjpwLwucbQ6IvRKVJkHURFrkTG0BN0TBvoywxPxn7ZV0aspLFOq3QeP4y4rNcL
         /nEJ/O4s+rono9zOpgiWNXINMyzG0rLTNKNmvVOCbeQDAv9b3B/qtXjLgyhL8tpGkI0D
         4AQxjkCEvVTTtSHCJ3hR5gEiGAqZElMkUo1usk0Bq4iSJVtNfj0Os5t5zU7vEL/yZmhx
         PENw==
X-Forwarded-Encrypted: i=1; AKwUvBwIl9+BJ7lw/a5Uq1z9u2KtW5VEDsAziq5RBrghIlIhxTgrv/70ZSXqQv5M0xIUnVKX4Up7VIwc24dDSij6@lists.linux.dev
X-Gm-Message-State: AFuF++lNchTG5c+3pCye1URc4WsblbiczD8oL7NfiblZO93rwHZi39pC
	5MuDIUG95AbdyE5G09uo1y/GSyZYvPHKDsgoAIAD55ygMugeA4TjlZce6EKrfm780OpAZFiFex2
	BG+i9mko4NUHbmDWh8EesxTvO3TVC1qp3UyM9VocT
X-Gm-Gg: AYBFou1FyRmv9Hq2m4JHWlOAjJzafEZBDglsTtUQMa/jQq3LhQhjDceEmOKaDDNv7eu
	gOXLhGX2b90p6A3UlzSmGgthRocUEdjs9ZGcEB0ycRlkCSB1Ag2K521hxFQTYJcIoSMErVNj0f2
	JPkUe0wiedmcVRij0F7OW7ARbrTXj/Skfg6a/7f6JehUrBiN4+IAcGqRskZ3opzEQSSfVFIo+ix
	ZjSLTTwH7Dp6INE5nmPt7flqlM8aS+evVWu28yUD7uIWoFODtvKUHJSkISkLCF72eieWcqp6/mh
	TYPY7rCiaAamNRtZiGULYmj0+zG62lBtt0Or4DVvIW3PHzdmDpMgyh7oXBx+sFHTKIOoU8bNXTg
	=
X-Received: by 2002:a05:690e:400f:b0:66d:113a:3928 with SMTP id
 956f58d0204a3-66f9bb6f3famr3574226d50.12.1788404894746; Wed, 02 Sep 2026
 20:08:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com> <20260902200703.2016410-6-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260902200703.2016410-6-mukesh.ojha@oss.qualcomm.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 3 Sep 2026 11:08:02 +0800
X-Gm-Features: AcwNN1Wn32BWTc7gvrI5NCynGubfvPlrWgUmvLkoMfGnpAB8yTnTJoIOOvbhgBM
Message-ID: <CAGXv+5E9zs7LsK=d08NB6QcuHkaPw4GcifuDuMDz0CVB6gB=8A@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] media: mediatek: vpu: Use devm_of_reserved_mem_device_init()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
	Houlong Wei <houlong.wei@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Joseph Liu <kwliu@nuvoton.com>, 
	Marvin Lin <kflin@nuvoton.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 4:08=E2=80=AFAM Mukesh Ojha <mukesh.ojha@oss.qualcom=
m.com> wrote:
>
> Use the devres-managed devm_of_reserved_mem_device_init() instead of
> the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
> pair, letting the device resource manager handle cleanup automatically.
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/media/platform/mediatek/vpu/mtk_vpu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/medi=
a/platform/mediatek/vpu/mtk_vpu.c
> index 8d8319f0cd22..557bffb2c2f1 100644
> --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> @@ -888,7 +888,7 @@ static int mtk_vpu_probe(struct platform_device *pdev=
)
>         dev_info(dev, "4GB mode %u\n", vpu->enable_4GB);
>
>         if (vpu->enable_4GB) {
> -               ret =3D of_reserved_mem_device_init(dev);
> +               ret =3D devm_of_reserved_mem_device_init(dev);

There are non-devm calls before this. Inserting a devm call in here
messes up the unwind order and leads to confusion. In other words
this is a bad idea.


OOTH, the remove function is missing a release call.

>                 if (ret)
>                         dev_info(dev, "init reserved memory failed\n");
>                         /* continue to use dynamic allocation if failed *=
/
> @@ -930,7 +930,6 @@ static int mtk_vpu_probe(struct platform_device *pdev=
)
>  free_d_mem:
>         vpu_free_ext_mem(vpu, D_FW);
>  remove_debugfs:
> -       of_reserved_mem_device_release(dev);
>  #ifdef CONFIG_DEBUG_FS
>         debugfs_remove(vpu_debugfs);
>  #endif
> --
> 2.55.0
>
>
