Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B2F28E603;
	Thu, 24 Apr 2025 22:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745534308; cv=none; b=oEu9mPFl7y8INKep1qEs2rcRbOaHCEmRnbVdfGzE77Z13ZfXx+54AGsUNqcsDmc271z8gtdiKe8ezdv5uADeHqcs/UmoMNB5fDFMYcYjD0WVzvupCwV0YQAgp4WlSyT7/7zifaNgAs9azJzqMEFpYAKdnYp4SDMZ8nx4MedDzQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745534308; c=relaxed/simple;
	bh=JKypq8qih4lXaXfNq9Dl3IZCz0FczV4G/Wz0gPP66gc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zx7+LJIh2DY5aK0WM/77Zz4eReAfMbp2LN2Y0uipS3EiNnlilGyK89qVzNxKrnXCmnoVlEPaSpSy1voBqFDAAhd29Bej84dYH24LbslDmBjMChSIM1lDad9Aot+F/eZ7WHTyfU6fMQnT8cEeAUiIyLt4s1YueW20TJtgJymzYK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X1aT8dGu; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X1aT8dGu"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-47698757053so21294391cf.0;
        Thu, 24 Apr 2025 15:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745534305; x=1746139105; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8qup4R95rJYDYPy2qb6xG8UgpgTWCy0PZH7PtmrTKc=;
        b=X1aT8dGu71UWWzsQDNr0LHUKAhlyt0Ygy5bJinzOnN3sHBHB84zZN00B4ggR0yCNO+
         UZX2iAmf7srRTTF4EtoHyb0XoJY+SgGnEXpu0LJTjd5rhhGUWS+7nWIfYIuPm9NVQ6II
         PELYmKhvZVPwQuegd64qZKWNqsN3aHaR18fQgJPwcy5xWx1ay63SixlFN9gJKpy02WR9
         JLKaeMYmlpwqZcf+rvaqbf7ubb/xTWd59oyGFvVczNG3fvrgO8RkWjbhjw4CnXTcght9
         G2q//TRmAIQTVPyBJJ6XliwlTS+m2lT3MuGMIxrpsY+CNiwhRGbAOkD7ykOumdttukCA
         Va9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745534305; x=1746139105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c8qup4R95rJYDYPy2qb6xG8UgpgTWCy0PZH7PtmrTKc=;
        b=KxPtME1D4dyyEIeCrRpSF82w3XHpWNZHaU5olwvORzV3rCFPgQYpxzw8kFFOQ6lKIc
         HaAPdwceLEdXOiXi2uPOg9mym2shHajHrFMr8ndYuIwqMYMGBIqsxsvTYzp8t/cDBW07
         339IsH8c+x/i0Gx3/Zww3QVVNxoaw7wsGojDfWwsS5jPYP3hC2P6buzQ7tFLIXip61Bz
         Zo6fFsqr6+gk5hymbkBU51KVJKGdQhZW2RFEh1NFp3iCKLud58SxXM8Xi2gjqAPbXGtO
         EMdJmvb3WncaCOcCkNlRmLgj1LPDd+JnS5+ZlfRa9qmX+DaCRc3WT3MMvNm9srw/Xfg7
         cmLg==
X-Forwarded-Encrypted: i=1; AJvYcCW6cbJjRqBBM45Q4hVIKGVZrMYuDmx9Sc/z/eqy+nc69ExLefFdWcd6K4SH6rmGxzM0sr+nUNJz9gc8wePFycpirJDF2Q==@lists.linux.dev, AJvYcCWkT1xz8x0xztPxStH+IfmNEiBXbYPiyKLwkTrI8wtWido7HzeO9V5ASuaW+iHSm1VDM0mdNWPQYkglXzzffg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzdp2gcFmu3Sh+kYjmgIhSHRvFBNVIMhbFxmgjfyIAo2HFPZZO+
	1lHU9yWAe5OpxjEbOzSrPS9y7y8iqHIUE+4+ojtSxOqplYXTtwIoqog7/UYYIVw5eT28rlc6QMm
	k29uXL3bA7twJQDlEtBlMHS0Nuzg=
X-Gm-Gg: ASbGnctCV3onjWWb1o3giGv/bIImZcsp21fYqGKkjdvuBpcyrSPpk8uIchSsRfLjSyH
	DohGLSW7tAo1u09M9806HO89IGmS6mGdD4xQoea3cldmU1thQLV/EJsLa4IuzpyNiKvh3XNv3Un
	H0NIDjglFQH8DMQDKyww0wk9/AmI93cz2HmkN4/J4uzxyVfJLp4qwkupRBHqS76cDU
X-Google-Smtp-Source: AGHT+IH0O6zZS3/GaX00Y2cZO2iVsV9rjsJgGIyhjsh4xJbnONWObZHNuJrLfqpqvzsHBgniry1lw5UVA+owfnhBtVM=
X-Received: by 2002:a05:622a:30d:b0:47b:610:c952 with SMTP id
 d75a77b69052e-4801ca7ce44mr2683911cf.15.1745534305484; Thu, 24 Apr 2025
 15:38:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250424223210.91317-1-gshahrouzi@gmail.com>
In-Reply-To: <20250424223210.91317-1-gshahrouzi@gmail.com>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Thu, 24 Apr 2025 18:38:13 -0400
X-Gm-Features: ATxdqUEFXdTfMjffJUTT1ZQkR5p9qZEXR8wMZCtajA4p5kgSKjMtevSFbH0UcaQ
Message-ID: <CAKUZ0zKw2Qq_Ct-BFk9ri-LnM1opG77N6-pzmm88_qCscD7PZw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] staging: iio: frequency: ad9832: Fix and
To: andy@kernel.org, dlechner@baylibre.com, gregkh@linuxfoundation.org, 
	jic23@kernel.org, lars@metafoo.de, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	Michael.Hennerich@analog.com, nuno.sa@analog.com
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 6:34=E2=80=AFPM Gabriel Shahrouzi <gshahrouzi@gmail=
.com> wrote:
>
> Patch 1 includes the initial fix.
>
> Patch 2 refactors the code to use the out_altvoltage_powerdown ABI via
> an extended attribute.
>
> Gabriel Shahrouzi (2):
>   iio: frequency: Use SLEEP bit instead of RESET to disable output
>   staging: iio: ad9832: Refactor powerdown control
>
>  drivers/staging/iio/frequency/ad9832.c | 69 +++++++++++++++++++-------
>  1 file changed, 51 insertions(+), 18 deletions(-)
>
> --
> 2.43.0
>
Whoops. Didn't realize reformatting the title on the cover letter so
it fits within the width requirement would cause part of title to be
omitted. Title should be: Subject: [PATCH v4 0/2] staging: iio:
frequency: ad9832: Fix and refactor output disable logic.
