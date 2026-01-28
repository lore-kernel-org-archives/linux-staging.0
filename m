Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4031C3F36
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 00:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769560826; cv=none; b=u4flEfJ9KVyIOxJKiSTV175+tLMvr6NflSH6kxt9KeSaDrmgXLNtu4Rrx/ur3MGJbCgF8TwVARfk9sj+Smr+lVH6ZfQwSx74TSzAc4qwl4dSfGIz0eZNxatbQdw2l3l8ks8h78JyB9wAalCL3jHSyqeesA3InvSAeNYN01OVA8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769560826; c=relaxed/simple;
	bh=yaZ5PpljRmTHUP4oYOKpdESHo76z7vfALV8v/LJqKQs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LpvjvYAWRA9oOkkwi4jfD96vddIM+TrH4ukkopuvkRX0qXBXFkgYDfyiKenuxMU/Ev0a+Wq120iXnDzoejtr/7Cxj64cuOW6HcdkEnDJ6pNRDyq3Akh6W769yd6NDiTBbbG/xirOsdD8mW1RvfR8uNuJWaxoUuDJmFbezqYvxHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEkvO3zc; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEkvO3zc"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7927b1620ddso7060777b3.0
        for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 16:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769560824; x=1770165624; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DzfEXumtZpg83dTzGlW3IyQ9xV9vT4Br6uHqRbeZ4Xk=;
        b=UEkvO3zcPi11PAsjdiSXr+zgL0eYx+HI372BPZL9DEdFpwv9vzHx8NkrLjTIf11Vh+
         PX4TALJIjdlbRc714MdK/KPwK6Hfko1Sb+3dWiLcKExTlTr0rzMzIz/Mvpm1HZ1KSTRi
         oV5uMGaWRY+fBTnspa3Urm31x1XTGeB7RC1FUEIx3zjTs8CvQQS+qZpMkDKgEWyhZIPa
         8Al7Bo0eb24ohPmxiuEzaFHEuNhFDdyA2Cp6w/WXZc79pdGw+XIEfq5wVlSXpOg/2LMF
         GLgeDlZfDhL4Iq9Wm90fh8afwKXHRib9fBv7kB66BprcDY3ntKzm+eRcR4TseAiGsAAb
         yM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769560824; x=1770165624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzfEXumtZpg83dTzGlW3IyQ9xV9vT4Br6uHqRbeZ4Xk=;
        b=lXGxd0f3Vh4C8vwtG5ionrkZ4KqgiqAGn2KAvq6k5dQtE3Gq/QvyJ8z9DQGZrQJkzC
         OK/I2wItXSUzKwCVJ1sob02WVt0B1mYIJs9+CP/kb826rySa+enhBTs2+z/Kdc0BsW7E
         bp10qX88mItfZkOp6fofBFFu2uuJJ+cIuk7sr2vN6oSad6AAADt75Grqq0X3TSCkrR3z
         NPfdW717MX5nQKx+b4sSURslctnB8PvFP74pQQGyKN3oCJHiYh96i5NRvChvEkQ7qvCB
         567rUO5TsytBDqvG0TKBtubKTfHhMTLRLdUXMA53N7A90sg4EO4U42RQ1goCwMzORgWK
         6JsA==
X-Forwarded-Encrypted: i=1; AJvYcCWFH6rBVuAWHZMEMwNJIB0WNr2wMlAVQE4PzeUHIQ3Bt4uavhPJICfiC06B8Q8VhK2T3IJISLSeKCz9V7UI@lists.linux.dev
X-Gm-Message-State: AOJu0YxvwrSRtETimywfgOXQZZcnw/q6c3kpSymguAOkaBCIKe89CalX
	TEUHCxf6Yt78gElyYCam717I71vyUc5U1gEDFrF23R0UuHFPbuKHDrMD
X-Gm-Gg: AZuq6aKp7yYLa/1AzznhDo9+UJ47EPtuNkODevEHVTjxmq9ZkrgPeYCDKoPmPYgA8wd
	s3vmtRqQtw6Ry+/+QCShSVpRSdkaD51XdRzlKs5dsHDrpitGsmAO0tTuCWgTATKXnHhd7cDOgq6
	AG45JBnMtKp4vUrtSwJmRvoTURyfgZO7yZL08kqrH5xzAIX8H7qFX7lxl12h9bShezSV+bTDiqB
	cVvOxUveRm12mer+PPtpKVUhEuXSRrpHpLBbbBtrBOm+7z35lTsXbCAFn6Lpblv/JjGYioY+IOP
	9qyZQTw+/HIeE5ZtHOnw8bm09/GrGdeKwAMZ6gUaG3Iswatmwb7VYbrqePs4hRAJmMzckXcZqSS
	42U2TcoPFw8AaTWCfqgIg/fnQ/oTg7sVNFzVE7bq1tWLPr1q7pguYkk4fwGLL3rMbqa8=
X-Received: by 2002:a05:690c:9a84:b0:792:6b9f:1ba1 with SMTP id 00721157ae682-7947ad2352bmr25256447b3.23.1769560824004;
        Tue, 27 Jan 2026 16:40:24 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-794827625d3sm4791867b3.11.2026.01.27.16.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 16:40:23 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v2 0/4] staging: rtl8723bs: remove unused diagnostic
Date: Tue, 27 Jan 2026 18:40:04 -0600
Message-ID: <20260128004009.51095-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series performs a driver-wide audit and cleanup of dead diagnostic 
code within the rtl8723bs staging driver.

The vendor-originated code included a variety of diagnostic counters 
housed within 'struct debug_priv'. These counters were updated 
throughout the driver's hot paths—including MLME, receive, power 
control, and SDIO allocation—but were never read, exposed via 
debugfs, or utilized for any internal logic.

This series removes the write-only counters, the skeletal functions 
used to update them, and cleans up the resulting unused pointers 
and logic blocks.

Changes in v2:
- Expanded the series to include the removal of RX FIFO overflow 
  logic in hal_com.c.

Ethan Tidmore (4):
  staging: rtl8723bs: remove dead RX info reset logic
  staging: rtl8723bs: remove dead RX FIFO overflow logic
  staging: rtl8723bs: remove dead RX sequence logic
  staging: rtl8723bs: remove unused struct debug_priv and all counters

 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 12 -----
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  3 --
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |  6 +--
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 23 +--------
 drivers/staging/rtl8723bs/hal/hal_com.c       | 19 --------
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   |  7 ---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  4 --
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  8 +---
 drivers/staging/rtl8723bs/include/drv_types.h | 41 ----------------
 drivers/staging/rtl8723bs/include/hal_com.h   |  1 -
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 14 ++----
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  | 48 +++++--------------
 12 files changed, 17 insertions(+), 169 deletions(-)

-- 
2.52.0

