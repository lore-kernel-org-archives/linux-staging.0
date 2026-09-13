Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169863CC7D8
	for <linux-staging@lists.linux.dev>; Sun, 13 Sep 2026 13:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789305682; cv=pass; b=pZGVcGG8f6KQaMFhyYkDEUec/ObggkOeMjSROKpDWgH/qd5pmEnIhOyQsyicbs12Jc/Htn9a5z2PyGvy+rxBbO729RgG4Ht/Zof1S5+IASSioDaS2I0hPX1+jSdm+Cq7rpKmvtc1hk6Jp9AHYQFWflrBa/nsyULhyw22XQyWA4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789305682; c=relaxed/simple;
	bh=qruS9RaFpfludketP5nShhhjtDemkZaJSSVTOVH8K1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K8AaDOAkxSl9S2cHycUW2o2QkmYZkckA+V2FzDv6eClhhNaOtRakcI94UXeqeTT5Am0Gk2ZdXLA5f5e7DVr+vLzm9SFOAcLkINtVIp+u9HDUmvRrUWu4aJoA03VfBnwbypz3mVEc9olrfAJcQCcEsGPEmpqPtwP7lU7v744tWjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L24laIKm; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L24laIKm"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4b37a2ffee6so299235b6e.2
        for <linux-staging@lists.linux.dev>; Sun, 13 Sep 2026 06:21:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789305680; cv=none;
        d=google.com; s=arc-20260327;
        b=o117YBCcw40p+/czvETUoO0hq0OScvc37JwxSKpABwBStxP5FUNXByNUrNbfK6Qkef
         4IcaqCaiE94ZZflOvH4NIVDAfY4cT7K3hqrdvFcV4H7Uz/UFXus8l08zYoSQjolR9ORK
         I/NuHk82wR7e2PoFvuW63KOSse6eLZxCPGdZmd1Ct8Q9Qh//OoFXQr9YUQ/BVuzuqkez
         OfmifU4CTTUVB09xMYhG1k9SEzi+3z+KZgc/5t3IN4mxPHBM0EcdpIi8cifU0YdUZsxx
         mYqU9tXJNq/acc8NYdDlu5STzSbXAQUw/1vJGjavwAuzJXbkejOb5UY3rIgk/gpb7qkH
         clDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qruS9RaFpfludketP5nShhhjtDemkZaJSSVTOVH8K1Y=;
        fh=cBSlOCdUYWXKrv99rvxDYNyMpLmQJjrl9d/zPPBl430=;
        b=W1aSOku7cuw+OHLkjhL6LGkc0fdLBiiDDyaZFdwUdqgfzT/lOPneBs/kuoPEaSPv7i
         mfO+QStG83xrq7w/g9qIooM2Zzse8OOrtf8YRhDz+fr06HINEoGf9pJt0q/JNA3t9tBZ
         wQkC8pZZb3riTQOTOiGFpmRbrhw/NyB0aUtBdLsLdU5GUvG19QpGUqAiwb/FsywipwLR
         Mu698gXyyl3Qy511WpXoNzoT5N00hqCOyRXcA5JZe9ixkxjFtmuqZKoqx2ax2Px8/22F
         Jj26m5qT79351UsJed5KE9NWmDV4bGa94HFPx1Mil60IwB01eNORRYh7Pl3sr8U/n/Ll
         PSKg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789305680; x=1789910480; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qruS9RaFpfludketP5nShhhjtDemkZaJSSVTOVH8K1Y=;
        b=L24laIKmhuqGLCB2nOeNeruiPUj1w0+xCN1vOdXR35yCSm+co2F5mvDqbHorHR859s
         Y1+Oeu85higHC3HOKJSrp9HHQIhSIaC8C037C3/+wcI0DQQaO8Z4UgVPCcZ0vC0DeQVi
         WYGwmsX+1WEVrXbzuCtp5MIkfQHQ9S3OeOhIy9ecXfrQl9Tyiexz735YFEqXaDR4wKkM
         2EmF5X9p2FBDP1GsoKxKjwb5uuNoDaJvfJTmJ92DSk/0XAHBWmjtXofeFGiV4GuN44OK
         dviUsh8y9VWTtXh2Cx/hihRoO1x4Mtrb2rD4fqDUGVau8AQ2pSVAvSWwNTz0Hxe1klTt
         kNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789305680; x=1789910480;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qruS9RaFpfludketP5nShhhjtDemkZaJSSVTOVH8K1Y=;
        b=d690Q64Ci1d83mwqFMt1SqG9hqrNzVrOtS6HMAc8oyC1BXSEjXz0tdhi6n8/8rwsNx
         /Y5uua7fv2I8KRlX6nDw5mOaJprMYWb/PK3ufh2DQhJK3cYU1EFONBTvFe/WhmzQfnT+
         P1U0KPFB8+up52AcRYTQ4QquyEipsj/wJYltsi+sqTIdIq2jqzfL6t2AK5HNXBFfD/vs
         RQAvhca8APFfKIXMYi8DQmumfO4GrjN7UGQJpFctSQH/8r7F0ycKuggixYwiAvcJM+em
         AiEgPqQmg/YFJR45+2Uj9ncpR6ecYKFEYOllX9oFqXh9lQn62+C2wfCTKbE8EiROykul
         lOZg==
X-Forwarded-Encrypted: i=1; AKwUvByeiLZJC1s1oZRWh2uw3YzEpTM99fug7m7WHJpn1Uk2wTWFqoTMhC5S5s1sGaYYn/DpRz/4/GFa4R5rDaND@lists.linux.dev
X-Gm-Message-State: AFuF++mPCd/YY93n/SeNpt5hYFo0TR/IEOoUg8z77nKVFVCEZWXLTz6w
	JJXJEsxrcQD2WggFixaNByc+p9tbf0f0V+2CAuHtXe1ntOl3cW+GDuY63u/EmCqwJhDAWZ+3HnO
	qlgH67LnS8atUTJ6QJYrTRB64wiRScoo=
X-Gm-Gg: AYBFou2nBYVlUuEEa319jbj5xN82SnzAjgI1C0KaS3/d5xUSlWonHHqzPn9vjwz9EQJ
	2c8WzmrGfWx+7207wBFEmrSACxZZ7JylgUTeM3rN1KQ0EGwoZskfNJcX5PfHj0yVLzA5Vektsj5
	OlnJk1CDP29Jvd0D/VvXEHIfnapXq6egkycQ+QBKl1Rzvxt0xLZncTqEc821b0pedqzcOeeqI3G
	Ifx7u0As/Ofpw7ssCPooXvwFASxI8qG0bVg9gcoBPWIU8sA5rmhnPflGcNJ15CkGHypS5OkXxTz
	ZWTBHBXV72MROJ5ARcIP4ifCwVqMr+uTLCSb0PKDBtY3heeXzJMjOA==
X-Received: by 2002:a05:6820:1886:b0:6b7:8396:f3e3 with SMTP id
 006d021491bc7-6c25003a9d1mr3486566eaf.69.1789305679912; Sun, 13 Sep 2026
 06:21:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260912132517.55686-1-abdelnasserhussein11@gmail.com>
 <20260912132517.55686-3-abdelnasserhussein11@gmail.com> <aqZc3LR0s0I2S27b@ashevche-desk.local>
In-Reply-To: <aqZc3LR0s0I2S27b@ashevche-desk.local>
From: nasser <abdelnasserhussein11@gmail.com>
Date: Sun, 13 Sep 2026 16:21:08 +0300
X-Gm-Features: AcwNN1WsbiyGU7uP4XszH5roX0jEFpFRx8lXN2O10Txdr0UEK0yTaOMrsHkr1Cc
Message-ID: <CANpqX3YgFne0HvC4n92R8URm3cC+gdRWsGo4=yRkXkXf1q5d-g@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] staging: iio: adc: ad7816: Serialize SPI read operations
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, nuno.sa@analog.com, 
	Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org, 
	linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, joshua.crofts1@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

Thanks for pointing this out

Placing the mutex after the `u8` variables introduces unnecessary
padding/holes. I will move it up in the struct (right after the
pointers) in v7 to ensure a proper memory layout without wasted space.

Thanks for the review

Best regards,
Abdelnasser
