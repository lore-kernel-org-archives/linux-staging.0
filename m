Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C6671
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 09:22:02 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id k128so25592503wmk.4
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 02:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=PKT4zkxJMqPYfA9QsNLhQ+bzLMVY8a1pdeHnZ0lb8vc=;
        b=vJps+xMHcJTJQGZCBcI1vI87JXm/2LWqlw+9gA6G+16Lej7YSMcjCFuMu/3dAt5lFQ
         PkVhTtshYyBAEXJh1Mw8fx0Cede+TD30Zy/Pi+VgWH1Umuqq1CWGU0OL0oqm25/mPdEk
         i5nsa9yPJYPjtU18h3mRSnHrbXZQGM5o6ZzKuh0da+0Dsw00nVV6AKenmN0SL2cHj/Rb
         D6VtvZfAb5fCbd3akwwsRXmSgsHNkA3nl8LvSsPYjfap2nGXsdLvunEykHv/5IFqBNLa
         34KYmfYtdSf01S3ViMd96Tk1SU/CzxEpC99kMcjh8BPYDinRhDrwFWbzXYSE22G1MoY+
         yTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=PKT4zkxJMqPYfA9QsNLhQ+bzLMVY8a1pdeHnZ0lb8vc=;
        b=UR5EUCtYvFj4B46z76mMILck53sG7MbFyaffWdfp5O3GUf57cHtjUFWphrtCn/6AJs
         9JjKDGzeYfc2Nu067wxFfoS1nzE4/PzAL27//0ISHDuIh7IAoipFDvj7pc4Q8AI/uGN6
         UF1q91Okxn0xIeISenw0Tf6LdsJBzFt9zAquth/0MF7dOvZq8ogAwo04OusnnqC4p69y
         wl6TBpTEq7nF3xr1qLb3Vn3BHQOzOxkCWLdmh12RwEMTMnq4hkgf2kkBGbNE0io4OAty
         qeXGz3411URAQJI2kBnsoJJwLiF1Zgk1qJZwxrkYw0j5Di3odP33CDEZbBQ5UsdyE7Ck
         DZsg==
X-Gm-Message-State: AOAM532qsGUVUonhcEiU4PkuVTW5S/lnu8qcClY+Nw4VySLkG7FM4hbb
	OO7Z/8vOFyYe8tMGh2koq9w=
X-Google-Smtp-Source: ABdhPJy+LoUpv1++f/Sm0DrpwQHIlIXUPiOhShagxZJ1aGaUIxHpwksIROn5Zc74Z+P4SuT+p8PD+w==
X-Received: by 2002:a05:600c:2247:: with SMTP id a7mr3235552wmm.133.1619169721348;
        Fri, 23 Apr 2021 02:22:01 -0700 (PDT)
Received: from ?IPv6:2a0c:5a80:3108:4700:8d94:f633:2343:f95c? ([2a0c:5a80:3108:4700:8d94:f633:2343:f95c])
        by smtp.gmail.com with ESMTPSA id o17sm7926548wrv.16.2021.04.23.02.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 02:22:00 -0700 (PDT)
Message-ID: <9528f276fab33fc3da617e4b5c3ee0a7c34bf6c8.camel@gmail.com>
Subject: Re: [PATCH 04/10] staging: vchiq_core: Drop unnecessary check in
 notify_bulks
From: nicolassaenzj@gmail.com
To: Stefan Wahren <stefan.wahren@i2se.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Date: Fri, 23 Apr 2021 11:22:00 +0200
In-Reply-To: <1619122076-31785-5-git-send-email-stefan.wahren@i2se.com>
References: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
	 <1619122076-31785-5-git-send-email-stefan.wahren@i2se.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-qpF3UNpN2Tt/lTnr6BFy"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-qpF3UNpN2Tt/lTnr6BFy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-04-22 at 22:07 +0200, Stefan Wahren wrote:
> There is no modification to the vchiq_status before the first if, so drop
> this unnecessary check.
>=20
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Thanks,
Nicolas

--=-qpF3UNpN2Tt/lTnr6BFy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAmCCkbgACgkQlfZmHno8
x/6cFwgAnlvWFfm/czTv3ehbqhIjk5fBNdW2rch1PK3+6Qq38GNu1pzGLLGku655
Wx/42xTyac8iTvIPL1A3BYfFqgXB4WnzVv8ePV5X4Fg9SUvNQFYumyWQAxEabo7z
MMoxrssrsxjyqn3jqmb9ICm5E5gTmtEM1OHMe82JHnFPv0c/khAeKRjJ7bPl8Sg1
C6klejW+a4YS5jxzRviVHlG0N87lvyjUl07JlcqmuYdjAVRXm5LDhy9HPhZ17/sd
xVapuyPmRzbcGRZXJTG3qUQrTyT6p69eZ/qFgyaeVQKZ1I/Ra5owuII24S7nJsxT
BJ03nSCWIBLlC75j3Q5mxN/fSgN3SA==
=m3pO
-----END PGP SIGNATURE-----

--=-qpF3UNpN2Tt/lTnr6BFy--

