Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7C430100E
	for <linux-staging@lists.linux.dev>; Sun,  8 Feb 2026 21:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770585742; cv=none; b=d7eE21ZD2npnjWOf5ma05Z4IuDA4HPEFAKYv1ItOE4KpXSoy7HllK1bN3o9SKCnhw1FxahyLMP4unkR4T/jUf0m/TuGbA/kWrJnCO8lbJgyO509KCsGeBBTRQ+GGOZzfVoFA8MRVJPg6Ssngh9EG08wAHOKZ1cAiHG+p61x21wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770585742; c=relaxed/simple;
	bh=NzSC1D+cViZlaDX3WIhPhFoRwDPM8Hi1AfXSdE5c6H8=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=eotaym6dPSH9QGhtNL4S1X4ywYjFrWOkp9Agjd3hA/QIyeQ84PCpKyzAONoNhzgQS/aw4uAQ65drGgiBPWcTMl+7M+rBcaKjRpTAqiOeEsU3BBqK5iuW0RwTU0Ek2F1Gc6vYjUcuTObAXLcgBuoveV+HqR4n+hNA/EsvVHLz+sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HThPWNay; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HThPWNay"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-40423dbe98bso1049539fac.2
        for <linux-staging@lists.linux.dev>; Sun, 08 Feb 2026 13:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770585740; x=1771190540; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NzSC1D+cViZlaDX3WIhPhFoRwDPM8Hi1AfXSdE5c6H8=;
        b=HThPWNayng3SEy4qoqPR0IKLfNwrYQsKq1sI9EwkjaGIestj/WJegGEfc3JPkPJKWF
         ZOpMBs9BT1A89xoTp53J7AQNsjZ63qHTb7nLM7XCZ9hXzijwheIRLnWWa+KSLHJxntrv
         ieICkxYv5kMPLxxXjJLuWIThpE9NNlDXBq3zttG+UMPjR7fd0MIE6k6g6mHThB3CLRSl
         Zqg+7XJ39Yt1smgpozyBoKdQoHDf7ITLXdjmQ02clwy8A1MwqApO4wrdxRa237uOuUqK
         ViNjfqdc6ljlkXzGrs3CzbVaoubTVDWZTRgTmiVAmOzNjYswC7D9Kcl2jS5aWwwzBM6a
         GJ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770585740; x=1771190540;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NzSC1D+cViZlaDX3WIhPhFoRwDPM8Hi1AfXSdE5c6H8=;
        b=pbR+Xoq6ZUJrXJ7IxzrjtE/8D89qpjKH/RhZdUiHSv+oTox4uImTrkRNfkHX+7V0tR
         Euf5dqYhbwmIeCQq5pUBymLAZOrqp1ET13CTPu98Ktc8zTXxE9n7Z2wVV8QeFr5pUDSi
         To9i2lqdUudruoELijpkYAC7BFQaD8+gquqQ7FaGbjps9YJZz2nSLTmqRq7a5qCsVvA9
         nmaJIXLEnRZ0gASIDce3j5kQp7gIHHz1ADTwEVv5dsRaIyg/jyb/itABZh4WORMV+r+P
         65Ib+SaHKslUp8oHgbXTfjXZEsaII/Dj6k+qZpzzfPQ61bo+ctujirz+kA4HpPw76z/p
         BPJg==
X-Forwarded-Encrypted: i=1; AJvYcCVCRuQ+IM/bajXzgTVvWT7DxAvfI6jnN4MKIwNuFlIClAcJH00ANWCyDi5cQEtIwQ3mpudKryX86ZOolk05@lists.linux.dev
X-Gm-Message-State: AOJu0Yz29/rRJgALZ5OkLvnr3adp9QT9bKcftCf3WWicHldVMfR/mF0k
	HhxrpqHXn6pOegxyTQCdM+eoqqrnykg5biqwz3BhKgUMS/WV5UrkHWhy
X-Gm-Gg: AZuq6aLWSKHxhD7gc25boefcG1k8kmbbomcHuZPKNsYbIbm6w8pdycc4st51dgcsPbC
	oYlTB9FiPuxF1OPV4i0ykth6g3GRAmiEiD9Uz8M/tuFphuFY18t2SKigtXB4Klelu/K7CiRiM+u
	ZFoAimwYGURBdQG3TP4/OKoOCci1yY67N9qzSbOHWE8lEV5/QR0Nj7uoZjJlOnF7FMDAdQybWvw
	/DCNcsgB86EENfmnPaP3DUWFknKNC/AXPzLWUnrW2O9iyRJCKSCGMASBdl7DQHDU7i0BdlOkBCF
	JSMSQwDDjWr0RKpJCGz13iOkyi3rHZOgKtMRAFNSQH/+ncBEZ+pQerDvizCtes0BY/XPxVTnfQL
	VDq9hVkmvwYg6kgPyfOk6c9O9+wkOCHeW5hrPIfpiwiAWhKMCKHJ3mKSNTFmcxUT4o4RseAXxyZ
	nwxogI4Szl/jGgNXsyDX9HUsd3IBydwJQG5uv+QuesYjwDTjv8FGLbKB8rjz2+iW4QcodIEc2EA
	RXhyopKLWeYO1RpjORz7MzoFS5AiG1a5jcqXNd8HUJ8krgdEo0TYc00Xg==
X-Received: by 2002:a05:6820:617:b0:662:f347:7601 with SMTP id 006d021491bc7-66d0a4777bbmr4585081eaf.23.1770585740574;
        Sun, 08 Feb 2026 13:22:20 -0800 (PST)
Received: from localhost ([2600:100d:b16d:c41f:7439:3a18:1e56:a313])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40a992edddfsm6541032fac.3.2026.02.08.13.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Feb 2026 13:22:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Feb 2026 15:22:19 -0600
Message-Id: <DG9W9FGTG8N4.148EC5J3F2JEA@gmail.com>
To: "Azamat Rakhim" <azamatrakhim8@gmail.com>, <gregkh@linuxfoundation.org>
Cc: <karanja99erick@gmail.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] staging: rtl8723bs: remove extra blank lines in
 rtw_btcoex.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260208175120.15717-1-azamatrakhim8@gmail.com>
 <20260208175120.15717-2-azamatrakhim8@gmail.com>
In-Reply-To: <20260208175120.15717-2-azamatrakhim8@gmail.com>

On Sun Feb 8, 2026 at 11:51 AM CST, Azamat Rakhim wrote:
> Remove unnecessary double blank lines between variable
> declarations and code.
>
> Signed-off-by: Azamat Rakhim <azamatrakhim8@gmail.com>

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
