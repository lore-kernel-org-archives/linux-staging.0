Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739DB815
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 13:05:33 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id r23so28124722edb.0
        for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 06:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UE4Nx0CiTaCczhJ2vYi5Ie0116akL9a7MnthzOVYiR8=;
        b=OlrEIJa52NH8jCOlaQ3+hYcIEuyuwp6tVMbKB787dxYsbdcsPPQC63OIJ7VXhU8w1/
         6csxZjXYaHkH4zNGIrJKU7PTMU++UO96s5nYGHyCkDelF5NUR3WiN9dFlaN151HUeC7b
         o4QS/zJIo2eht4oEw7/9hP7g/t56wamG5LNWNTQRL/DKY1l/Vn4CZz9hgaJdykwiDX0C
         dNrfSccT8zp1WbZwYOX/ZVQ37qSCeIquilyrpyW0n5t3wfoiNpLcsN/eBhZkz1hyFm3W
         hKKY5iCsb3YK++J57+r8agGJTN2uxJC5zAa1widOmsXzpt2Zg57D6pycVBbVgVa+KtYU
         4C/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UE4Nx0CiTaCczhJ2vYi5Ie0116akL9a7MnthzOVYiR8=;
        b=7sj52RUT/mEjjuYlrN+8qPVUaCZ3cjU9FOiHFz3Xz+MeK5yJjG5m2kwQEmqsD69lmH
         Blyq5rCeuzVDTF5oKALELVemZCmpjQbUrA3o3UVhoFitWafbQrzQnzhfaB5LfxMqplIS
         D6gneO4QQ4nPaCPEFrIMetSX3wL7NE30XDQkvBukGdsf4tGTmvGpQzYnWTHZmcp/cozH
         CfCb2E/Knso5Y3NBzWvR7qURUv1bHH8UYQ9DHzWSwPglZ27RzlNmNjjjQg3Rx8/dvU7E
         P/z8NZ0RG59pAdggV9GQWuAGPWgFP0LHNBkditS5fpcPVsyG4cvGDSqCXSnysXd3mrr/
         oK9w==
X-Gm-Message-State: AOAM530S277xx0+oiZXMJSpNaoSix6CCmDvD/6eH+2kBGkcB96RBdcHC
	At8Y99B7NX25w0njUPJpOtE=
X-Google-Smtp-Source: ABdhPJxuP9Apo1VHcnc/4RfNtkPAHelI4026bKbbWIjW9YKgNTAt9ARLJUajmJmP5l37C4vHBGYO6Q==
X-Received: by 2002:a05:6402:51d2:b0:419:7d2e:9d0 with SMTP id r18-20020a05640251d200b004197d2e09d0mr16378621edd.82.1648731931763;
        Thu, 31 Mar 2022 06:05:31 -0700 (PDT)
Received: from localhost.localdomain ([95.90.187.85])
        by smtp.gmail.com with ESMTPSA id kw3-20020a170907770300b006d2a835ac33sm9333358ejc.197.2022.03.31.06.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 06:05:31 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/5] staging: r8188eu: remove HW_VAR_CHK_HI_QUEUE_EMPTY from GetHwReg8188EU()
Date: Thu, 31 Mar 2022 15:05:20 +0200
Message-Id: <20220331130522.6648-4-straube.linux@gmail.com>
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

The HW_VAR_CHK_HI_QUEUE_EMPTY from GetHwReg8188EU() just calls
rtw_read32(). Remove HW_VAR_CHK_HI_QUEUE_EMPTY from GetHwReg8188EU()
and call rtw_read32() directly. Move the call to a new function to
indicate what it actually does. This is part of the ongoing effort to
get rid of the unwanted hal layer.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c     | 14 +++++++-------
 drivers/staging/r8188eu/hal/usb_halinit.c  |  3 ---
 drivers/staging/r8188eu/include/hal_intf.h |  1 -
 3 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 859ec8d8ad9e..496fb67f2253 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -1199,6 +1199,11 @@ u8 rtw_ps_cmd(struct adapter *padapter)
 	return res;
 }
 
+static bool rtw_is_hi_queue_empty(struct adapter *adapter)
+{
+	return (rtw_read32(adapter, REG_HGQ_INFORMATION) & 0x0000ff00) == 0;
+}
+
 static void rtw_chk_hi_queue_hdl(struct adapter *padapter)
 {
 	int cnt = 0;
@@ -1210,12 +1215,7 @@ static void rtw_chk_hi_queue_hdl(struct adapter *padapter)
 		return;
 
 	if (psta_bmc->sleepq_len == 0) {
-		u8 val = 0;
-
-		/* while ((rtw_read32(padapter, 0x414)&0x00ffff00)!= 0) */
-		/* while ((rtw_read32(padapter, 0x414)&0x0000ff00)!= 0) */
-
-		GetHwReg8188EU(padapter, HW_VAR_CHK_HI_QUEUE_EMPTY, &val);
+		bool val = rtw_is_hi_queue_empty(padapter);
 
 		while (!val) {
 			msleep(100);
@@ -1225,7 +1225,7 @@ static void rtw_chk_hi_queue_hdl(struct adapter *padapter)
 			if (cnt > 10)
 				break;
 
-			GetHwReg8188EU(padapter, HW_VAR_CHK_HI_QUEUE_EMPTY, &val);
+			val = rtw_is_hi_queue_empty(padapter);
 		}
 
 		if (cnt <= 10) {
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 8c4bc78681e1..611785caa17f 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1310,9 +1310,6 @@ void GetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 			}
 		}
 		break;
-	case HW_VAR_CHK_HI_QUEUE_EMPTY:
-		*val = ((rtw_read32(Adapter, REG_HGQ_INFORMATION) & 0x0000ff00) == 0) ? true : false;
-		break;
 	default:
 		break;
 	}
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 065fc7bd78d5..f0a6d697e68b 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -33,7 +33,6 @@ enum hw_variables {
 	HW_VAR_FIFO_CLEARN_UP,
 	HW_VAR_RPT_TIMER_SETTING,
 	HW_VAR_H2C_MEDIA_STATUS_RPT,
-	HW_VAR_CHK_HI_QUEUE_EMPTY,
 };
 
 enum hal_def_variable {
-- 
2.35.1

