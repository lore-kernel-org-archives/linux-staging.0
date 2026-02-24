Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3E613B5AE
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 05:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771909880; cv=none; b=W12DkPiCjw5FIrbf/24dUtvVWo38Smvi0W8OB6TEuzWV5bTmqbepTHqmXNpK6/4qKEj8YBz5BaRXVbBgKObTTV6umUEXB8JyDPUM2Poo333gYNGIGt4nXmjZxKsPiSv8DYTby2ZCxhd8Xn6PVz7DNgJ4J79yuiLZzbVCOXskDVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771909880; c=relaxed/simple;
	bh=hhP5jNeen/l42iYGATQiNm3qSnoVHhRRukR0HDtgdDw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=s+pCXYTyWBHrW2XW7xgKVDfej12jkIFVyVgfZxnSbaUCZFZMMOiRzG27+tqlaGsTbVwAi0Z74h0cuD/KIqwi3wwTX+jlyMBGPPweB8KwdwbfCtqV4Tk/y+y9rV8hSITKmJDWS8ioozdGAvyvwgLiFkBUqwBN6TN1cEyQ7JSUGmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8+taOFj; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8+taOFj"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-78fc4425b6bso45348277b3.1
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 21:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771909878; x=1772514678; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6oVw41GVfSd8C/Y0+J3njNqXuA0gh77EQnEAy1NxoDc=;
        b=T8+taOFjw/Ym/R2dxm6N02n+bMjljZ4BeKeJ9jtk2/rMYphxbtFw3O/oMGVknV+QsE
         /CZTgASk0tz9tBev9ASZaeHloajN+QwVtSXW5T0bvKcvRn2n/QfvGevNcSLWjkrGeBIL
         MZJYJYbNNofs4aNjCQ8/PXnId5w9JhxFIMTCMYf4bdizdx6JUPbJYNE4a0NhXaCWAPql
         k4w7T1164w1vh0upFHYsTyTOGW08xcbzfopJHubFkh0bGudpwaiS2t8RqFW4QpeYr9+V
         bOLjLPWFybVxa+yjTzh8jHmDnIySl6ip/Gw+3pjJzQzkR2M/acgaxiy6wMphps/y9GHr
         mHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771909878; x=1772514678;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6oVw41GVfSd8C/Y0+J3njNqXuA0gh77EQnEAy1NxoDc=;
        b=nd/fW2wdL+86U/vCln6MpcphyJeFwUzxY3+uOQJ/rUNyTDovLuz6imUYgJuJhGvbUD
         bc8bKirZDsmWA0OOQWx9d1oRGarCw8xg2AXWZ3VrhL3rwcdjqn5tMI+qOq4HhXWMbFc0
         NIhP14Vc1hCr0W1H58NkxvBZ/YfRn5HP7tuxYwADfW4YDEYwtwNAxM3G4oLxAgWTuexH
         nf+epY2WDwaziHrtDGCoRuDAUXOlXyc/DDGQu2tVP8SnNaqD7niD0kTQShe4gp17ULZO
         /mNoSBJ1mqqsWS1AyQMlfHHCclhbN9JNy/BhjNB0YNk6ZLFiLVindzBxTZ6ECJqJTrCS
         RQdA==
X-Forwarded-Encrypted: i=1; AJvYcCVtacLtMIV9ci5V3IUJkh9UnLTr9mlCuHlTRzsq0GG6K2gTNoNjH9sGpP9ckJk9SR2ad9TupEQw7bJthZey@lists.linux.dev
X-Gm-Message-State: AOJu0YyC7xKcTCTCFhIOOaRcCVlApWAMT4SEEweymUhUyx71C/y0YrNQ
	TMbk80IY2UICPM0JoD/qEXyZEwf9+2IM4ZaSUJDuWl8U7B7OK1y5W8Yq
X-Gm-Gg: ATEYQzx2nP0i3CidDTYTz96apNrStQd6J0DOItcbn2mxL2wGFf3Qfl2fMhtt3V938Ho
	nIuMSr8ZZSSyCYkawKo1O22DM6nADkQ5Oc6PhWAEaxLiyQ9V7OBgnm/y9wpex0M0h63qgdibdI6
	BKd4kcZOJq/ASAP5yAgv7ES/Fhw8SI28zVQQFzOobwhMpWpNS0bemFGbv31fvbGcJJg9jCEQxdn
	uzYeLFOv+uGH/RxEQ6VYDcQzhFWaNyZLo7u/2rlKWa9HbSQ5l2c0M3ZZofbgjdeOS0LR3yzYFhg
	HdFGdSG16EuY9waZ/thZnszGJotvBb+cBhc5nl5pZRL9UrLhZv08Rb/fqOt03yv6rPYMa5yVM6e
	uqC2FvVyNPoqqtjGqCEqQVAibXEFPNJwC8a2e6wo83WkTkHsKQbzv0InIHlFv+Gb2RqrYfjUOiZ
	kqv0xVJ69zFgGiVmADx3gwkSMJDB3riJwOvZj19ZO+x5UigJyCoLl8fOK9QxxNt22tzADFUFqLJ
	LAX5CXNNerNDVNQ5wGFfR0TnHffsSrL
X-Received: by 2002:a05:690c:a5d7:b0:794:9678:6542 with SMTP id 00721157ae682-79828fe2debmr69323687b3.36.1771909877855;
        Mon, 23 Feb 2026 21:11:17 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7982ddd5096sm40438657b3.45.2026.02.23.21.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 21:11:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 23:10:58 -0600
Message-Id: <DGMXMFH5FH87.1LHZD9XR9FXXF@gmail.com>
Cc: <michael.straube@gmail.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: fix spelling mistakes in
 sdio_halinit.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: <tomasz.unger@yahoo.pl>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260223114053.67890-1-tomasz.unger.ref@yahoo.pl>
 <20260223114053.67890-1-tomasz.unger@yahoo.pl>
In-Reply-To: <20260223114053.67890-1-tomasz.unger@yahoo.pl>

On Mon Feb 23, 2026 at 5:40 AM CST, tomasz.unger wrote:
> From: Tomasz Unger <tomasz.unger@yahoo.pl>
>
> Fix spelling mistakes in comments found by codespell:
>  - gurantee =3D> guarantee
>  - ser =3D> set (two occurrences)
>
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
