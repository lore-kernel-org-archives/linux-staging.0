Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5CB2EA48F
	for <linux-staging@lists.linux.dev>; Tue, 24 Jun 2025 18:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750788791; cv=none; b=Nmi3eJUBlHOljR/+FE2k2KwN48hUEk1xqfjSlv1761nGe+T+9Q1E7D3LwT3GUECLbu5n/APpJsObDfX9Pn0jWah3sMpYw9Vsr9mPCBPk3yFdwwglPWueogu1PvP9aqS/ZzU6XSGtQP5qy1nK4mS8o2tGakl/YcPLQ+24ANlGD/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750788791; c=relaxed/simple;
	bh=ZXA8DRWVPPHnm2xugJwcLuE0I9ArDZyOMS9O8RmbD0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RMcyW4ButrfrUUHY2si4m5BGiSwIx1nZX8UleAgtlhr/GIrynuJ97zYaT/egfctf0pKOPfqVWVSqEjPIeJtwlb9iJx4zxuAynasfvw+OhMnCuhWaZtDOuQTaSNx8hPqQRG9URnjjBQmYMCC9oQgNfQWIlTpLUzIR1wyYoNSYcOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NaBYEHlQ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NaBYEHlQ"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad8a8da2376so940695466b.3
        for <linux-staging@lists.linux.dev>; Tue, 24 Jun 2025 11:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750788788; x=1751393588; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXA8DRWVPPHnm2xugJwcLuE0I9ArDZyOMS9O8RmbD0c=;
        b=NaBYEHlQklQpSRKUcFD2alHv5V5AiftdWFNR4r0JIqV+zxTq3pr3d0XCLmtHu2tWTj
         I2FdCe+ZscBK2yJoQJBz1b6lJNG8bf5DcCbJy4Lx5NrFN2qErWqxoGW9TP4zpPa1yCOb
         q3nOXCI+zsiJpDhUGCXL/BDhNE0BUQxYEuFWgPJTUPVtaTdftIq8lU8GwQbhAZXCk/8G
         qUI33baLUU0trIsF3pKAV+IEjipW1WYuOWEg2vbDt+lO/7b7FEcaSldrrd9O6Eha1akg
         3CtKwPi4KtOaPIZ7P/azHgWabu3bSUSRCStmw8KUGwRjyszfYqLTg4yep49juUl2RKZc
         ljMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750788788; x=1751393588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZXA8DRWVPPHnm2xugJwcLuE0I9ArDZyOMS9O8RmbD0c=;
        b=xDlTw9NSl57PKeyzMTf6Zvr9C7m3lkl0uEh9s+k99+NyqzlK+GDJUF0Yk1Zmsdj9y+
         Z1wkURWAoe38zMz2ETDCN8u+CapRj7Z4d9UdE+wmzfv5cRFDjuRZkQL2U6JxjpCqaGPG
         fpjq8fxwAAWkxiniXwfByS5akvWU403Pd/YANxNJKS8ZAGetTPF0Yd3wqGSkiCUelzjN
         PLqPbWQTJ0XocbEJzzMk1YRoeaooDbtssj+csFyZH04ppG57OUuTKbGjWMp4Wa4Sqzip
         13aVEobzo9fC7hH0nt3VMgJKWdMBcNDCGyTYeeCRkS2lVYbqjmq/X5Yb8QWwL+mPO3Iz
         Z73A==
X-Forwarded-Encrypted: i=1; AJvYcCWeN1nzjwKHijUiqLrAXMQ4YiTqBqM19/MwOlKnTvOJ19ZZpRGt6B6udab0rZPOOW9Ls6A9mKt+fVSC0a3d@lists.linux.dev
X-Gm-Message-State: AOJu0Yz36nfmzlKwmgIhZ38RHweiLEfk9EL7wV4t7oDNJ202Yzebq/6H
	H+zbRmOXP46pmVm+ru95nGSGyoS8TPhE4h1Q8ldkX/C4V8O6b1W932GmtrQWu+rYbDg6wFbaQGU
	rnyh/KTPSX6hHmfwPAzZn0Tn+aSgdtXdLWWN05a0=
X-Gm-Gg: ASbGncv3XTEvmlgPU0idF5g7vygJ44oaByweh8F7Mlrg5W0Jq/BZtyiQSlr4Xj5S0t0
	3ut0az2tCOmWWw20jDI3wicp2t9Ax6Ajyqt+bOSQf2t4gyvdZpOmstImRzq2JvoCvVtH0lE+Ukq
	XjQd/gWUiPwkz/kryNy7sXMvWCi/PU4/fOZ8R+RlTZEFY=
X-Google-Smtp-Source: AGHT+IHAPhrE2siqZLDcYTmASprwv0ffOHbs35Be8BcBAzfVlcI6RKVtZ5YdVQMZrIAQEx/vZPcLhhOsSIhbiavvE0I=
X-Received: by 2002:a17:907:c810:b0:ad8:ae51:d16 with SMTP id
 a640c23a62f3a-ae0befc0232mr22330766b.55.1750788787409; Tue, 24 Jun 2025
 11:13:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHp75Ve_G=ziR7sJmKw4t3BRASogGQ1kWUsNNNWESFmmS4rVhw@mail.gmail.com>
 <20250624152000.489-1-zaq14760@gmail.com>
In-Reply-To: <20250624152000.489-1-zaq14760@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 24 Jun 2025 21:12:31 +0300
X-Gm-Features: Ac12FXxT6Ms8-cnSXjz5XCPtCtveFRdKHi5l-CJC9dofBzFjUDvnc4Qezvh7NrQ
Message-ID: <CAHp75VeijMvnbrCmRuqTeo_maxevCA9rB-r5URHaX+TrDNvyGA@mail.gmail.com>
Subject: Re: [PATCH v4] staging: media: atomisp: fix coding style in ia_css_output.host.c
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 6:20=E2=80=AFPM LiangCheng Wang <zaq14760@gmail.com=
> wrote:

> You're right =E2=80=94 the driver is quite large and contains many simila=
r issues.
> To keep the patches manageable and easier to review, I plan to split the =
cleanup into multiple smaller patches.
> I'll start by submitting a series of patches, each focusing on a specific=
 file or type of issue.

Please don't base on file, base only on type of issue. But cover
entire driver. And if you do some work with a script (shell,
coccinelle or similar), include the text in the comment or cover
letter so the maintainer may do the similar steps on their side and
check if the result is the same or so.

> Since I=E2=80=99m contributing in my free time outside of work, I may nee=
d to spread the cleanup over several days.
> I=E2=80=99ll do my best to keep the patches consistent and focused.

No problem, take your time and thanks for your help!

--=20
With Best Regards,
Andy Shevchenko
