Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDFA28E0
	for <linux-staging@lists.linux.dev>; Fri,  3 Apr 2026 22:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775255552; cv=none; b=SATeXbQ96B13MUYDT1Ok+HOSt+OQuNwf8NKX/++1qfSM8MKRLOM7PESOaEFYwoc3nGH191ahupin/zBcpmpCocTYoCsnvet4m9aEyk+KtTLJhJkEvEXS54c4+INPs/MDCU4AQ2UEIxKG7lKQZXFMYTk8eIkLlp4MaX0FbjpMb6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775255552; c=relaxed/simple;
	bh=ET1z3fDqPnotUmNTky9pKxtNHUywc/PNvPnXxW0uMes=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YLcutnIN0Hy99Ptw65I5TaJCfCz4E4S3FWEFj9W2PhGtmTvkm2X2DZuYxK1KbFVUxvx0T8lfuAaL6n4U9IFIJOE+seAxoo/PCK3fPbryjRjlo4lwdGvh4eRq5ALRQ4zT/JKRMOZqOLzFtJR5zOxVAqBGcrLmwEGH8uTCK/Z7xEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MXCrsCON; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXCrsCON"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a2c981e5dcso2170509e87.3
        for <linux-staging@lists.linux.dev>; Fri, 03 Apr 2026 15:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775255549; x=1775860349; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/0Qx7wRnRy4m49I2DvoAj8wD81qWeI+G7vfBRggcZYs=;
        b=MXCrsCONI88AbHV+m7oheL1LWwxfcJrFELzp+k22rX0Hoiw8CslSzThGXSFUHy6sCY
         rHLj1hBrk+raC7RZ9ALm0J3WqXABOiwKAlejFqqkfcIQerOIhR+mbrEKHtsKQkAN6AHj
         rk4D5+DgIyf6RFgUvRjNAYu2FCsVZ5L/8FUbsaV8t0OWkzn+qvv1UPO+WU+HSGVrfWp8
         QGxglb9fqHIyCjxR+FdyX4qsNQ+OZeliCuBl2NfP1PkwAm2utGN5/BkQV4zTxg1CBJUR
         OlXSalYPRwW3HgR8HlmYzw+qHaitd9NWNuckpN5rBglM6EC0Co0YFdgLjVc/QAiSINX0
         QaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775255549; x=1775860349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0Qx7wRnRy4m49I2DvoAj8wD81qWeI+G7vfBRggcZYs=;
        b=B0zb61Tf+5Nds2gdv/0+dDxhYm5qYbQXt0GP5jg8EaNmcFT+JkH0o3z5Ivm37+9aqk
         h46Nn2Bij7KjWIVWwBs1hMz7BsSxAbAzq+CPIYdBhDnatGqoV0PjS4wHRsCKH6T1t1gh
         +c6Xc3QnegkySth4BsukIDp6EtXu0NO+thdkrC0ENEUpAR6PUYCozI59uY3odbsyqsCb
         D8OB5jatII96WAO9gZSj4tScKtUqXTGg88JGPR2Iw/i06cyj4PRXF4/jswHABN9WZrSE
         Sqejmd6m3OGGi8Or0iuNUxS3rVJYINTmIJAIqHSVru76OTH3Uw5Et01vwRzhfIBZZj3N
         imwQ==
X-Gm-Message-State: AOJu0YzYJL50/cLUI3lsgkoW7aGm7aVfZQmk5nAMSgPwbnxOC3wEzXxj
	rlQL94LSRGmqbhCUHh4ZV/Vpjy6U/IJQJ1LZnAalgUtZH+FovbVg89Bp
X-Gm-Gg: AeBDietoFcUxDSY24jdPEOqyA8LfMHzo5YC4VQcJxULFtJZUD2MC2hKpyhSxb552LPl
	g3AnHL5UYpPccVyXuHLgPmOmIga04cnrCzMOxwKfWivdgdRusSte9Gw5Pq65bHxwe14QGyvEsG/
	XG8mFNg1bEK8VDUrxd+23SqIVT6FzEqzZv1mCGpEWgcjbDLT/HVJ7sqbRCcdqEJFhpBZnuGfFW6
	2c9JnWx6ZktL1iFhhpaKr7Az0hKSQg6eWpQ//baQNAxtwhb/WcxZ5HHjO6wkzQUYz0w5v7TZnef
	MgNqmBXBCkYUr3sUbsuUJvfv8u8rEl/3LxPTdMlHh0RkWqmFFryakSkAH0EU+1ZKhUC5x1u/kRl
	mGfpxr5iJBHKFx6d+5CRlMcXLjBAlStHm35eQC9UVv7jKAKTitPuJa/oZkqlTgow3rkJEPbeo37
	PU3c7xxYyI01uNI3EB95sNW45SIKZO1ip+KOS+c92SdsiTBHMBkewiI6mOrHu5yP4=
X-Received: by 2002:a05:6512:1153:b0:5a2:bd2a:5b44 with SMTP id 2adb3069b0e04-5a337564378mr1175114e87.10.1775255548719;
        Fri, 03 Apr 2026 15:32:28 -0700 (PDT)
Received: from localhost (94.191.136.33.mobile.tre.se. [94.191.136.33])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc63cfsm1706270e87.53.2026.04.03.15.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 15:32:26 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v6 0/7] staging: rtl8723bs: rename/remove functions
Date: Sat,  4 Apr 2026 00:32:15 +0200
Message-ID: <20260403223222.1831072-1-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renames global functions in rtw_efuse.h (1-5)
Removes a space before tab in efuse.h (6)
Removes two unsued functions in efuse.h (7)

Changes in v6:
	- Fixed typo in 3
Changes in v5:
	- Reworded subjects in 4 and 6
Changes in v4:
	- Distinct subjects on renaming patches
Changes in v3:
	- Furher split renaming patch into separate patches
Changes in v2:
	- Split patch into series

Linus Probert (7):
  staging: rtl8723bs: rename global function Efuse_CalculateWordCnts
  staging: rtl8723bs: efuse_OneByteRead() -> rtw_efuse_one_byte_read()
  staging: rtl8723bs: rename EFUSE_Read1Byte() to
    rtw_efuse_read_1_byte()
  staging: rtl8723bs: EFUSE_ShadowMapUpdate ->
    rtw_efuse_shadow_map_update
  staging: rtl8723bs: rename EFUSE_ShadowRead() to
    rtw_efuse_shadow_read()
  staging: rtl8723bs: remove two unused function prototypes
  staging: rtl8723bs: remove space before tab

 drivers/staging/rtl8723bs/core/rtw_efuse.c    | 22 ++++++-------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 33 +++++++++++--------
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  2 +-
 drivers/staging/rtl8723bs/include/rtw_efuse.h | 14 ++++----
 4 files changed, 37 insertions(+), 34 deletions(-)

-- 
2.53.0

