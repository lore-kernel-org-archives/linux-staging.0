Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CEB2CA3
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 10:36:38 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id c71so8911429edf.6
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 02:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rhk/RIq8N8redhElMwVU53NrBizqJp1QMtudMdpPmpM=;
        b=ORdZbD1syTbIu6mJjN3S3GMwVeAFXU0NZGz9hArxSzG1ubraJGzzF6CuYhMqDDfKoH
         IO5tZIEOUR96VlbOxJyU0mjUdJJeg5eCb37z9ETmVLSDCaMSy20O434N4bRELigU34U7
         CEFIS/ArPy8/+NhKLDvRuoZmcy70yfYHcF1WjKStC8a7jjxDls57qnXqCjpbdK2at7uu
         q0H7HP7/TJWdolpdR/lofBBVbFPKRK757mlja2kLGXG3F86TANq9yhhhtZGBWuqlRsyC
         Ihg+3vHJz0qlb72GRgGziBDVxgNs6gITZETCgwVKepaP/752yPpNncYZzfbo3VEZ+bl9
         UPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rhk/RIq8N8redhElMwVU53NrBizqJp1QMtudMdpPmpM=;
        b=leKxRNEsnjiSXMdGrbNOv2Jwi7eicJdx/n9LmOFR5ui/EqIy+Aq8Popj9XugklFWI4
         FbyRUw8ZeOQy2Yl9mnI5leQ4gwLDgeXsgPOPa54cgS4ig0VK8XKTy4DKailhmI7BOOY+
         5jxiRhlF7gV7lE6ZDsgwughL5pVsN4T2copOk/4W0lPGpYcfjQfAMJ9AH1GDg+/3xIvq
         ojXLsCoEBKzYosDxn1GW9vgiEeMKcygEuRMDcv2m5SAEyQfchPFzrHrk8XBIvuBNMQd3
         LRo/gm2DDvuEhR8vgL7OmlrooRXQtH+SjaZ7ygKINURCmTwe6Ycq9FTJqzBW0tJmVyDA
         CuLA==
X-Gm-Message-State: AOAM5320ooHWS3IN+8ODquwU9gT6tLPaERNHx5VwZUOCagkGIXhBOmsH
	9cJAAdYI9MwNfSj6LqltuLE=
X-Google-Smtp-Source: ABdhPJzCVdlFNRSiZiLnSKxbWk/jqyQfzQA4TzF2bHQZvmhfIq02kFr3gJcwfXr66PZL9/jFJDCH7g==
X-Received: by 2002:a17:906:150c:: with SMTP id b12mr48050752ejd.284.1641551796705;
        Fri, 07 Jan 2022 02:36:36 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::51e2])
        by smtp.gmail.com with ESMTPSA id v8sm1869857edt.10.2022.01.07.02.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 02:36:36 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 12/19] staging: r8188eu: convert two functions from s32 to int
Date: Fri,  7 Jan 2022 11:36:13 +0100
Message-Id: <20220107103620.15648-13-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107103620.15648-1-straube.linux@gmail.com>
References: <20220107103620.15648-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the return type of fw_free_to_go() and
rtl8188e_firmware_download() from s32 to the more common int.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 6 +++---
 drivers/staging/r8188eu/include/rtl8188e_hal.h  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index d219882fc4a2..f86b5cb2b6f9 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -467,7 +467,7 @@ void rtw_reset_8051(struct adapter *padapter)
 	rtw_write8(padapter, REG_SYS_FUNC_EN + 1, val8 | (BIT(2)));
 }
 
-static s32 fw_free_to_go(struct adapter *padapter)
+static int fw_free_to_go(struct adapter *padapter)
 {
 	u32	counter = 0;
 	u32	value32;
@@ -539,9 +539,9 @@ static int load_firmware(struct rt_firmware *rtfw, struct device *device)
 	return ret;
 }
 
-s32 rtl8188e_firmware_download(struct adapter *padapter)
+int rtl8188e_firmware_download(struct adapter *padapter)
 {
-	s32	rtStatus = _SUCCESS;
+	int rtStatus = _SUCCESS;
 	u8 writeFW_retry = 0;
 	u32 fwdl_start_time;
 	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 11d79606e120..4b67e11024a1 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -250,7 +250,7 @@ struct hal_data_8188e {
 };
 
 /*  rtl8188e_hal_init.c */
-s32 rtl8188e_firmware_download(struct adapter *padapter);
+int rtl8188e_firmware_download(struct adapter *padapter);
 void rtw_reset_8051(struct adapter *padapter);
 
 s32 InitLLTTable(struct adapter *padapter, u8 txpktbuf_bndy);
-- 
2.34.1

