Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABED2C80
	for <linux-staging@lists.linux.dev>; Sat,  1 Jan 2022 08:18:07 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id v7so59493702wrv.12
        for <linux-staging@lists.linux.dev>; Sat, 01 Jan 2022 00:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7VHZWSW7IZYW+tuJsgx1W6d7mxzf81jEGBsUolGkzPM=;
        b=bjmxPyvwNFTPhYcJcUJ98dC8ps/bBGutyg7IHwbG8rgvwxO100qA2EiNa4UFb9mShc
         bae19aCnDi7jaub2Zoyp4I7YMQu8AZwV1QK9tz42eRF9IkyS4W/xFTXaEJBGwWgcEoRe
         s1dnOsjp1iGyP1eoqBBy1O2AxuRNI8hD/KfGeV5eEjEku1xh+iDBnNRW+LkWcUvR+P6/
         Yg4cZlcZQxk5XYyvYlUXXN/FGjRByzIhSbcKFFQHeym1cQxJVxdUqHoSeiGdPAXEaZ8Z
         sv7Q9uQ0CwBpg6c3YdUQDzVtQU3eza/RLHNyhv9BBVj4PRz41eWCQsizbrZg2vEUowhs
         IQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7VHZWSW7IZYW+tuJsgx1W6d7mxzf81jEGBsUolGkzPM=;
        b=g8Cphm1Uh4ln41VaSjr1Z7isuuTVzyXb/vYCy29PSMHgtQ65Nru/r74xi9lFgQ5okC
         RLtvSkeSUfMi5NrE4i18hnQSuAWQyQleZd40zBPECuWi4UeLS+g61NIvTnRUEi/nkPqa
         6zYUaW3+JyqpezfJ2LgFny60R4AmNOa7KzYIy4faOeEvIVmVExotKOit+gREhZOer59l
         kwwp+NMYuFU+SYG7tHJyuIZ7Zo283FdcGvio8ZtGTAsGgrMfttMM0Dh2om/zIRCof0mg
         u6w//SHWCkDqMSREpjzYCZ3h8wBJ1jzC7TmBs7U1lEthItSPGWzuAdGoAhujPXoEv4Nt
         6Ozw==
X-Gm-Message-State: AOAM531EhYWAiXR8w/lvncW2sxE3lWkOT3Cx/UzXJ837M7LfC+qJgdpi
	UvV0t+IS41Qco8JENrNmR5lIBzoYqhQ=
X-Google-Smtp-Source: ABdhPJxJ33tHYsaHYW+ck0zvMCQIMLYjLwMF6L5bYlo5BOanRAOHbvX6mKtjbZcgesDeUu3mz82hZA==
X-Received: by 2002:adf:ec8b:: with SMTP id z11mr32116271wrn.378.1641025085625;
        Sat, 01 Jan 2022 00:18:05 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id u9sm30693651wmm.7.2022.01.01.00.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jan 2022 00:18:05 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 2/7] staging: r8188eu: UsbRxHighSpeedMode is set but never used
Date: Sat,  1 Jan 2022 09:17:53 +0100
Message-Id: <20220101081758.9716-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220101081758.9716-1-straube.linux@gmail.com>
References: <20220101081758.9716-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The field UsbRxHighSpeedMode of struct hal_data_8188e is set but
never used. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v2: no changes

 drivers/staging/r8188eu/hal/usb_halinit.c      | 5 -----
 drivers/staging/r8188eu/include/rtl8188e_hal.h | 3 ---
 2 files changed, 8 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 104705ef170e..96db9a8e7667 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -502,16 +502,11 @@ usb_AggSettingRxUpdate(
 
 static void InitUsbAggregationSetting(struct adapter *Adapter)
 {
-	struct hal_data_8188e *haldata = &Adapter->haldata;
-
 	/*  Tx aggregation setting */
 	usb_AggSettingTxUpdate(Adapter);
 
 	/*  Rx aggregation setting */
 	usb_AggSettingRxUpdate(Adapter);
-
-	/*  201/12/10 MH Add for USB agg mode dynamic switch. */
-	haldata->UsbRxHighSpeedMode = false;
 }
 
 static void _InitOperationMode(struct adapter *Adapter)
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index e8cb093abb62..8b54f52f49e2 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -262,9 +262,6 @@ struct hal_data_8188e {
 	u8	OutEpQueueSel;
 	u8	OutEpNumber;
 
-	/*  Add for USB aggreation mode dynamic shceme. */
-	bool		UsbRxHighSpeedMode;
-
 	/*  2010/11/22 MH Add for slim combo debug mode selective. */
 	/*  This is used for fix the drawback of CU TSMC-A/UMC-A cut.
 	 * HW auto suspend ability. Close BT clock. */
-- 
2.34.1

