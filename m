Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EFD308F03
	for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 03:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773371326; cv=none; b=Dck6onkoDB4LLMbVFsO8ElVnSdadt5Yq+/EQ1VmpSMCmXzjvrt1uUVLnFO+NZdRZs9teOs6fIONn0hbwftEQ6e2352/8V5d2v2Z8amiwSKqSmo7b04o1CnGKwmE45BkZlrOP/KH1wZTQE4iPIIx6ISERzHI1A1k+ny+sY1NMt58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773371326; c=relaxed/simple;
	bh=+JDz3thSoeMt+9l5jBzo9srt/F/Vrn38AoYBJxph7EE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=MhDPemAbHt3Hq+tsKpfD3urKM4dOLscbb0YPrzICwkeT+Ll30fNWo0LrSff2+6qyV2/rq72BM42WDp39waaRDTP/smRshSinzwomtGEOUODzsgPx8nZoOP0XsMI5+eMeTvNyW4z9YL0h5foD6BvoL1Nq/CLSapiSshMmRcecuYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZqA0Dats; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZqA0Dats"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64c9a6d6b70so1549355d50.3
        for <linux-staging@lists.linux.dev>; Thu, 12 Mar 2026 20:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773371324; x=1773976124; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JDz3thSoeMt+9l5jBzo9srt/F/Vrn38AoYBJxph7EE=;
        b=ZqA0Datshhq2rjyTJyzEuOteeXuyaGZjxbQ3n9YXSDh19nyUzkYyHxd9cz4R+qUvT5
         1hGiNtLAbt68iRC+DsAXa0L6KpMo3hRrCyWtWagE/psNRe9UPbp1xIwwHn6U4mJeHPKb
         Ac8alX3y8V3GcgO4D17r8t/qBk4CJlu+uOMnCTq/rxC8b/qdopcbJE00wFnz1l0PWVNv
         lHr9MdfK94T2ge0v75TycjrU5NwofW90++56V9YO3hqYOap/Tjmjq5WLL83oqFGX36qP
         fcHrKmUKmI0y84anPYnJ8vmAOmtnNIXYLpGOi3YsFQKVnyrJXgkLqgBCdynkf0k78LR/
         GxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773371324; x=1773976124;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+JDz3thSoeMt+9l5jBzo9srt/F/Vrn38AoYBJxph7EE=;
        b=m7AwEMHx9NKOmbNNeWjrgIbPjKUu+B1z3fYds6Wg5jkjT6Rz4QSJACBvp5hl2TYsex
         G9AVzhbwfvA8XpwJ3PC+7dsEkmlgHOTD05b8ziEf1XHwQl4IgGaQXtjypTlDoj5ylUpw
         hTReycX3dVaPM24/Qh8kD/7JnYOfQ2nzu9v5dOG8RJJxoc4EbXbSOw63B85RRQ5wetxY
         zlOId2E4AIF12eYwwk/ZE/SVv0FvJZQCJS78yGYJ0TJKsrgfey6t3oqhQyRmeF6KZVLe
         6UJhnm6ban+G5E95M8hGeN551pWyv85SKbbBoPCMTd/rCrfb1Z50OlZo+V3Wa+Y24a3T
         vCIQ==
X-Gm-Message-State: AOJu0YzX0T1BSSyIpus7oeKrqIagbVoGlcltjoLjBuYMr0/yfMCEEozg
	8dPIrnIr7seYZvusrxuG849c5ct0foL+6OFvUWsjUkLsEEc5O0XIAojU
X-Gm-Gg: ATEYQzxKuZ5reav16Pn0PqU8Ql59IpZnBV2EXvGh9uZ4R6pL4zt+dPYz/tBdeT5+5eI
	L/holv7ARVQYNF323qN988BVpwx4XOvCrQmo5Zc8u/h0PZEq+qKfIERqWNotyeSSDykueJS5HvT
	J3jR6IbbMo1huCF7cPqjVuHVPAspMendJ80eOhuSCeFg1avFlOW6fEkyhBwMIeA0l++SJUKcAuD
	1IOV0wTG/ueLFpqQPjDyapCLKIyJWr2jEd50LMnrZTJwPhHUvSKdUuIF53naZCyEKqft09UKlxd
	kVknNpjTPn6SduJ7yyGwqe9uKLDfX9OQm5PUK+A18Wy7yDAJmNW3D+BY3xUhy5GX4mdPSLnJDoE
	/c/USs191NGYBwuimr1uBSRIVcRkb6w0VluwGGuDnSYcj05Ms3w7Hzrvmx3dDVG0doqA7PFv+yU
	mjmEfIjxgK7koWwuVj79PsH7LJWnedHe+eKvkE6k2EO6XFt2mik7mHAGwuAU5LpM5WberoZu156
	oYnE5NXM4bXJjfB150mKUNE4cYKrp0gS0C7TGgJ/O/x0VYdAPp8v5a5vdO2g0dl06nVQUYGzio=
X-Received: by 2002:a05:690c:1e:b0:796:210b:f31b with SMTP id 00721157ae682-79a1c2088f8mr19259697b3.59.1773371323962;
        Thu, 12 Mar 2026 20:08:43 -0700 (PDT)
Received: from localhost ([170.199.240.129])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917f1ecd9sm40856817b3.45.2026.03.12.20.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 20:08:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Mar 2026 22:08:41 -0500
Message-Id: <DH1BO2JPSAW8.3KBPTDSIR9NQA@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <ethantidmore06@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: Remove dead code
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: =?utf-8?q?Bera_Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>,
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0
References: <20260312125337.1050-2-b9788213@gmail.com>
In-Reply-To: <20260312125337.1050-2-b9788213@gmail.com>

On Thu Mar 12, 2026 at 7:53 AM CDT, Bera Y=C3=BCzl=C3=BC wrote:
> Clean up the dm_odm_t structure by removing commented-out members and
> related legacy comments.
>
> Signed-off-by: Bera Y=C3=BCzl=C3=BC <b9788213@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
