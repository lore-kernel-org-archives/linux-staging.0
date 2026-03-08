Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEDD34F49E
	for <linux-staging@lists.linux.dev>; Sun,  8 Mar 2026 22:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773010468; cv=none; b=Y5kiMgO8+lDu/C4v2GdY+YBvReRLs8F3jnTUyTsEwrkeGHthiiFpichoE8c1INvW0J1ZaEdJR4msjZHgc+vzinfcjMddrW1xY2K6mlwD/mKkkqkIwiqNyNcuWVt/zrvPg3dxBNlrES5axflNs7JhLClNG93ZkNepaz+4ZUUA17M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773010468; c=relaxed/simple;
	bh=/9IATlnngtvkI3Un4XL2d+N2qfbNx0bFGKuCXfNwUOQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=m/JT48QuMCdBU/qMIU0UreCtqPrXLh/Qf4WqOepjJ+Dp1qow/1ukH7+kqcJGyFFCM5ImKQJNSW5UAE8dxiqp6GfM2aBzXGTYgcaBsLcQW9IsU81He5r4fryWEs+953OOFqkQAZIWuqy4VVcbIV6TBoW8CHvY5AiNz27uG6KKBEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFOWYP6Y; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFOWYP6Y"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7927261a3acso98663887b3.0
        for <linux-staging@lists.linux.dev>; Sun, 08 Mar 2026 15:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773010466; x=1773615266; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9IATlnngtvkI3Un4XL2d+N2qfbNx0bFGKuCXfNwUOQ=;
        b=GFOWYP6YmWtTTiu6tGSi6x5UmsDin3E0Ys+tEdwwz0tnb677ZyzkBn/Z+GEZHot397
         dOwokBn53OL1UYuQC/U+7cE2bGR8eSvXhFYrcSctftFox3kfxZ+nmYJXckAX9H9ESH4k
         khqxS+Spc0jS4K2kTQo42CHoIe+R4RUxJJNcIGC70TR7KQyf6SIMw1a7K2UOBWX79tjG
         SGDR3aUXEfIrlq07hbvQmY4zjyj/FWXQwRFSK9NooTpxpzznh2BxO74/D6gNGxrkk+pf
         zGjwN/ROKsFN73Oay2SesOGHT+eBm7hEKpJM/+CosgUgPSvkNsuwV0pTgZWwYAyvsCKA
         /RKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773010466; x=1773615266;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/9IATlnngtvkI3Un4XL2d+N2qfbNx0bFGKuCXfNwUOQ=;
        b=C4mMg+xNsUqXaa7By3Gvrfv9pkjrtcxrJplytKz7S8q/vdSqcfqXK5m3LdLg9PitAj
         vI6Io6/dYHC0pwnhr0iNLDZQWkpvavq5w8d1+Lvyv17YN5rTc5Hf1kIzkw5RGUWoTmwE
         9Roo85ZKU8ALbFbCP/yr1PLf2uGqZRP+bM2QuPkqUqvJKTW1BCqJ1FJhDvWc38Nfz90l
         MXIrtT2BnBkTOECcLbuJ/mjOOAiUWSKjEpATR5emol1736wGizmqiJIX28NE2lY33X8a
         kfAYO7DekriOL1Ye02tE37w2oa5VyNg+NTUziodBODpy8Odo+tg7X/FVkZ4qsCRrxbBc
         Q8Pw==
X-Forwarded-Encrypted: i=1; AJvYcCUY3l6rAhR2bW7D4k1lNjzYgOoaFGT02Q2M3mySQC13kuTTOia8dLRSYwk257zAAytQSXdQUrL53qzwyTbC@lists.linux.dev
X-Gm-Message-State: AOJu0YwbG+KgBBxd7ygV/h5VoyJibShOp4CF0G+k5IP2TI6jS5N9dwcv
	gpwLa5VRett10KAJJNdWthLXm9le07NxgYoWlY+jqjHmTDm0DLQWikfr
X-Gm-Gg: ATEYQzy/tQVnqBZHkIRPHOX0+5evgPioC5sY5/RtitW1uEfRce1EecS2n3MXDeuWg7o
	rRUBsJjTqdlWbbGUpPUukQgbyQULtoF7HnKUA0BrhfU3IBvyo4mdYZf9JTKBxCM9gWCXzhLyQyG
	PNNQohUV0asFtaiFTXQz+YHh5qkhMOItoDT7Ibe2+xDAjwEHs2rPb5OOl6kmrhX39YwK2uS/1zF
	0rUYUf4ZQ8OdpdJVZDgfjCvEgoS4q5v+idGtzTq7ZfaQB7QixyJWybMAv3e3kUvs34Zp12F3y5y
	52ZchRbbOGliZGMCazhcDPskX8GDLu+MRIejz5MID3PcWXP1BA71CTIyPfjAT6cytlOBInsFGxE
	UpfbtDjE61vnae5nqqR5Y8Ed6bDXEarbai3lITYZqRa56KEE/WdQRxASr4wUiAvVFpqMOIfRhBD
	V0aE1NcfmTqDU3XXVarWLrWjJDjA088W//EirEc0v4xrd58xSXl19VeSzFDm79+jEZ/q78yFupn
	ozXQ2p1aYx0QM5x8wr0RwDaKe2WntDMgDe4c5V29l73TRToCYOjyEgVyR40IEiIA0A=
X-Received: by 2002:a05:690c:4b87:b0:798:53c0:f4b0 with SMTP id 00721157ae682-798dd799d72mr90961967b3.48.1773010466057;
        Sun, 08 Mar 2026 15:54:26 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00:151a:1f16:9af7:946c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-798decd44f1sm36427367b3.18.2026.03.08.15.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 15:54:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Mar 2026 17:54:25 -0500
Message-Id: <DGXRR79ANUPK.19WTJA1ABRST@gmail.com>
To: "starPt" <starpt.official@gmail.com>, <gregkh@linuxfoundation.org>
Cc: <straube.linux@gmail.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: replace kzalloc/memcpy with kmemdup
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260308112513.249948-1-starpt.official@gmail.com>
In-Reply-To: <20260308112513.249948-1-starpt.official@gmail.com>

On Sun Mar 8, 2026 at 6:25 AM CDT, starPt wrote:
> Replace the open-coded kzalloc and memcpy combination with kmemdup()
> to make the code more concise and idiomatic.
>
> Signed-off-by: starPt <starpt.official@gmail.com>

You must use your real name.

Thanks,

ET
