Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B212CA2
	for <linux-staging@lists.linux.dev>; Sat,  1 Jan 2022 08:49:52 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id s1so59798839wrg.1
        for <linux-staging@lists.linux.dev>; Sat, 01 Jan 2022 00:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W9/q/NrnqBEqANyC37JD6gUeY78R63lo51Y9u+z8PxE=;
        b=OXz9HIVqaHeShNoGYKUneSqpMx0Fc1iwbb69AUIMtTNKLVpWOLT6KpioyVruyaBfP5
         oANCad/nPO3BPx5qIbKKJ4wgajhOVqdayrWLtgnaN2nCg+4BA3oToLAKPLFq16RmlarF
         UyEYWtss0eMJ31q8E6Drivzy8jzLnkM7SOL5vkZhz9fj6VeGhdlw8yurhEiX7qYyGL1o
         gAjY9S0uYNXr0gimMbXwVjsPLfh/TbYNn14KQUXx8bXuU0CSwU58qGO4ZBFk52pFYp7U
         rbNxwT+6rDv+x1bp7JJXzLveJjwZ5Wq/pKv4rD88QwKcDCLFTWOckU32ktx1VllJClZC
         PIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W9/q/NrnqBEqANyC37JD6gUeY78R63lo51Y9u+z8PxE=;
        b=Z+fLTApOmGJiK6FS+VjKmNDUsQHXK2+hoMkFCxGGrfqXZe9i7XHzl50MUXsc5+FG5e
         JiTpaocezpVtkHkyCEfmOB6rdVnOZgKzOgwvnpeKKXKjmZm091AowWIkevpYvxEQ0Lp2
         0iGnl/hlEk3Vas4m5cLHyFcIA7vDl/bRmNYWhwBZPMAra/zv34Azcm1HJjgW+59xREVz
         IxCyKJAlbjCE01g6kWvKXwakG7G/kkW9HSECx6V4o4VjIfvebuJb3P0TqxuHpVVKMLn0
         WxiHVTpOLM46RCkh6TmAuu19A1NRdx5pqd1jT0d9ZmgGPgarBB5dMZgIqDYNzX2G7Cwp
         EkGw==
X-Gm-Message-State: AOAM532Aw4MDSbfOa51W/88XmVJ1C6DzcXH9yjNCZC5HnXqD/YxN1Zrc
	bekq7mU05reT3b2iJp6xFJU=
X-Google-Smtp-Source: ABdhPJxPfVYNrz8QGNcH358gEHOu4NYNmhqY0/4FG8C9nVPLTfRjpkh1wHkaQrWyL6HYZ1eZZbk8Sw==
X-Received: by 2002:adf:f70b:: with SMTP id r11mr32894435wrp.496.1641026990486;
        Sat, 01 Jan 2022 00:49:50 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::d7e8])
        by smtp.gmail.com with ESMTPSA id o9sm14806578wri.97.2022.01.01.00.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jan 2022 00:49:50 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 2/7] staging: r8188eu: UsbRxHighSpeedMode is set but never used
Date: Sat,  1 Jan 2022 09:49:32 +0100
Message-Id: <20220101084937.3411-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220101084937.3411-1-straube.linux@gmail.com>
References: <20220101084937.3411-1-straube.linux@gmail.com>
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
v3: no changes
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

