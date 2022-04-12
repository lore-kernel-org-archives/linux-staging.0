Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00C43206;
	Tue, 12 Apr 2022 20:36:02 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id bh17so39611291ejb.8;
        Tue, 12 Apr 2022 13:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EkBcRQ3FSxoHr2CTVma7OTMsNkj+chjdnuq3vagcoSg=;
        b=pAItBEs6qc+VnWOS8cvFja8MzCU+mPUp2b9wDr39p3iDEc+KTKl5xGVfR3H9pg5bNZ
         +v2pc16/PHlSc8lLe/W8GA1rWIWqd/AqMVO5HSAZpF93YGFPyqBhaVLUnwS/jB413+YL
         8LKSuXW3X2Ibg1NraGS7CqfKnjkdYj6b+8LGGM3SUbzhYYwPZWprCyIjr0jSjs7XHYT7
         hayWKuEkvO4jbS8PNSD1suSqFZ3peirX+udmGWIrxEvcUdnRDAhOdsxb6ouNwFNTEsxd
         Ic7uOOYSe7EVY7gKpAeWEVUdXQNsQavSpHfXfa+0U/oxR+8t2WpJvhclX0TV7Ai8AobW
         32wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EkBcRQ3FSxoHr2CTVma7OTMsNkj+chjdnuq3vagcoSg=;
        b=8LNBclc6MzO3SEx8Vhzj5HvvkbHlpvufGFk4clulSDFwI9dssmrsYoyIwy5N3iDiR9
         EBzNmBz+gtpJb/mb42M11lUmtElzGVZ2ER149lNnG06CWm+FCRX+2sP9+MHt08lanQL+
         SW59jHb3Qe69dTxx8jKzhPCwp1Libkk8nYsyzkfuSRdkYofY3WV/A3YFXyDajnIQP8rj
         7XnhmGT9LKu0ocxlzJk+135HQUxyU2tDBr54erXbWAZVK2EM+PCPN6+PA+gLdp0Jzf94
         lTJ3p0ntwAvqugOjLa19duUUXBZsqngzrszKJe8a36BXZ0BX+vDQqy+HizkqRXwfBggV
         UlKA==
X-Gm-Message-State: AOAM530slrI/qWuuvoW8M5gFkoxlEZO6vrMkh+GWkbTOawgsvK61Be1v
	Nqk+2BrIjaHM0naANQMZHvE=
X-Google-Smtp-Source: ABdhPJywyDgdZmOauAKekxXMp8ylMAfdHu/iyTZe6vmSobj3jlxlUAeuk3DQoNJqjXUW37Rr5Oqv6g==
X-Received: by 2002:a17:907:3d87:b0:6e6:f1f3:ba7c with SMTP id he7-20020a1709073d8700b006e6f1f3ba7cmr36244569ejc.128.1649795761348;
        Tue, 12 Apr 2022 13:36:01 -0700 (PDT)
Received: from leap.localnet (host-82-60-208-254.retail.telecomitalia.it. [82.60.208.254])
        by smtp.gmail.com with ESMTPSA id y13-20020a50eb8d000000b0041f112a63c4sm32207edr.52.2022.04.12.13.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 13:36:00 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: johan@kernel.org, Jaehee Park <jhpark1013@gmail.com>
Cc: elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev, jhpark1013@gmail.com
Subject: Re: [PATCH v2 2/2] staging: greybus: remove unneeded return
Date: Tue, 12 Apr 2022 22:35:58 +0200
Message-ID: <5792471.alqRGMn8q6@leap>
In-Reply-To: <d4d01ecdabc492e52a3decebf165d1f584f3b3bf.1649793138.git.jhpark1013@gmail.com>
References: <cover.1649793138.git.jhpark1013@gmail.com> <d4d01ecdabc492e52a3decebf165d1f584f3b3bf.1649793138.git.jhpark1013@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"

On marted=EC 12 aprile 2022 21:59:15 CEST Jaehee Park wrote:
> An empty function with void return type does not need an explicit
> return. Issue found by checkpatch.
>=20
> Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> ---
>  drivers/staging/greybus/audio_codec.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/
greybus/audio_codec.c
> index 0f50d1e51e2c..3e3a16568def 100644
> --- a/drivers/staging/greybus/audio_codec.c
> +++ b/drivers/staging/greybus/audio_codec.c
> @@ -1032,7 +1032,6 @@ static int gbcodec_probe(struct snd_soc_component=20
*comp)
>  static void gbcodec_remove(struct snd_soc_component *comp)
>  {
>  	/* Empty function for now */
> -	return;
>  }
> =20
>  static int gbcodec_write(struct snd_soc_component *comp, unsigned int=20
reg,
> --=20
> 2.25.1
>=20
Hi Jaehee,

If I recall it correctly, Dan Carpenter suggested to remove this empty=20
function.=20

When developers remove lines of code from a function which becomes empty
after the removals, they also remove the resulting empty function and
delete all the calls (if there are any left) at the same time.

Thanks,

=46abio M. De Francesco=20



