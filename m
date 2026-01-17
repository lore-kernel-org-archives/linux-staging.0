Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE633B67E
	for <linux-staging@lists.linux.dev>; Sat, 17 Jan 2026 15:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768663786; cv=pass; b=U7wEoBiSLQnkxnDkTFHgzPVqFOwEUlg948KftBCFK/ct85dNHuzWmOSBcoMWrjJ6+qUxHkkOf4eJOLLkl5hFUw4xXfAWipG9Whq10j0N6ySydWAjSTLlmZgbgzfh25NlF+tb5e+dfSkIOBGBFowH4MtZhBbfopN8G3aBRDEl7XI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768663786; c=relaxed/simple;
	bh=2Y4nGCoRXOk/Gpizu9rh8AcXh48BErAAA54GCs0GmOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LpH6ioUDfJvQ3YwFWmDOjG0jsxYEvSBRQyB3BCronLnioSveB4w6uXBPtNw8EDSafZaJX/0x1zYZXyaa6MAFC2aQPX1S00eKVA5MVze6XCNsrYFV0ewJhFeJgkqcEBoKu5dheaEU26ic+/uj1XNaneOdLSdr/KjBp3Sl/3c/DC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YA5kiPhd; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YA5kiPhd"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b876c0d5318so419732766b.0
        for <linux-staging@lists.linux.dev>; Sat, 17 Jan 2026 07:29:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768663783; cv=none;
        d=google.com; s=arc-20240605;
        b=gmbGm9vs20sSuUsmgl87ceDoPL4eq0tsv4pTYqHnxdmQ2fqKkfQfa9iQ3UkizVbwXo
         HV+rqunlZ7fv1bgn9cIsYPk1rvEtPAvgyuMFwjdHAHBDbMKjEbEP/MmeVLgLldN153Hv
         eV05hYEJTfUkRMcpGgne8s24ckL7Q/DR6D9fUR6WFDDLE+DJXp3msCPTPRbFd8MdxSED
         tITw5yuHdd6kXVIr1o7dhPB5v1EleVr2OIuWp+rCaG04b9KswiBO4FVMiS98358Wktzc
         JYBeBhuMI8WHiH7UceBqE4y3IbCa5OKffSjFIWwqgIIMNxwPSXzfxymyhoDrS5OaU93O
         DeqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2Y4nGCoRXOk/Gpizu9rh8AcXh48BErAAA54GCs0GmOE=;
        fh=2CVTIkVPhg0KPB0MXJsQlUHJYqJp0iJnPh+zOrgPQrI=;
        b=jROxsMNRzL0RvQVHHZUDG7sIogg31yfH3XubHBaEICRj77cTOU6HtbbNHqVwaUq3Xr
         A0G1Jm0aHO0TfQXvfJaXugNJ4yuDNc9+NOPuef9tW8hG2B9ypup2Z5zsN+d2U9HacTmq
         /+TIXy5M0JITv0X/z5YCrLWOAv1qjqq2ZGiwfprX8NjmIV67cPs0jDpK12HKZfl6FeqM
         dzqKhi6kG25yXrQpK3eYMZMmEeeP9swKGcvTXQ0sztSvo3ejzhu0mQctQMDpoyrn63TQ
         bnioSLg/cRcQys8UyrxPVH2GZhPjEheaOieIbe/iQrosVkTFch20K++1FMNMc4yP2v6O
         200Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768663783; x=1769268583; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2Y4nGCoRXOk/Gpizu9rh8AcXh48BErAAA54GCs0GmOE=;
        b=YA5kiPhdxdULpGrNl8pktqajWpQictowUL7m6JT/dBZ6SsQK9PbwqjFUbi3UabDizj
         A0eOrjBlI8t6fvJXw3gc46ASNbZl5YXclB/7PphGI2OLMl3LfxeWvZOsP05zqPd7n+Fo
         /bE6woHWNo78GeE+eUJXH4Hu9YcsZ4oa0A/esOCVJ96CLKry/ZXM+RR14Z7GUz91dsf3
         xSQb249T2hgRQXqsO60Vb6uXI3Y0LiF41xir7vuaa1xOAx8be+xEclHF8tZltdw3vc8v
         Tjj/RiVIwrqEI8sPNrK5sWoTfjhLuaOjQ6G3DoMVKOEYsAyzfeTgOYelZBK3rAxdZAKX
         L+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768663783; x=1769268583;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Y4nGCoRXOk/Gpizu9rh8AcXh48BErAAA54GCs0GmOE=;
        b=KW0mRGZRol/k10zVc5uIE72wSY67gY9z0f8m8w7gAGzcYCtedpnZ7bNAsfjnIgLJcp
         IWsFF+DyEhnW96ndB+xrJnVRtjHWEvkLSJBWOTKVkGFR6FjxGgJDkLCpC77N7Y4k/tnJ
         GAF/OihCccZuk8ZONm7qdWoy6SafY7fHFfae3QXg3Ethkihh+49nPdFnoF2txjWfNKq7
         +sevOeVufTDWNeBUkdTQv+Di6emEWc3JgVP+bOcr8oi4TyUi4a06mGmL8JkaGXJO244a
         MatC6JmHKp6Cfps1T+UktdvL6LXtV37+P9N5LAsqGIrCFHWyC09XiIwXUfljobFk6Omi
         T6qg==
X-Gm-Message-State: AOJu0YwcnLRxuvN9sW6uN8JSaDkSpfHkLlRO7+sgRLp3sOZDj9GfDI5m
	GgA+zEuY1hggswFZpuF1PBG+cYV79ZlUdHsvJC8uPr4/rC6tCfPuOvAUpScqHfg0HFWCeXxsmHI
	MkPtpujyFr0HXfZO8auaCPPGFEuMJfhfcCxVy1go=
X-Gm-Gg: AY/fxX51iXvMsaQ7z0XYtbTEkgIPIUz1zb+/YRmKhbCd4FXHvnLOK+71AC7e4HN+MZa
	Lr9cILxtEnV2u/rIasp8zSXTEK5xAKG0dBiKgyeh3GHggmUy6cm+93OJoPZARybGWU65SO/h7K+
	9JVDDn1Nh+LL5G8J/E2AkNTG6vGhAnNVNTcgUGn0cM0WxRFMDr/82lcIQCbNp/6Yf5kACjyNSaJ
	+ssc95HpKiHVwUSM1WS9Bi0xnsuppf5yT/CGo+t5la63imJYQ9XgGt/isRQWubMRkgi4lTYPhbw
	PWy8F0aOvtHSiNIVH/aWFFQwnWh2gzoN
X-Received: by 2002:a17:907:1c9c:b0:b87:39d:2bb4 with SMTP id
 a640c23a62f3a-b8793028f6fmr548336366b.59.1768663782954; Sat, 17 Jan 2026
 07:29:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260112174227.14922-1-mahad.ibrahim.dev@gmail.com>
 <20260112174227.14922-7-mahad.ibrahim.dev@gmail.com> <2026011649-dwelled-amplify-49b9@gregkh>
In-Reply-To: <2026011649-dwelled-amplify-49b9@gregkh>
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Date: Sat, 17 Jan 2026 20:29:29 +0500
X-Gm-Features: AZwV_QiBWwLy-_-yGRSdYUmsMWyiNT1DwfdnrR2nDySNt0uwp70eDRY7RxyvLws
Message-ID: <CAHpOaLATkdXkTRhrCOSQ5vUk3VX4eAW=zGBaLp0hSY28949Ypw@mail.gmail.com>
Subject: Re: [PATCH 06/10] staging: rtl8723bs: Fix parenthesis and blank line
 issues in HalHWImg8723B_BB.c
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thank you so much for the feedback and guidance.

I understand my mistake. I committed different logical
changes, no matter how small, in one commit. I will
restructure the v2 series to apply only one logical change
 across the entire driver per patch as you suggested.

I will send the v2 series shortly.

Thanks,

Mahad Ibrahim
