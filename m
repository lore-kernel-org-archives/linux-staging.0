Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0713CF699
	for <linux-staging@lists.linux.dev>; Fri, 11 Sep 2026 19:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789154485; cv=pass; b=fkgCMEzJO5RuRkSx8cTmUZjENgyAaOKDj5TE1eLwMHAme7CN+mpXqRNpsjgsxQUK6fE+cPKoHuSGfDeN8r7PX3BdXgags1uz1qqvnzqum7Is0eFabSgCKIB9xUAsTKARcwRW+Bs/77mQXIPlnC6gSL2jS9j+XysHC8s8PR48gR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789154485; c=relaxed/simple;
	bh=BOV4Fh+PDB2Z2rZvij7HgrPGo1mR/1Km77YpcS54GKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eayD5BHle1FqmJXS1Ww3fPDWSMbQ18JCsnhXj6kILw8Xhu4it66W5C2PgzoJfx7ampmRpypa2YK+S0TEnsexKIs6A8ccmnpzoF9/LMeyvBs60S8GmgG58+FszgJAlTlSTdnyPslpJvjgdhNuxSunmTRr02TPYsdpV1XudHI3y5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJNsvQ33; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJNsvQ33"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3964e480f76so1737498a91.1
        for <linux-staging@lists.linux.dev>; Fri, 11 Sep 2026 12:21:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789154473; cv=none;
        d=google.com; s=arc-20260327;
        b=Dq0Cj5e9cgvdrbrFD8FQnRfabWUt7Q2lRGIarAdk6nKwjntEpBhyN8WXmFhbsybzTF
         /oPeRPggLVl4jT9euB+3PgHAZlOtJCeE4QoMBQ/333d2AAyelwHdns9dJ00ajRXzC+DS
         jkVx5OvL6mK3TMQCFWtHe3Va3KDy5qDaMk0/W6FzTlsjR7A8uJBkeNIgmgArXYvpgH2m
         uiJKC8iC/x3BMwVYVNN5lgv7R16EzVrAauiY6ZdUL5JoTwesLo5axgdsmqXzXkyj4kmV
         p0dbdnc9UG10WvTXdHCRfoJHts7hsSOI/jX2wckv+ihoDJAtYoSfspiX4Iq0Eiem5HNo
         AK2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=E5tfA38f+j0POlE4iIpcFWR5pq2Vcd0sRoqvAs5ymGk=;
        fh=LiZcE0DIqB0BSw7KhfWrj1FMyW4GYjEl+m3eW4Ycwx8=;
        b=Z6moGF/D8PIL58V4OL/CgRDK7WcpoOtyQeLqf+wjgxelxiC1ZJfvlrE/iYCxxdkfkI
         dReaVgZgydjoS+YRk6rQKXxon0fG1Exq+3onwLeV+6Arks8vxI5VaMii/dwOAN6K7vsU
         1CHvu4F/qmaU/xblkolYdvqdRXhLOKIxgG/uE2LW56TSopfStfhl4otcAbN3Z8qTsElw
         gr8S+YvKsUstoqw2jKumK4JjpktQijwO3tp6mntWJDc6mR77tChXB2TcBMRqHbkUZc+E
         ZxpFTSPo8CMYMgjHLZIBvpsmQ7cUlDHT8mBRlknemoeP3Vx70HsZKTskuL7uRPeMF+n7
         l7qQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789154473; x=1789759273; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E5tfA38f+j0POlE4iIpcFWR5pq2Vcd0sRoqvAs5ymGk=;
        b=dJNsvQ3300QcYuJibFnifu1PPA7ar5CWlA+f5q8PlirqS+/EMix7OBQyag9DcrTUgS
         ayKjqVmYay+eZ9hgm26gd0K003y6yHijh38z9jJdvFY/PKU2BkGEk3te0WM9Xc6SbV2M
         e5CkA8y2Yq1vLCUxCIencdERiihEuYdHVV/xM76QcbJ+sD593EwjMt0emM5x1zhCujjG
         iNHDXjZyGeSCHrcy1yykxUMuMaleGdd7RaoknoErq2pj0C+iErPfqRrbTtjhHCS37LHc
         RIqQWIElIuJZh9doMJ5jNPAkQ/5koy9ftxZxbXlw0ojGjzFefgfdJ+008526Ulfj77vE
         ZA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789154473; x=1789759273;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E5tfA38f+j0POlE4iIpcFWR5pq2Vcd0sRoqvAs5ymGk=;
        b=DxVgiGNLK7RzpSJJOJ62Pzd5sTN9r0nsNU3jEp5bc94wNXVm+wLwTSBJKFmGxDFf7M
         zuvhTHqBEPrn2YL/5dih/UArjCjFzHmHVDZy+XC/J3Drj566rX3A+QVbdSbPcZ+0QgiK
         9RhQHwKg3B8IeNjHYRgyx2L556WYfBERQd8VxWDSnGf1o8LhCTTHxmGPxEk/rpoo0SOx
         3psYZTpQDEuGz7oR75keanZrhj2yMHDMYn7O15p7VSXrgEXWadKC5A1MOJYAxrMwrIf6
         jEID4azR9yW/caCk1Ny9yG7pm7+1RnBSZwh2Eq4XSc7zIfzqjABlFc0sSZmcVWvwr8FY
         4U0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxI8WgAwHtiehvbhMHvZwqu9A4DuVt+4FO5IrZZi6+YzTQfVrG7g0DULEOLsVeCegVob/WxZyAc6QyzEZEC@lists.linux.dev
X-Gm-Message-State: AFuF++l2dIXN+noBdOtyZaIlqZOgRjR7KI8jzyw7Ad51x0trfzPVgE/a
	nIhFrLjFdOXlG95c6FWkQP9pI806PzqvFOs9IWVOu1kuwiNYWVUV9vd9C8XyRQkw8qOdk77S1Gf
	cnrA4+1OYz3fjuoK4TMFPIjUhpV5tqEE=
X-Gm-Gg: AYBFou19H2kiHYAzqH9arAA/pPXRTdwKh2MO9AbL99RtbCYEKJOoMW9YofN6PL4zQrA
	RQTvkeT5hcBvY66aSE8bt4o3ieDXsbQXTXaRpQUMLMowCcEEnmGOPuLjNxnVMsaNRLLX6/TRuS+
	KY0MUZunIg2ExDQmr9jaPdOysypasaSbM3vv3WOHTE03GiehRSHDkTbnX1EzHPlcrRz1cLcNKir
	6LaMRXUALl7SxN7YvtyaiBZN9E7ZRZxZ8ysWsaYRJb49Ko9C4FeZMsjqATN0gOl/tas+nzJj3aV
	FMJ7DxEey7JoZk6hanUfv5Xfk8ecT2GYramOtRIf1yZ94JqlCgDhItUdCmKjnVa65ONybs+BbyD
	sJ0amOpflFRPd
X-Received: by 2002:a17:90b:514b:b0:39b:ac66:bbc with SMTP id
 98e67ed59e1d1-39d9bd5e466mr10210009a91.7.1789154473041; Fri, 11 Sep 2026
 12:21:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260910124403.95741-1-7israr.work@gmail.com> <aqKzBTM-CdBqQzXi@stanley.mountain>
In-Reply-To: <aqKzBTM-CdBqQzXi@stanley.mountain>
From: Muhammad Israr <7israr.work@gmail.com>
Date: Sat, 12 Sep 2026 00:21:01 +0500
X-Gm-Features: AcwNN1WeLF1JmgXP8K5-fB6_KWQp7HGW3iQihCXg4WYNpI5_-GaC74CZsxkWRZ4
Message-ID: <CAGKr8w2e4YGF41X5mv5Mf2FDvoezpzeKmFMKaHKf43eypCKdFg@mail.gmail.com>
Subject: Re: [PATCH] staging: most: video: add comments to mutex and spinlock definitions
To: Dan Carpenter <error27@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 12, 2026 at 12:19:00AM +0000, Dan Carpenter wrote:
> It's supposed to but it is buggy...  What prevents multiple
> threads from reading comp_vdev_read() at the same time?
> I prefer to keep the warning around until someone fixes the
> code.

Thanks for pointing this out!
I traced through comp_vdev_read(): list_lock (the spinlock --
the mutex field in this struct is unrelated, it's only vdev->lock
used for V4L2 ioctl serialization) is only actually held around
the final list_del() in the read loop. data_ready() and
get_top_mbo(), both called earlier in the same function, read
pending_mbos with no lock held at all. comp_rx_data() (the
rx_completion producer) does take list_lock correctly around its
list_add_tail(), but that only protects against whatever happens
to be holding list_lock at that instant  which today is just
the list_del() call. So nothing stops two threads from both being
inside comp_vdev_read() concurrently and reading/deciding on the
same list state unprotected, which is what you were asking about.

The change I am proposing is to add a dedicated mutex to struct
most_video_dev, held across the whole read() call, so only one
thread is ever inside comp_vdev_read() at a time. list_lock still
wraps the actual list touches (checking for an empty list and
picking the head entry, and the existing list_del()), matching
what comp_rx_data() already does; copy_to_user() stays outside
any lock since it can fault. The mutex handles thread-vs-thread
serialization, list_lock keeps handling reader-vs-rx_completion
synchronization.

Does that match what you had in mind, or would you take a
different approach?

I will send the race fix on its own, and once the locking is
accurate I will send the follow-up comment patch.

regards,
Muhammad Israr
