Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF7A1D54FA
	for <linux-staging@lists.linux.dev>; Sat, 11 Jul 2026 07:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783754984; cv=none; b=IKKelaqQ3hnBTWNaUfyT7J0z9OuW0Cy8YxHTBRhtULVqjK9xI/8MnqcR9l5XjXa/QhASYT99XhsQMfF6wkDopszGhmkkWb/r2W8jhurBAXUH4ccNlBBg2QtYw/UulPtMbJ0xMm+aonJ7u+yzM/1rCAvJCp4bST7YdgRV7qcDIZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783754984; c=relaxed/simple;
	bh=/XlkIXDNyCf52m3eODYUQTRTmkrRjD16hDtyTWWG2aU=;
	h=Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lnWh92F58ewXnvJz2Y2c1L+FtMzTNrUIP/h4IFz1/tObO5S+r3KZncwZ4jP2ZRErtCxWgnsw2FWTvQ4RMqZ4/JtUR948iydrIvgWLtHS71p/lzV1OLft+okV13JC9KNHxWzgOtXOAGu8NXCSCcfZ7E/dimCFxmkTETjxhGOqShc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kKRSJhzB; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKRSJhzB"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ca70925c25so21889545ad.1
        for <linux-staging@lists.linux.dev>; Sat, 11 Jul 2026 00:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783754983; x=1784359783; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aECS2VE/JAEE5/6Q1Vp8WOCO6a5H3TmUFObfoCBKPk4=;
        b=kKRSJhzB846c0+JQMk4cZE+cQzfQkMpY8aFa6keLKvays470AGcsTT1HM/J48gPMY9
         ft2DDnkslpsA7icoPrdsEobDzBllwEyP66cHq9EbSDaioDJ1vYGXov3D9FpZZvNKh635
         /+Kh9gB1ScCKWG8a5locYM1qSV15BjbL7BxPw1P8LT/OtbBaquCkOdyPjJlhNqC5d3gu
         ymxESKATwMxJ+IEnq7rYSZvCV3p8mFTLzp0x64arH98zEb0iUCJCeVltvHhMFMuwrcQg
         WN+wl7TuvU1KMsykKFy2dfgKJP6x5DxYlyrUOcRIsExASMQBBRkfZOeCP+sbNvqoRKyX
         POuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783754983; x=1784359783;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aECS2VE/JAEE5/6Q1Vp8WOCO6a5H3TmUFObfoCBKPk4=;
        b=pAJEsZAeX9zExBr023hhl8y62rlEr1wvcVdBT3j0e8nfaB6fLSWpqalVfRoiSdPVzw
         +KI/GZB0CfzKzZ7XONB06tQDvQCas+u9YoHRT4JxFOCbxiuDr5aQggFIbAxE7xn0urcC
         SEyASE94ClgQbNCS3zUD4Zkh3j4x6qE33nsh5qC4mSV7R+PpP3k8u4nMOPseIPRb1XSt
         Oemu0se/z45dB9Lb4rAi5k4lmjdq7R2ABEjh9BDyDaPvOaNz0QMO8vPsdTR1//DfckPb
         B/bw8BcyuojfLRkjNpCbfcqf8GiveqHrD0G983u23W63YGqozdvd+GYFZPJJjSWElVM5
         HSzg==
X-Forwarded-Encrypted: i=1; AHgh+Rr7WvISYxU/hUuX0CkHgiwQhh7UIDeXrp0ABQE6F4YeRUmgUxJR5R5nws11tlPJBEFtJf4pCtHa86+owCpv@lists.linux.dev
X-Gm-Message-State: AOJu0YzIvZJnM/hjcz0633bCIDrJmjxT5cvdnzeim47Rz9XjCvtwTqfn
	pZGTG0LYMqJrwWhtnq14jCRbl+vOwj9r1RghnsG9vAUcNrdcl9ik4OTb
X-Gm-Gg: AfdE7cl307Us6brRXfENpQvm99szutMxd8epXTm0Iu7JQEAVaDTC+ttRnPrviqmdFx8
	skhLzvzxkFGhFgCmuvQyZnZlpWknmlUu75SJRsGXFjfx/fZP5/1bjLuKw/JWJ8saaB+J4DuFN61
	hqf5GetGbzQ73E7XfTyALvWYMRKZT/S648BilQ2NEOuWCxiUvNCYHx8LRkaFTAM+fiZfyreE2TE
	8jEI+U3MB9PtFNtCzAdsQUb2HXnvxhCzjBO41eCJ/GOBm3igsovPIwhLI0Dg11yB/8FxHcoFaid
	Rzq6SIzJof4Ivh2ESiSpGK+2SA+OBFCAlEeO8X+ou1+Q1aAK2856No/qkCbaVO9/BpbMfN3PaSx
	U3PGH3AnTWEtR0XLBDDS8aji0slylSCr95Lspc/xSSoyORcUtx07ElLhDA4BzrW237sscAO+TKa
	8ODR/gC/AHKBITvHK2vsw69F4=
X-Received: by 2002:a05:6a21:4591:b0:3bf:6c08:2841 with SMTP id adf61e73a8af0-3c110775a5bmr2018390637.48.1783754982831;
        Sat, 11 Jul 2026 00:29:42 -0700 (PDT)
Received: from reply3_full.eml ([49.216.173.166])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm45004071c88.0.2026.07.11.00.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 00:29:42 -0700 (PDT)
Message-ID: <20260711152936.191.alvinhuang0603@gmail.com>
Date: Sat, 11 Jul 2026 15:29:36 +0800
From: Hao-Qun Huang <alvinhuang0603@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: hid: fix SET_REPORT return value
In-Reply-To: <alCiZxAXbPDq3P4e@stanley.mountain>
References: <20260704081613.434445-1-alvinhuang0603@gmail.com>
 <ak99bENMWC8saJL4@stanley.mountain>
 <20260710020644.6728.alvinhuang0603@gmail.com>
 <ak_tgJC8-d1HPKuV@stanley.mountain>
 <20260710124050.31335.alvinhuang0603@gmail.com>
 <alCiZxAXbPDq3P4e@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Dan,

Thanks, that makes sense now.  The point isn't just showing the code is
buggy, it's explaining why changing a years-old return value is safe, and
that belongs in the commit message rather than the thread.

I'll write that reasoning in next time (what checks the return, what
doesn't, and what could be affected) instead of leaving reviewers to ask.

Appreciate you taking the time to walk me through it.

Hao-Qun
