Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BE1265CA2
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 17:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784135909; cv=none; b=fLvFkOO8fU1Kk88dtEXhUtxIHySBpp+rVat6e8Mxa+ARP2oj1X/1K0UhMAI/r2VjAO4oO32t+LPKPj5oKGH156msxLrjF+yaqzVffFtV+RIIVz+AmluHrq0cwjpjtvwXq6+hxHwunPdzsfUMDu6zQr3KJN+8o3JiAmOVRKvf0OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784135909; c=relaxed/simple;
	bh=eDDzIek115rmToQrb7OHMToo8rMaGLHkdzHYiePoX0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QxdoeXfOyhikmeqX6F3d9SHmYwqk1Snl/GEVpD8UQWxNRcjFM6CsVGMxQrrvv6lyoRl2tttPgpqdSMdgxU5R0oQ/kilV0qS0Opq1E2bXkOTJbUnJe7F9TLJqxeikAgjds+TsWMIJqQGPdvuoiYmlhXk+LhuBgGhWqn4Yrz6mSxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHhPM7sT; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHhPM7sT"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso5369783f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 10:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784135904; x=1784740704; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YvHvD3KbxA+xNUiQPpZbYkR2Eq9VnSuwmerYGDIDESY=;
        b=nHhPM7sTVz010GizaSqHfQ9f4PqiRPlpYTJvUPQqJABE3/eexqm/pq5VlnXY0gCDS6
         Ta5RoJPo5YqNoMXfa72/nYWMSlE2eRHxHpLUHIlQaEcN4MfZlSrIOzaAkUF7JdkyhmPy
         V3YQyup9sAUa1vEFVAkz+teU9cR/Z3qgnWStXy7vNvgalhvea6nGQuFav5LEJs9ODrZF
         H9zeU08P6GPycezXt8lWvmQQkK0KhsIZQ56PGGwSpLU7kLusmjmuT6JtEJLQdSPxAMfW
         OrNFQzoLoqwuqx+1xYBOkWD2r3rs5J124ecbbEE/Nw/Nu4bUDPmu/0sVp/9oYThJbjBP
         CJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784135904; x=1784740704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YvHvD3KbxA+xNUiQPpZbYkR2Eq9VnSuwmerYGDIDESY=;
        b=YZdk1DIwzfGbByclbswq9gnPaOulUek5710NiWJ58bDRVg+96umURRh18aRTHbsJrO
         X2k9vJoeGsn1l2++PuXWBN+cQkaQ/LAyfkvgDSZv4YxeQq0h5rkVaBDKc/SuJz1V7P0B
         ksurw+io9g8jLJbNFwsw8Z+XsK1V0DmouF/BMMFv1n7MVs8x1O5WCv5Ifkdd0+WskJuX
         TFCs/wNPqdnPMhOifVfI+dGVXXX2DCsA7J7mG53jDD3FsxixxZRl3zjnm5aU1kHNBcTr
         w3euG3wMNbFqfVePg5aAICFrrLFedyP7ZckX7EaiJiJEfKbk6BovCIKVV4R/0vYnGZKP
         xmMg==
X-Gm-Message-State: AOJu0Yw/MAhGp63vbFjeFsXIFECuuZLkLWQf5xOgeI2bcfTKiZYWwaGE
	WKsmgPYiASXnG/2Avp/PYns8tMvbCfbDCOZhm4Abw7oXpLzu48fQskYu
X-Gm-Gg: AfdE7cnQJbZ+4OjM0iAWtTZc2wMNgL53RWKr8KqgU59Aaiq9+3oI3lPXKYkiEBme7XB
	uNcBRC99DS1YjUImNJ+manbVCZKTd15U4BzAw98KB2yqHr8z2GenGXYafHMb2vDBmUWNVsFMOXe
	E5SK7MjnzThgzmM8yAzl5swG+o+Hx+3Kt9//ZHqMZmT3SVAE3y4h6S2GSgpPncIUP+USIzfP1ac
	3En1uoPo0nOWQJ+bqHunnJkbDRas2/En5kVgxyKrLIEmhsX7GJa01EGwY81ZjN/CpJALnhcvqq5
	DonshFSs8mE5NNJb0k6IjAH59+EVAk+wyCg6KGzA9v7delLwBlkM6iIe+8RsSkzI+u1jFtBUQYX
	t8lsRRQTy1aItOXssqXjO9wLNqBVN8EY/OZwgFIUhneK0PiHq+a7iq+6b28bChgKR6nVruff+Hz
	xGCUeVsGcH7haRXMxa5xoFKDDlf+5gnMVgxL2/P0yjgtHDY1P9puwK6sBBa8mqYucXl+WrQjL31
	3eoXw==
X-Received: by 2002:a05:6000:2682:b0:475:f0c2:75ab with SMTP id ffacd0b85a97d-47f4fd3711emr4194944f8f.60.1784135903578;
        Wed, 15 Jul 2026 10:18:23 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464b7f84sm17123032f8f.27.2026.07.15.10.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 10:18:23 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH 2/4] staging: rtl8723bs: wrap line over 100 characters
Date: Wed, 15 Jul 2026 17:16:32 +0000
Message-ID: <20260715171634.1550-3-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715171634.1550-1-fliegbert2@gmail.com>
References: <20260715171634.1550-1-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch warning by wrapping the lines.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     |  3 ++-
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c      | 12 ++++++++----
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c |  3 ++-
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 4e34249a2d26..4a7fe5af0ffa 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3708,7 +3708,8 @@ unsigned int send_beacon(struct adapter *padapter)
 			 !padapter->bSurpriseRemoved &&
 			 !padapter->driver_stopped);
 
-	} while (false == bxmitok && issue < 100 && !padapter->bSurpriseRemoved && !padapter->driver_stopped);
+	} while (false == bxmitok && issue < 100 && !padapter->bSurpriseRemoved &&
+		 !padapter->driver_stopped);
 
 	if (padapter->bSurpriseRemoved || padapter->driver_stopped)
 		return _FAIL;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 0790209a3a8f..d2b44ad60a4c 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -639,9 +639,11 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 				/*  check rsvd page download OK. */
 				rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, (u8 *)(&bcn_valid));
 				poll++;
-			} while (!bcn_valid && (poll % 10) != 0 && !padapter->bSurpriseRemoved && !padapter->driver_stopped);
+			} while (!bcn_valid && (poll % 10) != 0 && !padapter->bSurpriseRemoved &&
+				 !padapter->driver_stopped);
 
-		} while (!bcn_valid && DLBcnCount <= 100 && !padapter->bSurpriseRemoved && !padapter->driver_stopped);
+		} while (!bcn_valid && DLBcnCount <= 100 && !padapter->bSurpriseRemoved &&
+			 !padapter->driver_stopped);
 
 		if (padapter->bSurpriseRemoved || padapter->driver_stopped) {
 		} else {
@@ -897,8 +899,10 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 			/*  check rsvd page download OK. */
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, &bcn_valid);
 			poll++;
-		} while (!bcn_valid && (poll % 10) != 0 && !padapter->bSurpriseRemoved && !padapter->driver_stopped);
-	} while (!bcn_valid && (DLBcnCount <= 100) && !padapter->bSurpriseRemoved && !padapter->driver_stopped);
+		} while (!bcn_valid && (poll % 10) != 0 && !padapter->bSurpriseRemoved &&
+			 !padapter->driver_stopped);
+	} while (!bcn_valid && (DLBcnCount <= 100) && !padapter->bSurpriseRemoved &&
+		 !padapter->driver_stopped);
 
 	if (bcn_valid) {
 		struct pwrctrl_priv *pwrctl = adapter_to_pwrctl(padapter);
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 210b38d23fdc..08c77348b307 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -189,7 +189,8 @@ static s32 polling_fwdl_chksum(
 	do {
 		cnt++;
 		value32 = rtw_read32(adapter, REG_MCUFWDL);
-		if (value32 & FWDL_ChkSum_rpt || adapter->bSurpriseRemoved || adapter->driver_stopped)
+		if (value32 & FWDL_ChkSum_rpt || adapter->bSurpriseRemoved ||
+		    adapter->driver_stopped)
 			break;
 		yield();
 	} while (jiffies_to_msecs(jiffies-start) < timeout_ms || cnt < min_cnt);
-- 
2.54.0

