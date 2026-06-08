Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1C73793BB
	for <linux-staging@lists.linux.dev>; Mon,  8 Jun 2026 06:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780898946; cv=pass; b=jwOcBs97EE6Vsbeyk4DeLQCEGu4VmsgsA+SaPb84Px/ZwT0rqfXFEPecRrzygZGUz9D0H0IvbQFgplCsHguf2shaq8DexMEOJZF0GPMbQ+vRqqvX1bTqBkqLVaJpF9OBDXw2OVhuPNn5G0jpeZog3dXqA/CBmtlIONYBgjnWTDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780898946; c=relaxed/simple;
	bh=8gi/wE5hjAq/hZ0xe+B37Cet1OR9dugn2vSBBancYOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iBCaOtnYs8fRxfJxEhwmDKgxV/xE/4cBg5MnrCWiU6TFw3zs5h8Rku59XjinVPku1XwhkrZ1Q22Abc/xXSvFshTkv8CjQgg7nCf5S7F80Up442QT+R6nWoWIQTzv5Mh/4KSGlMgbxpPrEJ8t4P95nMndeNhC0MGaltTw8bNr/7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cYYN9fsp; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYYN9fsp"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-beb2a97cc9aso619958966b.2
        for <linux-staging@lists.linux.dev>; Sun, 07 Jun 2026 23:09:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780898943; cv=none;
        d=google.com; s=arc-20240605;
        b=I+eOzYL6lUZs7h9bxavTiGkfRUIOn9BmhfDSVJw9cs8I4R3dmChp3bgKMx+hW6TlHR
         1aKMEhLZtY1bH7GxLMz22vgahFtp43DZ74pkMnvcwfCG1tDnD1Zk27YWZJk6PmM5rNBc
         eWpB4EPg0rC0yhHnVSNRt7ahUXDhVYb9lXRBKWWw1w1gNV0Sk+6/JxJ9s1MWh2zf92u9
         as95ggga4XipQUSdWfsC539FZdYvCn84lnpBLHCS0CJn5oiIAz2wrfqGO+mny8pdock8
         dKEEG5nGMFVtDl+NoYUlXyciV8n/MAKFrmfGsmgapVuIUaHfgVjQtYAT7HO5xeM5b+91
         2zsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8gi/wE5hjAq/hZ0xe+B37Cet1OR9dugn2vSBBancYOQ=;
        fh=5WqT0JjaA99ahjPalNewYfn7OvhvoBmAhB9W/FJQF38=;
        b=J/DduHOcFAsIe9gWiWsKr7no/j5zQ+3gCrD49byCYU42Sk425fsK+wd8VWBUyj+dMj
         T4I2/AxkiBgFvtGkoWn0avvbRezJK/wVjFzeVl+uQqhXWqVW5l99TCbd1qq+AC9Wcqog
         DE/75sHTyDF3j0W5iCQ0IXjwi4vYDZaDDwZiGVpNpHVjuixgpAJDi0FYnRiXdbgPo/aI
         Fc3uMTQQH/EWrQjIQLa70lVS7I/54lHEzBN+PTFShwkH88iQOMupd3PJcC4zVsWnAwP+
         DDSidnaq+JMuT5eOTcr6HcjfgHJ6LpvI6Na3iBeM714kPX9Ag4ZEoWlIoDHhf2H5lzWz
         S5qQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780898943; x=1781503743; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gi/wE5hjAq/hZ0xe+B37Cet1OR9dugn2vSBBancYOQ=;
        b=cYYN9fspTitJrgW7cqZXHiSzsjrl1SLceOpL0Z0xDamIZhvrhZBpMRFG6e6agaBPIS
         mTNgj6MN3ONPutOQgeJaY51JU4E3iWZi9J69YbzYS9Ls5nN5V0aRmVEvP57DJwmDIWrS
         YwsbVNRiMFqmdORPJ0unMhttO1oqR4SZAmFBkHixtHs+F9M08AV8NybQ2KgQEzLQi4aR
         abmDrzOTGAjTpHH53QO4tMlO+raqhlc6iMsXcQYqeir8ZKebPpUeKdQvf7rVBjwekWKl
         gbm+5Wm+7qRaYcuDaax+ybdb2K9f+k/HoWdANy2wdBCD9F8gWeosNp8HsLwGwFq+vbR3
         j2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780898943; x=1781503743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8gi/wE5hjAq/hZ0xe+B37Cet1OR9dugn2vSBBancYOQ=;
        b=TIF2qTp9mOiAsxfeiyYJUi/iyi4ESUca8pnToQtLF2hEwNlj1z/hvnWfaTH56jQdmy
         L+8uHnrnb/2Zeu6DQ6yeu5d36XW3s/nO6zKmCpRzqVTPemln/FAi40QQj8LMNBD73JLj
         hOF5zua1gYDZS0NoIWOKPWHjROTZVAK/JdojguYhgSFN+r3lZA+rED0XrdLa+iEEcpb5
         xuYCG0GB4EkOZbRQ9ekNQFcDktkiRzUnDLmkN3XY3rNFTEyj2cqDjzspgcq4RYeL3/LN
         1jju9BH+/dUSYCdMxo0U8WNTwbEMfplQ9hyA7sF1Sl4vs+qVz4u7FxnWAm5p1JdX9RJM
         uTCA==
X-Forwarded-Encrypted: i=1; AFNElJ9QkV+SBmYxyp/3E7MkgLHy7fzhqml+42ynij8R6kNvNNYww0G3XI0lPDW22seQI/OhafI6hfGi8NhHfXH3@lists.linux.dev
X-Gm-Message-State: AOJu0YwI0rjjlgWZOQw0fym0Ta2uh7A0UpArgfWdK8w/yB14XKhD113p
	dMCujiJTblX2w7xVVHxYT3kP/nkcgLZoj8YIXcgXbH8XzqzpERQkloU8sX1WEyshYTY1GyR64dn
	MuH66D9tQxv9sztsdaB5HR4KkA3hyfXP0E7IKv3g=
X-Gm-Gg: Acq92OF9YwHXNao2kfLLH3BccXpACIhydwt+qdBvtzIsTK4NkNSocIGl0P8SlXK62/P
	N/w7z8Uy0nl4GQJZj1CAk9QXXxOsfsrt1W0KO8vAQLRr8Y2tGynuzVfd/OgYTbLo3djnntVQCid
	/hACDj87R04YyXzvKgSImcYZpKZiH8lw2My1XMo9+N0s9sjwPcZMEk2S0sfF5fcBUvsqivjxWNk
	1luWNehFYvwLMtf+ZgQFVFKNEeaZlc7fodrvl2nIi5wTJP5vak9IXP9qOMrgP3h1VNZRPBJ0lEm
	9AmdhLZspWfS3mY8TiOURF+dNnjTl7vrqvLA5yPERtQrsu2vaE1zFhtwOgtPragWjd0GQ4Fm9kR
	VDJ26GOpMdSrKLABhOBnDzJwLwHxlEzQs6qlUb28fCTM9gM/Z7WZ5/QPacowvs8AjXBPlgodNGX
	uJ03A=
X-Received: by 2002:a17:907:6e93:b0:be8:93c2:cbae with SMTP id
 a640c23a62f3a-bf3709666a1mr614698166b.19.1780898942969; Sun, 07 Jun 2026
 23:09:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260607201708.88644-1-ilovelinuxgames@gmail.com> <20260607201708.88644-2-ilovelinuxgames@gmail.com>
In-Reply-To: <20260607201708.88644-2-ilovelinuxgames@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 8 Jun 2026 09:08:26 +0300
X-Gm-Features: AVVi8Cca4h6JLxFlP6kdGJ4g6L7zlZmMpERaiqBbVX1YCnn0IeyLuZTJiZG6xIU
Message-ID: <CAHp75VeNHCbiP5+YwLvWifzSF5FBD8aKBdz7rd4GAr=Y_i6fjA@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging: fbtft: fbtft-bus: remove prohibited space
 before close parenthesis
To: Georgii Druzhinin <ilovelinuxgames@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 7, 2026 at 11:17=E2=80=AFPM Georgii Druzhinin
<ilovelinuxgames@gmail.com> wrote:
>
> Fix checkpatch.pl error: "space prohibited before that close
> parenthesis ')'" by removing the empty argument and comma
> in define_fbtft_write_reg macro calls.

Please, learn C preprocessor and compile your stuff before submitting.
Also since you have a series of the patches it should have had a cover lett=
er.

--=20
With Best Regards,
Andy Shevchenko
