Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3D534250E
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 03:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775098876; cv=none; b=oUBN6FZwVSaa+d2Gh/QvBYKPuekMmaasar54iTs/E/Gze0scfjgwhT871fTE9uM0qz1vN+8bH/uM36iCThwuB1q0fYPmY0b7nCk0XolQUuZnpB3E7joEGjsTcEpi2iRitx7NqLdNKf+p6UvbbZ4s0Tz9gfjgaNZajVKBPgaWgfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775098876; c=relaxed/simple;
	bh=KqZ67dD99SWoAK80ThruMcz3YzSTHlJHqCGZG/V8Jc4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=PBPYdf1xSPqS5nQaiuxbW0tw7LEZVlPHY82QnvzweRxjwRdc07pJlre/hrRqQWocBzZQXM24UGInQmfrmQRfOmw8plemweus0ZYOHeUbMwy9uI9sjAybF6+ni9PqPcTWv5fZvszmjnWSOeYuNs/JL4nrKEJRj7ILEjCQpAhmofk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjIXjVAk; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjIXjVAk"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6501547d7edso458140d50.0
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 20:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775098874; x=1775703674; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KqZ67dD99SWoAK80ThruMcz3YzSTHlJHqCGZG/V8Jc4=;
        b=bjIXjVAkwO30NUn+Rc20MF4t2DFoLw7qOFI5TnHIjQnYBha5bqA2w2zo/bgkUZzA50
         4a3AJSHd73iZBUgMjhVtf+/Bg0icJ1azKpbc75waH7tOhsoab7WGNq367FhrEcsCOv4E
         nzQPKljglCYIY4HnM02h5WcX3XeNRcq4cAKDKytV27XqCWNToOZjIehrW9KkpIheWd6j
         DfitloKM0LoDJ0JKtTYySoRMrvg608GuSZ6u7JEmtN9T+IvhPjKZFGcfsmGPUa2yCe9S
         a/mwueyZg/jpWaJ08COmDkb75KxKvJQhN6KxH18lfR7eEtBeU6fn6ecqwVT0AVhWwTML
         epSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775098874; x=1775703674;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KqZ67dD99SWoAK80ThruMcz3YzSTHlJHqCGZG/V8Jc4=;
        b=DkKeRQq/nH8MYxjNg9+Hunjj9RThwLzWapWtM6QriTo0kIFAyZ+Ii33CMMXxQlqNxt
         qxwFwb5P3nlUR5vy85/m0SvSwwjpOZ5l4Adt3j1AZntJeXsFCp8RvWtlW1DFH1/ny6q5
         /VAEBfOxIbaL7XfJROrcTUQltnsc5OA5eSxpRmV1kJkRikcDx/wkpI/y2rAv6JwG3waL
         zkDcbDZH3VhOI1puuhRmj72+PPVK7OIyB+rvzgFwEUda2V01EZ7BjznKJL9vF4bmQl/h
         NxmrA/V8PFFDPfCU5tTgfrbe79O3gd9DpqNrAKjiEeEJ8UDf66HPLYF9Jfw6dJ0x3F8f
         jWLQ==
X-Gm-Message-State: AOJu0YxYRedtX/GyirGLW4cmMFxzwxmDGQjFJIHDJbJwDdcNyqVmw95e
	Wq3MvbH/mYRLve5d0L0+bcoEeQ9qPs7ysEndq8FxAbEjJCwUz88H7dZL
X-Gm-Gg: AeBDiet2wu81N258mwbQaCy3hsOln98p5tHwiHGVGGE32eO4bDnLCl8nK/1eo3xkoSj
	uFjxvY9yNzGYHJX4U0Lf8sTlRTV/bagzHy5Y+/hqoEVUApsRfYUlBKHbxU21dvWo1LiZe+WuS7d
	aAAITXmD6f+6tto23NkHt+Wzt313xLGbAcjaUp8UIdftcMgwx/qRLWNF2QSYoZt5Y0E9d/aEOUM
	fQsWE7qmlxslzL9rzj3f3LMCPSfu76K3Y8dOWDS/rZbo/1PFiEXyA7DZ1S+mud4rcy7Z3gTwj6W
	TmGEpgx1fuLhMTtU8mxi5FuXZd+1u2te9fRdcW7AmRRbB6XkuOBPvUzRj5/M7Hfr6mbEbVecUg6
	I2sMWuueB+p527U9XetiF9NpSIexr6vKm1n6jutMJoYNSrMEWfyngFDz7pygt7SpdgLt0FUoh/R
	5wMDQmlvn1X1pzN2KoSaiSHCEj2e7HDOHs/ZiK5WDxXfgYwxyeA4VvR+qkk7sxydvHqZ2AgeLlA
	SCXP89rH4V1HBGyiq9sZ5lOq/v96C/V
X-Received: by 2002:a53:d0d1:0:b0:64e:dfea:ab65 with SMTP id 956f58d0204a3-6502fe4ac73mr5025946d50.43.1775098874021;
        Wed, 01 Apr 2026 20:01:14 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6503a978b7csm711733d50.11.2026.04.01.20.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 20:01:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 22:01:11 -0500
Message-Id: <DHIC17WZQBN1.33XD5KDW2O0E2@gmail.com>
Subject: Re: [PATCH v4 4/7] staging: rtl8723bs: EFUSE_ShadowMapUpdate() ->
 rtw_shadow_map_update()
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Linus Probert" <linus.probert@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260401190814.216333-1-linus.probert@gmail.com>
 <20260401190814.216333-5-linus.probert@gmail.com>
In-Reply-To: <20260401190814.216333-5-linus.probert@gmail.com>

On Wed Apr 1, 2026 at 2:08 PM CDT, Linus Probert wrote:
> Renames EFUSE_ShadowMapUpdate to rtw_shadow_map_update in order to
> conform to kernel code style.

Your changes show rtw_efuse_shadow_map_update() but, your commit says it
changes to rtw_shadow_map_update().

Thanks,

ET
