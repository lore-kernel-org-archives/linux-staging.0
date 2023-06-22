Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5AB1E531
	for <linux-staging@lists.linux.dev>; Thu, 22 Jun 2023 14:59:24 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-630019ff99bso51785356d6.0
        for <linux-staging@lists.linux.dev>; Thu, 22 Jun 2023 07:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20221208.gappssmtp.com; s=20221208; t=1687445963; x=1690037963;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Isuz+PQC54uI8U8TsiSi06GVeERGmJj43Np0iyUSrfM=;
        b=dmVv7bPr5iFp2PUKG6EmeBdAvXmiNR3KSnBPMouO1pNeZnqvux25rfVgFEEX5hqouj
         OEGTfONT4p8xLmJry1j+R04ZUSfHyXJ5jsOt7BkNXERYpD+kht6v4kNsqr38BirdMdNO
         zYYiJ0yTibnj1K1cCUGI88zgdWBtGUFcMwpRqgKa3zzE/8D6RwxzYXfl1AyzCCytdAj0
         ApZG9gmNwaHGnADQWCLl0lJC7DpWd1y/X8SrgrXikkIcGr4plRyzZe4XUb6yg2WezDZU
         guwfPZmzi8hqGmJPm8P1ICL4lziruJGt0uOzaKszwzj/8x/fdwjsNWh716DfhXK2yYod
         LdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687445963; x=1690037963;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Isuz+PQC54uI8U8TsiSi06GVeERGmJj43Np0iyUSrfM=;
        b=XpF1BL49HEYXs44Nyv/9nhf84qh9Pw5plGEGTUCXMkBwjRodAE/e8IMJMYmFxZt4Hd
         wy0nk1ab0W+TEZBkNT8tFw/+61tj5driRiVrawzYjGWwAjcaxXYVW0ki8KEe1NCrg79P
         oJX77CN9V6oRxYsPUGCflAIg7nB7yxwOZtNs8TX+mnNBo8rrU0z09t9LAvh8clnTotoY
         hUvD2rQYJwKe1bO62fudaNFbOevxhNd1NWqnd4KrmDM9I8Q9+ZdL/XYHbRoz8hFnjm4U
         6lNXPz7j5lN+JEIxE++79+ikH9+w6Ey1la+Awt5r+btpWIxSgKYxi/236NHHUZW6oFNV
         rtCg==
X-Gm-Message-State: AC+VfDy1EqM2R3IJgdYxV8DgF7CkcQ6i5ZiGyjRvhQ8vwXYZfAEpPvLm
	G1rgEvWk8JjAvzJAE0zU34KUFg==
X-Google-Smtp-Source: ACHHUZ5/R7baqHiN/5RHfljGCs+0RFR1fPdQ92oThBDCni214Ka5UIUJV9e4OiaFi5zT6J8G8DBvbw==
X-Received: by 2002:a05:6214:e4f:b0:626:3a98:95a with SMTP id o15-20020a0562140e4f00b006263a98095amr21177614qvc.22.1687445963256;
        Thu, 22 Jun 2023 07:59:23 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:c623::7a9])
        by smtp.gmail.com with ESMTPSA id b9-20020a0cc989000000b0062821057ac7sm3891746qvk.39.2023.06.22.07.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 07:59:22 -0700 (PDT)
Message-ID: <873a993dc0e4cc9249593bca494ed25e1d0b7fa8.camel@ndufresne.ca>
Subject: Re: [PATCH v2] media: rkvdec: removed redundant blank line
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Emma Christy <emma.t.christy@gmail.com>, ezequiel@vanguardiasur.com.ar, 
 mchehab@kernel.org, gregkh@linuxfoundation.org,
 linux-media@vger.kernel.org,  linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev,  linux-kernel@vger.kernel.org
Date: Thu, 22 Jun 2023 10:59:21 -0400
In-Reply-To: <20230621154247.43983-1-emma.t.christy@gmail.com>
References: <20230621154247.43983-1-emma.t.christy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Thanks for taking the time to fix this.

Le mercredi 21 juin 2023 =C3=A0 18:42 +0300, Emma Christy a =C3=A9crit=C2=
=A0:
> Adhere to Linux kernel coding style. Removed redundant blank line.
> Issue found by checkpatch.
>=20
> Signed-off-by: Emma Christy <emma.t.christy@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> Changes in v2:
>   - Fixed Singed-off-by.
>   - Fixed Subject line.
>=20
>  drivers/staging/media/rkvdec/rkvdec-vp9.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/rkvdec/rkvdec-vp9.c b/drivers/staging/=
media/rkvdec/rkvdec-vp9.c
> index cfae99b40ccb..0e7e16f20eeb 100644
> --- a/drivers/staging/media/rkvdec/rkvdec-vp9.c
> +++ b/drivers/staging/media/rkvdec/rkvdec-vp9.c
> @@ -227,7 +227,6 @@ static void init_intra_only_probs(struct rkvdec_ctx *=
ctx,
>  				}
>  			}
>  		}
> -
>  	}
> =20
>  	for (i =3D 0; i < sizeof(v4l2_vp9_kf_uv_mode_prob); ++i) {

