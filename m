Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA5A525D;
	Wed, 15 Mar 2023 13:19:49 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id ay8so7288102wmb.1;
        Wed, 15 Mar 2023 06:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678886387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUlnp1fB6sDr4A7BqDurvwTCfCpIFKb0AFx9h4y4qgs=;
        b=UEOfl28r8EeUXOKXouo1hBqWMuNis1mmzwyRAmX1RWRzptJB4gfHITSw9+0EiaMqZ1
         HIf0WeJtbD5ZTot0365o8M3+tVRYqcvX3jHp8SRMm6DEzzoXv3G0N4yoOYa88nL0weYr
         HmI5wc31hGPWaFOOHJ2NgRPNgNaNWiTFMCa/BAOoJZpRAzAtTQEtisSmqKNTtZhAFRaT
         qkk6WOXHSASEMZDPkkFmZd3wpAuiVXsNB2t18uMGtYeeL5qgDhtXv6za5DPbsa2fdEoe
         8QEwWd9C1f6EjdWRRf4+xo+x3/aMH7kB0UosIYl9SY2jU3t0JB71LUXHOPjDAkZx3zfB
         PYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678886387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUlnp1fB6sDr4A7BqDurvwTCfCpIFKb0AFx9h4y4qgs=;
        b=Xv3QIyJoPJayfpUFfz+zKyWg6XdfQSjzfOa809+uaeoT5rfakKKyAjvArLTFu+uT0x
         FAS2xJozFCmUt7JyiR41Q+qltiFnr3C5c0tV0ItoEVX9ojAy9kcYY7C4k15Lm+LnZFlQ
         mDmNcd7C7DdvAM+rDf8uAqCVa1ZN1GQljYmzfW2jgPvOjJQr7uAcbpstNQNwV001n21N
         qB21ECCwAl83/8D+HMYPNmwU0N0EhW2W/x3xdyp49tkxcY1MII/Y7gQNW3t8DAmdrOGP
         voVx4p+r2LuQ0sU4KsvRqZW1sX5ap89sHQgEJx5aJtlJhThkYDymixagNVlIzlmkSqi7
         KTUQ==
X-Gm-Message-State: AO0yUKXYq/4d4J4V+lgCcfvlFRrWYt3JPabgr50ROPV0BjdXgLD/clCK
	AA4zTWVzHZMCSqopdf250bo=
X-Google-Smtp-Source: AK7set+qRkJFNWa6iCgoQYjmiHQddUMUBq8CB04MbNnjr8zLbiMiMRp+wKP9QeeR0gATLEJlrstn0Q==
X-Received: by 2002:a05:600c:1c96:b0:3eb:3300:1d13 with SMTP id k22-20020a05600c1c9600b003eb33001d13mr17750518wms.14.1678886387320;
        Wed, 15 Mar 2023 06:19:47 -0700 (PDT)
Received: from suse.localnet (host-79-35-102-94.retail.telecomitalia.it. [79.35.102.94])
        by smtp.gmail.com with ESMTPSA id r6-20020a05600c458600b003ebff290a52sm2120911wmo.28.2023.03.15.06.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 06:19:46 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org, Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
Cc: outreachy@lists.linux.dev, martyn@welchs.me.uk, manohar.vanga@gmail.com,
 zoo868e@gmail.com, jerrykang026@gmail.com, cuigaosheng1@huawei.com,
 arnd@arndb.de, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 eng.mennamahmoud.mm@gmail.com
Subject: Re: [PATCH 2/2] staging: vme_user: remove unnecessary blank lines
Date: Wed, 15 Mar 2023 14:19:45 +0100
Message-ID: <2403283.QvUyjg2IbA@suse>
In-Reply-To:
 <8958127fc8fdb4fede7867f38579578af924b719.1678882204.git.eng.mennamahmoud.mm@gmail.com>
References:
 <b56c7b94e59a4051373af8b5d90a0685dfc9233a.1678882204.git.eng.mennamahmoud.mm@gmail.com>
 <8958127fc8fdb4fede7867f38579578af924b719.1678882204.git.eng.mennamahmoud.mm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On mercoled=EC 15 marzo 2023 13:21:33 CET Menna Mahmoud wrote:
> remove unnecessary blank lines before a close brace
> as reported by checkpatch script
>=20
> CHECK: Blank lines aren't necessary before a close brace '}'
> +
> +}
>=20
> CHECK: Blank lines aren't necessary before a close brace '}'
> +
> +}
>=20
> CHECK: Blank lines aren't necessary before a close brace '}'
> +
> +	}
>=20
> CHECK: Blank lines aren't necessary before a close brace '}'
> +
> +}
>=20
> CHECK: Blank lines aren't necessary before a close brace '}'
> +
> +}

There are no valid reasons about copy-pasting that warning 5 times in a row=
=2E=20
Just say that you get that message from checkpatch.pl in five different sit=
es=20
in the file you are changing.

What if you had had 20 or 30 occurrences of that same "CHECK" in the same=20
file?

Thanks,

=46abio=20

> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
> ---
>  drivers/staging/vme_user/vme_tsi148.c | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/drivers/staging/vme_user/vme_tsi148.c
> b/drivers/staging/vme_user/vme_tsi148.c index bfa604043355..2f5eafd50934
> 100644
> --- a/drivers/staging/vme_user/vme_tsi148.c
> +++ b/drivers/staging/vme_user/vme_tsi148.c
> @@ -1023,7 +1023,6 @@ static int tsi148_master_set(struct=20
vme_master_resource
> *image, int enabled, err_res:
>  err_window:
>  	return retval;
> -
>  }
>=20
>  /*
> @@ -1741,7 +1740,6 @@ static int tsi148_dma_list_add(struct vme_dma_list
> *list, list);
>  		prev->descriptor.dnlau =3D cpu_to_be32(address_high);
>  		prev->descriptor.dnlal =3D cpu_to_be32(address_low);
> -
>  	}
>=20
>  	return 0;
> @@ -1773,7 +1771,6 @@ static int tsi148_dma_busy(struct vme_bridge
> *tsi148_bridge, int channel) return 0;
>  	else
>  		return 1;
> -
>  }
>=20
>  /*
> @@ -2220,7 +2217,6 @@ static int tsi148_crcsr_init(struct vme_bridge
> *tsi148_bridge, }
>=20
>  	return 0;
> -
>  }
>=20
>  static void tsi148_crcsr_exit(struct vme_bridge *tsi148_bridge,
> @@ -2530,7 +2526,6 @@ static int tsi148_probe(struct pci_dev *pdev, const
> struct pci_device_id *id) kfree(tsi148_bridge);
>  err_struct:
>  	return retval;
> -
>  }
>=20
>  static void tsi148_remove(struct pci_dev *pdev)
> --
> 2.34.1




