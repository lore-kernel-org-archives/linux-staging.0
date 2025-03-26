Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3180A1E8343;
	Wed, 26 Mar 2025 13:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742995629; cv=none; b=qTdNPnSC5DbUSeU0homCUN+4lK+u0HiMkyazjdrl4mOfRO8zdtZSttfez2Zn3zsD3L57w7fHF08K3GvDg6aDYQkyipr1OZN5qEUValhGIvd5kHX2ZbHctbjqLdKUGtCs2Oz+aruNPhaNLTTETH3cN6MfLS8jgynxyIwUBYIa6zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742995629; c=relaxed/simple;
	bh=nt8iBmq1U2sZ+dsDy+fiGojzVAB4//DaknXjZ9aDNpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p2pDEQ8uf/qHMtdJK7AYcvdN3b4YqR8l3e8+srCsCVOyB3MD0NGjGLXqSycEmB31jsU1sQeV08oCRPwku2ohTtopCgbsn8CAboCt7h+ChOp+7Xri7VGekLJnXF9VZEZ99+SLJYtKKxOpuE6ePHTRj1NzmMO0Wgzhlwu42OgyEEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dO/eGbqh; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dO/eGbqh"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-399676b7c41so3746064f8f.3;
        Wed, 26 Mar 2025 06:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742995624; x=1743600424; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hcjtkRmZu75V50diYJfuq2HFM+HxBgj5vj+NwkadNwg=;
        b=dO/eGbqhBxQ52vEWDzuKNa2nii+4P0Tg4/e+1k6RKbAUFjnvnodhNID5ncUBS6/V4W
         4yHAcVI1AOJWg3TQxpcdfSvMyO9ni58DgpSvGwDiGQc45mScEeeMyQtILN9j6dK4vTSa
         dW8RPMd1f89VRsb5DreE8W3hgHyLQnCfM93FjbIf6aw9S7Z4ZhtfdMWAahGDD3Zcu6Ny
         t8jq3q9B0NolJQCl4LHzh6bZ1me2SxqCuGQgctzUrDxe654nWboN/gS36Iz8n5yq4yZn
         aeFogy7WlrTZSeJHu0OJBNTfy9PTSkNnflHETEOrcbLSgn87ns4qQnC6nJeAQI8+mxVn
         QaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742995624; x=1743600424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hcjtkRmZu75V50diYJfuq2HFM+HxBgj5vj+NwkadNwg=;
        b=Mb08nb8Jxj+FAM667Wk+7NAtqQCF82ZV+ChfBY6Jxe/7OjBbPwKp9OvJwV4oEcxg1c
         uapHDpMKMnazpR7ej8DUfdDI59P7xrVKIEGLHLmV+QXPOzRXxxcAf5IvexHY/Af3KnOe
         9wunbey/ozvLBYxfANLBkFTYTFEG97Fso5pim3UyGntZXLwLKixVo95uhp8RlRNxQPEi
         ApH2nCpl+KPMV+4vtLkhfhYGFzwlK7ZTnEUno25PE/ZicEFX5/6L11keukM90b+cI2DI
         KoKZEOHyBwF82aPWE0anpxQhJZVkxsXBxaPf67bFKmpR8j3/kE3qflsKKUqSu8lTvkYh
         QUtg==
X-Forwarded-Encrypted: i=1; AJvYcCX2/KqSGKeTpoN7OZVniEHBR1IBuDTOQNWPFcndGPgY20TI8YbTdspRZ20LuTQT2u6JGUSrrdieO62v5qeV@lists.linux.dev, AJvYcCX3tWw2R77IOmvY6d2KR+9UrKAe8dItn8xKvnxHNq6fdDH7rRWedNYA135HbrFibDn+TNg0CI9DIJ9a@lists.linux.dev
X-Gm-Message-State: AOJu0YzbirUDDeFQq6+4+R8/BeCmmcIVK+boiVN5V9LVizlJyWnpjOK8
	JD+6empLOTW4traRkNvzhKMJ5q+cQWjHatEBqF1lSDnb4Kgrrvbd
X-Gm-Gg: ASbGncvPsdXjSRb+E2m/Ayxf+c4cfs0RW3ezuEFCcGY1O/JTlU4kLc7hSX6AePWJ8oP
	OtnOP+e8KrvnG2pCa7AOU+qYlrBEpCMIpneUZyRCnE0nxzEM/AK0mCvERCfFT0vDZtPL+1Huakm
	Tq367YgGz2PMgiKjU9oB13G/5Yet5WutMFisBWn8LGZ1YRL54g/mqdi3gc6uY+m3tw76/FOxQjR
	S7J41k3/AFLY6BM0XImir85OO8d8Lifp5nEB5tDxt1Q6m6MizMSJjQ01r3q00fwsRZk/rPLw1/t
	NcKNDiV+7Y0Ktrvhuy5UYaF4/IT9EHDieJNrTldgRQ==
X-Google-Smtp-Source: AGHT+IGtRgPZrsoC/mmYcSJc3J2eXZaSsDcJzf12SwZ4RBy8sd1QLKiYQmooEtxhYKXQzRLx8il8Bg==
X-Received: by 2002:a5d:47a2:0:b0:391:23de:b1b4 with SMTP id ffacd0b85a97d-3997f9371e5mr20984993f8f.45.1742995624162;
        Wed, 26 Mar 2025 06:27:04 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e66c7sm17008478f8f.79.2025.03.26.06.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 06:27:03 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5] staging: rtl8723bs: Rename variables
Date: Wed, 26 Mar 2025 16:26:49 +0300
Message-ID: <20250326132649.22055-1-karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the variable `mediaStatus` to `media_status` and variable
`lpsVal` to `lps_val` to adhere to Linux kernel coding
standards by using snake_case instead of CamelCase.

Fixes checkpatch.pl warning:
	CHECK: Avoid CamelCase: <mediaStatus>
	CHECK: Avoid CamelCase: <lpsVal>

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
changes since v4:
  - Include a summary of changes in the v3 patch and place
    it correctly below 'Signed-off-by' and under '---'
changes since v3:
  - Include a summary of changes in the v2 patch and place
    it correctly below 'Signed-off-by'
changes since v2:
  - revert double blank line changes  ensuring
    the patch contains uniform changes.
---
 drivers/staging/rtl8723bs/core/rtw_btcoex.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index d54095f50113..f4b19ef7b341 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -8,14 +8,14 @@
 #include <rtw_btcoex.h>
 #include <hal_btcoex.h>
 
-void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 mediaStatus)
+void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 media_status)
 {
-	if ((mediaStatus == RT_MEDIA_CONNECT)
+	if ((media_status == RT_MEDIA_CONNECT)
 		&& (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true)) {
 		rtw_hal_set_hwreg(padapter, HW_VAR_DL_RSVD_PAGE, NULL);
 	}
 
-	hal_btcoex_MediaStatusNotify(padapter, mediaStatus);
+	hal_btcoex_MediaStatusNotify(padapter, media_status);
 }
 
 void rtw_btcoex_HaltNotify(struct adapter *padapter)
@@ -52,14 +52,14 @@ void rtw_btcoex_RejectApAggregatedPacket(struct adapter *padapter, u8 enable)
 void rtw_btcoex_LPS_Enter(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv;
-	u8 lpsVal;
+	u8 lps_val;
 
 
 	pwrpriv = adapter_to_pwrctl(padapter);
 
 	pwrpriv->bpower_saving = true;
-	lpsVal = hal_btcoex_LpsVal(padapter);
-	rtw_set_ps_mode(padapter, PS_MODE_MIN, 0, lpsVal, "BTCOEX");
+	lps_val = hal_btcoex_LpsVal(padapter);
+	rtw_set_ps_mode(padapter, PS_MODE_MIN, 0, lps_val, "BTCOEX");
 }
 
 void rtw_btcoex_LPS_Leave(struct adapter *padapter)
-- 
2.43.0

