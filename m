Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271F857F5
	for <linux-staging@lists.linux.dev>; Fri,  1 Jul 2022 21:08:02 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id u12so6079922eja.8
        for <linux-staging@lists.linux.dev>; Fri, 01 Jul 2022 14:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LHuqyEIXQpdDe9hw0YGVIKUxE052PWFvNDZe12GKtKM=;
        b=SCn6U43tkUsHk3DESgQq5eZ4zuqbkjqwqB/qUX5TmvjIIbQro72DaWVJ9uLeghWhOB
         RY/dg1Mh9DHqqbsGG2+vf5NLElWTH4zKpVPHuNzHDSS419T35ksAjnE3kHrDFhGqT0wI
         BAzx94t+jXiNBtxrivIJJnste+/YJAL010gbhe8y52/yibBopCbvgDXehA6hicOXqtkG
         DnD2pbvfcqNDbPWL1YV3JNG58o0JebxDMinoEWXSIxXOtHWsF6fjTYhL2T4hgT4QkM+t
         TQC5PfV0u7NbB4KRqkILXNE530GjrV7cavcGMt7Yp/O96MM2ur6uxXZOdjoIlS+UfrrN
         ELjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LHuqyEIXQpdDe9hw0YGVIKUxE052PWFvNDZe12GKtKM=;
        b=AzX2uUbY587r50q8/FikzWDI6J9LeI1P5OUOGnQnecIVT3irfC+iRXSdYvXyE7pbMY
         mrksihFXlnc9cgjlxIAn7/wQffxppyDjUUJNJmMyKzgdHEbKMnnnclR+3ZkDcOt7vZwl
         aolxtfAumZWWq1LWt+fmN06JywcfhZLIYuq2upaJ4VMrDG+9NHeDczxDrGKSql6vdKir
         Fmz3uMKIrX8HlnBa7Yt5okmoCVDClGZZ9EnkT2l6v2dE9ANQgHaJ7XdsU/4BQwfFc14N
         ESHxkH2TdoHlOtZpPQ7E7onALcCc5bSD5HrgIO0ghm6RtFiib3PamGIW3uEXF+yVyTEC
         fMRQ==
X-Gm-Message-State: AJIora+rI/r1EZfC4kLblajvYP0xATr8q5MisNmMMZ3VItYVX0UfkeWs
	FdeyO/reHYM4bIo5vGMZeEYYMOuOT68=
X-Google-Smtp-Source: AGRyM1sAbB3wYi2bxdam8OWBiz/ndF8TAO0VUSjJb9oP+7GZmYAMuQiaiYSDE4Y+0boIeJu0p6Z7iw==
X-Received: by 2002:a17:907:16a2:b0:726:abbc:69bf with SMTP id hc34-20020a17090716a200b00726abbc69bfmr15880254ejc.363.1656709680316;
        Fri, 01 Jul 2022 14:08:00 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb5d.dynamic.kabel-deutschland.de. [95.90.187.93])
        by smtp.gmail.com with ESMTPSA id b9-20020aa7dc09000000b00437938c731fsm9646646edu.97.2022.07.01.14.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 14:08:00 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: remove HW_VAR_AMPDU_FACTOR from SetHwReg8188EU()
Date: Fri,  1 Jul 2022 23:07:53 +0200
Message-Id: <20220701210753.8210-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the case HW_VAR_AMPDU_FACTOR from SetHwReg8188EU() and move
the functionality to a static function in rtw_wlan_util.c. This is
part of the ongoing effort to get rid of SetHwReg8188EU().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c | 28 +++++++++++++++++++-
 drivers/staging/r8188eu/hal/usb_halinit.c    | 26 ------------------
 drivers/staging/r8188eu/include/hal_intf.h   |  1 -
 3 files changed, 27 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index 2d5fd654ead9..aa6b549fd54d 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -805,6 +805,32 @@ static void set_min_ampdu_spacing(struct adapter *adapter, u8 spacing)
 	}
 }
 
+static void set_ampdu_factor(struct adapter *adapter, u8 factor)
+{
+	u8 RegToSet_Normal[4] = {0x41, 0xa8, 0x72, 0xb9};
+	u8 FactorToSet;
+	u8 *pRegToSet;
+	u8 index = 0;
+
+	pRegToSet = RegToSet_Normal; /*  0xb972a841; */
+	FactorToSet = factor;
+	if (FactorToSet <= 3) {
+		FactorToSet = (1 << (FactorToSet + 2));
+		if (FactorToSet > 0xf)
+			FactorToSet = 0xf;
+
+		for (index = 0; index < 4; index++) {
+			if ((pRegToSet[index] & 0xf0) > (FactorToSet << 4))
+				pRegToSet[index] = (pRegToSet[index] & 0x0f) | (FactorToSet << 4);
+
+			if ((pRegToSet[index] & 0x0f) > FactorToSet)
+				pRegToSet[index] = (pRegToSet[index] & 0xf0) | (FactorToSet);
+
+			rtw_write8(adapter, (REG_AGGLEN_LMT + index), pRegToSet[index]);
+		}
+	}
+}
+
 void HTOnAssocRsp(struct adapter *padapter)
 {
 	unsigned char		max_AMPDU_len;
@@ -831,7 +857,7 @@ void HTOnAssocRsp(struct adapter *padapter)
 
 	set_min_ampdu_spacing(padapter, min_MPDU_spacing);
 
-	SetHwReg8188EU(padapter, HW_VAR_AMPDU_FACTOR, (u8 *)(&max_AMPDU_len));
+	set_ampdu_factor(padapter, max_AMPDU_len);
 }
 
 void ERP_IE_handler(struct adapter *padapter, struct ndis_802_11_var_ie *pIE)
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 3908c46d2fbe..1a08de85a6ae 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1209,32 +1209,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 	case HW_VAR_DM_FUNC_CLR:
 		podmpriv->SupportAbility = 0;
 		break;
-	case HW_VAR_AMPDU_FACTOR:
-		{
-			u8 RegToSet_Normal[4] = {0x41, 0xa8, 0x72, 0xb9};
-			u8 FactorToSet;
-			u8 *pRegToSet;
-			u8 index = 0;
-
-			pRegToSet = RegToSet_Normal; /*  0xb972a841; */
-			FactorToSet = *((u8 *)val);
-			if (FactorToSet <= 3) {
-				FactorToSet = (1 << (FactorToSet + 2));
-				if (FactorToSet > 0xf)
-					FactorToSet = 0xf;
-
-				for (index = 0; index < 4; index++) {
-					if ((pRegToSet[index] & 0xf0) > (FactorToSet << 4))
-						pRegToSet[index] = (pRegToSet[index] & 0x0f) | (FactorToSet << 4);
-
-					if ((pRegToSet[index] & 0x0f) > FactorToSet)
-						pRegToSet[index] = (pRegToSet[index] & 0xf0) | (FactorToSet);
-
-					rtw_write8(Adapter, (REG_AGGLEN_LMT + index), pRegToSet[index]);
-				}
-			}
-		}
-		break;
 	default:
 		break;
 	}
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index c3704618bccc..b81144932d9a 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -17,7 +17,6 @@ enum hw_variables {
 	HW_VAR_DM_FUNC_OP,
 	HW_VAR_DM_FUNC_RESET,
 	HW_VAR_DM_FUNC_CLR,
-	HW_VAR_AMPDU_FACTOR,
 };
 
 typedef s32 (*c2h_id_filter)(u8 id);
-- 
2.36.1

