Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC101192D68
	for <linux-staging@lists.linux.dev>; Tue,  7 Oct 2025 09:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759828409; cv=none; b=l2Dy/0ASQoUKWFUiuBrbgdDChUARZJ35Gjt99RVHOV++cYoT/oLIRwDg0Nj5iiGMP+lkcXXwairdL/SB1YepIYJsZmC2BJkIF1+PpRFFp/N4E4YQ/OWnD6cxMf/wxA0j2yjuZaZ0MqFQAjq5+imNYXaOC0wLPT4Q+XVgZVQv9Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759828409; c=relaxed/simple;
	bh=lAVDGc2LK84Ub0jbxmUjMOcpfOBmY3qrd6eZ2zJcTWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mOqss0CzdKytZ6gZmoFGo1M5bJIwNLzsBnNTphE5nd7/U1SKNclk5EoLsKsStzstAXmA5f0PzEhx1fipcdGqQ/X0zqcSaFFgKRlMtP/mIg6B4zH2V2Yr70FSq7KZBzDbC94vb5Rt6oAPezb8h0n/lvElJwmTquC7tUZ4IHesXJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGZ28EKo; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGZ28EKo"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7811a02316bso4208212b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 07 Oct 2025 02:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759828407; x=1760433207; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XJtapFc34rZOz8eU7l/AxCg1WyZd+AeqhYHeXbqdkZQ=;
        b=NGZ28EKol6i68JbWnafLfTX2m+DW5nFVV6utuGFOHAZVDCYIg9sRakn+CMhYB1k1Uj
         98mbtR3lwyljRWxSKO4Jn8lFaBuho/swc2JyORRjyxXHgoI8kVdkMEAcbEnLU8RAJ+qp
         VwlRycRS8EIuiV9eYiwzAxGc7WUhjJSQFjcFk4fqFgk6Ppus4Z3ES+45tMmierXx08oD
         aVateiSb9U0aSjg3Bg1rPUrgF6jIbt7rh4fSFBlXqoyS1ABwvBOy6yxr90eJx9jfqJJj
         VVLhdm9U+p8fTdXYLgJWLVQ/ur+yy6GxyhCrL/tlsUMKQGrc+bzyUivAf6KExt/owfyJ
         Lx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759828407; x=1760433207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJtapFc34rZOz8eU7l/AxCg1WyZd+AeqhYHeXbqdkZQ=;
        b=w77aEcptuTaIo7z7ESngwO3fXeWn+ujmWne1A/+ZDntEIuiNrT/0zOejTh2LBOQecC
         JKJO3SrUdnegh8JgMLiPWXGVB1UMGvh2RE0hEOaFcfh8BV1YJKLsgMPy/zo3BXnPrCW5
         qdoLAEGRxidvzHizAd26t4Z+aJwYGKfmkUvN3i5qkRsHR0xff1ujwVwlPnuCrEkpec4r
         pMWiOanEMQWmvYcD41A445vSEtl1AoEiHiULedwZ2ZV946Ks9qEXYwRuOku14/MZ5LAO
         UUnMUD9RVVAvGjPz3RMO0zBkGX7s2JrjhH2Kheex/lyQG76WIuyNd+YBUu49vssC9nrE
         1d7A==
X-Gm-Message-State: AOJu0YwHRXxy2riDtqFiGzyILECozluC6d0dcqa8x69zzbmbD2GL65SF
	YuwY6E5SJg1t28fJyV4+oinHo4eGX98/rDNCIUD8cnx6OR7YnYufhx1PtCSGRtvlTW0=
X-Gm-Gg: ASbGnctZTnpEEO/EExy5kvQYPYiLbHFEodEMwVmbd2imco9mtD6XavyIK/rUkLxvnJk
	XrojP2aguBlk0yuvjw9sd0w37rWED1OcnS2adB9JEXPJc+J+A1vbhnktJkS5peOw6Qzm78VMDCJ
	GDImZGYAs3zh5Bp98EQzTipotf660rAIC//BvP+4pO65ucDQKbfOQxYP1GUn74VF5ABG2fTqwd5
	hUSORnXTvTi9MQw7jrLJ072Ah5ldqru8Vm5qzAaCyiTCbK2UTS1r5/QC/5DS6+s+sazVGvTNx7Q
	Q2KP+NbypV1gz1y2pc0/OwGlqxAQTTx4/+bckRJsfBHP/T13DeH7fyWfEB2Wv6ximl0kMsz5Y4k
	5juJEPBjKXFgd5OBNX+d6RUvPP2JXkhPKVqkYnrdlAilgjvNtwi23GWgdcCBl
X-Google-Smtp-Source: AGHT+IGsCw2HiJs9AwDg2O1EQNO5zOmV3sAvt2f8shsaRr+S4pyGyvmsnnhDJznLDazcP2/9Ze2ZgQ==
X-Received: by 2002:a05:6a00:39a3:b0:781:1a9f:aeeb with SMTP id d2e1a72fcca58-78c98d2e6aemr20785655b3a.1.1759828406742;
        Tue, 07 Oct 2025 02:13:26 -0700 (PDT)
Received: from Deathstar.anonymous ([172.56.42.228])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9cda9sm14941784b3a.13.2025.10.07.02.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 02:13:26 -0700 (PDT)
From: Rohan Tripathi <trohan2000@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rohan Tripathi <trohan2000@gmail.com>
Subject: [PATCH v3 1/6] staging: rtl8723bs: remove unnecessary blank lines in rtw_ap.c
Date: Tue,  7 Oct 2025 05:12:58 -0400
Message-ID: <20251007091303.491115-1-trohan2000@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch removes superfluous blank lines where appropriate to improve readability and match kernel coding style.

This is a coding style cleanup only. No functional changes.

Signed-off-by: Rohan Tripathi <trohan2000@gmail.com>
---
v3: blank line removal only in this patch
v2: previously had an added blank line too
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 0908f2234f67..373718cbd6b9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -436,7 +436,6 @@ void update_bmc_sta(struct adapter *padapter)
 		spin_lock_bh(&psta->lock);
 		psta->state = _FW_LINKED;
 		spin_unlock_bh(&psta->lock);
-
 	}
 }
 
@@ -1252,7 +1251,6 @@ void rtw_acl_remove_sta(struct adapter *padapter, u8 *addr)
 	}
 
 	spin_unlock_bh(&pacl_node_q->lock);
-
 }
 
 u8 rtw_ap_set_pairwise_key(struct adapter *padapter, struct sta_info *psta)
-- 
2.50.1

