Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597322CA5
	for <linux-staging@lists.linux.dev>; Fri, 28 Jan 2022 11:54:59 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id m11so9317570edi.13
        for <linux-staging@lists.linux.dev>; Fri, 28 Jan 2022 03:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h9cza9dSqPk0L2+uMxlWPbP0uhx5TQLbq0PHDy2GAGI=;
        b=gBwQn0Dc69hhlkMzoTB559FJzXv2XYymnc1LjJWJg39Wf0Jt07Ekg3ING+cZpqw8C+
         Ocm2Tu/YxnPRUbqSy3EdqTPZ567d0cZs8iEmCZm+msl+qHf6QJzPsIlW3tUp0ZrpZbuX
         v8E2EVHcULS3HTlzPBYKWD/0QPHPe82WpY1YfyrbsXcFKfnU8CIYYfw6jdnLpWOL1Q+i
         4rT/7VAhYz8sz9t2zx+aWCvxNFTU5sbyjg5fIQTY4hmyJfT30njUvZ8vURuQP5RXVyOr
         DWnWho2evY/cTxDxehewPGhAX110cU+8HgLxzIGpKxF3rH3amDg+iC4qeWwwIvZAl9SJ
         mvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h9cza9dSqPk0L2+uMxlWPbP0uhx5TQLbq0PHDy2GAGI=;
        b=Gh/XVuOg5qTSEXG0rWSeBjXn7nKKSbklrUiArE21962Qaz3mPk3SrI1lb21r0rwRNv
         Spwjh5y1vdZRdtebg671Xi0AK2xxi/Rc/FMPdWWGI5JpS1dEzWqZ2wz1iYWn1dh1140f
         hFagv2Pt6h3aKso5buDMwhl5B3S7pO3NcnyVSpBUYOOB4Xz+PKGM9+pyxOta2H2dbqTw
         ISTM3EZ5flBrTlVcg0xczcggWVGnqaCvJKEtWdMoB7j+G0JuaTg0QsZSek1f7tKHkwLs
         0EAHJ3zXc0VQ6OWzqKMIqkEYDEE/wh65oqN6873MT1feIVq4EnZW+a8xLrIJp+ODr2Ak
         cJgg==
X-Gm-Message-State: AOAM530MN1jBNeFdZYcOmo3LCq4nG4Qqylax/TCwxEtjCpTmmMF2dSu1
	gZPnGwFw6Rx+luoNzGIdm1U=
X-Google-Smtp-Source: ABdhPJwtB8qiP2MjAq5mpzfVzNx01EBjcBYJkBbdCfLRKJXp/TmFcOQmXJaFxjPz+6WfSnjaqlDqYg==
X-Received: by 2002:a05:6402:345:: with SMTP id r5mr7987043edw.269.1643370897861;
        Fri, 28 Jan 2022 03:54:57 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb9e.dynamic.kabel-deutschland.de. [95.90.187.158])
        by smtp.gmail.com with ESMTPSA id h20sm12494261eds.9.2022.01.28.03.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 03:54:57 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 5/6] staging: r8188eu: convert SetHalDefVar8188EUsb() to void
Date: Fri, 28 Jan 2022 12:54:44 +0100
Message-Id: <20220128115445.6606-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220128115445.6606-1-straube.linux@gmail.com>
References: <20220128115445.6606-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return value of SetHalDefVar8188EUsb() is not used. Convert the
function to void.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_halinit.c  | 6 +-----
 drivers/staging/r8188eu/include/hal_intf.h | 2 +-
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 7a640fbaaca6..3aa5289a61f0 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1651,10 +1651,9 @@ void GetHalDefVar8188EUsb(struct adapter *Adapter, enum hal_def_variable eVariab
 }
 
 /* Change default setting of specified variable. */
-u8 SetHalDefVar8188EUsb(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue)
+void SetHalDefVar8188EUsb(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue)
 {
 	struct hal_data_8188e *haldata = &Adapter->haldata;
-	u8 bResult = _SUCCESS;
 
 	switch (eVariable) {
 	case HAL_DEF_DBG_DM_FUNC:
@@ -1692,11 +1691,8 @@ u8 SetHalDefVar8188EUsb(struct adapter *Adapter, enum hal_def_variable eVariable
 		haldata->bDumpTxPkt = *((u8 *)pValue);
 		break;
 	default:
-		bResult = _FAIL;
 		break;
 	}
-
-	return bResult;
 }
 
 void UpdateHalRAMask8188EUsb(struct adapter *adapt, u32 mac_id, u8 rssi_level)
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 96016e175cb5..9b4d1650b4b5 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -101,7 +101,7 @@ void UpdateHalRAMask8188EUsb(struct adapter *adapt, u32 mac_id, u8 rssi_level);
 int rtl8188e_IOL_exec_cmds_sync(struct adapter *adapter,
 				struct xmit_frame *xmit_frame, u32 max_wating_ms, u32 bndy_cnt);
 
-u8 SetHalDefVar8188EUsb(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue);
+void SetHalDefVar8188EUsb(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue);
 void GetHalDefVar8188EUsb(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue);
 
 unsigned int rtl8188eu_inirp_init(struct adapter *Adapter);
-- 
2.34.1

