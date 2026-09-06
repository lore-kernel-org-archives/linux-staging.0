Received: from mail-wr2-f11.google.com (mail-wr2-f11.google.com [74.125.225.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B1F374E73
	for <linux-staging@lists.linux.dev>; Sun,  6 Sep 2026 11:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788694201; cv=none; b=N7xaeDLvw3luiYr5OEhzATSOh7V52s/mT0+WXvMqROlRqTczpot85wQayLhi27otzNy0xFynutVCnP+NQV4+8m5e5F6En+nm39rswjVr3y60yTtLgL2n/FkT7GN7HU/kiRRKTAo1aHH2AWAZGhvxLlZhqpzn3/s21HYoBvmnPpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788694201; c=relaxed/simple;
	bh=m5zIMtZ5YFQEMMhs3C/zvyltUjDlWssoiKmGT7EnzZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N0m7uZVCWUwgyfvCEl59+wf7H/g5LL1xVyM5Yq+GXq+gOBFSaDdCbXBp9qkeECBFxXIm0Pkz5SPqpP0ZfGCXkmOdWLmCuo1O4FtwNoDEAJPX0czaS33TIts/bY1RJgYbItJIPc0rGVAoXvKHp0UWvUH3YQekixDfruOl6ql9yHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HR0XBB3/; arc=none smtp.client-ip=74.125.225.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HR0XBB3/"
Received: by mail-wr2-f11.google.com with SMTP id ffacd0b85a97d-48351e5bb47so828227f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 06 Sep 2026 04:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788694198; x=1789298998; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MDwZYC2NyL2X/osmWFuUErm3Hdy99QBvzJ4joBR30Sk=;
        b=HR0XBB3/CTdPMjkFZIk301Dwarjoe1eRf1rnhvObFhfTzOx6iXWEhCBipyFxMJun0z
         pAmnp7mXPK34foPKjimlymlJXKW9RiTNGNgV7ZfTL7NKb+c3xKXcd1OusReas7RHPXrA
         acLE7Jxm19MzBpS+V9ygmn9LKC+HAtunjWOu5N1lWwxwRfqO5w+pz5Bh1iUoP/G9ICO5
         bpEaOr6V1UI2F0ipjiuFjSrhC18JoZDjzQ4cWjGbkNh8h94kKSRj86n8k+RY0QpLuCYh
         IMCgy3wDVvCy+mUlDXN+/x329yNim8MoGY0TfqiB6tRSErYed2D9A+fErRp25mpDo0Zu
         ye5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788694198; x=1789298998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MDwZYC2NyL2X/osmWFuUErm3Hdy99QBvzJ4joBR30Sk=;
        b=M+Sc50GpVGOAIjNCj+RaigQOwSGi3nOx0inuJj9vukWGKUg5pKzBOHkotUgGa87nS6
         Bp/Z4v0HBNxWUByyORhEova3dEpiM7NtOmnUl+IHQPzdjvtSlTyfuVxugaLkXDujb2lL
         L3OWRn/ybjdM+upIgD5+Sq+9uI/ysOhY6e65roA6YAojyI6JO8nFBK3m4UzCps3K8Oap
         /4tPOx8YAX3tngljsyKfGrYaC2ul6mrkHBWYslLrXU2U1ZG7I9fvQhLEn7+uyVUPjENF
         mWHSkINWtmXW1y5BrpRxp2MOkQibH3V+k8iyP7TmGgW8jMX+jy6fh34nhizHFc5zdPPQ
         fGnQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1yT0sDmIy/UNt1F86SCcSyfV0NL6Dk2SKmHhA2IBvcCaxygIISKvyS60sNppHQ+T7e6Q+yp4WOmmRr+Bh@lists.linux.dev
X-Gm-Message-State: AFuF++m0C5MNIgZMlpX7n6L0ijIsw4X4VxLzlu7NODtWycpbvxGiWDp0
	DAhvhCGA/AUEigBCSvLHKut7/MQly8kFDqAJYFl6KqnrDNPsQCJh2ULN
X-Gm-Gg: AYBFou2HkRFe5HAeaBAKT4yXLWl5YiEoq+kD9PM9EeFMVu5xyELeNgCqW/RO8AyuycU
	ISBEsIkFjma8gXjqiJQ9fS+j7/t/XiJuz/4Jt78mVNajeV7CkGipn3R+6cYFOdjkDRtB7nRce/o
	s+/XMauo1AsO6wKC6Zadzn4lk+0VSNc+P7OzTIqOdcMjZjthdi2gMsvTZP60yeelzzICmUH2Ezw
	1r5Fjzxxq19RSR4ShNvvxif8O26TjHcDpQswQ63iPNCJGi/dbwdYPDVgeOGI40p918XA6Rc1XRS
	eIZt3+m2isJG9+lOyUoke3cPR0/Ae/q0kRu6NEoSCE+1bYJi71dv6CzNkD/Re8gyvWMfwp6Zz6k
	aOhNTsJ5hepBdtWqtXu8h56nWodJQ+1wNykriYdV2y5KVV9daxn/KJ8CKbxpqcESevb2N8C6pIB
	ue9wChKtopYWp2tpJO6f9rF2Y8fx4V32Q3e/J+Etcjiqfj7PBzMhmMkomKljGV
X-Received: by 2002:a05:600c:8b11:b0:49c:edfe:d525 with SMTP id 5b1f17b1804b1-49cf82417f7mr391687355e9.10.1788694197990;
        Sun, 06 Sep 2026 04:29:57 -0700 (PDT)
Received: from bera-gentoo ([2a02:ff0:c13:ea42:44d3:2042:c3d9:257e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7740d44sm510893245e9.15.2026.09.06.04.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 04:29:57 -0700 (PDT)
From: b9788213@gmail.com
To: s950343@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	b9788213@gmail.com,
	guojy.bj@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: remove dead 5GHz fallback in GetDeltaSwingTable_8723B
Date: Sun,  6 Sep 2026 14:29:50 +0300
Message-ID: <20260906112956.101264-1-b9788213@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906042043.1850-1-s950343@gmail.com>
References: <20260906042043.1850-1-s950343@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> This branch is unreachable. `channel` comes from `CurrentChannel`,
> which is only updated in rtl8723b_phycfg.c after passing
> HAL_IsLegalChannel(), which enforces a range of 1 to 14

	if ((!Adapter->driver_stopped) && (!Adapter->bSurpriseRemoved)) {
		phy_SwChnlAndSetBwMode8723B(Adapter);
	} else {
		if (pHalData->bSwChnl) {
			pHalData->CurrentChannel = tmpChannel;
			pHalData->CurrentCenterFrequencyIndex1 = tmpChannel;
		}

		if (pHalData->bSetChnlBW) {
			pHalData->CurrentChannelBW = tmpBW;
			pHalData->nCur40MhzPrimeSC = tmpnCur40MhzPrimeSC;
			pHalData->nCur80MhzPrimeSC = tmpnCur80MhzPrimeSC;
			pHalData->CurrentCenterFrequencyIndex1 = tmpCenterFrequencyIndex1;
		}
	}

In else branch pHalData->bSwChnl is still true.
It is possible to write an invalid value to pHalData->CurrentChannel with PHY_HandleSwChnlAndSetBW8723B().

Thanks,
Bera
