Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D9913AA2D
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 07:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781507441; cv=pass; b=ZLkmkKJ2OxIttwYdMv8Th86jN8auK5SUHYXPtdDQaxrqCJnwlVaOqIw/X4axxFd/2uquP/Nmgfn91W1Wwf9d/KsgR0LT4jhfENyWQvQADnIQtoNOsAPY0QZkwmDQk9mQwB0bsUiQKT+xDRNI2UCZoo32Mxl9KHNcj1XuGmFDCcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781507441; c=relaxed/simple;
	bh=Ox3fjy9suyScmRrcmhaltE9MsZADpI1WVron/xvMJL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YEgJ2gOk9983CSBCuPvmpRei9InTmpEEIoOlexUyKbGSQfl7dp1itYhtWYMYaHus2QarQkwr3BhD2blU2R4ttt/kClc1dNl9TPzdYBZhzwqdtBBwsn4JrR5LFlGjlZZaTnL6tqOqzwUknw61II3rFceCueCLjGpESAE3U6DdEQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pxykJhAX; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pxykJhAX"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bec449cf976so371387466b.2
        for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 00:10:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781507438; cv=none;
        d=google.com; s=arc-20240605;
        b=Z2bqPyLqx21scWIuG3YN7zuWcnP8KfPdK7GkdslUkhs5gLwgn9oAJBbpu2EIHWs86S
         HU5MwPdP0Odu/w4A0vfXEksnRj+AFc2yitx43BFIzAnZnwwuOqtC/JBIPXmW45FsBZW9
         FZq+/PTt7FV2i3tzw5AaABt2AAIpECT3J/pHPQGO68JarPSoYLl1Ghf4f+I6rs/kvrEa
         OeLgj8SecRTTLf3B4HV//mvpA0YojnlYlzojC1yY2vnHmPgWB619FYX8tXle+YV5Bx26
         5Ja+d3VNRHhBZDxXsSte59EJxkbNRg6Sujw9Vy4n5knuCXI/SswQx+s+GHMrsQLIAiER
         Ik4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ox3fjy9suyScmRrcmhaltE9MsZADpI1WVron/xvMJL0=;
        fh=CX0fGzZ4SNzzfZJTBIEWUhFTUozvfr9GG1VUubkQfi4=;
        b=GmvrENiqjdPadAjqFOjvENtHhwaM4v7tRmqePGBaX/ZAIYPDJuBAesciGbkIenprTY
         GDM5qPV2sXE1PvYN9xmXvokcddPtsZTIH66CA1eUoiEGnZE6ERWfXyiVsqn6VEcl6OvT
         ol1Lmox+ZXzEbgTEj2q0/0zFsV8Ew7GBrXOrCJ5Ovlc20n35RvWqjXJm7VNO0Uvm5PNr
         aLS0oqp5wmEGnZRB2aHXUmiU1OAicWinFe9hbPpqOQ/9MIH/v+7PFmeIwV3nvmd72dok
         vE74eu9p/Ha14C3s2k1yQZMlfT9+yA1ROSMfkjXXkz6QsrRXqDwUn9f5xn6HxbO3GqTn
         kSeg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781507438; x=1782112238; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ox3fjy9suyScmRrcmhaltE9MsZADpI1WVron/xvMJL0=;
        b=pxykJhAXtmpaqIIyFCFh4QV38NNTCWKO/q+JddeAHLRGSVmETOzf9PdnB+SV3laR+G
         KMNEVtbXFGdd50JVw4WSW/jMXA4DOg5NNqjCGmLRsscWpcZitknOpzeO9dwXc/CcW6eG
         EzBgjLTehee4wBbMBcw8hdAjSskxqwP0dJjnIiwatERJ3lZW8+tv2w6RP0IREzMTmDrE
         QI0LbBQHJ5OxTnHTaC/AQ1l1E3SN7HTmu8ZDkeSeHvRQmJBn5y9VG+Gy4v71nzDH0Yr5
         A65cyVxSawdSUNGPI2LWC0JSBz4Px/9y9/Z4IEweAzSQH8um0Kl2YzpCCUmg6asjzK9n
         VraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507438; x=1782112238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ox3fjy9suyScmRrcmhaltE9MsZADpI1WVron/xvMJL0=;
        b=ZYsgEnjEE2azZvbVgXysabda2K4zvZmDHNfxVE5xUIKVMEkq9Zeno6haNvrfppV3Hj
         onL5fdbBW1NsOGG54Oz+F39cm16hkPS2c9MfQ0awqwZbNqvfHXXaHpn5TTe42qlMrzHs
         qdflUWUdmfI4kRoN5ei4Qf9g36bjkelhif2+MsGLVl5Q31JCY7nR+naByqudVTZ4XKoF
         s+r09crc4qpTBuMhfI7dHRjQNZqsAUS9v+jMJke46XU5sNgtyEwHByn02rzmhhIbhRLt
         raHNEFHYIjBC8utMEEjLISixDTSJSMS+Qz1z0QKXPBXeQVqb5QTx/GS84zKSn7yj6LJN
         6X2w==
X-Forwarded-Encrypted: i=1; AFNElJ8qMH974xnRWFX/r5Ftt1RlVEMwl3bf7kNwB1sz6zTXsPkYkYeioJpeeM3W6g/v97lLcnepU9LTaIC/yJ/g@lists.linux.dev
X-Gm-Message-State: AOJu0YxynX+u4lAxwUVS29uoHaLzH+g+Gwyk3wH7Ra36j0wOcqJDgAYS
	2lbQ3YGhtgirLQalmgX3PEubAU6h8hjcW9w77m6l4lun+b/J+JJaGQYqV7fVF4LYV/4OS75rmEu
	EIw/4d5w8DG2Y2mpLajQhAIHpTxf9DNs=
X-Gm-Gg: Acq92OHfqiCJTKsqbL5paRNm64rmbptEpyASlsI8JYMDE++PdxaEruGZBY5eMXglbFt
	kXtWj6ODYy+vEjuNJQnfB4deVZ8azUPRIr2tA+ywdRqnYYi5QRinUhCEgpAPiWQrw31ZeXT60Os
	lnE1QFhMLk55smRaZ7JQypenger51kYkrmsg4ibub2VLqyKCpVkKyfK8AbTB2UkJi4Y3JFxpiHf
	a4YUXpF4zGnFQ8OIpxnGD98CV/dRGif9Sbnev/UIjGtfwIee5NmbEo2ggnb5siF6Puje9peMu9b
	oOy8Ek8RfvqS+ZBB00xionLXVrIm3/L0MPqKMoqgvF/WEetxCy2gXwVUzPP+z2xxLuixha5tcL7
	pVLr7wrGvjr9Qj2Vbk2Hj0OoZddkw7X2ZR4fqQfupED7AWyg8UcTLs+oG6n463rbz0hq1
X-Received: by 2002:a17:906:cc4e:b0:bd4:6da5:d5b2 with SMTP id
 a640c23a62f3a-bfe278302c0mr422985266b.1.1781507437663; Mon, 15 Jun 2026
 00:10:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260614200837.17908-1-reeveskeefe@gmail.com>
In-Reply-To: <20260614200837.17908-1-reeveskeefe@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 15 Jun 2026 10:10:00 +0300
X-Gm-Features: AVVi8Ccqd-I4uOPWzClztukgUI3AAdEG0bLZD1O4-8fQaU-229tIeoSg2FTznI8
Message-ID: <CAHp75VfSUfjo6rxUdwMghZb7V9s2_AgYCDex5uDX3cCWZOenyg@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: use %pe for backlight errors
To: Keefe Reeves <reeveskeefe@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, abdun.nihaal@gmail.com, 
	error27@gmail.com, chintanlike@gmail.com, namcao@linutronix.de, 
	niejianglei2021@163.com, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, 
	Keefe Reeves <229415268+reeveskeefe@users.noreply.github.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 14, 2026 at 11:08=E2=80=AFPM Keefe Reeves <reeveskeefe@gmail.co=
m> wrote:
>
> From: Keefe Reeves <229415268+reeveskeefe@users.noreply.github.com>
>
> Coccinelle found two places where backlight registration errors are
> printed by passing PTR_ERR() to dev_err().
>
> Use %pe instead so the error pointer can be printed directly. This keeps
> the behavior the same and just makes the error printing cleaner.
>
> Signed-off-by: Keefe Reeves <229415268+reeveskeefe@users.noreply.github.c=
om>

I see a subtle problem with this email address. In case something
happened with your contribution (exempli gratia a regression found)
there will be no possibility to contact you without digging into
mailing list archives to get your Gmail address. I would prefer to see
the From: and SoB to acce-pt responses.

For the change itself, I have no objections. If one considers this
useful (probably to stop flood of the similar patches in the future)
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
