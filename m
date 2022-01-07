Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E315A2CA3
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 10:36:40 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id bm14so20440197edb.5
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 02:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X7rszZizH89dSbfSfGmlz97XSOoPDVqc24nyseEzr4c=;
        b=CqUJ/ETNRo08TkqIWFe64tXrwbngg+wRvlCRwV/VPrLRl3jAs+S4QASRoWP5eHiryO
         mn+4fQ6X10UUV08opZ5ACbfQxvCLxhvAf9+VBD2uE+qycUCIuY3xL01iytUvao1KZKjX
         Y00GcasC+q607lyK2u6hhAHLPIL+mV4EBXCY3ZUSMvMT+DJpLmJCDZ8/IhoSB3uyGpjr
         RJLaU548rSMKJ2+D+XKMwcxn4fYYN9sVrkGOWmQo8g4JakX3+MFwA0kxMrQGol4cu4N9
         jezWijyriqqumPtwfLzoWWIzXqcSq5z36iTvtBvsXIlrBF2d91+aJMfbwC/LqLmlTBmH
         QzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X7rszZizH89dSbfSfGmlz97XSOoPDVqc24nyseEzr4c=;
        b=XdfqRVOZLUV/PTQsP/dt5l+3/u9hCHA5zyQ4IddrQY9qK13tylpx0tmSTAAmoP5pVJ
         JEAGGDl1Hl3g5gCESO0ocVRiAL5oXYRhsR2EHU19YwK7HotVcfc5VYl0j/xdySecr8Hp
         2uTxV31X2eWs1o00rHf/rwnMIqpeKlP8ScVjf/qwP+MNDk8kqWMFstBzhvzof1OyNqpo
         INoflNgYJptWQfV6Qhye8BsR9jum4xKjAeIZvdPhIoM5fD7u+nqhsNZr9jF2TBqBOV6a
         fijfSNpkV/hMTrqIkTvk2ftaTkylkwt4Fnz8Bf4FAg9HidAYe2E5kFnMWEe6JAzamLO5
         1Wog==
X-Gm-Message-State: AOAM533BUh+BB94XsOtUwKGRp06jdabN4cGoScRKA5W3Dm6olVnCvhDp
	ZDPQfgRpwqWVDyG0kO3m/ow=
X-Google-Smtp-Source: ABdhPJxezvuXX8rUJcgdt9IHum4R/sSKlaHQJqtHAYz90KNedXscKdejd9i726iRiZQG1R7BFDzLog==
X-Received: by 2002:a05:6402:2686:: with SMTP id w6mr60509694edd.79.1641551799372;
        Fri, 07 Jan 2022 02:36:39 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::51e2])
        by smtp.gmail.com with ESMTPSA id v8sm1869857edt.10.2022.01.07.02.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 02:36:39 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 16/19] staging: r8188eu: rename writeFW_retry
Date: Fri,  7 Jan 2022 11:36:17 +0100
Message-Id: <20220107103620.15648-17-straube.linux@gmail.com>
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

Rename the variable writeFW_retry in rtl8188e_firmware_download()
to avoid camel case.

writeFW_retry -> write_fw_retry

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 6c23966ec785..15e8dc0b9a37 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -542,7 +542,7 @@ static int load_firmware(struct rt_firmware *rtfw, struct device *device)
 int rtl8188e_firmware_download(struct adapter *padapter)
 {
 	int ret = _SUCCESS;
-	u8 writeFW_retry = 0;
+	u8 write_fw_retry = 0;
 	u32 fwdl_start_time;
 	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
 	struct device *device = dvobj_to_dev(dvobj);
@@ -594,11 +594,11 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 		ret = write_fw(padapter, pFirmwareBuf, FirmwareLen);
 
 		if (ret == _SUCCESS ||
-		    (rtw_get_passing_time_ms(fwdl_start_time) > 500 && writeFW_retry++ >= 3))
+		    (rtw_get_passing_time_ms(fwdl_start_time) > 500 && write_fw_retry++ >= 3))
 			break;
 
-		DBG_88E("%s writeFW_retry:%u, time after fwdl_start_time:%ums\n",
-			__func__, writeFW_retry, rtw_get_passing_time_ms(fwdl_start_time)
+		DBG_88E("%s write_fw_retry:%u, time after fwdl_start_time:%ums\n",
+			__func__, write_fw_retry, rtw_get_passing_time_ms(fwdl_start_time)
 		);
 	}
 	fw_download_enable(padapter, false);
-- 
2.34.1

