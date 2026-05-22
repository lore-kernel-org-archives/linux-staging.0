Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B401A6837
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 05:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779428797; cv=none; b=GqDTFQCo16kvTU3bq3X8Z6cjerWZslHP6Wys3GqK6KE3EKUKWm6uhn4c6Rq8Y5S4zHQHtRHHq13EuUpEom5MrHGn/3/6pQ0PIHadnH8Rw6skUHPyDvNM922LAFm83pVz14RXP3rfKmXXPsh9vLx8Gnh3jCMa88COOluV7w1j5uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779428797; c=relaxed/simple;
	bh=8DkRkxnTl4bKzgh0KXYQOxy+1xeRzix6mvqx40kbUUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Vt63JM4nCTgAWT+4v+bjn108CtawK+ZWp/0Ak1OMPNZujn3OUlxyme4MYrSS2rbTT8gP+XuEras1aSQHC8Dp50FqAMrb/hXLwTppKgj6FIcstO8LEk6OFCcI55Gm0oW8L0udGDnhZ8a9wz8Y88+p/HSEbsTNFzO2dlmS26I/qE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXdo3jA0; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXdo3jA0"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-69d60694c9bso1551108eaf.2
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 22:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779428795; x=1780033595; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/MsxqMEhc4ULm6lRlk5Hoz5Xp/8tINWqbUvs1QE8ePQ=;
        b=kXdo3jA0pvzoH2/LCxShRd35kb2JHccMXqn22A5wdtLBkUyIgSN+oG6CMfS6SFyTty
         v53S4Xff+OlzTY9AaN3kHs/ZFVi9LZCf84oDWR/guwCF72tDs7MtvD/ti9OEO/MXYdXR
         4CUl3yokx+zMUj20hZdHZezzwT1wnRhREdstWKfJY49JVX6PILtnnzJ0iiicFRbjANrb
         5isQlEzpRTlBMw1lzkUsS7zLfjjNXcZs7HUy2HT1l96vIRpzL9fHQ4qF3s8O4QYxLVxt
         hyMnoJOBGnJoLrJUuFo7UPnb0JHQSAFtsUkoaHTxqi1ZhaRxmHB5WTAOnvq0vb25EXkV
         I/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779428795; x=1780033595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MsxqMEhc4ULm6lRlk5Hoz5Xp/8tINWqbUvs1QE8ePQ=;
        b=fvyO1x8JBkfZ4+EH5W22F4fVb/rcnfAr0oiOxnwPU8tjMjEhRXb06PTHPUHoP5Bh7H
         TQG1FyLccOSTCBbRn3QsW2r/7ToWlIpt7gbe5ZSBwlWSjjJL9QXUSJixDANTHN5cUo9a
         zaTGy4mOw0tGwH6aoquCF1uOHIdPaXMmMb9piTFGXdj7ZCD55DyflAciJikQ7JtkkiT9
         bIoYXJpXBTC4so4J0gx/TPFkpFPr8Bs1TrV/JGbf0wMJTrGU89Wg8ZULAO6hXOvT0vHM
         2W1QZvOkFxiff3nHTtBJpVjbm+M0bHlOMbcsSbza+q9Eb8hPqLrEZBuaE3nviw10XezB
         tfug==
X-Forwarded-Encrypted: i=1; AFNElJ9f8gCsgFiTmRo//Epkt/G+KZeimS00m0dmYIR/Nwii/47xLpTEPwrwqu0tNUVLp76s8udWZ2thwWZllFpG@lists.linux.dev
X-Gm-Message-State: AOJu0YwHHOHqbYLeOWtUjylvkMpqjtmqc7EbOgf7FXl8HvCXFwb4ritj
	WEaRb898B5nXwWxxdITmzZIuV/eZLMdm2I55GkHE3+Aw3O221RlarJZh
X-Gm-Gg: Acq92OFG+bEkyTVKygOXYuraafGsspNzn3pG1XB0uag6Rv56tDa3ifA0uflanHcLlBO
	kmMxbrwk+J4sG8jFx99YlLnWPv5+dxVuzLG3wigiZuzHztzlRR43ou7dHJneCETtDjqZ7oslcdq
	Kv8+wSoK5/2k0OB9nT6XAQvHmIbO7zgJyuvvjEI4OZaD+9sFbQv5AsTzJ0mUDZs8ECrRAI/DSOS
	akD1JMp7KNL4iY3Y/f1wrb7gUcbFcXBszzY8Dwz2LP74XdwbDCV20qXl2OJyFs6TE1BsoEm0nMG
	UayqJeYt0QsCgxsikKnEFLKLFhfrOUTCIGwi+/RrkRikiX5Tz5c8pHaWwcwGeo068sfB7OqUG4U
	Pe59uYbr5B0dCs4EL9vX6J9paGV9Bw0NhTWqfRzfFK0/Y4ls/FJFF06A8SNVFIPW++dI1l7WEfH
	KFxBmI2sAmIg2Z6Q/rldlXClpcy983GuQ=
X-Received: by 2002:a05:6820:f02f:b0:69d:7eff:8c8c with SMTP id 006d021491bc7-69d7eff9672mr1082360eaf.19.1779428795310;
        Thu, 21 May 2026 22:46:35 -0700 (PDT)
Received: from pop-os.. ([2806:264:548c:885a:fb25:8a80:d99d:260b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43b635d26b5sm879683fac.6.2026.05.21.22.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 22:46:34 -0700 (PDT)
From: =?UTF-8?q?Diego=20Fernando=20Mancera=20G=C3=B3mez?= <diegomancera.dev@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: m.steinmoetzger@gmail.com,
	guojy.bj@gmail.com,
	straube.linux@gmail.com,
	error27@gmail.com,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Diego=20Fernando=20Mancera=20G=C3=B3mez?= <diegomancera.dev@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: clean up if-else logic in odm_HWConfig.c
Date: Thu, 21 May 2026 23:46:24 -0600
Message-ID: <20260522054624.190256-1-diegomancera.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Refactored redundant if-else blocks to a cleaner else-if structure in
odm_HWConfig.c and fixed indentation to use tabs as required by the
kernel coding style.

Signed-off-by: Diego Fernando Mancera Gómez <diegomancera.dev@gmail.com>
---
v3: Restored accidentally removed comments and blank line.
v2: Added commit body description and Signed-off-by tag.
v1: Initial cleanup of if-else logic.

 drivers/staging/rtl8723bs/hal/odm_HWConfig.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index c88d669cb086..abf3d96746b9 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -227,19 +227,16 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
 
 		odm_parsing_cfo(dm_odm, pkt_info, phy_sta_rpt->path_cfotail);
 	}
-
 	/*
 	 * UI BSS List signal strength(in percentage), make it good
 	 * looking, from 0~100.
 	 * It is assigned to the BSS List in GetValueFromBeaconOrProbeRsp().
 	 */
-	if (is_cck_rate) {
+	if (is_cck_rate)
 		phy_info->signal_strength = (u8)(odm_signal_scale_mapping(dm_odm, pwdb_all));
-	} else {
-		if (rf_rx_num != 0) {
-			phy_info->signal_strength = (u8)(odm_signal_scale_mapping(dm_odm, total_rssi /= rf_rx_num));
-		}
-	}
+	else if (rf_rx_num != 0)
+		phy_info->signal_strength = (u8)(odm_signal_scale_mapping(dm_odm, total_rssi /= rf_rx_num));
+
 }
 
 static void odm_Process_RSSIForDM(
-- 
2.43.0

