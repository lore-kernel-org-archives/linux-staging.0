Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1627F269CE5
	for <linux-staging@lists.linux.dev>; Sat, 23 Aug 2025 12:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755953027; cv=none; b=B/RObVcqwtq2ts0MCxN/fBQTafxgvP9c00R8lrCasy4TmzMMewdEzykwWyJXCpNxYI2mwLAyBd+dB4UhL7mzX0Uh4Euaivj9IzLwXNX0DdqMBM/XfPn8PxEsm3tOfVkEmTr8G9yr9oiSySvD+dTrdlDO9xonk16QEzN6ICZ4GqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755953027; c=relaxed/simple;
	bh=IanlrOwnnjBBrz4JaH6rwyvteh8W9IK5cImbmNuzYw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nvnaLGQkbw6v/b/GzcdDhyW51lN5zA5yyK/XfonMs6YWh8wqYGgZlmYapNDR6JxpVCIZ8+IyOvPMLTazqibPLlMjAbiiwkxbRL71tndI/RdJrGL+o+vkomDKK62ZUchGcVaHaeguPufe2EjZbRZTHQIvoSShqp1cBiUkNOX/doE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KyNAsW1l; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KyNAsW1l"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb7322da8so445825466b.0
        for <linux-staging@lists.linux.dev>; Sat, 23 Aug 2025 05:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755953024; x=1756557824; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BlpWMFNb27oGthpW/T6mneIPKbt2sHdUQYK8r4ZWK0g=;
        b=KyNAsW1lcLfC4qYllpBWf862JrRYsvq66YRLFVTL/dlgU18UQFAoOo9vbwzJaxlatJ
         TmxIvH0yI3xYl+dQQZ55dbml1nEGtgv8hqArDfqVjX29jcl030voKe5N4ZugYtJ65k5M
         tkrOdOKxbWTT/uSRQenyt1zX7FhGOBaOnXXofnjr1gvcJ6htmuOV11Vf8YEgbv9WpnBd
         VSoYyCCfdZFgCeugcfocjZe0PYb1oVrIhhnIJohpuvYviiWi6UIOsmlzSUueZFg0OWCg
         2LwUKJUQL6sZE4/iHl9E5apOZU/emsyVJGQRbY8Wjxvjo0SfIfRuF9NPl/XLL2syZG9i
         6Mkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755953024; x=1756557824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BlpWMFNb27oGthpW/T6mneIPKbt2sHdUQYK8r4ZWK0g=;
        b=lBBWmU8q6gmY0S2q8Q3iFP6VCCHAZcgLFzmxiknR9W/5cx6lWFXOKYlis51vt8VqnM
         mgwjpq5GynaN2Q2ZxAHA8Sh8x8GWj89z/hHGBJSne/+C+s9n9bMBc/QDueoSuLDiUQzg
         PBot69GmbDLcErq9qOZ+Y9T2OQQ8EPOCamrWRZOpCQtrfcpFPAOlKM9GcicTuqeC1MKf
         dAJFMukIaaFD0M73FGQp9vHXg15CVND4eywsIIr+vwWV/rANNv3s1Ams65LQXRosspzA
         UOyVkKXVbQDpcNkp5LtD94Saeo5LHaoOKr0fmMGhf0ggdwCcvDEpW/FVlQhe0yT488Qn
         Yyuw==
X-Forwarded-Encrypted: i=1; AJvYcCX0WhV7ftSy+GTOytl9AQ/g0ajnWKPIGaup0NU+0E4FVO+fPkxvTYfcB08Yq9U8XdvotGzVNYgjUp5SWl49@lists.linux.dev
X-Gm-Message-State: AOJu0YxVOJ4HYgzydSRzXWDzjkNdQd7oVXAPX5ZOoppkM4iUFYVHNr3X
	8shulelfWGHFOqjire2TR30oX7zB3rgUnnES5ZuTmjfR1TL/Eiy62fYhx5vX+A==
X-Gm-Gg: ASbGncug8hvHvlh9ycfsW77QYA/60hIxRIiFVEj6YS73zpWAf9alXArTOCvsYYFgvHv
	IMD7XSbf1KIAcNWcWRJpvOCSGA/Gd00JyCLqm53VYHq8yVysZgjqP1xiZaxE1nJQZ4lRnJbQR1H
	kUdk41adUHLq76NfiNh1Bn35ScuVHmdsApQGmgh+B3n8thYNGg/9gcpfq4r06Xq/stJIeXYiEKx
	gMug4IdFnUcMpL/1mohKljn0d0w8+BscGq+UrzUeoHt6smyDZJn62XzSp3otzO9q+EOVHTbYcpE
	PbTYvfmkIL8z1zdUD3J1webBDqVbUxronU4f6vjZICA992jKtgsviJIpUWfxQLCw2N4Ngqr95PD
	QD0HB5coLPqQCAxwbMgmcZzlv8g==
X-Google-Smtp-Source: AGHT+IHaVisegjQ9un4mzCp0ZhRFxVs2znau0+RrxU5O9zNvz+u1VqtORNXI6y8NK2V/NUg74HclLQ==
X-Received: by 2002:a17:907:96a9:b0:ad8:9e80:6bc3 with SMTP id a640c23a62f3a-afe28ffcdf4mr585948666b.1.1755953024284;
        Sat, 23 Aug 2025 05:43:44 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe49a1f5a6sm165076466b.111.2025.08.23.05.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 05:43:43 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 12/14] staging: rtl8723bs: clean up variable initializations
Date: Sat, 23 Aug 2025 14:43:19 +0200
Message-ID: <20250823124321.485910-13-straube.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250823124321.485910-1-straube.linux@gmail.com>
References: <20250823124321.485910-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After previous cleanup patches the variable initializations in
hal_EfuseSwitchToBank are messed up a little, but were left as-is to make
reviewing easier. For example bRet is initialized to false and immediately
set to true. This patch cleans up the variable initializations.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 014d94894de9..ab30d2598825 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -448,11 +448,9 @@ static u8 hal_EfuseSwitchToBank(
 	struct adapter *padapter, u8 bank
 )
 {
-	u8 bRet = false;
-	u32 value32 = 0;
+	u8 bRet = true;
+	u32 value32 = rtw_read32(padapter, EFUSE_TEST);
 
-	value32 = rtw_read32(padapter, EFUSE_TEST);
-	bRet = true;
 	switch (bank) {
 	case 0:
 		value32 = (value32 & ~EFUSE_SEL_MASK) | EFUSE_SEL(EFUSE_WIFI_SEL_0);
-- 
2.51.0

