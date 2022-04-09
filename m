Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFB2810
	for <linux-staging@lists.linux.dev>; Sat,  9 Apr 2022 12:06:44 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id w18so12746550edi.13
        for <linux-staging@lists.linux.dev>; Sat, 09 Apr 2022 05:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sL45mKNoTqnnk6QANCD/gP//tD3yOWqa4ItmJXFVefk=;
        b=XFCwvzZ3cY/7Mv88ITvYg0x1nn4/dfRj4XKaZEgFd2jIn4ppYOdCuxG3+y3qqKuvsC
         9LdsnS7Xi0QFz5qaheAyHhsymhewv+7cOnAYbqAZSsYLgk+WDf8TF0AdotG8d3u144cT
         /Eo/SgxhL1R1FrzoR4xaZORxIRjtrSRSbyL+Snt3pJmjrUx3pzL+2zuWOurhsDM3/kor
         rZoj9aTaL5B8kmDb68y88UX7IZHq6CShJJW1VQLRYBWiktxm3knmsA/nR6j8a0mtv2lA
         m4FyNZnOsWwv2bwcX7ke8YI4M9m/fX6fN3tMc848IMzo7+oEWsx5h0UgHjq59G6SVQwA
         uLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sL45mKNoTqnnk6QANCD/gP//tD3yOWqa4ItmJXFVefk=;
        b=SHcw19Hahn2f2zpqPqchmu+KOH32ctMMMvzvvgLN8vbCBPdeNzL0wfm7zNac27fjSJ
         0wbHWAxm9hlbumRAlv0TT3W+u63edx7y0fBJgbfUqRuyn2f0lZ4ZwqE6kOICknPJBbLK
         Zx6foYlYY+3wR9ZqClAKiI+68tvMfuVvcNkgZ2edN8/eo/YU7F4Eo6KR74TBq20ff+ix
         Kik03hTOE6x0v1DmHwUolqkmqtM5KvX2zIqbtUqKyOEmlbitEhSUfYM778j5LAr9HscV
         kjhL/RHDVT87Wcj0jxx0mFqYdAWF2tuGIMNIU49mOMXtkKmiP0CV/b8s26sc1QGA+dCF
         pAfA==
X-Gm-Message-State: AOAM533wRETpTdrIEBVxNZBB61cgU8fqK3SgJPR+xAGogOLPGyiwSkxW
	RRFQ+1m4QqMVm8Z2F1Osdas=
X-Google-Smtp-Source: ABdhPJy4MRAFo0KUaEnBSUApDBM0F0zws6Yy4/9oHx2G85uHH2HOczhKfUiSc0+KfOSJ4X2iKyzcwQ==
X-Received: by 2002:a05:6402:40c4:b0:419:135b:83ac with SMTP id z4-20020a05640240c400b00419135b83acmr23953710edb.321.1649506003252;
        Sat, 09 Apr 2022 05:06:43 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id z21-20020a170906435500b006e8669fae36sm1102947ejm.189.2022.04.09.05.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Apr 2022 05:06:42 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/4] staging: r8188eu: remove HW_VAR_FIFO_CLEARN_UP
Date: Sat,  9 Apr 2022 14:06:26 +0200
Message-Id: <20220409120627.10633-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220409120627.10633-1-straube.linux@gmail.com>
References: <20220409120627.10633-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the HW_VAR_FIFO_CLEARN_UP case from SetHwReg8188EU() and move
its functionality to a new static function in os_intfs.c. This is part
of the ongoing effort to get rid of the unwanted hal layer.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_halinit.c  | 26 -------------------
 drivers/staging/r8188eu/include/hal_intf.h |  1 -
 drivers/staging/r8188eu/os_dep/os_intfs.c  | 29 +++++++++++++++++++++-
 3 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index e50d47bf1f0f..62ada1790d0d 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1116,32 +1116,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 			rtl8188e_set_FwPwrMode_cmd(Adapter, psmode);
 		}
 		break;
-	case HW_VAR_FIFO_CLEARN_UP:
-		{
-			struct pwrctrl_priv *pwrpriv = &Adapter->pwrctrlpriv;
-			u8 trycnt = 100;
-
-			/* pause tx */
-			rtw_write8(Adapter, REG_TXPAUSE, 0xff);
-
-			/* keep sn */
-			Adapter->xmitpriv.nqos_ssn = rtw_read16(Adapter, REG_NQOS_SEQ);
-
-			if (!pwrpriv->bkeepfwalive) {
-				/* RX DMA stop */
-				rtw_write32(Adapter, REG_RXPKT_NUM, (rtw_read32(Adapter, REG_RXPKT_NUM) | RW_RELEASE_EN));
-				do {
-					if (!(rtw_read32(Adapter, REG_RXPKT_NUM) & RXDMA_IDLE))
-						break;
-				} while (trycnt--);
-
-				/* RQPN Load 0 */
-				rtw_write16(Adapter, REG_RQPN_NPQ, 0x0);
-				rtw_write32(Adapter, REG_RQPN, 0x80000000);
-				mdelay(10);
-			}
-		}
-		break;
 	case HW_VAR_H2C_MEDIA_STATUS_RPT:
 		rtl8188e_set_FwMediaStatus_cmd(Adapter, (*(__le16 *)val));
 		break;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 42d5aafbb32a..bbbdcfa253f8 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -21,7 +21,6 @@ enum hw_variables {
 	HW_VAR_AC_PARAM_BE,
 	HW_VAR_AMPDU_FACTOR,
 	HW_VAR_H2C_FW_PWRMODE,
-	HW_VAR_FIFO_CLEARN_UP,
 	HW_VAR_H2C_MEDIA_STATUS_RPT,
 };
 
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 390d1cc0ecb0..891c85b088ca 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -736,9 +736,36 @@ void rtw_ips_pwr_down(struct adapter *padapter)
 	padapter->bCardDisableWOHSM = false;
 }
 
+static void rtw_fifo_cleanup(struct adapter *adapter)
+{
+	struct pwrctrl_priv *pwrpriv = &adapter->pwrctrlpriv;
+	u8 trycnt = 100;
+
+	/* pause tx */
+	rtw_write8(adapter, REG_TXPAUSE, 0xff);
+
+	/* keep sn */
+	adapter->xmitpriv.nqos_ssn = rtw_read16(adapter, REG_NQOS_SEQ);
+
+	if (!pwrpriv->bkeepfwalive) {
+		/* RX DMA stop */
+		rtw_write32(adapter, REG_RXPKT_NUM,
+			    (rtw_read32(adapter, REG_RXPKT_NUM) | RW_RELEASE_EN));
+		do {
+			if (!(rtw_read32(adapter, REG_RXPKT_NUM) & RXDMA_IDLE))
+				break;
+		} while (trycnt--);
+
+		/* RQPN Load 0 */
+		rtw_write16(adapter, REG_RQPN_NPQ, 0x0);
+		rtw_write32(adapter, REG_RQPN, 0x80000000);
+		mdelay(10);
+	}
+}
+
 void rtw_ips_dev_unload(struct adapter *padapter)
 {
-	SetHwReg8188EU(padapter, HW_VAR_FIFO_CLEARN_UP, NULL);
+	rtw_fifo_cleanup(padapter);
 
 	if (padapter->intf_stop)
 		padapter->intf_stop(padapter);
-- 
2.35.1

