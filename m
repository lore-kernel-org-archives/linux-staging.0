Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B809636EA9D
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 22:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773093748; cv=none; b=TS/6IX/UB1LPNGyE0SNi0cty4sbF2TEkJnHuY84vMk5vWQ+m9IeeG0OFVGjQzXs8OSX64Wi9KTgYZ1J+5cWEdaJzExFQFi8bYj9iEyDbiFeXvYbPzXkC+SgStXCX1SspIyPp7KtthSvbpODtN0pOjiWWw6vCo/6d1LSV1XVlur8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773093748; c=relaxed/simple;
	bh=sPZVw8Cb7pUpk2Nf8Mslr4sEocVwrbKx2wW3nw/70n0=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=LMDHSK9Tr02f4Ieb2M5nTp1EDRK54JprkstaIU4OYfRe2B2DF2q73Z2pf2qwbwnSqynqDCw0AlIAbnKshWOKdBBvC8ghI+OSuym6Jw0rAXsE9stwyk++LId858Qv+JPV1ltTo6e/oPYWuVCzz5fneeA+Oi0d3evEikz8L8mIaFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GAM/rFcj; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GAM/rFcj"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439cb5af25bso2488141f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 15:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773093745; x=1773698545; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPZVw8Cb7pUpk2Nf8Mslr4sEocVwrbKx2wW3nw/70n0=;
        b=GAM/rFcjW50Lfb3I/ePWy+tGA4cKoES6t8SNDUNdTpC6agXxqb/j241OJjSAXrhKmX
         +9cY+qekgBx5MBbiWYhfcIG7ObsnjDRd3P2Uak9ME4ADm0XUMtnD2sb9HEQV7+GcBnXp
         LgxwFsmyo4rjQm+Ph+wigU5aYdPVwyvXgNAb/b1mz3oKdYBACynBeMsPggE1s1Mf8Nsr
         pBXeIIQf50gFwVfF7tvgHLli266iPReiXZn7cGnomu4VSiYCh0Q5Y7y3CYmxia4efSbZ
         JzXfNtlzlF19t6XWNrwxB9v7iN2yh6Igd9CSvW+i8ttxAjF2sA7Iw+DVtCRG52pPwE38
         3PDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773093745; x=1773698545;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sPZVw8Cb7pUpk2Nf8Mslr4sEocVwrbKx2wW3nw/70n0=;
        b=fKcOHuLn/h/yeavVzantz7q0/aPfk5+SNrHmCqFmlCjD2xNtWWGstMQknjykBZKVaX
         m47u460WFNe7qF53TTmcyC806c0KczG3ukOIWpFKOAbZn2ChGHFq+KR8z9peeRzu1Izf
         hwpb/93BQkZVvrdF3F6FOEOHfcLChtiob+15ikpvjdEk9A4z576qPVbNDREnksdlYgKB
         u3aENew5m+TWLXY4cAM47z5a4jRZSvOabGQVSCrVpxZ/F8a7uhTTirJcvXZfhiHcRcuJ
         L+BdpYKxJJHCN5trmKin3zcJjPdXMdpyuMjk/J2nDM5qd2o4Ttj5rydyD1R407t7RutK
         D11Q==
X-Forwarded-Encrypted: i=1; AJvYcCXU+1faavgtLdL0NvYPvkRSZDywPbkQf2qetuIzaEKrsGu2KQP8ssJECdEuwgP5ErtSS6Gtk5eIR57C5MfA@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/INA7u8YKGl7UGPmPA9AAJUDlMcrtvRFXgiKiN7b4NxI3xAaS
	oao/oVWnSokW0vFqYBfK9M2pCP23DAWVMXOGR9KVrCCwtb2qCrb71oas
X-Gm-Gg: ATEYQzwIxZx9BLGUVMFo7yOOGdfc5XsFu8HCCF86seu6aRUy6krbb3p7ZivzkbKNcPx
	ZQNaGwEFctA0K2DCiRpVlnsPObEpTWV5OTkNz6HClqezUvxJLnHW45CklY2lYOPGKFrGc2h7oQk
	5RbB+6RLpsORSUQ8DP3nxSIQczZZhFdPU5Dl0TJLpQBX2Hgp5K6ljf+bI2tjJ3TwSyYp4frVL9e
	gj4jto4vBSJucBwsiIcqvFWiRc68eWxAHjZ8XyhP0tdFvuEklTF/4RKgaB57NFg7BllUCPMKz3C
	/lUOigU/zRWccD6rPuUTezHBe0kqvC5yApihH3OtVZYj767gtOaoDANQb18mQq89Oy5s9o7CRXV
	IDLzuT4zFyPRTQjmtF9+xqOZDbwAQ8FA5u+nvVc/jtyFGQRh1+uSzIxuTcZtEadVpDTz5uPw84C
	nhoXe0NfIxzGphMBgJ
X-Received: by 2002:a05:6000:2482:b0:439:b440:b8b0 with SMTP id ffacd0b85a97d-439da86faf4mr22243585f8f.45.1773093744877;
        Mon, 09 Mar 2026 15:02:24 -0700 (PDT)
Received: from [127.0.0.1] ([86.1.69.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3a20fsm29190180f8f.28.2026.03.09.15.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 15:02:24 -0700 (PDT)
Date: Mon, 9 Mar 2026 22:02:25 +0000
From: Josh Law <hlcj1234567@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Message-ID: <15d447f9-a3a7-4f1f-bedd-3640b07c885c@gmail.com>
In-Reply-To: <aa9C7YFy3bkfS1Kv@stanley.mountain>
References: <2026030908-destitute-rely-9997@gregkh> <532d31d1-0c06-4c8a-af80-86b6fdf07225@gmail.com> <67b71192-97e8-40f6-9b88-666526ccd16e@gmail.com> <2026030952-petroleum-osmosis-50df@gregkh> <356a52f4-84d0-4872-b713-9833f07e1a8e@gmail.com> <2026030928-smartly-spinster-ae05@gregkh> <e65d636a-325c-41f4-978a-6c09a967a923@gmail.com> <2026030931-quiet-crimp-e4aa@gregkh> <4219d437-d0d5-464e-8b92-095690bbbd98@gmail.com> <8e07f7f7-8019-4edc-9a33-99a66db12e49@gmail.com> <aa9C7YFy3bkfS1Kv@stanley.mountain>
Subject: Re: [PATCH] staging: axis-fifo: remove redundant goto end
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <15d447f9-a3a7-4f1f-bedd-3640b07c885c@gmail.com>

9 Mar 2026 22:00:17 Dan Carpenter <dan.carpenter@linaro.org>:

> On Mon, Mar 09, 2026 at 05:22:19PM +0000, Josh Law wrote:
>>
>> If it's convenient for you you can ignore one and two since they have
>> no descriptions, patch 5 is worth looking at maybe.
>
> I was predicting that patch 5 wouldn't make a measurable difference but
> I didn't know you owned the hardware.=C2=A0 Could you try measure it?
>
> regards,
> dan carpenter

LMAO of course I own axis-fifo, that's why I'm doing it.


It just makes code run better to be honest, unclutters it, hopefully moves =
it out of staging (wink)



Only one or two of my changes are for performance.....

I've measured them in another thread
