Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0206CE83A;
	Fri, 28 Oct 2022 07:41:16 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id y13so4144966pfp.7;
        Fri, 28 Oct 2022 00:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nZcVVJXKTudcoaW1Xnbq9pVmL+jhwnIjYb5pjiAaeoA=;
        b=QaXhQr7GVmG5cXT3xnRLXJMwMfritNwyKut8TX/b+3+SMMuVyy1s5IKBWNANIpT8w/
         aGx1CRVj7MR8Hz+CNU9CkPqF3TjoL3yChYRfXvbUCDc+aNIsW+xRcNd2lREvOa/+AZMs
         MS0Zl6Opbc8GriOEpfGXSfk8LTLtGLGThCnhdjxvn4aknIGNErqGd0O0NFTg2spAmxJO
         90tBe5AbaYRvAegmHdj3D/EKq9nPWrcadb9jPwhCBQnEsEr/vwj/cwGXSnamBehP/tyG
         0egUXidjWo5N+DplZfc8r7wIc2HLnxNICeQ85JPHVQzYFN7AVJgN/2/oNN0xQ/4xo7EH
         rfbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZcVVJXKTudcoaW1Xnbq9pVmL+jhwnIjYb5pjiAaeoA=;
        b=t18ErGvjMgrEojnBwCVlGD0poXfs2phjnFYHKk2Dyyhs4w9vPNL7sVfPFi5bIGa/Gi
         sQG6JesfpbDOORW2S2r2HF/M/2okVQ1sNArJawUQUnuuIpU98vJcIK5Vr7RxJR7LQqW3
         fxiO9KxbOYoOSC0w2USPuBxmVG/+NH3XjlxPglgtJQwzB90teLAK4jsicBHk59Al+fwW
         7mopYt6f7DUYJRkOKjrHwmhJ0K1sFzoF0g9xLejqHZ+Wy5LNl6y/r+p6mbv2oHa27pyI
         Poflp6baiD9rsSF9PwNjrv2VE338Hfc5tsIIMM6KU+SGPQpaJv/7a6laWXBgpdcdrLGf
         cVsQ==
X-Gm-Message-State: ACrzQf2v0jjnh1hYKP7F4C60GqA3hKwHtN9yGzWswN3Xzk3yevajTWNF
	FGzbRjUmhZp0pcjr//q1DBM=
X-Google-Smtp-Source: AMsMyM6uGmuwwathfUeizITkDy/6ZqZ8PnQv1b/pvPaOhTv12ET7Tgufmbiy+GBk3WfsTUx64ZAkzw==
X-Received: by 2002:a63:2b53:0:b0:439:34d9:5d47 with SMTP id r80-20020a632b53000000b0043934d95d47mr44910652pgr.283.1666942876329;
        Fri, 28 Oct 2022 00:41:16 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-85.three.co.id. [180.214.233.85])
        by smtp.gmail.com with ESMTPSA id k137-20020a62848f000000b0056bb21cd7basm2303639pfd.51.2022.10.28.00.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 00:41:15 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 5396810411D; Fri, 28 Oct 2022 14:41:12 +0700 (WIB)
Date: Fri, 28 Oct 2022 14:41:11 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: UMWARI JOVIAL <umwarijovial@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH]  Possible repeated word: 'very'
Message-ID: <Y1uHl4di6R0pFA/i@debian.me>
References: <20221028070439.GA36889@rdm>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5AHVENxkMm6djXWN"
Content-Disposition: inline
In-Reply-To: <20221028070439.GA36889@rdm>


--5AHVENxkMm6djXWN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2022 at 10:04:39AM +0300, UMWARI JOVIAL wrote:
> Reported By checkpatch.pl script
>=20
> WARNING: Possible repeated word: 'very'
>=20
> Repetition of the same word in one sentence same line
>=20
> Signed-off-by: UMWARI JOVIAL <umwarijovial@gmail.com>
> ---
>  drivers/staging/rtl8712/rtl871x_xmit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/rtl8712/rtl871x_xmit.c b/drivers/staging/rtl=
8712/rtl871x_xmit.c
> index 090345bad223..30a0276b8b58 100644
> --- a/drivers/staging/rtl8712/rtl871x_xmit.c
> +++ b/drivers/staging/rtl8712/rtl871x_xmit.c
> @@ -766,7 +766,7 @@ void r8712_free_xmitbuf(struct xmit_priv *pxmitpriv, =
struct xmit_buf *pxmitbuf)
>   * If we turn on USE_RXTHREAD, then, no need for critical section.
>   * Otherwise, we must use _enter/_exit critical to protect free_xmit_que=
ue...
>   *
> - * Must be very very cautious...
> + * Must be very cautious...
>   *
>   */
>  struct xmit_frame *r8712_alloc_xmitframe(struct xmit_priv *pxmitpriv)

NAK!

You send patch with the same content as [1], for which Greg already replied
as [2].

The code and its comments imply that calling r8712_alloc_xmitframe() must be
done with extreme caution, isn't it?

Thanks.

[1]: https://lore.kernel.org/lkml/20221028051420.GA30073@rdm/
[2]: https://lore.kernel.org/lkml/Y1tx8XjmR5QKV9lQ@kroah.com/
--=20
An old man doll... just what I always wanted! - Clara

--5AHVENxkMm6djXWN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY1uHkgAKCRD2uYlJVVFO
ozJfAP98k83IoBbLOqKYVGBcCIKTV1wDGbH2y5M14189nsgH0QD6AzbdUjKDI/UW
jvhe3t0vTOYRclrj8RRDIG2ttn2iNQQ=
=jU/M
-----END PGP SIGNATURE-----

--5AHVENxkMm6djXWN--
