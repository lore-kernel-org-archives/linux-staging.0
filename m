Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E817B
	for <linux-staging@lists.linux.dev>; Thu, 27 Oct 2022 13:31:05 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id mi9so1245050qvb.8
        for <linux-staging@lists.linux.dev>; Thu, 27 Oct 2022 06:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1B0as6qvgEusJAHWP9PQtAwIU23LTfV1igQHrsAgsGc=;
        b=1DMmN9r4Vqu8/Ln9CA2Wah4LyITkT7R0TeXDoLNtydzX6KbzisELATCEbYXLHdcxT5
         yOXLaQBkvGLLHku0FY2/E/QJJIjcZFHJd/alcRG1UIKxL/yq+Eh5FHFHY0bUbJUM/wqM
         MmMBXSpPkbNahoY70R+NYg3IhytU2OdbzvQG/mObsQINjXztP+zG7sTP8+9tl6Oi1dYg
         qFJZ3uASSUjjAmBOs/zhvoNuOuaLyQgIn3YoVaMrQ2QKUMSEugcc9L4d6PYaUJo/w+xW
         7CM29Cu0pf+fWPNhLwaTgkSeTeNq1rg2lzE+P0SB89mqsT4DHba/5Q+2rW+tnZCHfmSF
         XzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1B0as6qvgEusJAHWP9PQtAwIU23LTfV1igQHrsAgsGc=;
        b=nylEdpu+nIcd27b63ihDTxMdo719yNAnmcMeo/3FSWbWwBdMbLm2jpa7ctedDieTZV
         wAqIpbuqUdBOiD2oHfvCyfSBxTMCDmkbI7Z0Cdjea6hHASI+2bvlooa3gU+7P8RWI+id
         9lykn7ayVgzJlP68+5+FvKuOIift6czRrUk7zz91gMyvIvwLo2shZuUOU9G1MgxeaVHK
         Eb3ya3ihWF+IEpm3+a1+8hd6aoYHEWfOKJu9QM83rpVwYi59XltlhSVnJvXNruKz43by
         n+pBKbT//wY0JTQb9XGx9hqzGrrVXqoYr+V0CcGvOiidoL+cW+lXpFLNrUVuaMV6L7nP
         65ag==
X-Gm-Message-State: ACrzQf09NHa4CnJGKeErczfIfm6+5YUENR4+9wjqQVuWBarP9BQ+7u7T
	iMVCxpLD6bi/8S2VA7SZovAPgQ==
X-Google-Smtp-Source: AMsMyM5ntsKQEhEdjJhlKZ1V0z2QlyKyG95g+zOV1ibMsSGDt9dJqEaQOMzFRmaT9Mn23CKsL5g50Q==
X-Received: by 2002:a05:6214:250c:b0:4b8:78d7:e718 with SMTP id gf12-20020a056214250c00b004b878d7e718mr33101450qvb.97.1666877464100;
        Thu, 27 Oct 2022 06:31:04 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id u19-20020a05620a0c5300b006ef0350db8asm943153qki.128.2022.10.27.06.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 06:31:03 -0700 (PDT)
Message-ID: <85205ab7833ec260447e1f68b9264acbf3130112.camel@ndufresne.ca>
Subject: Re: [PATCH] media: rkvdec: Add required padding
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
	linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Ezequiel Garcia
 <ezequiel@collabora.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kernel@collabora.com
Date: Thu, 27 Oct 2022 09:31:02 -0400
In-Reply-To: <20221027080217.6290-1-andrzej.p@collabora.com>
References: <20221027080217.6290-1-andrzej.p@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Le jeudi 27 octobre 2022 =C3=A0 10:02 +0200, Andrzej Pietrasiewicz a =C3=A9=
crit=C2=A0:
> The addresses of two elements of the segmap[][] member are passed to the
> hardware which expects 128-bit aligned addresses. However, without this
> patch offsetof(struct rkvdec_vp9_priv_tbl, segmap[0]) is an odd number
> (2421) but the hardware just ignores the 5 least significant bits of the
> address. As a result, the hardware writes the segmentation map to incorre=
ct
> locations.
>=20
> Inserting 11 bytes of padding corrects this situation by making the said
> addresses divisible by 16 (i.e. aligned on a 128-bit boundary).
>=20
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

For backport purposes, perhaps add ?

Fixes: f25709c4ff15 ("media: rkvdec: Add the VP9 backend")=09

> ---
>  drivers/staging/media/rkvdec/rkvdec-vp9.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/staging/media/rkvdec/rkvdec-vp9.c b/drivers/staging/=
media/rkvdec/rkvdec-vp9.c
> index d8c1c0db15c7..cfae99b40ccb 100644
> --- a/drivers/staging/media/rkvdec/rkvdec-vp9.c
> +++ b/drivers/staging/media/rkvdec/rkvdec-vp9.c
> @@ -84,6 +84,8 @@ struct rkvdec_vp9_probs {
>  		struct rkvdec_vp9_inter_frame_probs inter;
>  		struct rkvdec_vp9_intra_only_frame_probs intra_only;
>  	};
> +	/* 128 bit alignment */
> +	u8 padding1[11];
>  };
> =20
>  /* Data structure describing auxiliary buffer format. */
> @@ -1006,6 +1008,7 @@ static int rkvdec_vp9_start(struct rkvdec_ctx *ctx)
> =20
>  	ctx->priv =3D vp9_ctx;
> =20
> +	BUILD_BUG_ON(sizeof(priv_tbl->probs) % 16); /* ensure probs size is 128=
-bit aligned */
>  	priv_tbl =3D dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
>  				      &vp9_ctx->priv_tbl.dma, GFP_KERNEL);
>  	if (!priv_tbl) {

