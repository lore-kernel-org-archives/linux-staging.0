Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794148448;
	b=MkQnQQokZw+vBB5dqbFgaK4vSDQgWb0yjSniMKzo3/lrB7D4wj78hPP7DoKGtI3+eqwv
	 FLimbBJV0hhn5ZT2oPONFQ2q0exH/V+nuqY3w3pUh83pk8I5nRQXrcLCH5l4OMeI4c4wz
	 CCh2mGRm6AlcaSfSmZJDAYtc9fi4FeZwfpNFhcUMl2T26pGhcw7YHcEvN2+A8l5G267NC
	 rhQLxCDocRl+HDQU0m5+7PWQ6av0sluBzDqT8eU0pO7djT62LTD3/oso9cT9unIyvRv+5
	 39YIHEjZ9k6CbLIY0hS5x2GXVyPq8rGWkXMJQiXtFJkdmpImxoElCgPEZijVOHQJ2lQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794148448;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=bZ6795oK8wTcMWcOgiycQWPJ2nyh3zzKiM/vphOQm/M=;
	b=ZDXbakon6w0YpXwbEcBuiTY6Q+9Qrh8xwzasEgq8eYGrHbPBF8f+9D2PC7IpkhUUaF2b
	 Uv6kxpnm4boIDxgSMXR/0tnWtJMkgrAYwe1beRisqtKK1AW2YT9Fd/lIhxKWSBSSOci51
	 d8tBtSumYi5YpfdkLdRBVcthHtwGTl21yHC/aAxxVvIYLL7DHfH7atkmvZ81hQQcm5so1
	 t+gqnXGl+2Oxp2F52DFy7XfThMDedWKTC/9MaCKCBT+Fg3IC4+hpgfbomH0g2k2l81tfb
	 IU2OQl3O5Nh70ECBVdToqOTtai4OyXA8RVZ/uDl7fUk4FH9K7ugo/o7lMNsSSF/35cA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O5AAIw99;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8298A606A333
	for <linux-staging@lists.linux.dev>; Sun,  8 Nov 2026 14:34:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8298A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O5AAIw99
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c434376dbebso13975066b.1
        for <linux-staging@lists.linux.dev>; Sun, 08 Nov 2026 06:34:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794148447; cv=none;
        d=google.com; s=arc-20260327;
        b=JcI4pC+QhWXnJinV4vYHvp+GdLRxqtyCwYxOPgQ3oPgcMilzKlKd0XUzmuDBuwDegU
         x8progdex2E/jUmgX+22ZMDdJ3mN9SnTdKhRQ7iE2sA5x3LkB8yJUt4w6HRZy5j8twZy
         1ruDHQYTVohWw7foVTfP19k0F2MI7W6YtWBgLjnUX8FRHAm5DgpIH5BOFNKWtCC5XAin
         aSaiFK+Tqck7xdEZLv2+uakKKZ63CZQ6mrkjDd/ne04zQa4QSTFyRWqZGMmo4ETaxcCu
         PCzi+BIwX6ojRRdYHIYRFqiAHXKlWpDjQzewpfxIJptpNbKdKpb8ILsfxk2jdMvGko57
         RKKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bZ6795oK8wTcMWcOgiycQWPJ2nyh3zzKiM/vphOQm/M=;
        fh=iF+upiwN0S8JobbSYdu9o9IXABfya9LQIy+B/hGKxYo=;
        b=NizfQfOu3bbiIkEDNlnHSdncaq56or43z42OJThb6a+VaySUOGIH2KlIR7mUgEUnD1
         Ts9X0MQBS6XhD1AExXL+Q41PpXjHlfv/Zxi3F4UeZ7ajrowUeqfUgCOvYRmp4SKPM2NR
         DYu2ZzUo7ghbWSG5DYQzZDrCAPbU1HYHzgHDC0/rGkOS3byC6dmbpuwMzTBFE8pscpOP
         fTChvced0XSS4R7MA6KC+BOxvZezN+qIlAc4aVCQeFm9E1gUzn0FojrKdfdVrDK9vQiu
         7PwX6VGCf9Eq7ZqIZeNzsWc3I+sSpJ3XvUUHzHNSqXQq+MxHXGIth965BD27xYi21ehB
         YEbQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794148447; x=1794753247; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bZ6795oK8wTcMWcOgiycQWPJ2nyh3zzKiM/vphOQm/M=;
        b=O5AAIw993NIFaEZNzEgY23W0RrnKOjW/Q0EC6VEqBRmvFb/O+hw21WkVJrqFHtZRxH
         s0ezrPEPIWUbhmZoqk4FmFTjde1iP/M+NuDkMS867FJPdUD2VqzCOwZQzsae/qF+HXvC
         LD0XJlDxVVMXkqYoFMxgmcBd2m/OamDkieQf1RyB9TloSag/3cpjx3bo/qUzt1z5Vnxz
         B/D/Vkpc3wSNfrrB9vQfzMcV+pKreRBzi5oWAmkydg50jJ15MOrEKi2gkH227KgFg7Wf
         OCKNA+r1LJW8J4RMnPNh1AL1rfVLGJsL8yz84sX574KnMPBWnmrMIE4QmfAT3VqZNcRu
         F0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794148447; x=1794753247;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZ6795oK8wTcMWcOgiycQWPJ2nyh3zzKiM/vphOQm/M=;
        b=TI35Z5WkWwoDQ2ZiD0gXP+jBfS8wErT25pF6HKFZURI4x/fjBhe0lx12JHds2+B6Xh
         ROIhyK0kyy3HDpM0Fu6EX4Phjc05KgcSdhzvvvsD9sWXzSuLc9ftkh46D42f8j1sjgwL
         ZPyhjvjFN+2PQpAaDluxGSzCE5Nov1baXss1PPpapi8Ak1ZaNmWiAZ+DL5qp3lYphA35
         Qg+W1QFbRzp9+jGFWgywa+w3hO6PJWomdoPZPgryqy7fSURo5W2au2bBAraDPp1PijFr
         elgKz2NHVX9pwzwTf865Fx2w1KgiO6tOb4tt3tdm0js4xoyo4aAfTuSkqJ/L1eOaAGag
         iy4A==
X-Gm-Message-State: APuU4Z9eRa1c3kFuPFQI+TpOYE9Oj1/TksBkEOG8ZoT4dVhs6ewOk7tC
	f4XcmMmJ7qPhn9Jv30jOGbtP7mqYQ8oUpYbicg2pe5k3pivgsMwKOQ3rVt5tdpuCw8GENpOXjAS
	VMbcvvninuhnIsrQoQ8ihcAazyMO5c6Y=
X-Gm-Gg: AYBFou0/FBKGT7Enu2MuWKjw12tJUHrQTG3YvhMMldDsNgLY/Nwrg4TReDgiTLJ0+oY
	wJre4DoZAQzE8wpx+h9Ncz/RGgOpl6WEZqJsGcr1gkL03KyTux8JJnoCt3smV5CpVrXy0TohLal
	NCciRrnj8ZEPGykOLabHJbYfSKBIlGuLuqXKEnk15NAaaxsgTf6AMiNfUsz8Hz2AIQWWKmweZPe
	YxdnnKGgii2pHF/rXf9J4KwbcihfUEmgHOttCCrvDGW1eAgAU0dnbhhm0ht0fJGru7hQga5SNiK
	qKJrceJFfJViyqPUr3f8aAkKk3qEdBLOUsM8IASUVic8Pq/Xgo6+vP+1EUAw02rP9vNUYBlxMPO
	jeAvRQ8XyVorVPUshO8ZAn6i0BNsJXgVzU+CCKzs=
X-Received: by 2002:a17:907:86a1:b0:c2e:902e:5208 with SMTP id
 a640c23a62f3a-c4d6dad8db6mr119774866b.5.1794148446720; Sun, 08 Nov 2026
 06:34:06 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261107-octeon-phy-series-v2-v1-0-d7ab0b4b3f17@gmail.com> <2026110822-unbeaten-unraveled-698e@gregkh>
In-Reply-To: <2026110822-unbeaten-unraveled-698e@gregkh>
From: Alejandro Lucero <aleszlucero@gmail.com>
Date: Sun, 8 Nov 2026 08:33:54 -0600
X-Gm-Features: AclHuK85Cj4IQbHtpoDWOX_0elZu-ELS6tCw4SzCaef8dKcau7FRuk8kknnHO1M
Message-ID: <CAHDi9tpvCP2qJfCfU2TFsY4JJVk2Yy-8_Z8uPigN5yWfpMs6bQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Subject: [PATCH v2 0/4] staging: octeon: Clean up PHY
 interfaces and fix race conditions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

You are completely right, my bad, srry T-T

The code changes are in a big part my own manual work, i've was there
for a while time reading the octeon code in staging, searching a lot
of errors whit the tools I mentioned in another commit but since I was
really nervous about introducing bugs or messing up the logic or
explain bad, I used an AI to double-check the code and write the
descriptions before and after the check (im not really good at
english, im learning it :'c).

I get the gym policy completely now. I will step back, rewrite all the
descriptions by myself if you agree, and re-submit the series later, i
really want to apport.

Thanks for the heads up!

Best regards,
Alejandro Lucero


El dom, 8 nov 2026 a la(s) 7:55=E2=80=AFa.m., Greg Kroah-Hartman
(gregkh@linuxfoundation.org) escribi=C3=B3:
>
> On Sat, Nov 07, 2026 at 08:07:54PM -0600, Oscar Alejandro S=C3=A1nchez Lu=
cero via B4 Relay wrote:
> > This series provides a comprehensive clean-up, documentation alignment,=
 and
> > critical bug fixes for the Cavium Octeon staging ethernet PHY interface=
s
> > (SGMII, MDIO, RGMII, and SPI).
> >
> > - v2: Consolidated the individual floating patches into a single
> >   well-ordered patch series as requested by the maintainer.
>
> Nope, you did not do that at all.
>
> > - Investigation: Patches were identified through manual code analysis o=
f the
> >   staging driver directory, inspecting resource lifetimes on initializa=
tion
> >   routines, checking error rollback pathways, and reviewing compliance =
with
> >   kernel-doc scripting definitions.
> > - Testing: All patches in this series were successfully verified and bu=
ilt
> >   via cross-compilation for the MIPS architecture using the mips64-linu=
x-gnu-
> >   toolchain with explicit W=3D1 compilation flags, ensuring zero compil=
ation
> >   warnings or errors. Style formatting was audited via scripts/checkpat=
ch.pl --strict.
>
> Sorry, I can't take any of these patches from you for these obvious
> reasons.  Please go read:
>         https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh
>
