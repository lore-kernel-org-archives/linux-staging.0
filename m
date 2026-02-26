Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E963A1D11
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 10:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772100278; cv=none; b=jB2nF8D+DgAFb9Gr/oEZ74uhUs1OpWduCpqF+1YsXY1oEkesxVBZ6a/gZ6/nSVp/NDdw31V+LVBYb8FZWEDt1MXLdAm0q2652bOmmAA3IxW8OclF2qB3n2XKXeqaxAaUQvQpVHoREEWLXgWg1oXOTYYp8vpgU0LxYtnl4Wb8GRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772100278; c=relaxed/simple;
	bh=tYbYKBWNjUckIWfA1M2gp+RHKjOfQ27+KRR0ALndKdo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s4NfIyouQG3X4kwjl3ZMuoWcsDqNwdP/X2Lz98gYW6jqaQoIHy4optvOb41YH3jSLA9VKPmoWlvBtsJyhQ2wpZVCswUq0kqXU6/bIzkn+RM1Kgr1Il8I0KdactovKmYqpGU3iMK63vSd37ONAPcsG7tPx6urbnWZyHL1uolo/nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fAFiIL4c; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fAFiIL4c"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48378e60742so1037475e9.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 02:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772100274; x=1772705074; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o9fF0yCX2eqmISD+Nb16CbzBm5KM1dkqZc1TjQLwxi0=;
        b=fAFiIL4cn00FRX9ZgKcL2K5mRKNAauGc6vfk6fpOGYPgjuiPanmCyPdC+VdPTTjzg4
         oG41aOqyvf5doER7ctDGHiyxxhU75hSu+azGuDQYXm+UPjKUqDkb5baVRtDsybwWWCc4
         mwX7wRM70tYAk6jD/qQHHrpHPlkslkMl8fUrJY7pf/eyKJ4bp3PauGAgQjTsIw3mDB2A
         EyYsuT4iOpKX7r1VPoB/WS+AS0K413jvvaLtv+NvLcJO1tIAUpWr5f+885CHzg+Klzuv
         CNnB1z4aQfSObbcLax/yeL6tuCY9/jb77P4jBa8PKQUOmYEIVQP484YACXtMRKk20h7Z
         dhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772100274; x=1772705074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9fF0yCX2eqmISD+Nb16CbzBm5KM1dkqZc1TjQLwxi0=;
        b=I6VySoNt5HOLmiTAXe4OhLLsU20Jx7b7RdTwoCnD4odNnDYbMNKtJg9khsEXGX9E4k
         c1PGEQeIXLZX3E+xAcOpeIyYgEyLhEFH8VIWhjIljyoYmC0cjhLDptaOb9AENNmuOh8y
         bE81eXmh9pFFhUmBm1EIDptFts0jbjeVVGaIarzllkIvUujJIgsl6cQv34hthFVeXdJP
         AMaQZ7LaRMLomMDFzOTNDYYPnN+4tjVgk3zPON0KJwI6cpTLzXIUd6Ke76P+GYIWg6i2
         tVpaAyOPum6TvV0lViIWd/PuCt9/H1zCHFX7HLo58jmHjsD4a5maxTdL31x9AaoXByDG
         Pa4A==
X-Gm-Message-State: AOJu0YzKKCN1AhE4qQlMVu5pL/v40CGh+30xhx38acSqzk8HTRhlzd6n
	0I1dcEVfB9b/1CZlxNa6SWltInYXZlpUzV8DnWt0ql7JrhRxyx2vxL8Qb3HgPcTdDug=
X-Gm-Gg: ATEYQzyYHik/9CeGozf9W1MBVYbgG4PcSK9+3ejDFZKCOjaM8K58bM8jrcA0MHysg+T
	BmmCAAdjej7G3kNXzoeNZmlMum/rOKT83QZcgfVH0elVX+CYDGDusKlD/Bm3MlA5QKaFwqx4XlB
	m6+WwGAnLyIPrK2K5WipTEXvaafEaLi4TEJf8nCd+eyinuj0Sc0sVN6IEelM8PYbvjhX4lAn+r4
	HKAscF/rUkf6OUbXRvagt+AI0nh8lNediddOiN+IAY6X20PwcoT89enFJo1eC18pCf5ceSVbIUs
	3/q+CK0fz81PV2tqj2Qd8Fpn9hYY/erHTbG9v7FDUrkw1ftb8zeC4x4yzYebxCAKKNROTRvheYe
	NtSLJTFXhaI7lzeV6PNflwE18xEQmM8rmRq30FVqUO5qePvSAgfrnz2NjwVzgC6lpB/2fYiDmnA
	6efmgxqfHjtBTryk4GvaWARvY6Ug4UbsfyYVXoy9GxWkK22hg+MKucnnsVdyJc50QhZuPygtr49
	uDUC+1zID3TtUILQLEZI8NTay4Zsss3vHl4OYgyhI4B+SOuNP8QaZ2+s6ROEcA=
X-Received: by 2002:a05:600c:34cb:b0:477:a16e:fec5 with SMTP id 5b1f17b1804b1-483a9555ad9mr185129155e9.0.1772100273742;
        Thu, 26 Feb 2026 02:04:33 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43994da2584sm7127026f8f.12.2026.02.26.02.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 02:04:33 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH 08/12] staging: rtl8723bs: remove unnecessary casts in rtw_wlan_util.c
Date: Thu, 26 Feb 2026 14:02:52 +0400
Message-ID: <20260226100255.167059-10-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary pointer casts in memset(), memcpy(), and memcmp()
calls. These functions accept void * arguments, so explicit casts
are not needed.

No functional change. Object code verified identical before and after.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 3242978da36c..db8aa084f3d0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -364,7 +364,7 @@ u16 get_beacon_interval(struct wlan_bssid_ex *bss)
 {
 	__le16 val;
 
-	memcpy((unsigned char *)&val, rtw_get_beacon_interval_from_ie(bss->ies), 2);
+	memcpy(&val, rtw_get_beacon_interval_from_ie(bss->ies), 2);
 
 	return le16_to_cpu(val);
 }
@@ -676,7 +676,7 @@ void flush_all_cam_entry(struct adapter *padapter)
 	/* clear default key related key search setting */
 	rtw_hal_set_hwreg(padapter, HW_VAR_SEC_DK_CFG, (u8 *)false);
 
-	memset((u8 *)(pmlmeinfo->FW_sta_info), 0, sizeof(pmlmeinfo->FW_sta_info));
+	memset(pmlmeinfo->FW_sta_info, 0, sizeof(pmlmeinfo->FW_sta_info));
 }
 
 int WMM_param_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
-- 
2.52.0

