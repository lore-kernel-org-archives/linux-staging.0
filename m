Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D873FE3
	for <linux-staging@lists.linux.dev>; Sun, 30 Jan 2022 19:03:44 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id me13so36111378ejb.12
        for <linux-staging@lists.linux.dev>; Sun, 30 Jan 2022 11:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0WNZPBbLkLD5BATZjpOdpNx2Pq3vxYoH7d33hip6I60=;
        b=YQXKzKee807KM9FTAvhayv2BpNZlHZa8mLsZsZHvifprAjUBsZKdMAg/gECaH6jb5E
         +8Xy9Mjuj1z1ZLl+0+pd5gE83wKGlYqMSSYooNqYHUED0is7yIC5i2b4Pvfbm5L2Gi/s
         T9sc3SPU99qfjlgrXPyITWtT9ZCYsO0RjnSJpMlpztiCVnPCaADtqZQMHV0wsR8GGupc
         buq7S+7rQyaTTYWStZFTX5z7icIDq2AYh/nVQoOj3KtNTCF9fdwMQgDh+W/rTNo+P7Tl
         QFlek6LSvWtU1LLJOjSJeEQNBf5WoUQI6WCsaKuW2RfRp90QRgpknfISCUxjavdGXbGl
         JExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0WNZPBbLkLD5BATZjpOdpNx2Pq3vxYoH7d33hip6I60=;
        b=ML2V18wxT1BOGVz4v3PnB5Zfc7/SG60ntP+D2UPfG01RY7rUaEwwQzRNEZXhNkV8V7
         rk2uoAR9a/G8Ky4IcnmXv5tip/T8aYCS4gNhc8FUZLffRMfx8mcSJ5qUHuYOCywf4yeD
         xS5CSzctDj+aCJzNST6T26BBHEd/DndnzXvtn7lph1cg5UkU5PuzePVYrCLh71Kp79N0
         yXgc9/GvfcmhmYOUocr/eT9a8xRjBziukOpjYPOXGhI2vf5/8HXsuE7sgMuGETgZyM1P
         r9EF0Q9wBt1yMYE486N0R4hPg54UqAx0NF7vHTsqcTvAwDjtVhr/4CgLMJgb61IY9Xxj
         kvjA==
X-Gm-Message-State: AOAM533/yLSD64HyLCNStQVJR6IKIFxhTAmaFWqzNSVHaRRRairon3Wa
	dRnBLAUoV0WTr/YcdDRxFpo=
X-Google-Smtp-Source: ABdhPJxKQ3eirYKDmDkWO9d7T7Ayf2b5TuaNS8KPTNjVEKyDQgZUKPwF+yEm4osx7+v3JIQSNVooig==
X-Received: by 2002:a17:907:16a6:: with SMTP id hc38mr15249048ejc.291.1643569423221;
        Sun, 30 Jan 2022 11:03:43 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb5a.dynamic.kabel-deutschland.de. [95.90.187.90])
        by smtp.gmail.com with ESMTPSA id n3sm921124ejr.6.2022.01.30.11.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 11:03:42 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 11/12] staging: r8188eu: remove HW_VAR_CHECK_BSSID
Date: Sun, 30 Jan 2022 20:03:20 +0100
Message-Id: <20220130190321.7172-12-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130190321.7172-1-straube.linux@gmail.com>
References: <20220130190321.7172-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HW_VAR_CHECK_BSSID case in SetHwReg8188EU() is not used.
Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_halinit.c  | 13 -------------
 drivers/staging/r8188eu/include/hal_intf.h |  1 -
 2 files changed, 14 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 796c898bfb8c..bab76a92ece5 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1122,19 +1122,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 				ResumeTxBeacon(Adapter);
 		}
 		break;
-	case HW_VAR_CHECK_BSSID:
-		if (*((u8 *)val)) {
-			rtw_write32(Adapter, REG_RCR, rtw_read32(Adapter, REG_RCR) | RCR_CBSSID_DATA | RCR_CBSSID_BCN);
-		} else {
-			u32 val32;
-
-			val32 = rtw_read32(Adapter, REG_RCR);
-
-			val32 &= ~(RCR_CBSSID_DATA | RCR_CBSSID_BCN);
-
-			rtw_write32(Adapter, REG_RCR, val32);
-		}
-		break;
 	case HW_VAR_MLME_DISCONNECT:
 		/* Set RCR to not to receive data frame when NO LINK state */
 		/* reject all data frames */
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 7be5eb2c4a9b..5add8d100da7 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -14,7 +14,6 @@ enum hw_variables {
 	HW_VAR_INIT_RTS_RATE,
 	HW_VAR_BASIC_RATE,
 	HW_VAR_CORRECT_TSF,
-	HW_VAR_CHECK_BSSID,
 	HW_VAR_MLME_DISCONNECT,
 	HW_VAR_MLME_SITESURVEY,
 	HW_VAR_MLME_JOIN,
-- 
2.34.1

