Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CC17A;
	Fri, 15 Apr 2022 05:44:42 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id c6so8818741edn.8;
        Thu, 14 Apr 2022 22:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6PBnoK+Xdn2DCyjwDcJ7PpTGCnpwqIt7qavktBIjyDg=;
        b=ZUj8ieFadguVroY4xBPA5dktap6dK5fa460pO4XTErU/Ehi4yuq3XgcN4sT2R5awTv
         Sz2TKRx81/HE5PBycIsR569cqiJiTR7mr98/c7tWZnBQ0P0rw6OOHGIXbrF+Smpz0q9X
         hnCH7a73rL2AVzXAik8bJuboMd6rHcUajicaCKMS7WP6txTLcErr3FiCqVTLqbExqoGz
         0WmVto6aVW9jaFLso845SkoJpc8QesHTOOLnRwYwR8LffYJD7OiQBVsntd829M9nEhvo
         H2peWCrVhooUNV8FUSQYdS2CbLRdrEsgvrfGd3ZHJsIkXQ/yeeCAWxdGuiG+tx5ofU8m
         pTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6PBnoK+Xdn2DCyjwDcJ7PpTGCnpwqIt7qavktBIjyDg=;
        b=4M+MPtrRTfvpApC4e8yjrQrVrtvyk2BZYLQsn04plQEkH62XiTmTkVZYg9JCcc30PG
         pMnq7nkYhY1QH70gtUZLmwkpii2PZwQvg5KJSJWYmCSJpB6WszATs7SPavH5LYspQLGo
         DzQN1eav/ZSrWheYs3YysT8mdJiFWMGU7Kpaqzq/NPQGyvqEtoL0rHmnxZdjPk5m3nBF
         aU8Qcf42JjiKRTL0zNP5ElKHLXV9eNVkS0x4ftKNmoCerVc/UqMFPyqEgr2ja0LuF0GX
         sRz/zTcMY7pEEV9FtP8JlIJL32T9KDOIInkOLXPw5PKPq2pb9n6x+gneJhz1h4vmrVrc
         tAMA==
X-Gm-Message-State: AOAM530gxyXQBd1a6U5PsVUx8VigL5VrUA7AJIVIrVvXjjTTJy7As7Yq
	Oa5EXgMBSXtojqHsCo7Kzik=
X-Google-Smtp-Source: ABdhPJyLifigvHL+bWVjKfam+uh5NDeVDMnUpQO3yDzpH1vf9GlVdph7rluIt7neKyXouTlVrwD5bw==
X-Received: by 2002:a05:6402:350d:b0:41d:675f:ea96 with SMTP id b13-20020a056402350d00b0041d675fea96mr6708882edd.297.1650001481241;
        Thu, 14 Apr 2022 22:44:41 -0700 (PDT)
Received: from leap.localnet (host-79-43-11-75.retail.telecomitalia.it. [79.43.11.75])
        by smtp.gmail.com with ESMTPSA id b11-20020a17090630cb00b006e83fb1e6b1sm1337697ejb.100.2022.04.14.22.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 22:44:40 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: forest@alittletooquiet.net, Aliya Rahmani <aliyarahmani786@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, outreachy@lists.linux.dev, Aliya Rahmani <aliyarahmani786@gmail.com>
Subject: Re: [PATCH v4] staging: vt6655f: rxtx: code style - Fix Lines should not end with a '('
Date: Fri, 15 Apr 2022 07:44:38 +0200
Message-ID: <1749887.3VsfAaAtOV@leap>
In-Reply-To: <20220415051900.5801-1-aliyarahmani786@gmail.com>
References: <20220415051900.5801-1-aliyarahmani786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"

Hi Aliya,

I think that the subject of your patch can be reduced a bit. For example,=20
why don't you remove that "code style -"?

On venerd=EC 15 aprile 2022 07:19:01 CEST Aliya Rahmani wrote:
> Code style warnings reported by checkpatch.
> Improve the layout of a function header:
> *Put the first parameter immediately after the '(' and align the other
> parameters underneath it.

You are doing two different things. Please only one logical change per=20
patch. Furthermore, why that "*" before "Put"?

>=20
> Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
> ---
> v1->v2 changes: Put static and void on a single line.
>=20
> v2->v3->v4 changes: Rework commit description.
>=20
> ---
>  drivers/staging/vt6655/rxtx.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/
rxtx.c
> index 53506e242a96..01dc83b2f4bc 100644
> --- a/drivers/staging/vt6655/rxtx.c
> +++ b/drivers/staging/vt6655/rxtx.c
> @@ -567,19 +567,16 @@ s_uFillDataHead(
>  	return buf->duration;
>  }
> =20
> -static
> -void
> -s_vFillRTSHead(
> -	struct vnt_private *pDevice,
> -	unsigned char byPktType,
> -	void *pvRTS,
> -	unsigned int cbFrameLength,
> -	bool bNeedAck,
> -	bool bDisCRC,
> -	struct ieee80211_hdr *hdr,
> -	unsigned short wCurrentRate,
> -	unsigned char byFBOption
> -)
> +static void

Why storage class and function type are on a separate line? Is it a special=
=20
convention for this driver?

> +s_vFillRTSHead(struct vnt_private *pDevice,
> +		unsigned char byPktType,
> +		void *pvRTS,
> +		unsigned int cbFrameLength,
> +		bool bNeedAck,
> +		bool bDisCRC,
> +		struct ieee80211_hdr *hdr,
> +		unsigned short wCurrentRate,
> +		unsigned char byFBOption)
>  {
>  	unsigned int uRTSFrameLen =3D 20;
> =20
> --=20
> 2.25.1

Thanks,

=46abio M. De Francesco


