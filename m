Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF78174EF4
	for <linux-staging@lists.linux.dev>; Thu, 30 May 2024 13:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717075124; cv=none; b=hY0x7Zo/Gztx2PmJ6Xgt839bF3WNgV5F7UY+EV2gk7dKQaiNo8OgnOTKgECOSn7dPFaEsqUcT4JeF63AseXQJ2gN6yf5cvV9eqfCTfnvOgXWV9UlpHFzEK1pLSecvDLTsz0dMCsa70LVnfsw4lRpN/1tHSfBS6zMkfM8IjJzqJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717075124; c=relaxed/simple;
	bh=SeKOEGo4lawtukCUDlc7sC7VHPowPZ/lJM/DsPPUPbs=;
	h=Content-Type:Mime-Version:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=OPmnZwU8olYwMU+IQ2M2ejdoiWMTs2evtQPJX5O75yb080LKCOhTcFDj8Sqf/JIY21HiiPyUufyTsyaeivini7v+/SI05uMr9Kj7Lj71zowvc7ID3rDpBeDHGhz9DYkWxtIAenJ9H4aIFrUYrwi8zDCZYss9YsxoS+WGp46z3pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PGmGXs4Y; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGmGXs4Y"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52b1ba74d39so1108899e87.1
        for <linux-staging@lists.linux.dev>; Thu, 30 May 2024 06:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717075119; x=1717679919; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bwd1PBPyv+646I6bFN2hDGg/9uDOlVE5us6n2AOL7sE=;
        b=PGmGXs4Y9c8bndXsCIomjfe1Qnx/FH7rXWRI8ihvJ2CxTO8/0RnNDPWPzpSZmVanep
         cmscrCtUxxCDydypn+4dWdc5pYQQWrn0Hyeej8tn3hunEBv2jKMnJWbzQStr2MQ2z26y
         qHDezLmt8t8yG9uIJ6RFivc7+uZGB2P93YNI2LUB2DN7kHRfAv7hdLTyggRRGiTfmKoe
         /jyZc9ugByihsHDx+j+6Ygpb/Ie9gysgPUsiz2N8twnn86gaZvDHnQW+H6EVIWKxOltA
         d0AbI4eyhMwyt532+O+l5Kb0xE5VQ65blCo9iRildsoAiQf+1mLRayxW0WbUR+6WQ7c/
         tV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717075119; x=1717679919;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bwd1PBPyv+646I6bFN2hDGg/9uDOlVE5us6n2AOL7sE=;
        b=EiCbVBFfEIZvs2S5jKhXqYTRhfvP8sAUxeRq1HeOnMmyuCnd6gNDgZ2vnyRZQ0ISz6
         7TQdCKwBtHF4vUwcq/7vEUCYPoQE7ZLeVLfwQQ+XtofUj8I20uG0xWoa6jpTA9y8ZF2I
         Lb0ic8SWiqGTeKAEbK947oDDdh/0Yev+5IALr6aWmVM+Dtz0ep3zR9yp/yi50Z8of/co
         YAUCFi7lpr1/S55crCSCPShgIot4rE2ilx711Hhxw/AT9EcYELD7LKQvnBz5K2dhk/kZ
         CXl5tZLzP3WiKkW4cIu1DWFRhoZKuBydCkDDGCWZakxsAw0ujkIXlQ9k63Rqn99DUy3j
         DL5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXha6HFU7OcEkGeIecHdo2+XkY5G5n3kvwx0oa4dUcdKMs495IjlGHdrOHg+WirzgwWRem6Us3ocpdQW0Yj05Uwe9Y2btlyNS/hspriBQ==
X-Gm-Message-State: AOJu0YydaFzEa1w2QzsZeEM6WWEiJ+Mpbj6EFIQPMb+V7e8cCGjAIqx1
	f+uz6fsEug2VCTlq5sHiHTcRQUn7uPBSQgNjoR8hyKBkD010WOfF
X-Google-Smtp-Source: AGHT+IHNhojVA3r4sQYkAlP5C59gijZyaJ5Vc6N1TvijjL72aciJe8w02UxDzIkhsDvvCRCr+Y3CAg==
X-Received: by 2002:a19:ac4a:0:b0:52b:4c20:5cee with SMTP id 2adb3069b0e04-52b7d42655cmr1270814e87.22.1717075119071;
        Thu, 30 May 2024 06:18:39 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b7d42911fsm222977e87.281.2024.05.30.06.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 06:18:38 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=bcb7fe86b3b9e469b48e922bcd55856b7b09e063ce70f9d068a77cd6a2a0;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Date: Thu, 30 May 2024 15:18:37 +0200
Message-Id: <D1N0BV7W6LDW.19UTZTRSJJD8S@gmail.com>
Cc: <linux-tegra@vger.kernel.org>, <gregkh@linuxfoundation.org>
Subject: Re: [PATCH V2] staging: nvec: make i2c controller register writes
 robust
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Marc Dietrich" <marvin24@gmx.de>, <linux-staging@lists.linux.dev>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240526193932.57277-1-marvin24@gmx.de>
In-Reply-To: <20240526193932.57277-1-marvin24@gmx.de>

--bcb7fe86b3b9e469b48e922bcd55856b7b09e063ce70f9d068a77cd6a2a0
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sun May 26, 2024 at 9:39 PM CEST, Marc Dietrich wrote:
> The i2c controller needs to read back the data written to its registers.
> This way we can avoid the long delay in the interrupt handler.
>
> Signed-off-by: Marc Dietrich <marvin24@gmx.de>
> ---
> V2: rename i2c_writel to tegra_i2c_writel
>  drivers/staging/nvec/nvec.c | 41 ++++++++++++++++++++++---------------
>  1 file changed, 24 insertions(+), 17 deletions(-)

Hi Marc,

I've been trying to find out why we need to do these register read backs
and so far I haven't found anything tangible. The only thing I was able
to find that sounds like it could be remotely related to this is a
mention of the interface clock being fixed at 72 MHz. So I'm wondering
if you could perhaps verify in your setup what the I2C module clock is
for the NVEC controller (any dump of the clk_summary debugfs file after
boot would do).

Since I'm not sure we'll get to the bottom of this, this looks clean and
is certainly an improvement over the udelay(100), so:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--bcb7fe86b3b9e469b48e922bcd55856b7b09e063ce70f9d068a77cd6a2a0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZYfK4ACgkQ3SOs138+
s6H7WhAAiSVAvfdQncK4PX/fpaBQU4TG0iL3ie0dSRJzUFJVyG4sqqP9JsiTBH5O
EXPkht+5ol9LDgnB7oHh2k9jkTBZUNx5ZbQW93XdpbFNiPIuiGmf9IDbfa0fac00
Qx7Vk1yN/ET3ajqfYOjiyKaOLGZ2ohXnEMPo+xpT69m0f6kNA689cKSGLJBExznY
msnvZysWOLi4KrQ5X99P4pHccR8uqSo3qT5VyT62jCztFDEZ2UWgekbdlIWD2VHE
odtqSXc3bX+JwVRRcZPNqX7SAyRs0w7hJKZ5iwuGPJJQcgJM4eYs8X81Ye/XFTrj
bvownMnPCA3l+vNonqAio/IrHXdLY7SBZBSCfvH1jRLhO4neXfc/C3jyvVXgfzpq
T8eE5rZLLPeWRsWQZp2QhjDJV4vadGMh/NO/kv9afdxZ4TgyhqsLYqPRIQM0c+WJ
oj2z9tIu5o4ZEA6nYbqKZo8RuqcvkTazmufPsL5T0zkn7fXcwQzTF6j2AeTFZgtX
UEmKiBHysZFC1/LzRXbhSxYp2HzKECXc1C0JqteNcnnLGDywW2zbdw9zCxchDOVo
mhND9qgQu6DigzUdxj8/Ht/ZUcmQokqFPKSTbPWrvEXVqtpFgvoMWakXqvnonfV2
UCRsENKvCuWSM6QR9Fo3KtKK/hIqSZPl5xeSZbXvv2YPjT8z7Hw=
=rKEX
-----END PGP SIGNATURE-----

--bcb7fe86b3b9e469b48e922bcd55856b7b09e063ce70f9d068a77cd6a2a0--
