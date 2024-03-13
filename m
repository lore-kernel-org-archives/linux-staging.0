Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4D23E48C;
	Wed, 13 Mar 2024 13:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710334969; cv=none; b=LIEWbZRiBYeGzwI6XwtSYH12mMDd4Rtl0zJ3ZXAR5nszgCvnFGrt4BToM8RSA/Hck8NoMnmypyjUNJegMsJHaILsD17I206MTQvqUyktw32JAm5AQcoRH4I5vgSoZuRbr3/Arj4K7fa/3hvdobYfCXhwXIsCpgw4b4gI2KtZT7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710334969; c=relaxed/simple;
	bh=5+6a6BE6Dzik/1mcPGXs78Go5F8m8w8Zi3fZK+98t1s=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YQKa/hbgQS78deoXw5tM11h+UuwwfkuO9G1/NuhmDVJh2GLpA/j+ZmoCOKxBSHR74vfYEJLqX/AzqBeH1M0bYoNshwkCL5MYSeMWpMetcaUZGxq4qkIPD2YhqNH5dc6n5hXxY831uzffIG8mAqhQhTx1po0vMJDCPxlGU2YOzrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1InmK+8; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1InmK+8"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e6ac00616cso1605091b3a.0;
        Wed, 13 Mar 2024 06:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710334967; x=1710939767; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9uHnZXjrHdOB/gJ/MSqj+aJ97zQ05u9C0OKdlbMO9ak=;
        b=Y1InmK+8pfuX9m8rNGCpJvat2fpq6QdI7EevZDHD+669vCewwzxQKZ/vTvjggvmJi+
         AMGSDrspiXb0RJhDOnxfFuR2zL6PjDmjeYCNzXot953pb29oB7BHdPYSzqa5G4BH45qu
         TbwSbWfpZuHktqZYXdc7/p4WQtY+dDyKsIn2bhpR/Q/EO9kKbZB/xDAIPY4/1ojpo4Ez
         al63W37v0+kZ26cjFGnUQjDuhUS2Xhq1b11C6li/mzPvUAZfh7MscXDkCzPTCdUyXd+j
         qvGFnuBfEVr90JHq/Rk70w9bJqiNW9qzAgbhD3le90FHPcPHLNj7KFORjzWdN5f5+bGp
         92kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710334967; x=1710939767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uHnZXjrHdOB/gJ/MSqj+aJ97zQ05u9C0OKdlbMO9ak=;
        b=car1hPkvQAhOCdgUSh4V7kv5Uj+ylQs9jDRS7aUJkzEpRqkjYEud8Gp10I9sIbI/tm
         efJD41RDhe4gi0ZvVeWlzj+GsvVoEM6fjP7bCCrvvg7NUrn1pfCfQeSI40clR40Lv9Tb
         m62KKY/Ph4/C1GRXOOwVj+vhPuHskYqtJM/mUE8bmlA4FFOvP9GHZyeC80kIC/nrw8Pa
         riHBNS8E4nbhbOGyZe7mpPocXRslVFI8VqiY8iRoammNDTP5chZ8nnMZo1HkTAbU4V8S
         +SSEXZcVjZMnIMJFOF2uqXsxun+H/SJEp1hI7kh9UMuuy5MctHQRJ9lACdJj+V6pjTXC
         G2gw==
X-Forwarded-Encrypted: i=1; AJvYcCWYFhFEGxRevlrfNHcZN3DG9vzqqzl9LuQVxU0zFXw2qlHTEXPDT6aDCq9vLwClUm1tqt0sOSrFX9IvoXpDqCR4Ctub5xICt9X2esB9/r4aFypl5+1fqjHtjF8TGyGeLJ+5XgUHYqnE7A==
X-Gm-Message-State: AOJu0Yz9DZ5R9gOlg0/3O/qszWEGecTCm89Xo+GDhjLJDLFnRYr6s1e5
	J7yx5GgKWZSUGTH7ubqXTWYXTvfFphbLiUpGqz1l0ktOSeVmbHjd
X-Google-Smtp-Source: AGHT+IHcBZua+aVXdiEVkkrp9XGdTKxGzC5hjJd7XpDgbvBpTetMe5hr5GcXeGM+KgU1t9gQ2W3I6g==
X-Received: by 2002:a17:90b:30c2:b0:29b:a957:f664 with SMTP id hi2-20020a17090b30c200b0029ba957f664mr9195362pjb.41.1710334958324;
        Wed, 13 Mar 2024 06:02:38 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id g15-20020a17090a7d0f00b0029aac9c523fsm1307071pjl.47.2024.03.13.06.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 06:02:37 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 29C791848F178; Wed, 13 Mar 2024 20:02:34 +0700 (WIB)
Date: Wed, 13 Mar 2024 20:02:34 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Ayush Tiwari <ayushtiw0110@gmail.com>,
	Linux Outreachy <outreachy@lists.linux.dev>,
	Linux Staging Drivers <linux-staging@lists.linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	gregkh@linuxfoundation.org, florian.c.schilhabel@googlemail.com,
	Larry.Finger@lwfinger.net
Subject: Re: [PATCH] staging: rtl8712: removing redundant paranthesis
 chk_fwhdr
Message-ID: <ZfGj6v2yk8Ie8cit@archie.me>
References: <ZfDIF+6MrdrX79nd@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="olrniryj63XltpFO"
Content-Disposition: inline
In-Reply-To: <ZfDIF+6MrdrX79nd@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>


--olrniryj63XltpFO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2024 at 02:54:39AM +0530, Ayush Tiwari wrote:
> diff --git a/drivers/staging/rtl8712/hal_init.c b/drivers/staging/rtl8712=
/hal_init.c
> index 1148075f0cd6..9f41b2c086ca 100644
> --- a/drivers/staging/rtl8712/hal_init.c
> +++ b/drivers/staging/rtl8712/hal_init.c
> @@ -138,7 +138,7 @@ static u8 chk_fwhdr(struct fw_hdr *pfwhdr, u32 ulfile=
length)
>  	u32	fwhdrsz, fw_sz;
> =20
>  	/* check signature */
> -	if ((pfwhdr->signature !=3D 0x8712) && (pfwhdr->signature !=3D 0x8192))
> +	if (pfwhdr->signature !=3D 0x8712 && pfwhdr->signature !=3D 0x8192)
>  		return _FAIL;
>  	/* check fw_priv_sze & sizeof(struct fw_priv) */
>  	if (pfwhdr->fw_priv_sz !=3D sizeof(struct fw_priv))

Hi Ayush,

As Julia has said earlier, keep the parentheses as is (hint: search
lore.kernel.org for why Greg doesn't like fixing unnecessary parentheses).

> diff --git a/key.pem b/key.pem
> new file mode 100644
> index 000000000000..ef912436e976
> --- /dev/null
> +++ b/key.pem
> @@ -0,0 +1,28 @@
> +-----BEGIN PRIVATE KEY-----
> +MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC8i/6L5h4wSbaP
> +tn9whe9BfKa0jpiiy+F9L0fJEWGKqUqxMUL3D48LJsqTgt8vP6ORMcSQmtQ1ijyv
> +f9s0N5/sNci9dYeiVhzArlcZi4IOEkfkn/lgRoz4WOsZ6NQzgsk6ctctavrlHUwB
> +e6RQHFyEC9BOmCq6PTPMtPTeTrQvjzm68gMiQfoNT86/uho+eKxABYBOZEN1DObt
> +Q2wEbJOhiZ+UfknJd5BuxLXFLLeutYNHT+jzymVETfH6Zqr5U+NS/68H8tVRSy5w
> +zwMZ38yQc5RI0fhI/u+6Lsikf0sJYV4sNaUkElclfzKFRE9RNc8McQcjbY8RUVvG
> +81qbKvDxAgMBAAECggEAB62YcpWu7LQmbpN10h0U1rEJpY2vB+Yklcal9jldJFqW
> +M5a4IuaBIpOe/ph+7Tt6tjrKxewVheP4v67bEYp4WpQAIOhXMH8Fkbp9H98Er1JY
> +QiZaRJeVkwwlRXtWn423vcfCcn409GftL0bxNIqgdod39qi6CLaIVFGZgoS9pWLD
> +lrrEnK8nlq8/4bs/bPyZqoiEIUXTC9IAHhlmmwL1diLYmTOTIFn0XN3kqxMwz50D
> +81Bh/pPZXXsL4f3an9v/68prsM4NgJMXvHh/qWGY8L75QyoPn69/6d4mETBDCSeL
> +BAA1Ac2z2UlC6uqlM5A4/F1IEilrtDIFMD6r3UMZDwKBgQD1Zbx3A3VV/HDlH2CN
> +Tzf/Er2xUPYbPHJCALbZVwEM8zNTeIysMM3LeqWXfbJ4JpfkU575QLCaAC1PdQJT
> +AjNLqo9eYzsir6pj18HqBN/MxIujhbLGA78oD5fYRTL+5sXl0m1xkJq+ngkWbx6Y
> +ByfZFZ/UIUMST8kU8nVlNuFN1wKBgQDEsXO0PH5f0RkdbRVBQvVIdj5kfR94bheW
> +s7apwU07uYvlLiLrikRgC3Q60a7K3H7tfxkP5rjKUr+CyH+rlsL+WL4gJjBi4D13
> +XQeFlNbZieNNrnOctFCnGPlUSmte4Ubd1QEplUkbYkfvh5XKIklAfLsQPf17FQr/
> +ZAE/2YIOdwKBgGfXCQ0DdZ9RFySdRmoFX5icAZEKxVl5FpA/ZSBK5LLqJonntP8Y
> +F71GxNN56Q9WpWeEyvyGFzTTZlj9FmKxx6r5HXm/W8KtuthM8E1qiplHgh9L7/5C
> +j50QHBz0C0Q5uvwpMw6fNhv7G7VWiAek34PI1r0Y5hzVji1C+9I8itI5AoGAYGsU
> +at/UmyenBhO4/ZrTHkhIYX4sdR6SlZ9XBXPqZkKYXyn0mD3ZMrOqsEKlSnA4EDfj
> +kzXok9VoZ7XdT8HBqGjcGmpeAbomp2KFE2hYwZ6kPCouJj0F5EOLxVQNuh74XDnU
> +LgwuICxXUwXF2aZg/immkVmx7inskDD3o9L9vBUCgYBhCpayQcy9hswdDVICOEst
> +U9VXwVAbwfdmPTLiKacRQdw44zhBcsBB0wi1dszvGvSlAlB+ChFM6MxALEdbvTln
> +Jxwsyxx9KXuoryhcTlHQikBOYxmrqPAhdrPh8H2tdiv2yX35x9g7E/XkRZZxMfkL
> +H7x8vakFgGNcX2NITZBM4Q=3D=3D
> +-----END PRIVATE KEY-----

Please don't leak (x509) private key. If so, generate new one instead.
If you intend to sign your patch, you can use patatt (see [1] for usage),
although you have to use a GPG keypair for that.

> diff --git a/staging b/staging
> new file mode 120000
> index 000000000000..ecd48e46fcb1
> --- /dev/null
> +++ b/staging
> @@ -0,0 +1 @@
> +/home/ayush/git/kernels/staging
> \ No newline at end of file
> --=20
> 2.40.1
>=20

What's the purpose of above file? I'm confused.

Thanks.

[1]: https://people.kernel.org/monsieuricon/end-to-end-patch-attestation-wi=
th-patatt-and-b4

--=20
An old man doll... just what I always wanted! - Clara

--olrniryj63XltpFO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZfGj5wAKCRD2uYlJVVFO
o+cdAQDkmcNoU5/jUFGizeKREePa60FyiCloMKaWAtknbSvpOAEAz1Qf8s9FIdGQ
pKy57HtDlfJ/ONGlBVjhn8A4bE/L4wY=
=WaF9
-----END PGP SIGNATURE-----

--olrniryj63XltpFO--
