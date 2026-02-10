Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCC92D879B
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 03:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770692818; cv=none; b=s1ld8ZGdGk0qmmOw8gmJc5iIdQEzDdBv+NFkLvV0F6ZGK0MKN7um+OVrwWCzGLC1tQDTvhB+QYpbwZlE4ATnL07Xhm/FcT+xWCFdIJSHK/3M1hH/8s1nUhs441+KEMESjd0ehG9zKorEkagzp704BBAAd/5pDZQHNwkmfCDfD4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770692818; c=relaxed/simple;
	bh=4nswuDhOPstEbQq7yGg6P7Fqhzry017VswhB5AoaWSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ThC0kc7patKDxBmVv2ZDVy3JmIl1+8GB/duJasYFiziOcZE5V4BLoIgtmjFISBtqThM3VolqivMvVDuobqIXcuxgroPiDpCjvIGCzHPbWv4E5ezgs7uS4nHgxwqutHvWTVpKvl7Q2ED/wGSfbNVgjX33HQV/a9+BB5v/1ZXXE0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JJgMfvAD; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JJgMfvAD"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2a871c8b171so2002195ad.3
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 19:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770692816; x=1771297616; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tUfBKjWhi95Dnxl4hPHEjCtAYlrQ8OeYDkRNpts/udQ=;
        b=JJgMfvADlOCmr4DyluFqkcwIB8Q+zceLwortbf3GE33ZBjQTKoOXZMCzpAH6DbRhn7
         fEcMAfU4Oi27Ju3NybXWEnJujAlaD2wdi0mKD0FQVVzYBb0x9rAhNopcQPMAPoTZqQ/b
         5kfvYz7k7MtP96NZ3Taumr4PgSIraNbUqX/hsqN6OrUnUMoXDa2dxFy4mHaAjAKt1dht
         VOrurP04riGL3LLagE/evaWDCyMV9pDf71ZaQVBw2CAL6TvS0uJeWHn6QI3Nn76kktqF
         uJvZOjymtXmYswUy825Lyr+gIL4trImqj3yIiS8/vD/T0JlU1ruf+C7eRK95+Fw/AdpQ
         KlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770692816; x=1771297616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUfBKjWhi95Dnxl4hPHEjCtAYlrQ8OeYDkRNpts/udQ=;
        b=Xk4Dqkp0Lr83oMnBQjhNDnnK0rSfoTzuPR52IWtJo9sZ3AeqKz+8U+VBwnpe+VsJIt
         SFE9/0hmQqqlUUXL5dfsjCG3Nmy/9GkPqc2ivY4sa5XyyYSzA2+FqVvshw64iwJ64da6
         HovkmL4jHPZZHhuFFEj7BWhuOUk19sJVbxjh0Nu4MqMJdXc4Xct5olg2LrcpQCpMkm4i
         3hECWpaNFS2B/zf7XbwkHxLU32XWxXEVprr309QV7jPlqFcuU6F1jZ4iXv0cJSOToKf1
         7pFs2pR7iglQ0FeUFMa/rVwMC54mqL+R3zTw0LfKV+QPk8e6DVE/ag2GkMgny2nJLEJv
         q9oA==
X-Gm-Message-State: AOJu0Ywhs8bWTd8XREd8dmkDOQv32XfpDRbr0ceBN0Sd0WmiL1xoqjJN
	RgFxlaTMH/jDRheVCa41wMH11nYp6J/CCIV2DBiHlNY8wOLVlgDdXp6nzTowulj/
X-Gm-Gg: AZuq6aInW04ZBtSqGqSCnfIMJN7uy9krkUMzTmQ9UEZl+Ys3slm3+YimS5uu2yvlmap
	YoSgvPtJ/i2Hpg1Km/lMZDHfMe8kaoiKsJxgD1ytZd3Zq2rS9fRyudAFXYbwU8cosuIC5/Ql2by
	C6cG3Kc6yuPhwVEKFnWmGylft7IEYSwrcJQf0fQg1pHAgqPjNKO3rWp0f9h9PiND+F/IKbAEDOO
	EIU/ztmVnoGp0kgvugSofB9KG7JTgMltRLk+VdvdT+Xrnua8cLDOLvneTTqS/cNTnLAAgo5hfEa
	dphLNpmIvODqKKJNVFQIm0ESAi5IhgzoWdymhdy69qdO9+bctowXqUNzyPv90gJTVtbz7qSxJGR
	FH9j9OCuA03kkYcOvqHqtfPsDQ0+KBjVVuDQA0ftf9VmpA6eL6BgjWhRTBu50Tj+eXIcHi0Uyu+
	XJVWnRSm0XLEqIL9Gcf9URhBBKRJ8f3g==
X-Received: by 2002:a17:902:e802:b0:29e:9387:f2b9 with SMTP id d9443c01a7336-2a95165cb27mr109193585ad.24.1770692816227;
        Mon, 09 Feb 2026 19:06:56 -0800 (PST)
Received: from Horstaufmental ([1.47.25.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c809desm116248265ad.30.2026.02.09.19.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 19:06:55 -0800 (PST)
From: Siwanan Bungtong <horstaufmental@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Siwanan Bungtong <horstaufmental@gmail.com>
Subject: [PATCH v2 0/7] staging: rtl8723bs: remove unnecessary void pointer casts
Date: Tue, 10 Feb 2026 10:06:00 +0700
Message-ID: <20260210030607.1430567-1-horstaufmental@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes redundant (void *) casts across rtl8723bs.

C automatically converts pointers to void *, so these casts are
unnecessary and add noise. Removing them improves readability and
follows kernel style guidelines.

No functional changes.

v2:
- Drop file names from subject lines as requested in previous review.

Siwanan Bungtong (7):
  staging: rtl8723bs: remove unnecessary void * casts in rtw_ap.c
  staging: rtl8723bs: remove unnecessary void * casts in rtw_efuse.c
  staging: rtl8723bs: remove unnecessary void * casts in rtw_ieee80211.c
  staging: rtl8723bs: remove unnecessary void * casts in rtw_mlme_ext.c
  staging: rtl8723bs: remove unnecessary void * casts in rtw_security.c
  staging: rtl8723bs: remove unnecessary void * casts in
    rtl8723b_hal_init.c
  staging: rtl8723bs: remove unnecessary void * casts in
    ioctl_cfg80211.c

 drivers/staging/rtl8723bs/core/rtw_ap.c        |  4 ++--
 drivers/staging/rtl8723bs/core/rtw_efuse.c     |  6 +++---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c |  4 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  | 18 +++++++++---------
 drivers/staging/rtl8723bs/core/rtw_security.c  |  2 +-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c  |  4 ++--
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c  | 18 +++++++++---------
 7 files changed, 28 insertions(+), 28 deletions(-)

-- 
2.52.0

