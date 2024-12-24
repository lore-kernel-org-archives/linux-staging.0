Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380542030A
	for <linux-staging@lists.linux.dev>; Tue, 24 Dec 2024 13:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735046430; cv=none; b=PY9DZV6CPMvDxjlfHFEiGumUs8uPcnJtXdPM/B9cShUkS2hWleCWS4MYZNfO365C2TZzRYSk36kVm4vdmKNW9uNSGEO5nvzK+gjBsMzHAcmt4PGkxmD/RFKRYFWzpWyEutpptHbNgQlAXzFc6yTwysS891vAEnOQbffyXliSKOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735046430; c=relaxed/simple;
	bh=So07i7TsRc8MZo97SNl3OBIKdmzGjmYOs15PooVy7f0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S6lUEzjacJ9YHFIxRAJ/d4AEQmdLN1D3OMXPOLIausojvQbKDybmKY/3zJGLtaRovfAGFMUF3U2+mS9ETlnhUBA57cPu0J6xbWVC+wORo+J2u7Efy+slrwavagroF4BNl2kAivVKRUczA7UleEPLM+Ts7DQFYcneHfG9xuEnBDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ky6zG5ki; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ky6zG5ki"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21661be2c2dso47039205ad.1
        for <linux-staging@lists.linux.dev>; Tue, 24 Dec 2024 05:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735046428; x=1735651228; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hhd15APbcYRqWh+wXaifbceYc7BmeJiVjQiC8yBJW2Y=;
        b=Ky6zG5kiwn6QJC0OnUOKDai74nBWuc915fd62EWNViqO+USTaNJqs0NhlVuP3qJO+e
         QBBGJ6zSyVOSK5/3Ok9jTQra7IZOYBLvFq4Jq5TU2YG3d9ZcyLd//cQUlmwuT/aMMkc/
         /z+8WiFZDzp69KGocAOXM2syCDg72MMSWJm6R+iyuIw0UqCfbzZGCSjewy830WZY4uhd
         6Ort2rywMXOf8Ttx/argLohoJboQU2WuaOQTd4uge82VVVOpR/QqWHevb7Wru42/9Iva
         0X72g6Sl71mLD1vF3VKumTVFHnkqfdidN5rcZyNpH+hrMe7TCs2Uhs/bzt6WrgmY9WHp
         8VSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735046428; x=1735651228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhd15APbcYRqWh+wXaifbceYc7BmeJiVjQiC8yBJW2Y=;
        b=SU/hikvmoa5Ts98R3korFXa+mJurpLP5fXJ2l9a/c1GrCX+di6O0Tmd64tffyzFQn/
         npWt+HqhsXWgHCrCLAmsNNq7OWdtzOjTegE4XOSGz4MPYWaaLK96dJPt3N4hKv32zkl5
         405e0dBEsXaPkEiZm/eKraarUidSpdoUyxa1MgBlGg647S6ZggqPf5UmWOE2Bss6o6lk
         RJfMtXO3FTJN7TdmxT63lzKz3uzbCKmDDQ64KNBGSSISR44h01zxVgWIjHscE/Ua5qiW
         qH7Pl821VwstncpX19Y5HzYVWikl13kSaOuJwY/ZbuHv0ZWzU52d9EMISqs6BtTYTgma
         lHRg==
X-Forwarded-Encrypted: i=1; AJvYcCUToPZVQoJ22xm837VmPs74wrzO9wcsbeQCuJ+2tlfreCWIBHdfDiUXkQsNS3JQi/sAdlk8ysenpRiRzkTW@lists.linux.dev
X-Gm-Message-State: AOJu0YyQSHpqH4RREub7GolsTC2WrfFChCwRM5/Bkw6IHuVydUq+YNiv
	Fjd2b5F1Bcj0yEfwLBgsk2/NT418lRC+mGIIPPcF1tCh57cg4AiP
X-Gm-Gg: ASbGncvJY9/mi9Sn3jXoR7oKkOWXVOC7iwdNLuPzfEBdhQgxOUIaL9L/93OmE/87DkS
	pGh1AaJD65OEq3e0F20sEtSxF8+xRkHgzqjBgIKA5f1WeRYj+jcNq50IlU2OA/RbTpfAD+K7vwA
	TnfAyEdFI8paqoJLoLJ7ji0PGNxldrQhA7CEFJOuDpyRj12rZ+voBUti4vjdOtB3gHjoiJ7KrJS
	g2kPOyaBZVlBYNTPTqPDYuHoaPjR4ews7qmioEt2Vf0fTYYbpyq3jW9ofLaNqx9TasJrLcT8Nk=
X-Google-Smtp-Source: AGHT+IHJZM5TNdcX3fuV0F4Sl/9lZE4ImDD1ZRKAbGw+CJz9LYrra657DAAEa2qeZaSgxLGWaQV7nA==
X-Received: by 2002:a05:6a00:8089:b0:728:f337:a721 with SMTP id d2e1a72fcca58-72abdd7bc30mr19857385b3a.7.1735046428465;
        Tue, 24 Dec 2024 05:20:28 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:5aa6:b9fe:4943:be7f:75fd:aab3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842b2b3e83dsm7545589a12.32.2024.12.24.05.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 05:20:27 -0800 (PST)
From: Atharva Tiwari <evepolonium@gmail.com>
To: 
Cc: evepolonium@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Meir Elisha <meir6264@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8723bs: fix network selection in rtw_mlme.c
Date: Tue, 24 Dec 2024 18:50:17 +0530
Message-Id: <20241224132019.75475-1-evepolonium@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

this patch fixes the network selection logic to avoid selecting a network
with the same ESSID as the olddest scanned network if it was scanned
within the last 500 millisecounds

and please give a specific value for "new enough" on line 481,
i have estimated 500 millisecound but inform me if the value
needs to be changed

Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
---
Changes since v1:
- Changed the "new enough" value from 1000 millisecounds to 500
- fixed some styling issue

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 5ded183aa08c..6604619d1b99 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -481,8 +481,11 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 		}
 
 		if (rtw_roam_flags(adapter)) {
-			/* TODO: don't select network in the same ess as oldest if it's new enough*/
-		}
+			if (is_same_ess(&pnetwork->network, &oldest->network) &&
+				time_after(pnetwork->last_scanned,
+					(unsigned long)msecs_to_jiffies(500)))
+				continue;
+			}
 
 		if (!oldest || time_after(oldest->last_scanned, pnetwork->last_scanned))
 			oldest = pnetwork;
-- 
2.39.5

