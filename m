Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4721FD9;
	Tue, 14 Mar 2023 04:55:06 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id u5so15337528plq.7;
        Mon, 13 Mar 2023 21:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678769706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V+GGb3ptBh1e6f7SZa3WUdgPGSOkMzefKbLzCNkJM7A=;
        b=C9DBDX+gVzOuJcvEcgQmkLsriX59c0qHolTRZQgVElo7mJO9XP0XrE3e3AJLwNzWPP
         dQmSVHpMPhhrtC2An2IfLVyxVengslpinKhVFActY2ig2nDcpJx1lgJZrIAjT0NQqVa7
         gaKyosDjZE0GN6IikF1Hixykv/CEy5dwbraEuhpAFEw0MPVvKsUnjhROkIft3z8+NtMt
         +2zB7bS/cZJlKg6XWXFPvqN9oTGAYhAiaV04jNVP6STCsKrLm8TcphhcPgn48B3nqGtc
         +Uh2a0+rY0ro/KJsQXKYOS8TF+oP9GmnoeJKS2uO6/OUHP6s9vj5FGbO+uQhBNhYyv52
         EhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678769706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+GGb3ptBh1e6f7SZa3WUdgPGSOkMzefKbLzCNkJM7A=;
        b=lvUYoy0d+ggX6P67UtCw+6jG3ukDDtvW4+0DaDNTIw/0Jq+2bKCt70aMgs+32Ztuoi
         O70uqwQLU0ViN082vbcCCXDho1LxK3bQ6b5A+SeaI+cYXeB9IONO/x3PxqtM/8mBnWLU
         toUAWdYfdBrt7YJzH+4N018G/ZfpAsgVVn6xOWZuQRRt5kAnr7U69tPWBPqUPX3eUUl8
         AXdsv7nhc4EtcALe817F2KAX7a27a/nmCNxtFAkQcx6MHIbF0RXobCxgWV45wNofMW6e
         hkLda3MEm9118lGjmh249J7EC9H8w7mQVin4A+zw4tPNIiiJJwrm0mn2OzdEAigkCifa
         j3Bw==
X-Gm-Message-State: AO0yUKViKWfNR23fThC93h60ap9xD/PlXDMuCHsuCxthj1zbZbtca8Dd
	1S2wX5DAXQyUk+GaDGMJdz8=
X-Google-Smtp-Source: AK7set9M5yiG8FIOgaweAra6Tzonl3vZeHRpbzxyVm6TtU3dc099vSZEQbAG4owpeEK9wEVGsTx2CA==
X-Received: by 2002:a05:6a20:144d:b0:cd:c79:50e8 with SMTP id a13-20020a056a20144d00b000cd0c7950e8mr44791277pzi.62.1678769706058;
        Mon, 13 Mar 2023 21:55:06 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-88.three.co.id. [180.214.232.88])
        by smtp.gmail.com with ESMTPSA id j11-20020a65428b000000b004d4547cc0f7sm580920pgp.18.2023.03.13.21.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 21:55:05 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 17B811066DA; Tue, 14 Mar 2023 11:55:02 +0700 (WIB)
Date: Tue, 14 Mar 2023 11:55:02 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Kloudifold <cloudifold.3125@gmail.com>, teddy.wang@siliconmotion.com,
	sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750: Rename function to avoid CamelCase
Message-ID: <ZA/+JlgWfdg2wH8B@debian.me>
References: <ZA+K6OdPe21k8F2k@CloudiRingWorld>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q9+2y9es+8db1Tkx"
Content-Disposition: inline
In-Reply-To: <ZA+K6OdPe21k8F2k@CloudiRingWorld>


--Q9+2y9es+8db1Tkx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 14, 2023 at 04:43:20AM +0800, Kloudifold wrote:
> The sm750 driver had some functions named in CamelCase,
> which violates the kernel's naming convention.
> In this patch, I rename these functions to snake case,
> which is the expected style.
>=20
> This v2 patch was prompted by an error reported by the
> Linux test robot, which detected the compile error.
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303110849.X24WnHnM-lkp@i=
ntel.com/

Hi,

I'd like to write the patch description as (ignore markdown):

```
sm750 driver has sm750_hw_cursor_* functions, which are named in
camelcase. Rename them to snake case to follow the function naming
convention.

Fixes: <commit that introduces these camelcase function>
```

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--Q9+2y9es+8db1Tkx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZA/+JgAKCRD2uYlJVVFO
o7VIAPsG0Of1YSDHa+Ug6knGMBl+AC/WH6UA5gFPaUapKrIcOwD/UyxwKtQxte62
rsEOKS1MlZupf1k40EL7qlGMJGwuvgM=
=k0dL
-----END PGP SIGNATURE-----

--Q9+2y9es+8db1Tkx--
