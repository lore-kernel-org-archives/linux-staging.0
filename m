Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4AB2C159A
	for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 16:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776528601; cv=pass; b=NgMVH3ZYRItHZ75XQ/XtMFnm8XuVucW1PtO0JLxUSOrh2/8nvUtVxD7Bdc+P+tcFnETIBXrbrannHqkmZUdd/AIbRXLRSWTSwMdTpmIo/6HHzIIi6VHcmx8Qry3qh1WwDSY3bSQQb/H+8nJwkWuTl42LYcvmMiOmOroNuOCD67o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776528601; c=relaxed/simple;
	bh=hBoKfqeTMOQXuJ6MyKDYCsaLS536mqDbpCPC9AaeqIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KNHXPoFJXG4Uzta2mlZw9EvW3crbT7kQtZk2uV5IN39L4Hre5i1ONGk+qNUStHxeKAN4pRR9Nm6dUlxDSSCgt2rC6TbnvuC3Vhkqmj06Ls9r3YwCk+OR5ybP8PLt+DkIw7sPlE+f8kGTc2PW3om8w2RSZU+Vva1ojg4ThslbgeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MwNQwmLX; arc=pass smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MwNQwmLX"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d7fdb922a5so1562322a34.3
        for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 09:10:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776528599; cv=none;
        d=google.com; s=arc-20240605;
        b=h/Og5YvSmoPgOI03u2Z4wW9gGEHlPAXcy/48WqaUlc1NXwVU0DTJQk3PmfPKqXV9Fz
         dD16hqrTl6AhDekCj1m1/PDSI62tD6lgLRLoQwDcjK/I6JheLoLELI43ddgR3XatPDRm
         yPLCOC8xcTHfmLJ+CMWkQ5rfrFk0IWZLyHIMFA7ZpXPkYV4QRxolYTcs+9+sdKEUZqX7
         IK68Wxoey/aqWFKUM9Db8Y319WZFLtfQLCMC0jz2yRPv3Z5i11HzPCyRwBqz4r0/padJ
         DsNxFFw1pwZaeOhvaM13IcwXJZkTLf+iaYviobyzd5M4edzGqQBU7pw4LdB97GS4u8jU
         fPRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hBoKfqeTMOQXuJ6MyKDYCsaLS536mqDbpCPC9AaeqIA=;
        fh=SQA3moKXb+srgklLPw9jKc+lJV3uWjeDRsPjo0Czj18=;
        b=aX/E7Ai0qGhaX72pFpvNdImWFfA/UuRQrvRg9XDdbsjKwXsjHw+WI/tdGw6TSem/u6
         03pgOrD1rAfCerrPzvRYqR9Sb8qchJl/os06io27ATzfV1jKV+XJmUu/glhOM23H0Gcs
         hy2x1dSoJ1zIFRZSl6/T4AKHB2OcAoavZXOipUrIO/24ivJA5NkhME1nljXgtNwkQGe7
         rA0lC/nxJ+LcI/neS5IuTJmdg8QSY3Cv9hlPQicMIF6QfF7jTEsA1i9PmqWxYmAPL6eP
         6YcLdAI+9umPsqq5DxzkfF4XJCaW+fHl5zhpkER+vh2Hbj1Li+2Z84y+IPHDtui217iX
         4LlQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776528599; x=1777133399; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBoKfqeTMOQXuJ6MyKDYCsaLS536mqDbpCPC9AaeqIA=;
        b=MwNQwmLX73YT4C6puBAGsFE63Y9OW+fKNUmPEJk/tl5lhvuemmFCq69SjdnEiUa9IA
         L0m+yL4HLRg9je316ejtyJ0R1Ml1U1m6FUbN4ehHpKrpyvwxLLq26F5RX2ZkgKgFcDOz
         9EV5NIvaynfTgOeIsGH/fAnvBkPl0/NJBw/SQ9BTND436eBWuttC5IbZ8bQWFTbqrMAW
         PCrgQFRek52H9fB4BLS2V4nLOOR+8Ni2KlMLYBpofAeYDvhc8o5FvLJCD+Rj5PETug9L
         4G3N4rlZd87djGjJF3cnyRUAjGPF5z9oEFySj/ljcZXoeUdkZXEVpXXxUcunkq3KRBLU
         et0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776528599; x=1777133399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hBoKfqeTMOQXuJ6MyKDYCsaLS536mqDbpCPC9AaeqIA=;
        b=G8BhYgyN65jU8cIy9Tn+jKZUWrLFSlBxuyzNvCdFoxekcB1nO7uQXWhgfbVwiG4LkO
         Yioc4kSRUXq+X7wlq6PLOrLM8HNnN0htaJclSOEq7NmkfQvFbdqOEsVRKyWuP9lS5Zxv
         q9sZbQIjoxw8kJi2ZZe+DxJD024UXJVvSzfaXXE0sivOl2iZN5RyvWdXcM8iYWXb0oku
         Q4svT+8rnnXxx8ceU/aFDRD6tvZ6d1K01z/KNk1Wapd5+9le4wb9fyXxzyhOzTnOyNoY
         YAyxqyvQ59cSyHVXDIQm2vLmGYc1fRTTuRNbxUHlMyTBbwGYniTNeVm4aPlna3BF9kjH
         c+xQ==
X-Forwarded-Encrypted: i=1; AFNElJ+NiL+cM3Q2jIyGT5G4UMtvp5p4PN8g/wG+7fweCGEaoj3BuOIn5LBUar6w6NQnwZcJqnXowPzOUgmNP+QK@lists.linux.dev
X-Gm-Message-State: AOJu0YxyCIjhFyEQXY8xmaE93jyCC5jC/XhVYWSWU9fwI6olsZ6kUtbu
	5NSgfPLXAOhg5TLZFxNUDkg9D8ER4zHyqGLfEUwhC9qhXVvfKW1wbtzV2CyP9BYpGy2lOLXjbNF
	hTEi0bES2g/9M7nrFoesZgiYhE2UlaLw=
X-Gm-Gg: AeBDietNCMRgMdTUP4gVB5kCP8wwDxEHjvkr+eDaqvAmk0rkaumXV1JUhWJSfBWUqZp
	0mOvxW34wXJs6gN9s+1cNiQTrH/78ig0TZkuV8yfFQ7lVjEJwLx3defyxw2gab1nU7KgfCv9kP7
	bk/58pP6Ut16mGUsL+5Z8tE9bAdBtmNj8OPt82tNIvMOtHWWBGJFo/NY4Gs+dLf79t+QjfSllZE
	5G7LKR4biZ979kzuqYM62FsqpLdX5PPrf898AFcNjIj0RdNn26ggjGGwIWnAwLPa5fTE3qpJfEK
	2UrayIxOz4Xtb39C6w==
X-Received: by 2002:a05:6820:4719:b0:685:dcfd:2305 with SMTP id
 006d021491bc7-69462e2bc6fmr2949086eaf.3.1776528599164; Sat, 18 Apr 2026
 09:09:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260418144916.361744-1-ochiyuma.ochi@gmail.com> <aeObTxN4LGwjJRFx@stanley.mountain>
In-Reply-To: <aeObTxN4LGwjJRFx@stanley.mountain>
From: Yuma Ochi <ochiyuma.ochi@gmail.com>
Date: Sun, 19 Apr 2026 00:09:48 +0800
X-Gm-Features: AQROBzAUjIRu0ejYTGNZi9DfxKhBSdP8cIBr2YPx-0GBwU28lgdBWRZUkAynqSQ
Message-ID: <CAHND0=C3M25vxBmVMXm833QeopsfdO2gYdnDkX8483A5FzLZ8A@mail.gmail.com>
Subject: Re: [PATCH v1] staging: rtl8723bs: Remove boolean comparisons
To: Dan Carpenter <error27@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 18, 2026 at 10:55=E2=80=AFPM Dan Carpenter wrote:
> Originally the parentheses were not a problem, but now there are too many=
.
> Same thing in other places as well.

Thanks for your review. I will remove the unnecessary parentheses
and send a v2.

Yuma Ochi
