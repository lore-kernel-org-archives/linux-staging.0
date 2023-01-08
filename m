Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3389C1FD0
	for <linux-staging@lists.linux.dev>; Sun,  8 Jan 2023 12:38:16 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id u9so13824440ejo.0
        for <linux-staging@lists.linux.dev>; Sun, 08 Jan 2023 04:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Avq55gRD0o24gHHFPcHLu6HTKb28LUs31qoNXBnZq7o=;
        b=SaRq11IRo9W5C99Bvfz6SYfn4HdsdfBFfQWi6NBPtPLz1Gb/qDzWd8WnqYPNs6llUr
         35itgXqlGWAcRp7VZScT0IT73imvtXOVbNb/IRNKoo/VjnUrs/cv7IDScj6HiHeHhhoo
         svaX1tcRvBkyH5cGqT4STpAfINPyw9bCgHs7VuFbDNY5S2mq3mgmPKoAO7ZWL/E7HEAo
         4BsM77RYm+0VkdKxeEu1SgwEhY0u1E7phyLx7BN7xcM6ucODYmql+tlOyhYMHNsEHWwD
         JteerpUUcLCY+W9M8LMp3GEj5el1F7EpTPYpmiA2Hw2VaonVv7IE7yKISSEyTY0TUsoS
         Dnkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Avq55gRD0o24gHHFPcHLu6HTKb28LUs31qoNXBnZq7o=;
        b=eq3xF2Vgz6BoqXkWEqCg86P+XX3R05TmzMsyaqdo7TcLy4w7XuU8eKP7jDV02cR4QW
         rgo7ls4ORibYPxxCrpYE33+rQmKLQJIj6oZ+32XgmSstEksf786IJnQvTbg1/l+3YDBw
         SdqSY7sxGw0zvHV3vsVIHkYSDllzFnKeYEBzX7VxPGzmj+U79wfmZVIVHju7CObJiXY1
         gw9RCMan7xW6VWIo1+bTuqqqmZ2N5hfr2IOvYz/XMXmeuPn+B/895sngueLdCcHUB5Az
         qZyrWCOHnh7js4NWQ90XX8EDFYdtw21vZ5AnqRx3dRekysVQRM3mPWz3aNk8iHok8d++
         uS0A==
X-Gm-Message-State: AFqh2koXMDOZPoHlgkejbjJuuBu85RQuuOoxQDqjMjj5A7uGnPMqlMnM
	cw04aTmhcr5/RZlPN/k6eYU=
X-Google-Smtp-Source: AMrXdXsGwNrCX7itkrEzflpaam01vpOlqAU8MXw5HzlKCcaeLy7rER92TGCNEedyar9AJR2l1umm9Q==
X-Received: by 2002:a17:906:71c3:b0:7c0:dd80:e95e with SMTP id i3-20020a17090671c300b007c0dd80e95emr59081397ejk.51.1673181494346;
        Sun, 08 Jan 2023 04:38:14 -0800 (PST)
Received: from localhost.localdomain (ip5f5abbc8.dynamic.kabel-deutschland.de. [95.90.187.200])
        by smtp.gmail.com with ESMTPSA id e15-20020a170906c00f00b0084ca4bd71b8sm2448014ejz.208.2023.01.08.04.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 04:38:14 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: convert rtw_writeN() to common error logic
Date: Sun,  8 Jan 2023 13:38:04 +0100
Message-Id: <20230108123804.3754-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.39.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the function rtw_writeN() away from returning _FAIL or
_SUCCESS which uses inverted error logic. Use the common error logic
instead. Return 0 for success and negative values for failure.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
Tested on x86_64 with Inter-Tech DMG-02.

 drivers/staging/r8188eu/core/rtw_fw.c       | 10 ++++------
 drivers/staging/r8188eu/hal/usb_ops_linux.c |  7 ++-----
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
index 682c65b1e04c..1e4baf74ecd5 100644
--- a/drivers/staging/r8188eu/core/rtw_fw.c
+++ b/drivers/staging/r8188eu/core/rtw_fw.c
@@ -89,9 +89,8 @@ static int block_write(struct adapter *padapter, u8 *buffer, u32 size)
 		addr = FW_8188E_START_ADDRESS + i * block_size;
 		data = buffer + i * block_size;
 
-		ret = rtw_writeN(padapter, addr, block_size, data);
-		if (ret == _FAIL)
-			goto exit;
+		if (rtw_writeN(padapter, addr, block_size, data))
+			return _FAIL;
 	}
 
 	if (remain) {
@@ -105,9 +104,8 @@ static int block_write(struct adapter *padapter, u8 *buffer, u32 size)
 			addr = FW_8188E_START_ADDRESS + offset + i * block_size;
 			data = buffer + offset + i * block_size;
 
-			ret = rtw_writeN(padapter, addr, block_size, data);
-			if (ret == _FAIL)
-				goto exit;
+			if (rtw_writeN(padapter, addr, block_size, data))
+				return _FAIL;
 		}
 	}
 
diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 7c72f5e04d9b..f02f8568cdcf 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -179,14 +179,11 @@ int rtw_writeN(struct adapter *adapter, u32 addr, u32 length, u8 *data)
 	struct io_priv *io_priv = &adapter->iopriv;
 	struct intf_hdl *intf = &io_priv->intf;
 	u16 value = addr & 0xffff;
-	int ret;
 
 	if (length > VENDOR_CMD_MAX_DATA_LEN)
-		return _FAIL;
+		return -EINVAL;
 
-	ret = usb_write(intf, value, data, length);
-
-	return RTW_STATUS_CODE(ret);
+	return usb_write(intf, value, data, length);
 }
 
 static void handle_txrpt_ccx_88e(struct adapter *adapter, u8 *buf)
-- 
2.39.0

