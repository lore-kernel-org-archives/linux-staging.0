Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8651D7E35
	for <linux-staging@lists.linux.dev>; Tue,  4 Mar 2025 19:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741116489; cv=none; b=CV3MxCVxkdHrw1Eu0wZ75VJJbCJwie0P7yFeaCBU3ypBa5Fy57DnxL8KWPXfkvu9S0IfdQty+bHHR/n6QLiAu7YHrOoG18WdRQ13UB+FX4zawtWUV4coFYkaGfayMHumC0555Sov3Ix3PonTSRiRZqmedp2+k9e8xrJxbC3hGI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741116489; c=relaxed/simple;
	bh=R9opTtkqiR3EVB5DiuJYrC8B6crJ7i7OxRy9XNgNAB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Km22ViYj/eLugBLBNXx+o+8wvjr8wNm2oS7adeXn5FlczxopH7ov08QbxC7qyCbhuBFXccah+sGlaBus+RBYNU3UWnFNnYiIh65iCj2+HduwJc/7+VZdi2QgLKWudeOGLBtLx7sBt8k5VXK/RWy9pnmZMd7WFEkgtacJ9cXOJUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NXZmM614; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NXZmM614"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-216513f8104so13878275ad.2
        for <linux-staging@lists.linux.dev>; Tue, 04 Mar 2025 11:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741116487; x=1741721287; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epmOVtfS9+Yo2ZaSmvnox3J1qzYW8Hx3jkXGEoYH3uA=;
        b=NXZmM614HkzW8mFF/7hWPhw6viLLIhCNkjl0G4daO23BI0K009HPaecyCE6RVVMJfs
         nyN6gCgIIPpC2FEBkOonaH45XaXyYKV9gF1Bv2FJ2zjVtzX9RyvbEjH2vUdLWKsOugv0
         rBhnIXNdPDU1hoqcAAupeeKBiw0rwVuRS+WPYC79VK66FWWJKy8+ia0/0yWyJ/r2OT+r
         FiaTwcdFggU3i38emou0+WiKrObSdj8yQzVEovV+6KdnBrRvwVmSR4z/snVfpug3Y2Qq
         NdLCUNvTKrmv4zWDtJ/KZ1OAm2TtAQ3xXqeN08IOpXlI3y9StveclW73Vl6s6RuAasPv
         v2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741116487; x=1741721287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=epmOVtfS9+Yo2ZaSmvnox3J1qzYW8Hx3jkXGEoYH3uA=;
        b=E0cgsRrNl5pWWidbSTVB2nrIIatqbJAs4a4mhg4YYWw8/t8qXR6m12Uku7/GhG3KUT
         NyXAbSfdY4LvEruf2F9TlW7E5VV10hjQiYPgoS2tJHcfW8ALpNpLhTFMGC6WLwHM5/Vs
         VgOuRDqxi7srYjjRlX5vCtuSA8G0ayZmcg+cG4aOpH4y5ZWZOdzoYwrOe5DLgO6lgVnl
         1jqtSBv8gS0orOL4fJvy5UwKQ5wmwUIZjO1jxEKWCcNFAq0gfll9j3FgmS0ON9xvqcRH
         6CiA6grNhDIF5QtTUQc8HI34jANg/WEX1QkusS9cQlmu3JY1hkvMzdWkK+xW/y/8znQB
         R9nQ==
X-Gm-Message-State: AOJu0YytUTosx4ehXF0WE/uCCOliyQdwhuBgo3unobJ5b9U38tb5K3bR
	//LQXlGV3wxWeJOB8We/9JnjamSEhngAINSm7CiVpcVXS+YynYQ1Jj9xNg==
X-Gm-Gg: ASbGncsAQg4/WozuE0uTTnVCf1yxp1npP4n7jMXWc4JKVgI8P3qmt/jblSyc9gcNRy8
	wvgzelO2mId8QhjEDo6THt6E2hyO7hYZVu7w9XgAvx2Audu+DeySvRtYaafrhb63uYAfC6iSoEp
	pVyptmr8Zj7etAgEU9wRt9NAOlq7C1W61iq1W/gqmm0dZUKKpMDs0UIEvJnY/hoH/T4Z64phhP5
	ltk954O7Te7o9e5jTDGV1wCiDqCagouPDXvqtO9HyNR3gl9Jcv+KOXATZoOZPWHeuvwQnIEWaCI
	MolLyVE4uHUzimiTpfck8NokSU4t4fzHVGJ+ffl+lTHfdQwkr9jL2zAbWw==
X-Google-Smtp-Source: AGHT+IEdX0BHGO1aNI4wvVQv2mPr+fwnaDksYZRGrdWeJn/GT7+TqDieWrNAWkuFEHO7F4AFLt2RNw==
X-Received: by 2002:a05:6a00:244f:b0:72a:a7a4:99ca with SMTP id d2e1a72fcca58-73682b4e2a4mr73072b3a.2.1741116486856;
        Tue, 04 Mar 2025 11:28:06 -0800 (PST)
Received: from localhost.localdomain ([2802:8012:1f:3200:f1d1:c186:ba5b:8f06])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734d444a9fasm9341920b3a.60.2025.03.04.11.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 11:28:06 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	arnd@arndb.de,
	niharchaithanya@gmail.com,
	jiapeng.chong@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	Gaston Gonzalez <gascoar@gmail.com>
Subject: [PATCH 3/4] staging: gpib: fix kernel-doc section for usb_gpib_line_status() function
Date: Tue,  4 Mar 2025 16:25:41 -0300
Message-ID: <20250304192603.40565-7-gascoar@gmail.com>
X-Mailer: git-send-email 2.49.0.rc0
In-Reply-To: <20250304192603.40565-1-gascoar@gmail.com>
References: <20250304192603.40565-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function name field in the kernel-doc section for the
usb_gpib_line_status() is defined as 'line_status'. In addition, after
the kernel-doc section, there are three macro definition instead of the
function definition.

These issues trigger the warning:

warning: expecting prototype for line_status(). Prototype was for WQT()
instead.

Fix the warning by renaming the function in the kernel-doc section and
by moving the macros at the beginning of the file with the rest of
macros definition.

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 090857824d07..f7dd0809b06c 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -78,6 +78,10 @@ module_param(debug, int, 0644);
 			dev_dbg(board->gpib_dev, format, ## __VA_ARGS__); } \
 	while (0)
 
+#define WQT wait_queue_entry_t
+#define WQH head
+#define WQE entry
+
 /* standard and extended command sets of the usb-gpib adapter */
 
 #define USB_GPIB_ON	 "\nIB\n"
@@ -131,6 +135,7 @@ module_param(debug, int, 0644);
 
 #define INBUF_SIZE 128
 
+
 struct char_buf {		/* used by one_char() routine */
 	char *inbuf;
 	int last;
@@ -644,17 +649,12 @@ static void usb_gpib_interface_clear(gpib_board_t *board, int assert)
 }
 
 /**
- * line_status() - Read the status of the bus lines.
+ * usb_gpib_line_status() - Read the status of the bus lines.
  *
  *  @board:    the gpib_board data area for this gpib interface
  *
  *    We can read all lines.
  */
-
-#define WQT wait_queue_entry_t
-#define WQH head
-#define WQE entry
-
 static int usb_gpib_line_status(const gpib_board_t *board)
 {
 	int buffer;
-- 
2.49.0.rc0

