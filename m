Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089633DD506
	for <linux-staging@lists.linux.dev>; Mon,  8 Jun 2026 19:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780945691; cv=none; b=atneKewIENZhUpmsXoiql2rsqVqP9LHCTgEPv9FAWQ/LW4IwwDcVmhAfgYy+5hNl82Dk213XqZkgEfAJhDlGPT4ljV4RFsPZBOM9FGOHJxxOI7EeHJ/0sMWDvz3hDsEf55hnvmL2XUa2rtIGXgn0heOLrE8VATrGecdpDQqvaw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780945691; c=relaxed/simple;
	bh=mrlN8oTK1xCKFazv7gxjN+JMJKdR9jAYfIEr3zLtFSc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hHO22ck4qNhyezCgVGibnwMhlP8OoXBNsZQXnjilgVmj5kL2uu1e7TAcLDyxAYUjX4iprunaBZZtjJeFCdx/7CaBqRMp1gb2ph14FYxgR9AmmYUIN39kTM3LbtCC9i2WDq9guLHwwq1c+okKmCNLlpcc7ezK+r9pPXNzex86rPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3XEMAIk; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3XEMAIk"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4905529b933so50991845e9.0
        for <linux-staging@lists.linux.dev>; Mon, 08 Jun 2026 12:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780945688; x=1781550488; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zIpRmwEDvt5u/zq21xSApuv1AvoqyPfLmSADHW3zJO0=;
        b=Y3XEMAIkFOW3ZR0KwikFvZ0yql4b1Fw83PPN3mhnYAuL2AB3UxMcOzWTtBMIEvOP98
         B8Uo3RpoIEjPsdU00f1Hn5OKfiDQAk/BGal6SkBa5IVasqQK6MOW3edfJip6SQIcWn3/
         V66UyiOupRyKzvUGigMArGAuHCQkSAa9xyU5UoBDiSVaT/g5l+dnMi1hvvxIaupIk180
         BXBsraaaSXrsd2S2WWH5+M5zHDnrd6wZvXC9raAZT8LIsvK+FR+4EwQBUK4oTV7+j8ll
         sCVPkVr+kWBrNRYVBEe/jprVn3aqg8zl8mxDXjP3qapwI+yxUvq9V40qovkV0LidOWfl
         AyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780945688; x=1781550488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIpRmwEDvt5u/zq21xSApuv1AvoqyPfLmSADHW3zJO0=;
        b=O4521jQbuDt5Um7tNh8x/8hmeoZbLDDsBrcmAB+YXWD7DGf5T4LAZuJxzZC+cKYm0q
         iWTbbU6/sWH2MYtNjQjwKvr32ORRyJPEgjTPi3niKPI3YmS+ct+hN+TYEebgHJgH1yzZ
         UaFfUksABKQ7zJa1WRICjJT75WMt6O2nF8VHgrPPheyVcMP34xdNxVQe65QZVY+FYevq
         Wb0lsETjsmmtS6I44sj2cgLyscGQXV9psPOsZpahL7ppa2c31/SLGz0DR/+kItbKL53W
         hw8wFMePmfWpv1b0a1YkE2jiLreAtr3yVjD930pAknHsJ13ARAMs247MgbjkXUQFX29u
         +PJQ==
X-Forwarded-Encrypted: i=1; AFNElJ88QudVFj4vYBlJlTgKXH0/bXzUBB5cq35dZjbx8aK3ZuWpDLf6oS762daw737XnotOQvQ9gIbMrGYCBnpT@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7baDKTFgbZdDeku5s/nOs38x8ssz9GxQREXx0lBCtPa4XtrjC
	IsLBTwoOrpWrZAnVTVS8OXL5Bd7HmJqL6kOga6vYV3EZuhSpGmJfpRAPXUOtycYAGXc=
X-Gm-Gg: Acq92OHQXkdUk9WX4l5sc4w19hjrP0FrGv8Emuwt9FYTXLwN0t3SdO3SS6z4emklMnn
	zK0sR+YTqtKmMiBmD2Y5PWWmn6y3tLRklseL3C0UiXXVXp9gMRe2kKKwX3bYB2mLHwn0QxF1B3T
	B/npvtWaXinypH5+OG8b4LfdB9XWEpmCw+NgdWYtfWMLyaX1nR7IlR5U167okvAWpfugFVPwgZH
	KB3L4ZTCiBRYdW7VOl7QFuOyt3zgc86tCVxSDTyxpAZW46BbKHlAy3DnXgdQ5VqEyYYeBalwptZ
	aZwmdbj08vnBVu9ePfnBdXIgHOvvL6kPvITK71Qbvf5RaWw7PB4FdXIr4b222W3ou9pC5DXeJ74
	laR7nt2y9vhdwJKI0WchnDh49drwANoVwaKnjFaZtqRWw6cpU7F73zCcjIH10dv/jL7p7TS8W4Q
	HIy3gf0pTOgDjpbOOOnVe6RW/GsZ1bEOO9
X-Received: by 2002:a05:600c:4e43:b0:490:3d62:f5df with SMTP id 5b1f17b1804b1-490c25d24f4mr273799625e9.30.1780945688319;
        Mon, 08 Jun 2026 12:08:08 -0700 (PDT)
Received: from omarchy ([212.58.120.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc412sm56878622f8f.4.2026.06.08.12.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 12:08:07 -0700 (PDT)
From: Nikoloz Bakuradze <nbakuradze28@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Archit Anant <architanant5@gmail.com>,
	Minu Jin <s9430939@naver.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Kees Cook <kees@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Nikoloz Bakuradze <nbakuradze28@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: core: avoid NULL pointer dereference in c2h_wk_callback
Date: Mon,  8 Jun 2026 23:06:58 +0400
Message-ID: <20260608190700.85755-1-nbakuradze28@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

c2h_wk_callback() allocates a 16-byte buffer with kmalloc(GFP_ATOMIC)
when the c2h event needs to be read by the host. The existing guard
only wraps the read step, so on allocation failure the loop body falls
through with a NULL c2h_evt and dereferences it in rtw_hal_c2h_valid()
(via c2h_evt_valid() which reads buf->id).

Restructure the check into an early continue so the rest of the loop
iteration cannot be reached with a NULL pointer.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Nikoloz Bakuradze <nbakuradze28@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index c1185c25ed369..874970116f920 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1702,12 +1702,12 @@ static void c2h_wk_callback(struct work_struct *work)
 			c2h_evt_clear(adapter);
 		} else {
 			c2h_evt = kmalloc(16, GFP_ATOMIC);
-			if (c2h_evt) {
-				/* This C2H event is not read, read & clear now */
-				if (c2h_evt_read_88xx(adapter, c2h_evt) != _SUCCESS) {
-					kfree(c2h_evt);
-					continue;
-				}
+			if (!c2h_evt)
+				continue;
+			/* This C2H event is not read, read & clear now */
+			if (c2h_evt_read_88xx(adapter, c2h_evt) != _SUCCESS) {
+				kfree(c2h_evt);
+				continue;
 			}
 		}
 
-- 
2.54.0

