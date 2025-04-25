Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAAA26AC3;
	Fri, 25 Apr 2025 04:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745554950; cv=none; b=q60rHbK8tsuKKnfQ8SJ4+6/pxTikAppKRzWFKDFXTA+X8Y+Mhvd/uQkM1mGmqB3qbUxbKLiiwt1I6T20Vf842pHqEgKo0RMpChrFZM6fFzMPMN7qU8McwBmk2inP2y4+k/y71kteEek6mtrKJDUg9UevgWVc/tzh1Zbxjdeae/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745554950; c=relaxed/simple;
	bh=wVmtfJ0+IHdRZdURO4e3LV7ZYiRRjbMZL+41Y+TJQSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=udFDduVDY3Jr1Czlk4DxLXKCEylYVYoCeGwNTXkL6d8wnui/nP0uCnHivfAm4RrHRkt5H5BnlZBjei3sb7nqaF9Zvrh8oPankAy5mk8fxb7YLCTbMerw/HBTq4gzSRZEGWO/WOgHbyDro3TZPLpwvV3+9f9JoCLkczxPxmTkTzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mfcI2nuL; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mfcI2nuL"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-acb5ec407b1so299009366b.1;
        Thu, 24 Apr 2025 21:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745554947; x=1746159747; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xkt3Fb0i8BWUPG3FcNT5RaUD+ZjJauG0htje5UaVJ0Y=;
        b=mfcI2nuLgmE3yBqxc4ldjiveVANZ4a02OXsPpTd5TJrBFQvfNr8yRebeY86AohBsbk
         U38QCAQom6S3tzzs0+rOb+m1X+u66B69CnlxSUTTm8Xy/zdsPk7OJxequaNVQd/PZ/Oz
         yb6QBgzeeMVRKYS4WzVuFaCTE9z1fFCP8a2LJBq5z0t8FcpGOECTz0oBIE9poGUzoR+4
         16741WMQAKL8inXWVMVfky7i0G0RN5lycgj8LmB+U1cricvEzE8UB0mu8JKltLX4Nst5
         h6plOEAs3V5sqUX51AGMza2uP0NSyE4K+6iN7EoT/92EY9hopQcKpaXobwrs1II15XOd
         NF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745554947; x=1746159747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xkt3Fb0i8BWUPG3FcNT5RaUD+ZjJauG0htje5UaVJ0Y=;
        b=KdBfOBpuq3SDj4lm2VYu8wBn097IypUYJ5iVhsPvM+n0vcmu7vzUiMOJPCfh+HSS1C
         CCEJ2TczHSlNqHSPDzV9OcBFm3I0ryJILSXqu5gi+MOInhEYfdvdJ0+gsE9SSJnmWfYI
         o1rq7dRy2Ym8VTh/cXk7nAT1FQ18ZX7Vjc9WuuQXv9Udd0MByqAS0kU+n7y755F9SALK
         QS8Gp5TOslHwRlUHEAcBkseirI9GWEY9/nBersxFBAsLUyUrIP9GzBLYtKXHlmLZ6Vm6
         /+hHbHgBpQeD6LG0s5rdHEDwdf5JfC/HX4CJepSR1Sp7cO4/CGl7Ka2xEqXVdgzcAAMr
         wuow==
X-Forwarded-Encrypted: i=1; AJvYcCVaOwezA66DidzA7WDOueUjv47UsiWli9O/tubZDcCMfrhbCFZLciurho+wrBEZiZcK6VxXni+2aNHFHCc2wA==@lists.linux.dev, AJvYcCXVMySA/4M/kqMJaaqESqUY5emaa6ocRX5YVsNF4Xh825GlHFkzrQT0SLi5z9LsZTfDPlKgcCvlYUaU0JElGZt05iBuMw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQVuGxDnuysukJFnwxcRkQ6Y6rEIdKGy3KFNSYeNWtdEZalCnm
	7p/PQDKIamqdLgMduQ/aey/gNGSMJsCWiV9LPne0+LNScuZ+wzrsZT9tI+1hlmNN83t5zLUPXeE
	tAKtpN15cNEjDVHbE4LgiPAZbeEI=
X-Gm-Gg: ASbGncs/GOOk2ZgFXdLBAARgPkGlkE9b4iBNTF2Qtpllb375At0dopLb0O6GF4I5lt9
	+Wk07bK89D6igHfjUBQVrRwWI43XwRmDd3Hy6pRcOiG5RUxvmab4fZmbizMOwJVGGrpo+dT83xm
	ZfE6QXBXjGq+sBliZv4M1vZQ==
X-Google-Smtp-Source: AGHT+IH+BM2yM/rGFp1Z11i1ILsWonHhYb005z8Jxr+yHkNXJFdekCIfbD17qMnLRljz8On+cUmW6DtvbwQ/DNGNpng=
X-Received: by 2002:a17:907:7d8a:b0:abf:7636:3cab with SMTP id
 a640c23a62f3a-ace71158aa5mr70087066b.29.1745554946609; Thu, 24 Apr 2025
 21:22:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250424223210.91317-1-gshahrouzi@gmail.com> <20250424223210.91317-2-gshahrouzi@gmail.com>
In-Reply-To: <20250424223210.91317-2-gshahrouzi@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 25 Apr 2025 07:21:50 +0300
X-Gm-Features: ATxdqUF1UCKerji0yG_QpF0px61-9OXRWb5-42XDjrlc9ydh7FDnSk3X5-2_n5I
Message-ID: <CAHp75VfbyGKximuP5QKuyB5UKOSPydf6Zh8+nXzk1hvZhDUbJw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] staging: iio: frequency: ad9832: Use SLEEP bit
 instead of RESET to disable output
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: andy@kernel.org, dlechner@baylibre.com, gregkh@linuxfoundation.org, 
	jic23@kernel.org, lars@metafoo.de, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	Michael.Hennerich@analog.com, nuno.sa@analog.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 1:34=E2=80=AFAM Gabriel Shahrouzi <gshahrouzi@gmail=
.com> wrote:
>
> According to the AD9832 datasheet (Table 10, D12 description), setting
> the RESET bit forces the phase accumulator to zero, which corresponds to
> a full-scale DC output, rather than disabling the output signal.
>
> The correct way to disable the output and enter a low-power state is to
> set the AD9832_SLEEP bit (Table 10, D13 description), which powers down
> the internal DAC current sources and disables internal clocks.

...

>                 if (val)
>                         st->ctrl_src &=3D ~(AD9832_RESET | AD9832_SLEEP |=
 AD9832_CLR);
>                 else
> -                       st->ctrl_src |=3D FIELD_PREP(AD9832_RESET, 1);
> +                       st->ctrl_src |=3D FIELD_PREP(AD9832_SLEEP, 1);

From the code perspective this allows combinations of the bits to be
set. So, what does the datasheet say about SLEEP+RESET, or RESET+CLR,
or other combinations of these 3 bits?

--=20
With Best Regards,
Andy Shevchenko
