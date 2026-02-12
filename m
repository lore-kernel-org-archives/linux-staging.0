Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD19261573
	for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 14:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770906166; cv=none; b=n+aUInp2lh0AM2jfyX6RG2ECJKvl5TNa+25KTvYD2YWMxA6sfoUVo2dEE65Pu3z0TIn9OAAZbx6loKelbwzJC941MES+QH5LqZVOGqsMW75wksQnXdLL24i/sVrWfJaxvVP/gKCGNSeZhm9CZU/C7Wo8x0cw7jLLmOjAS+6DDao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770906166; c=relaxed/simple;
	bh=/9yS7jZDEhqncV6H2j5LoBJ67mkEIyHfcXUsZaIHbcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sCDlVeT2eTOA3Xm4XkscN11fZfDyYab2u60AUJSFsHGvy9DBdVtYgrhBX9tHxEqqWhMPvOI7hLeTP1Fyk7NPWXHwEtQ6VMjk22IVf/5vXhBSGbhlT6QnDfdXlWoEpY5Cd9HDAoSpU2xDQvtVPscW7g2hOp9JqLyaaiBvaIHwEeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f5CmcEZA; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f5CmcEZA"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-823075fed75so1238052b3a.1
        for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 06:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770906165; x=1771510965; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+6UHFzcsZiWTg/cFlOaek/gAXW5JWxnycDrQGF0hnU=;
        b=f5CmcEZAeZkusynPpEmalzd3qvcGqy549GAS05iXKiC248Y5Ou2GN/WlvYW5ZyfVx4
         2cVU72N2Yvebejj86R1oyc4OQx41FXKE63ukRCSFA03+F5FiMn2Qcq15RnBJ5zdZ7cGs
         VZsOgDGN6d3u1KGEvT/iHE3/9xo0Rn78ohCpVMao/2VAv+41z0PV0qUGebzsfaq518ny
         cihg7z6EKYE74OUhdls49rOjifW3vZwsEZouxJuC3V1eWKI8/ScJkXrxHII4UrN5Z8DI
         cU2P+3DeoR5i4T+eZAC7EEBx3DTXP27Cz621Nel22WLBTWCsyS8pVBopmlwMAmEOYHub
         AviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770906165; x=1771510965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X+6UHFzcsZiWTg/cFlOaek/gAXW5JWxnycDrQGF0hnU=;
        b=LpQPME8KwhDK+6XVvfswZ0mowkorKr59ZEtX9vFvaLFOXj9e1WhnyNoLWMeeHHeNid
         FfmwmmLyYQrLpWD46eDXmlhQW2IuGvOW4ijtrtnhX41M+Vlqd7Nc3JXAmDv8Y3GjQH8U
         WD24qLmJdJv/LJkKwQSpzQRwZtJ1MHZgmA79ZokaGcn6SndNANuck80E6u9+0GLXLq8/
         a6PdjUBK4zrf1731DcQwa6QRVyWhHv967yDFJJKTIk6y0gujp2vVxj+J5Q4SLyxz6D9d
         OPSuK6hhaEb3/qlLbQgWeP+32fwrRiy/G4IVNmwAwVnT4Q6COQjy2CzIzhCMvxCGReuP
         1UOg==
X-Forwarded-Encrypted: i=1; AJvYcCX966QmbsFwLHkZPO2MpWVfLzNmVUeoN82AKXXENi1PrAQEVDODawOQo8daZmuZhuJI7yc7IV5Y0yunjpNe@lists.linux.dev
X-Gm-Message-State: AOJu0YxvpeLc8FPKmlgUJl6Icg20vLY+GjtuV4KbKnKJQqH+0//q92KC
	NhHGOmTINSk7EHITziaifb2fblH1l7taL/GeY64U9OGWpR/tB1vidWjJvCVFiQ==
X-Gm-Gg: AZuq6aIYIcQ2CjjhGQcRMPPpX30GaVm0tp7sHN0IcaBnfJL/O+lTBBgkp/aYSdGpQfA
	NPiTUZyVp0Plt5cfiU1VklJcVZZnMARGH1LgCPgi26GmrfWXDTy0VvJlIFyMOJo9Ou1e1k9yn+0
	8BveL+KQprMFh7pq8n+ZSV4fxNiGpG/+uOBxCZxjHKr0zhhVQ2rSW2I6Y5MtuFsdMEDR0464fCA
	hZir9gTw9zaXzTXuMaaheNbXy1F2UXIZkGoJLhL0VNEsBFBaOQe2x3rJTEGPCahy0XIykkvp4FU
	vp1olz9KHDgGeiEaqwn1/jfq5MLWXk/c/yYy3fF5ySeOiEz2C3UfQKkGQp/INqW0wzkaQfAV8ei
	032n5bk7R/hxWNQcXCTheRg4SGpNuTIGnxnsVawd3Xhd+ilBF9RuIJL9DrviUtqKqSrkgvRET+s
	8Zv7kHPhTRpFjP9zSeRonLccX2MEwJAQ==
X-Received: by 2002:a05:6a00:ab86:b0:81e:af19:34ac with SMTP id d2e1a72fcca58-824b0cea5b7mr2113227b3a.29.1770906165070;
        Thu, 12 Feb 2026 06:22:45 -0800 (PST)
Received: from snowman ([2401:4900:647d:9ae6:881d:5895:580d:d8e5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e366b82sm5336631b3a.1.2026.02.12.06.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 06:22:44 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	ethantidmore06@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v7 7/7] staging: rtl8723bs: align and split variable declarations
Date: Thu, 12 Feb 2026 19:51:31 +0530
Message-ID: <20260212142131.28131-8-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212142131.28131-1-khushalchitturi@gmail.com>
References: <20260212142131.28131-1-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split multi variable declarations into single lines and move
trailing comments to the line above to fix line length and
alignment warnings.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
Changelog:
v6 -> v7: New patch to address warnings from earlier refactoring.

 drivers/staging/rtl8723bs/core/rtw_cmd.c     |  8 ++++++--
 drivers/staging/rtl8723bs/include/rtw_mlme.h | 13 ++++++++-----
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index f322a7f89b42..ab669032be40 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1131,8 +1131,12 @@ bool traffic_status_watchdog(struct adapter *padapter, bool from_timer)
 	u16 busy_threshold_high = 25;
 	u16 busy_threshold_low = 10;
 	u16 busy_threshold = busy_threshold_high;
-	bool busy_traffic = false, tx_busy_traffic = false, rx_busy_traffic = false;
-	bool higher_busy_traffic = false, higher_busy_rx_traffic = false, higher_busy_tx_traffic = false;
+	bool busy_traffic = false;
+	bool tx_busy_traffic = false;
+	bool rx_busy_traffic = false;
+	bool higher_busy_traffic = false;
+	bool higher_busy_rx_traffic = false;
+	bool higher_busy_tx_traffic = false;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	collect_traffic_statistics(padapter);
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 65a9e4e9df55..cdb2d1dcb728 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -99,11 +99,14 @@ struct rt_link_detect_t {
 	bool			busy_traffic;
 	bool			tx_busy_traffic;
 	bool			rx_busy_traffic;
-	bool			higher_busy_traffic; /*  For interrupt migration purpose. */
-	bool			higher_busy_rx_traffic; /*  We may disable Tx interrupt according as Rx traffic. */
-	bool			higher_busy_tx_traffic; /*  We may disable Tx interrupt according as Tx traffic. */
-	u8 traffic_transition_count;
-	u32 low_power_transition_count;
+	/* For interrupt migration purpose. */
+	bool			higher_busy_traffic;
+	/* We may disable Tx interrupt according as Rx traffic. */
+	bool			higher_busy_rx_traffic;
+	/* We may disable Tx interrupt according as Tx traffic. */
+	bool			higher_busy_tx_traffic;
+	u8			traffic_transition_count;
+	u32			low_power_transition_count;
 };
 
 /* used for mlme_priv.roam_flags */
-- 
2.52.0

