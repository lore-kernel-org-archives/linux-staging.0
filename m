Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C56B30DD31
	for <linux-staging@lists.linux.dev>; Sun, 25 Jan 2026 23:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769383232; cv=pass; b=K7ZI9qpSk+Bm7pEccs2vO7te54Rq/Yp2DxwU/rpSM6waNKM4f5Xb1asgcYOeJ06ESMC8m2U0zFGjKTnicLttKKPP0ieK1VYnkPeEboSxpRoJqDoNPf6MlgSMUDxiPxkkSlNW8ApLogo62c/fTcjN7HJiNBSPAuLeX6msKZQXHk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769383232; c=relaxed/simple;
	bh=27v9uNphtb8p1p3TZtXo665JiiDhpYrWtBlrDQaCcJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DubpIMCe5TawUKpa/cp4DFX0rOx+0S2cxo45UNXmySErw+F3pwUNEVuwVWR0DS2CRyGp2G1o/JedYpxCq5eHP2N/ITlGHYPyO0wlFDolPpv1Uxiqmdwu68F73y43JNjrjNQAcWsZdf6Rke5OwpD4Q+34wQVOuuMTd/vM/zrK2to=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HM3W3QpU; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HM3W3QpU"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b883787268fso588643666b.3
        for <linux-staging@lists.linux.dev>; Sun, 25 Jan 2026 15:20:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769383229; cv=none;
        d=google.com; s=arc-20240605;
        b=QELq9m78bazR/0L2TDhm0QMIPCrGVJWr93Is5dGG31vXu0wK2JxG5LANGF4dt0FfcB
         3vXnhJl6yQNdsRfZ66CEzCzbUbRi22JcsT9DR761LdW0x9jKGuQvpzDJvjaCJTeQ+PpG
         9JAfgPzggRw3pBC0lxOlAa9zSiI6XG+IZrg9doJHCZjepJmWaTUCxuFn4Qx6o80xHRsO
         AzfqGIak45WXz4SVJgbHpSbXBdumWl4eWzbQqNX+GGY1vm7QQan74YyujxhrCWtg3ZbW
         XIGzo9eUA5KVUyC1Ck6B06xib2eeBhFjRbas0dg0b6XLVVxZ383/FvdHG6DBF9vZvIgT
         oRJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=27v9uNphtb8p1p3TZtXo665JiiDhpYrWtBlrDQaCcJc=;
        fh=ToCMRLOjwhbYQMnDxJWJHHzDWf/uhNm2IsmSO8DpUTA=;
        b=SH2TELYQE6YTNlUn4pHwBvQ0IlEPf1g7lom86u5BNUhV7SjhOgranDvgxkDSO138Gf
         TZLjMfgm2Wx9Yv51yQGBJxuMlxGycUjwtMJc1RjzGSImir/qwcALDxHab+Ut6j9kHY09
         bwIwCsyXWk1REAY9EGpopc3nGfQ/vTk/fX7PF/xXiyefFtd8QT4U4Ce4iuqKuk4YCe5w
         RdJ+471V1ph87bP3ThxLjkWgXe5SvH8MaNp6rk21+TW++qns09W0TPZwrpos9ZfcwNCZ
         1SywO6AOEC2+uY+L08bmNYrjEUYknXlrO4DKFUyjuGTjDezf3wTosaAJ+9uWiJgPeQyS
         6daQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769383229; x=1769988029; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27v9uNphtb8p1p3TZtXo665JiiDhpYrWtBlrDQaCcJc=;
        b=HM3W3QpUTS/GTMMR8d2mYEs3ZZivhFCP516VhkdUV8ufCrdO0sPnr6X5Afm7vluLq2
         ZNLiB3b6aH1i18S/YAIwXC6nsF46rDdXSzrSo+JszPojYdWOW6LxJg5YoKh+vATwiYZM
         YSi/7AlqNfqFpjkn9uymdQWdoDBBo4wI6xZtWeQL23ud6CTPpkt2Shzc4krLzZzJv15e
         ba71r6xgEOkSjc5RV0BGokL3cL3u+Z1t2uslXIAPuG4znn3fKJUprT0otGCf0pq+PjIX
         zOpOOjGIJdRXwjoquJHo09r0FaMEEpDtwfIEiOZ1sd0qrzESljdCqdnZq3zHYiaaDfC1
         z1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769383229; x=1769988029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=27v9uNphtb8p1p3TZtXo665JiiDhpYrWtBlrDQaCcJc=;
        b=hQNceEDoPctJrAdWsjm/PSpk19BcVloW4eiCvvlnDHAYy+FRFOcmlAZgG1pl9cVaM8
         /S+OP6YnTYP8SCshHkaNUZ+KtkR5UkesYFawiedyMtWJPPAYKhpnW+Sz8BSAeNPrBaBN
         0L6qBOWWNe+Lxr76ta6QcG+M4T0aF1VHyVIPF2dFRxaSw9Q/gfCCPJo4LcvvmUgPJTnG
         s5wb7qOBly7+cZ4ZIPmHSTcBGV9UpkWLtIH2vhPmKUOIYmAd+f9M5suk9xLvdeQL9z+H
         fA6oWMSnMEqKIGppkB0OGuSRs7B38tCY4RfqjEKwNe4vZHVuUMMfDkmXmOC1uD8paVpO
         wojA==
X-Forwarded-Encrypted: i=1; AJvYcCXi7bYxjTMI5n4x3YDF1LCSomzNpeMFyKBfI0MHMOdfcIBcpSKZO5hfhlqyizKPu6mMYq1WalkIRYe/hxvO@lists.linux.dev
X-Gm-Message-State: AOJu0YyVIDo9S/BM339DOV19wDsr5G0f7fjHCVn0X4dAZi+TatR2o0sU
	Yq6cErMy7s7rbspFcXs4+iQbFBVwwM/aKMHGHUOsy5TH9My7ZwW7x1z2Uk1e89nwHmNXsmR24di
	QIt5wKWJlOCV9+6DFDBP+bIIeW9127Ps=
X-Gm-Gg: AZuq6aJHa0Mvij5+1nDYi6zTBqlA2ybfcwOeL61vpOtHaHmebli2c4k/LZIuXpz9JRb
	H3lavNsTslEw8xnW6+9ZUAoYG0m8U6xLy6F2hl/E/a+htiGhHqyvDBlMBIdM/g0un0ZlthFeAp7
	bEN9m8spZtvkTCgZysnFEkcIa5Ue+qwMqg3OGslpS4oG0XdrBPycQqISDOSqXS2b8Wr5JRzUOu9
	F2jtag83SY9lgSDoWo9mWOt4oYtuiFm8i538t73K0PJtfmiC0i0kXEflh3+9yr/60woeG4=
X-Received: by 2002:a17:907:6d19:b0:b87:9e78:401a with SMTP id
 a640c23a62f3a-b8d2e8db9f6mr137200766b.65.1769383229079; Sun, 25 Jan 2026
 15:20:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260124104920.5721-1-tehsiu.huang@gmail.com> <20260124231557.18189-1-tehsiu.huang@gmail.com>
 <20260124231557.18189-2-tehsiu.huang@gmail.com> <e87acd109ea5eb4e3f8fc233788cd0dbd128407d.camel@perches.com>
In-Reply-To: <e87acd109ea5eb4e3f8fc233788cd0dbd128407d.camel@perches.com>
From: Te-Hsiu Huang <tehsiu.huang@gmail.com>
Date: Sun, 25 Jan 2026 15:20:15 -0800
X-Gm-Features: AZwV_QhVQRx0sG4Zvk2Y9Kox-eoUnGIy_-QGWYJwlGsBRmRULkBnhLHgVDVxG7A
Message-ID: <CAMbZB6NtykT1WxJVLwoCZYt3rfvFz9Gjv-VGHog=azwjEe5mAA@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] staging: rtl8723bs: use continue statements to
 reduce indentation
To: Joe Perches <joe@perches.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 25, 2026 at 10:13=E2=80=AFAM Joe Perches <joe@perches.com> wrot=
e:

> Several additional things to consider for readability
>
> o Rename ICS to something more meaningful
> o Separate the ICS[x][0] uses to another named array [8]
> o Adding #defines for the array bounds 8 and 15 (or 14)
> o Change the loop bounds from 1 to 0 and 15 to 14
> o Converting this/these arrays to bool
> o Use boolean logic

Hi Joe,

Thanks for your valuable suggestions!!!

These points=E2=80=94especially renaming ICS, using #defines for array boun=
ds,
and converting to boolean logic=E2=80=94would definitely improve the long-t=
erm
maintainability of this driver.

However, to keep this series focused on fixing the immediate
checkpatch warnings and reducing indentation as suggested by Dan,
would it be acceptable to handle these larger refactoring tasks in a
separate follow-up patch series?

I'd like to ensure the current cleanup (v5) is stable and correct
before introducing more significant structural changes to the logic.
Really appreciate your time!

Best regards,
Michael
