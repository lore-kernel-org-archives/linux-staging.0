Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB3F7E
	for <linux-staging@lists.linux.dev>; Fri,  3 Jun 2022 20:52:26 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id a2so8280171lfg.5
        for <linux-staging@lists.linux.dev>; Fri, 03 Jun 2022 13:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to;
        bh=INm2lKIJIOK1vkfeeO9IkNQLYQIEPvdab0PRt+gAhcU=;
        b=ZGlF2wwfgSdRhb2kEUDAHV1jdX3qfvCmrfU7vIkJt3ArsZVnx4KkrSL6CVL92moobT
         8TOiuASeR2Heyj5VxakFWKRmP7mqjKxIeQyMWcF/Tsq+/j0WIMny4dhJ9ylwu3L7fXRL
         t4c5rgIVMVHHicGWtLaKTvGzWWpVpKNq7gdrr8BF+x6lXbmg7EUBDHSy3tytb7KQmzLN
         K5OZoQHOB3++0nKJUoYSFyTLLCVRKIYx4tHzSzuYVrxsaybGXKu3gv6T0GGYQ/y8dAXf
         cNXxCQwk7/ZGglnfee0PuTYHC02W0M5H5a2d7lj/shjBTxyjbVnvOSavXNW3pCe4REZP
         uukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to;
        bh=INm2lKIJIOK1vkfeeO9IkNQLYQIEPvdab0PRt+gAhcU=;
        b=ro9ahFb7IKzfm8Z9dkZYX/XyLuUm+JGm0ZHKh2A6FMnfA1KB9Etf7B3EK2fNafvbNt
         PL9jDglCx9Gx73DPd1FuXRsmehoVhyqZvRiQc1c+Bwk36g9OGED/ddS+HUAE/cWFvbqe
         muDqgbjLCSafbxKk1h7mWCKXkXOLjYG4fRaZFd1h/2dgLq6c/JgJEk32+sXONOnTWsZq
         Yd5/BbeEKqeYva+QSZkWwo2mg9RD3PXHyOwWyizs2wo7JgAxKNj5B06j3OiRUYO2xalb
         2ct1ZZhKh8DG28/Tidtm5WI4jUA4egNqHxP1oyhRL+6Hoog/gczuj7RCxEwyINjsCV19
         v4Xg==
X-Gm-Message-State: AOAM5319sgExdH9Ga5ZXkg1hrZzda+HFR/O84AiXDtcvlCDJsS6E4xQA
	yc0HhTRBVZc5gCxmox6bG4U=
X-Google-Smtp-Source: ABdhPJxpwbxhm/c0M3AWjfq7icUalnd2xF6MGErptO9eYHmQ5Fm6Fjf0GO4aGJTwT+XszPRunM7+Rg==
X-Received: by 2002:a05:6512:529:b0:479:2158:da27 with SMTP id o9-20020a056512052900b004792158da27mr771824lfc.389.1654289544444;
        Fri, 03 Jun 2022 13:52:24 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.67.4])
        by smtp.gmail.com with ESMTPSA id j2-20020a2e8502000000b00253cd476074sm1448461lji.111.2022.06.03.13.52.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jun 2022 13:52:23 -0700 (PDT)
Message-ID: <1fd1374a-132d-fc38-fc96-ed9c98e3ef8c@gmail.com>
Date: Fri, 3 Jun 2022 23:52:22 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 0/3] staging: r8188eu: some minor cleanups
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220602194807.281115-1-martin@kaiser.cx>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220602194807.281115-1-martin@kaiser.cx>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1xABE6dtyAJLjVB6UXL9h6Z9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1xABE6dtyAJLjVB6UXL9h6Z9
Content-Type: multipart/mixed; boundary="------------6WFRi6R0nSoPDdhXDMj27Dzx";
 protected-headers="v1"
From: Pavel Skripkin <paskripkin@gmail.com>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <1fd1374a-132d-fc38-fc96-ed9c98e3ef8c@gmail.com>
Subject: Re: [PATCH 0/3] staging: r8188eu: some minor cleanups
References: <20220602194807.281115-1-martin@kaiser.cx>
In-Reply-To: <20220602194807.281115-1-martin@kaiser.cx>

--------------6WFRi6R0nSoPDdhXDMj27Dzx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTWFydGluLA0KDQpPbiA2LzIvMjIgMjI6NDgsIE1hcnRpbiBLYWlzZXIgd3JvdGU6DQo+
IFNvbWUgbWlub3IgY2xlYW51cHMgaW4gc2V2ZXJhbCBwbGFjZXM6IFJlbW92ZSBzb21lIGRl
ZmluZXMgYW5kIGEgd3JhcHBlcg0KPiBmdW5jdGlvbiwgZml4IGEgcHJvdG90eXBlLg0KPiAN
Cj4gTWFydGluIEthaXNlciAoMyk6DQo+ICAgIHN0YWdpbmc6IHI4MTg4ZXU6IHVzZSBpZWVl
ODAyMTEgZGVmaW5lcyBmb3IgYmFjayBhY3Rpb24gY29kZXMNCj4gICAgc3RhZ2luZzogcjgx
ODhldTogcmVtb3ZlIHJ0d191c2xlZXBfb3MNCj4gICAgc3RhZ2luZzogcjgxODhldTogZml4
IHRoZSBkZWNsYXJhdGlvbiBvZiBwcm9jZXNzX3B3cmJpdF9kYXRhDQo+IA0KPiAgIGRyaXZl
cnMvc3RhZ2luZy9yODE4OGV1L2NvcmUvcnR3X21sbWVfZXh0LmMgICAgIHwgNiArKystLS0N
Cj4gICBkcml2ZXJzL3N0YWdpbmcvcjgxODhldS9jb3JlL3J0d19wd3JjdHJsLmMgICAgICB8
IDIgKy0NCj4gICBkcml2ZXJzL3N0YWdpbmcvcjgxODhldS9jb3JlL3J0d19yZWN2LmMgICAg
ICAgICB8IDMgKy0tDQo+ICAgZHJpdmVycy9zdGFnaW5nL3I4MTg4ZXUvaGFsL3J0bDgxODhl
X2hhbF9pbml0LmMgfCAyICstDQo+ICAgZHJpdmVycy9zdGFnaW5nL3I4MTg4ZXUvaW5jbHVk
ZS9pZWVlODAyMTEuaCAgICAgfCA3IC0tLS0tLS0NCj4gICBkcml2ZXJzL3N0YWdpbmcvcjgx
ODhldS9pbmNsdWRlL29zZGVwX3NlcnZpY2UuaCB8IDIgLS0NCj4gICBkcml2ZXJzL3N0YWdp
bmcvcjgxODhldS9vc19kZXAvb3NkZXBfc2VydmljZS5jICB8IDggLS0tLS0tLS0NCj4gICA3
IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pDQo+DQoN
ClRlc3RlZC1ieTogUGF2ZWwgU2tyaXBraW4gPHBhc2tyaXBraW5AZ21haWwuY29tPg0KDQoN
Cg0KV2l0aCByZWdhcmRzLA0KUGF2ZWwgU2tyaXBraW4NCg==

--------------6WFRi6R0nSoPDdhXDMj27Dzx--

--------------1xABE6dtyAJLjVB6UXL9h6Z9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEER3XL3TplLQE8Qi40bk1w61LbBA0FAmKadIYFAwAAAAAACgkQbk1w61LbBA0Y
8A/9GfWZ2/S3Zy6rjGs71kwX2Gqswq4DXXxjPHztqVD6rS1U/975GtJ749Av4vpNy9RvD1SoZQAv
1qsmKqRjuJZm5/KxaO5NOpvmYrx6ueyDg9eMoRAfg672OvxRt2VPAA/0IP8IZ13jrZzjTrQU0lNu
ITIOht3JoYpE4PSZRpQNDKcgVCbhcJ3mkREv4H4DHsd6civT1gK+LqDu7HOSSF6VgI7skx/Xf5Hh
0Lx4z80WmDCIdCiqfL3wFXnLs02v8fZ5WK23fc6w78GXQU5lmv23+DjMu0C676M8KA+/2vvuxbPe
8aJSpzPYCEnePLNjyphMmgfueYnwCqf7XU9B79h+ZoftQp9EzazxUMkr0ptSQg0/2cbLYMZTCb+C
M0tanoyMtQTcNrwyRIvz4yxYHdtpSZny7zB2Y0qnqR81T36JXRKXkuVd5FO/tiFgOhaPYQaQ5xrg
dh7uEXfBQsG3GnhCjzFlS5HQ+HvEZ3LK5gYsf2VgTpk7XM30Zsqu5WJqwlNQv+9axhBvHx1K8+FY
2DclPuVIAsHKPZDdB0VOJGJveyYcuv9Oby3Dr0XWDTe1X3okpN+euA0O0Lm9I0RS7prj3Cv5JyM4
iZKOH1SI0YahOtLNYSsJNso7Pm6wDfWc6Zy+R82Ey74+z15RTD0ifYoZVZHe7jV/+nlvCywE4Hi2
ZWk=
=uLHL
-----END PGP SIGNATURE-----

--------------1xABE6dtyAJLjVB6UXL9h6Z9--
