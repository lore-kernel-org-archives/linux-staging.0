Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E714C27E048
	for <linux-staging@lists.linux.dev>; Thu,  2 Oct 2025 17:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759425853; cv=none; b=MH08GpW6Kk3tqRDYHJahbIpTOwApFWyQhmDDdzTbgLWr6BkXWYuPwjWrw2FT5J2iE4jSRZ1W9zo/SnF902NGr20XvMx9ka4GWcIMEMR4WFQrmzEgSsudA2uzIPBOtVx+CE0fREBi60788Py2/0SpWCsXp179S0iNWIw+pBP0xdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759425853; c=relaxed/simple;
	bh=y15Rz9Jdn5VuI15nWuQPMNU8ucvaYPNJOXj7ij+eGLw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hKO9VN3IlL0jEllnMoxeQ1/sy3lcvHq3u47TXsvXMW84Cd19H34e87v7AhJIfnLDdKXs04kuty23wPI+NIt8nlClD8NcKn4gx3dj0gOjzNqjumj9KKVSdLiCjPbNRI4ZLLfwUGNf+kdXWJF7mXwfVXuELQ2qpyQVO7hMmuJ91uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=duMinlc3; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="duMinlc3"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4dfd1f48d4cso8913441cf.0
        for <linux-staging@lists.linux.dev>; Thu, 02 Oct 2025 10:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759425851; x=1760030651; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WrGwyIda8Yaf1BU4JPb6IyVXaieF7GyMf9bdMMzqacU=;
        b=duMinlc3Q/khVQhfk+g5OwYWgjvXHJc1nCOOceaz/nLJ4Mike3y6aTN0le8hrbhDnB
         pOBzybxHRMH/fAIaV8xBsPgpyR/GmV+rW7FHPNCyR1VYgkZawRzy4ZRZ75+g73hSnBmo
         Uy6xnevoN522Eg6XJoLT8nB8Fh/tzTmPoG4FsshAejdvrf2/PT13MEjnF5MWILutaGax
         wjCnqn0+2wv5PiDssQtGGewtgYqs15WHN3lVYkxZAYhPgBFs3Pi+t3H8vvJTyzDWd06a
         aGgjPbH5qiIE0k0q8I9iQCoHz+GMXA8iwM4MEmYA7fV8fEvUtqG6JEoItx+7IEdLl+uv
         1n9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759425851; x=1760030651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WrGwyIda8Yaf1BU4JPb6IyVXaieF7GyMf9bdMMzqacU=;
        b=EQS8/z+AidD/mvNTJhmODt8NRXdZyYtgVBj0ZYIcb6cEyhL93fP8zVZFdztzapul6E
         IybIyqQTjdRAbV3GwLOcGoRCk+z4uytoMWe5ahZ47m3hSqGu+dCR3ZjyQKEgWLaoTmcW
         Zq0XorekgVkCDE7kTBxueobVQ7pfKNZXfEaM4iuPmpTmbhYSRgYwA16Qdr4TqqfHznlJ
         rNoV8RP7h2xqd0C2BQCNlo3sqYp1lRb/X4b0OB1VmMN95zRGYbanqPx1RPvYZrfIoXM4
         MvNZnO0dvhpjr3BlrtLWQw9LWCJVTPloNbP712qm8k3PHqw7AhQNgcw/1DdwkrqStBAX
         AiJw==
X-Gm-Message-State: AOJu0YxhpuN7Cb2oXKmLDr62FYZQqwCleqyMMsWs9lYUVeyrpUD0NygW
	EPzAVJ2wVqh/jMDZ8jZXH7PxmyG3FryvfWuFPAnA1gNEtSftb+K7dGEE
X-Gm-Gg: ASbGncsR1zsaNRjDd1ksikGVnf+Pja0f37yLyy+nNfmKUQ09+9vmRVI7p7KDdIROD9w
	yZCGL4VeStbxFWi/3D1kEt4RohEN0+Hh5kAgrlkngvIP/2LluhawyItv+7J4715Qk4dYt5+KjWP
	ArtgRsAx5qYJi7TpXMn2y41REXH3DKbJ1TGvklVu4VqFaqmhPfbYP7OxQCnegMqu8w/nDE1mfHY
	KnjXT16K0JJFXmIqGgFaBBimoyuS5Hpa+hlm5Ql4jOWDSr89yzTMMXP7AKXYR85STu7pU0ung5V
	FfOrqf7YQDNP1ZYSqnCBHREsFn0z5I9R5fvu/p9T0LAhDxeyvohwqoIU2DFrIayRuOOr3Gks4+J
	ScBX5V1oMZTR1zyu0qDEB1loUhTjNi5Plv6QkU1avHZZRENxd3MxDHwWKYcc0NaS8IdD3dDXynb
	U=
X-Google-Smtp-Source: AGHT+IH1aTnmfvsiPbVHrnXi0F1Kl2CkjT6ZVGtsmT9NpSMfEE1Uey6PNJoaYFNjakybQ78Eeln/LQ==
X-Received: by 2002:a05:622a:1249:b0:4da:16c:6ce9 with SMTP id d75a77b69052e-4e576a446bcmr1430651cf.5.1759425850512;
        Thu, 02 Oct 2025 10:24:10 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55cbd3d9fsm24504971cf.32.2025.10.02.10.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 10:24:10 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v4 12/16] staging: rtl8723bs: add braces to all arms of conditional statement
Date: Thu,  2 Oct 2025 17:23:00 +0000
Message-Id: <20251002172304.1083601-13-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251002172304.1083601-1-vivek.balachandhar@gmail.com>
References: <20251002172304.1083601-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add braces consistently to all branches of conditional statements to
prevent potential future errors when modifying or extending logic.
This aligns with kernel coding style recommendations for clarity and
maintainability.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 74dfbc7a0c26..ac225bb9dc80 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1668,11 +1668,11 @@ void rtw_mlme_reset_auto_scan_int(struct adapter *adapter)
 	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
-	if (pmlmeinfo->VHT_enable) /* disable auto scan when connect to 11AC AP */
+	if (pmlmeinfo->VHT_enable) { /* disable auto scan when connect to 11AC AP */
 		mlme->auto_scan_int_ms = 0;
-	else if (adapter->registrypriv.wifi_spec && is_client_associated_to_ap(adapter) == true)
+	} else if (adapter->registrypriv.wifi_spec && is_client_associated_to_ap(adapter) == true) {
 		mlme->auto_scan_int_ms = 60 * 1000;
-	else if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
+	} else if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
 		if (check_fwstate(mlme, WIFI_STATION_STATE) && check_fwstate(mlme, _FW_LINKED))
 			mlme->auto_scan_int_ms = mlme->roam_scan_int_ms;
 	} else {
-- 
2.39.5

