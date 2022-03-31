Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8F5814
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 13:05:32 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id r23so28124692edb.0
        for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 06:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vhzg+EFSHTIr1gVDui1/FuKQCOLjPrm8bCZUxNvvDXU=;
        b=V12rv/gD9izH5kJjX4/6cUNAYZK5mCknm7kdkqtNI5auSjebI1oFnHvaPqKB87D5Ua
         eWcpwaWUlyMEL0qc0skuBP93r1L/dhi1ewpgYVxqQD79Rax9sWcSmPz1eXHPEorGnN3y
         YC1rWn8L6rDurf5KymFbuu6JLBRu0/MKx1X3oUUHhYvMBksunmwVdHpiuUSgY9m2icbb
         qbFjJLvo/dO6lDU1aXzRifD7oBUO7kIV7sUFRn7p95WWJeostmmztpY7AJ7HMI5MCvc8
         N6fRmhPQNNLjkLbrdJM1ma1Dhh44teNIPaKS91y/WXUX7YnImFHg/TZ10P7S6Puzs74h
         KDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vhzg+EFSHTIr1gVDui1/FuKQCOLjPrm8bCZUxNvvDXU=;
        b=3Cvac7Hf+zpP6ncLJ2x6Y8o2MVbYU6jB6bYEoJsPH5+mPNe3d9d+ytzx1TtTpmIZOw
         c1yu56dHGMeH01NyMvXGkUoNLZkCEh6nYtcJwYVfo7nYpNI7Qa8cxHiDTf/3tYfHE7fa
         1ZH0zTg33EbWJnLUqMvPs/QFFXXPb7xA4ea+MNq1VZPPeDsTt7S9DPjQmt87E0P6Q9L6
         64YdWSZESnvuvNILNP+56f+aOf5k8Bzdmb101ZDzEGdzYsgcLuFxOVV+waL8f5NVBxYZ
         dJ9FrO94WlVr5NdSLYdk/Vwq6VwVkHXt+iofAKm0WKr4VTqhEJ3mdWkUmsKEHWTw2Ylb
         7uJQ==
X-Gm-Message-State: AOAM531QTNAmqfhKM8QYLKuBWckGBTR78Re9F7iC5E6JU4xjKG/2lQnx
	bdhWkBdowgfMqtgkBGXT6nh4WlMrJ9c=
X-Google-Smtp-Source: ABdhPJxI+/ZNJNapuNc5I5I5OMz/nuAIDlweF9ZbVqo17g9YvwLlrKiTx6+7HAh+k+R2m81ecmrPWw==
X-Received: by 2002:aa7:cc82:0:b0:410:d2b0:1a07 with SMTP id p2-20020aa7cc82000000b00410d2b01a07mr16432053edt.359.1648731930883;
        Thu, 31 Mar 2022 06:05:30 -0700 (PDT)
Received: from localhost.localdomain ([95.90.187.85])
        by smtp.gmail.com with ESMTPSA id kw3-20020a170907770300b006d2a835ac33sm9333358ejc.197.2022.03.31.06.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 06:05:30 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/5] staging: r8188eu: remove HW_VAR_BCN_VALID from GetHwReg8188EU()
Date: Thu, 31 Mar 2022 15:05:19 +0200
Message-Id: <20220331130522.6648-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331130522.6648-1-straube.linux@gmail.com>
References: <20220331130522.6648-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HW_VAR_BCN_VALID from GetHwReg8188EU() just calls rtw_read8().
Remove HW_VAR_BCN_VALID from GetHwReg8188EU() and call rtw_read8()
directly. Move the call to a new function to indicate what it actually
does. This is part of the ongoing effort to get rid of the unwanted
hal layer.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c    | 10 ++++++++--
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c     |  2 +-
 drivers/staging/r8188eu/hal/usb_halinit.c      |  4 ----
 drivers/staging/r8188eu/include/hal_intf.h     |  1 -
 drivers/staging/r8188eu/include/rtw_mlme_ext.h |  1 +
 5 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 15a91c5fc852..3032a7e7977b 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -5755,7 +5755,7 @@ unsigned int send_delba(struct adapter *padapter, u8 initiator, u8 *addr)
 
 unsigned int send_beacon(struct adapter *padapter)
 {
-	u8 bxmitok = false;
+	bool bxmitok = false;
 	int	issue = 0;
 	int poll = 0;
 
@@ -5768,7 +5768,7 @@ unsigned int send_beacon(struct adapter *padapter)
 		issue++;
 		do {
 			yield();
-			GetHwReg8188EU(padapter, HW_VAR_BCN_VALID, (u8 *)(&bxmitok));
+			bxmitok = get_beacon_valid_bit(padapter);
 			poll++;
 		} while ((poll % 10) != 0 && !bxmitok && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
 	} while (!bxmitok && issue < 100 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
@@ -5784,6 +5784,12 @@ unsigned int send_beacon(struct adapter *padapter)
 	}
 }
 
+bool get_beacon_valid_bit(struct adapter *adapter)
+{
+	/* BIT(16) of REG_TDECTRL = BIT(0) of REG_TDECTRL+2 */
+	return BIT(0) & rtw_read8(adapter, REG_TDECTRL + 2);
+}
+
 void clear_beacon_valid_bit(struct adapter *adapter)
 {
 	/* BIT(16) of REG_TDECTRL = BIT(0) of REG_TDECTRL+2, write 1 to clear, Clear by sw */
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
index 2e252562e48c..45b788212628 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
@@ -568,7 +568,7 @@ void rtl8188e_set_FwJoinBssReport_cmd(struct adapter *adapt, u8 mstatus)
 				yield();
 				/* mdelay(10); */
 				/*  check rsvd page download OK. */
-				GetHwReg8188EU(adapt, HW_VAR_BCN_VALID, (u8 *)(&bcn_valid));
+				bcn_valid = get_beacon_valid_bit(adapt);
 				poll++;
 			} while (!bcn_valid && (poll % 10) != 0 && !adapt->bSurpriseRemoved && !adapt->bDriverStopped);
 		} while (!bcn_valid && DLBcnCount <= 100 && !adapt->bSurpriseRemoved && !adapt->bDriverStopped);
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 8cb1163ced5d..8c4bc78681e1 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1289,10 +1289,6 @@ void GetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 	struct odm_dm_struct *podmpriv = &haldata->odmpriv;
 
 	switch (variable) {
-	case HW_VAR_BCN_VALID:
-		/* BCN_VALID, BIT(16) of REG_TDECTRL = BIT(0) of REG_TDECTRL+2 */
-		val[0] = (BIT(0) & rtw_read8(Adapter, REG_TDECTRL + 2)) ? true : false;
-		break;
 	case HW_VAR_DM_FLAG:
 		val[0] = podmpriv->SupportAbility;
 		break;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 1e2177b8e11c..065fc7bd78d5 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -17,7 +17,6 @@ enum hw_variables {
 	HW_VAR_MLME_JOIN,
 	HW_VAR_SLOT_TIME,
 	HW_VAR_ACK_PREAMBLE,
-	HW_VAR_BCN_VALID,
 	HW_VAR_DM_FLAG,
 	HW_VAR_DM_FUNC_OP,
 	HW_VAR_DM_FUNC_RESET,
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index a00da19c4b88..0875472dbb72 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -538,6 +538,7 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr,
 		     unsigned char action, unsigned short status);
 unsigned int send_delba(struct adapter *padapter, u8 initiator, u8 *addr);
 unsigned int send_beacon(struct adapter *padapter);
+bool get_beacon_valid_bit(struct adapter *adapter);
 void clear_beacon_valid_bit(struct adapter *adapter);
 
 void start_clnt_assoc(struct adapter *padapter);
-- 
2.35.1

