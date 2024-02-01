Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC9D6216A
	for <linux-staging@lists.linux.dev>; Thu,  1 Feb 2024 14:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706796321; cv=none; b=Av8Ru1V3ttyjRBun/FmSsaHmrroly6a9Uo7OxpxnUKpKftrP0Eojl/ly5TTdRzrymDRnTTmvj8/0VnJHHRL8OngUe9jJ5YWfSqkX0U5b+21hE0cMPQXRgFG7X5XtJLuGTi7Cddrh8ZuT5awflRQ0SuSQJ7FBWxCfHVHNGN+KlBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706796321; c=relaxed/simple;
	bh=dUpEwtl6HrWQwmNRsfssIbEHclysv218wLdB+QE1DWA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mgTqcBp+Mt8WuchLRBvjkRgicDmQCOlCvNIrNl1Q50vJLF33Xlnz8MaTNq7sT8M2HIkyu/IEUUFeqk4+OCBjSfxuApcNMX/PJSZAfv9C0u4MPQE2f7VFgziUTlPV9XJrMU4Gu6XyZCaBgbBchF5MhLcXg/yo9VX9VPPusRmKViY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ACWZZE4n; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACWZZE4n"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33b14702adaso441821f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 01 Feb 2024 06:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706796318; x=1707401118; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdXU5rj7eakY5p27mKvfYSeW9QV6FkZ4NSs0xJtV3vw=;
        b=ACWZZE4nYfNKnltX6bo22Azi1s3HE9Iwk9bE1ibp9rpPd6xw2iM98m5CIoyHvx5SIz
         hCTQaSaqZ+KCwQnAOEWTIYuOJcTkuJhCKIj2eWi67IEspEk7Jc84RGchP5cc43eQWako
         /ljLIDGOX0sKKmJBxe1OC7If22QmPDVdWsqa4jreO0VJIOXTlAGCmXyVhJ9/N/5jXNBh
         b+cseU9DBg7wgLoSs9VxpZnlIjLkNNawqfHj+UxhEgxovQAUGWOiL4lgTTFtl8+mEo5P
         2jrHYNvDYJlOqsJV7VwLHGQnyn7ohQ1pyOw2xGReGqHyTJ+iDmJ64XUxDOMA/oRi947C
         lvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706796318; x=1707401118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdXU5rj7eakY5p27mKvfYSeW9QV6FkZ4NSs0xJtV3vw=;
        b=aPzEc5dPx5BK5sSonQSDlTtJhUD2LOsvzpFfj0FfotgHevUah4pzrviEV++C31dVIe
         TRgMocYdmhoytVQbQRjm5w9yg1Kj8/4a9n3IKCm89GYe60eWBU6ECWeSTZUKnAcFq06V
         SX8lzvSHrBlFZjUzlOjNCX9UvaMNmY8iwA1onuYGKuPQFVxb1ya82H9aLz+o4ZoIcsyL
         KHBUlNpAMpcfUAW4INvkaj231kMmw6GTcdrxsSpY+GOWwXxvrHK9r+rmRcxkH2f5rY0+
         8ZtvusSnUH8gbXXy4aZyEtTBA0EJTrmIAredI7wJU24vaOaFAIRHpgWUWXvMV+Zkf011
         xCHw==
X-Gm-Message-State: AOJu0Yx/Lhi1wu9lIoW4l5E31phKwbL1vWyCw5R8RtLPNu0rB6D9IA1X
	mm20nM7MMUsDMQ8xcKP6RUY2bUKB+6xrpiyI8qjhezNhM1Y6VCqu
X-Google-Smtp-Source: AGHT+IFxA1ogf/virsIXTJ/ZtZ86nDJzZNd+ZydaO5BklUltbf9SJS/NkIfszYgY8bLVS1VThYs9MA==
X-Received: by 2002:a5d:548d:0:b0:33b:1bb9:af19 with SMTP id h13-20020a5d548d000000b0033b1bb9af19mr104050wrv.54.1706796318130;
        Thu, 01 Feb 2024 06:05:18 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUzk7AUvEJhqoe8POG+VzWLqYmptGvNd08BPjkPQ1kmC8OFA9WF9m1GHxCGXGlIBVWAqGx17N/Fd1KJzwdO2T+vJgu+spml0jKpInVNXFRlL9zpSLqAdiHbP7Yx59I3NMA8kBtzWXxqfrIO+kw53JWVXH5JywfjfCy8x4luRyad1jhX8ynqFvvEoOQV6Xhve7i6kZ/mxhNySsZqiMgrUVxys67LWO0I
Received: from Ubuntu22.myguest.virtualbox.org ([46.121.140.152])
        by smtp.gmail.com with ESMTPSA id ci10-20020a5d5d8a000000b00339281d98c9sm16522227wrb.72.2024.02.01.06.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 06:05:17 -0800 (PST)
From: Meir Elisha <meir6264@gmail.com>
X-Google-Original-From: Meir Elisha <meir6264@Gmail.com>
Received: by Ubuntu22.myguest.virtualbox.org (sSMTP sendmail emulation); Thu, 01 Feb 2024 16:05:14 +0200
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ruan Jinjie <ruanjinjie@huawei.com>,
	Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Meir Elisha <meir6264@Gmail.com>
Subject: [PATCH v2 4/4] Staging: rtl8723bs: fix else after break warning
Date: Thu,  1 Feb 2024 16:04:59 +0200
Message-Id: <20240201140459.438479-5-meir6264@Gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240201140459.438479-1-meir6264@Gmail.com>
References: <20240201140459.438479-1-meir6264@Gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch warning:
else is not generally useful after a break or return

Signed-off-by: Meir Elisha <meir6264@Gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 40 +++++++++--------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 13bc0ebca247..6a9b57fd1a97 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1498,30 +1498,25 @@ void _rtw_join_timeout_handler(struct timer_list *t)
 
 	spin_lock_bh(&pmlmepriv->lock);
 
-	if (rtw_to_roam(adapter) > 0) { /* join timeout caused by roaming */
+	if (rtw_to_roam(adapter) == 0) {
+		rtw_indicate_disconnect(adapter);
+		free_scanqueue(pmlmepriv);
+		/* indicate disconnect for the case that join_timeout
+		 * and check_fwstate != FW_LINKED
+		 */
+		rtw_cfg80211_indicate_disconnect(adapter);
+	} else { /* join timeout caused by roaming */
 		while (1) {
 			rtw_dec_to_roam(adapter);
-			if (rtw_to_roam(adapter) != 0) { /* try another */
-				int do_join_r;
-
-				do_join_r = rtw_do_join(adapter);
-				if (do_join_r != _SUCCESS)
-					continue;
-
-				break;
-			} else {
+			if (rtw_to_roam(adapter) == 0) {
 				rtw_indicate_disconnect(adapter);
 				break;
+			} else if (rtw_do_join(adapter) != _SUCCESS) { /* try another */
+				continue;
 			}
-		}
-
-	} else {
-		rtw_indicate_disconnect(adapter);
-		free_scanqueue(pmlmepriv);/*  */
-
-		/* indicate disconnect for the case that join_timeout and check_fwstate != FW_LINKED */
-		rtw_cfg80211_indicate_disconnect(adapter);
 
+			break;
+		}
 	}
 
 	spin_unlock_bh(&pmlmepriv->lock);
@@ -2052,12 +2047,9 @@ signed int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, u
 	}
 
 	iEntry = SecIsInPMKIDList(adapter, pmlmepriv->assoc_bssid);
-	if (iEntry < 0) {
-		return ielength;
-	} else {
-		if (authmode == WLAN_EID_RSN)
-			ielength = rtw_append_pmkid(adapter, iEntry, out_ie, ielength);
-	}
+	if (iEntry > 0 && authmode == WLAN_EID_RSN)
+		ielength = rtw_append_pmkid(adapter, iEntry, out_ie, ielength);
+
 	return ielength;
 }
 
-- 
2.34.1

