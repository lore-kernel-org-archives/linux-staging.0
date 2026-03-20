Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8EC30BF6F
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 18:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774029903; cv=none; b=Tw9eafh+jFPPm3GiNkJyw8U7tq3GF6V9U8w6YEI5s31OTxELvJDAzL5Fh5tJIpMapR8nPWP4b39kIosUZ1S68yxiWkxn1iVE+GP9ATRAOqOlQkBAAfqDfvYbhgkungOXFBNN3F00S/gfX54RDwasTMOJsrnR0jxZPHFeLKCKvNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774029903; c=relaxed/simple;
	bh=7BfMDT46qUZnhZa+bZ/zj0UzZabE1h6EQzCpLCH81As=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sLWi2RdQ3pEYKSpG5Xt1kQyDK4EN8187Tpc+MlmFgvVO+R83keRZUdh94t8ihq6DE2Mf6xQ/lonIPeClpTnfVBBZKm1l+CtsMddM7KIBTsEpF5m6EQhiPQ0ZlDXJqYQbaYfXiWZPy/XZ9lVto9TsYndNe/zBlhgMbkBnJrwwV6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HluG5Syz; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HluG5Syz"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35bb7623717so150297a91.3
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 11:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774029901; x=1774634701; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+3uuxx+BeQSGg8NcY75Tane+2CTuT8SjXPGbNYaB1B8=;
        b=HluG5SyzEFAhu5vBXQTEkMnRihJYYx0bgPOf9+AdMF6/+O8gZyQ2xI6mqwPIQr+v7U
         leweKnqq6/nilh/ljeu/vu9BCfZN5fNmPibNrVbxXflhwpE4R8lZrXtNXibC/j55NkJW
         lDx2JDP8YbC/WI7BqQjh8eggq+a2Fyl6zfOeYH1CyrIbDLjTskiUV5k0D1DOfN4fk+mV
         0/VCDlRbEVsZ8BZsIH3IDJ3HYElb7dZkdCiE6UznOUzH0dcGBs6o5xkmCan92zEAWMr8
         vhl4EB1hZMsczS2cNctL6MKTuAQwUhQBzR8D0uPJ9ejVqQcVCIVLmN8eqw8mP0T+ek4h
         EPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774029901; x=1774634701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+3uuxx+BeQSGg8NcY75Tane+2CTuT8SjXPGbNYaB1B8=;
        b=h8UhWI1GZrL6S/c/+jiEoDTmSPzluER9pJWjB1PuSx5LEG9Uq18ZAaIGoXDzfrTMG4
         zKoQk0nKOBKopWjdTsNS+WUAPF8pmVkNp8jDxK1geia7dfF4XzOz/G4lp6kDczHNRlY6
         6OyNGAXYbXLhd3O9Ya39vCB97GY2G+olf5be9xdBQHqQxRuDUV7Yn9/KwqKfbDVuxPkJ
         Lgt3TlQF+m560oEZRckWKSxCsblhmbUjM/6NG2ZMOygdppDRpop866fb/LrsECXFCvRo
         J+xaPjVXbpMt9KQ6S6b/Czut89bU2LwL0CnrTRn0c3GICOlG1L/yHBNoIEvmHVL8zcjs
         vsQQ==
X-Gm-Message-State: AOJu0YyaGt/zIFcmNJ4EMU6lGg3qqgxphGwdWlRHoJbE0YEEF6cLDpeu
	g6l5v7oEEL2RTrdoHiJqrO99gFxG5b8gNYmW789KcaQZZMNi1LGT8a4E
X-Gm-Gg: ATEYQzyjPIKAaKYyRqp1Ug3LlJca5I2x9YmYkqm930tekZvVLNKXGQELI+kegClla36
	hYwyli+hGU4XDdI3Gytl7oG4jhKJW2PVhNc0FyXa/K4W1zYK0hjZDbING+gLoS7svgvEkiwdAvO
	DtUkUtD221d91dlDlGBBJqd7hBPqQKSdv+/6vCl/j221MzD4Wr7BFWvGDw32YHusBvYrXulneUj
	k4zdruExfjFmbt8FzK1UA1pTktt/mrYzyTt91BnMbJXJSs0fggnrzP2Lcwmb2RcbkaNYoSUS6QQ
	vHWkGljRtYgBSes0S9cDZphIuZxA6LPQanOGInqXg+Q/2yJIAa7/Nnh3ZRfhrbq2P7328rYC9eW
	HMXKK0Iz99l97nHp1JFcX7VqsQu2zwrBCYBEGw9sODnO4YmJsFASlzOLVSPk+STZgn4T6R5wh+q
	HBQTstl4JwvM3oAKA8FwKYzFQTO4Jm0eDjkJDpQQ==
X-Received: by 2002:a05:6a20:9189:b0:398:97dc:5546 with SMTP id adf61e73a8af0-39bce9a31c4mr2458819637.2.1774029901215;
        Fri, 20 Mar 2026 11:05:01 -0700 (PDT)
Received: from fedora ([2401:4900:85e1:8dc9:732:e49c:7da8:40ea])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bc1e59sm2689523b3a.13.2026.03.20.11.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 11:05:00 -0700 (PDT)
From: AyushMukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ethantidmore06@gmail.com,
	azpijr@gmail.com,
	dan.carpenter@linaro.org,
	AyushMukkanwar <ayushmukkanwar@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace msleep(1) with fsleep(1000)
Date: Fri, 20 Mar 2026 23:32:57 +0530
Message-ID: <20260320180257.40243-1-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

checkpatch.pl flagged that msleep() is inaccurate for short durations
under 20ms.

Replace msleep(1) with fsleep(1000) to resolve the warning and align
with modern kernel timer API standards.

Signed-off-by: AyushMukkanwar <ayushmukkanwar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index f074ea6e0f38..32a5e26bf6bc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -414,7 +414,7 @@ s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 			err = -1;
 			break;
 		}
-		msleep(1);
+		fsleep(1000);
 	}
 
 	return err;
@@ -567,7 +567,7 @@ void LPS_Leave_check(struct adapter *padapter)
 		if (jiffies_to_msecs(jiffies - start_time) > 100)
 			break;
 
-		msleep(1);
+		fsleep(1000);
 	}
 }
 
-- 
2.53.0

