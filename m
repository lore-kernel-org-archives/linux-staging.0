Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71821CA94
	for <linux-staging@lists.linux.dev>; Mon,  4 Mar 2024 21:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709587191; cv=none; b=P1uPddTdxPo6F6lCxD6ceZj2sewRxQ670muCQOvIsKPwDzHdngXXe1ATlr/BqBqPh8ibU10+xS0ngSQVVDge1NZTgr6AWA7yYQ+UzEzRVo0dgrr+bw7BsbEBlZuuz5O30QMXVgL/mK/I2QYZn2TlZYE3VGj4pzYma9rvg2+yLAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709587191; c=relaxed/simple;
	bh=GzpZ/81jwqeQvoZLzsqYfc6Kb/FkPz/ssCrmMegdNyY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VyLtShCH1KH+rjZHZaf/1NmrVCmTWkdNWMbxcH2+C1H/Q9AbqkwCOMmrRqT5oJSUt4y0FGu5C3d2awfI/l/osl+qfLBHZplyfuoW0nv/jUfU+2yIZeDtzs60YDIieDd98+F1O9ITgM8wfZHjQrGDdDxgzEUQJiYxZbejgDUG8Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MQyDDDaT; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MQyDDDaT"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e5a232fe80so3051039b3a.0
        for <linux-staging@lists.linux.dev>; Mon, 04 Mar 2024 13:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709587189; x=1710191989; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kuwjsv4D6U5YXnr6LRJiA6f6hlMDXAPMBAB9PBj+oJs=;
        b=MQyDDDaTT4k5gn9udEYxQQckJtzRMtnmsi2WxpwUMMDnR4zNdEj5VaYmu4yyDOT09X
         oeJhijFu5a61rIThKaMuTyI10dVFBFyXpRnVeCo04k/PdnNPRS6sjjPSzdPzWVhBjl6T
         hzWBIJI7HG4sp50X5drQUCmg5kBMC8hMu4dS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709587189; x=1710191989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kuwjsv4D6U5YXnr6LRJiA6f6hlMDXAPMBAB9PBj+oJs=;
        b=TkkqU++lrK8mazlDuxoRzL9xHnRyfAySzd28G2vv4kZ2fSaBwhDJD3LIUi+QE37/zC
         ABMf+TUW87p4M3buhNM5k4hNUjrFwFGY42BY2N9yePD6l5uX/HxmSkUM777nv6SMF9pb
         uVLqEfxuQ/K82Yis9dG5QA1VD15PzXG3pPIgH/2fcUsGYl8J/8Bv6gDGWok10gBiMoyz
         8ImakWPfPv24cMMh8NyyPZMMtefO2C2aSOOFZ7mLqUzUg6TOg+lR6Vk7nR5T0LRwO43A
         qToJVonq6UbCqwOVJFWuRHoTu6E0Tk04YQXc4GbNZ0Zih10kNwHV5v42mW+iF1WqQ1cB
         sfHA==
X-Forwarded-Encrypted: i=1; AJvYcCVMoTcdyxVdXAaSRU17Vh4m1WDo2eMg/eKe5kKiA+VN0u2GM04wJV8gUIpTidjKjGUB56PzTpwAw3Xx/HUK0ViOeQFApIO4HpdmjrE4Ow==
X-Gm-Message-State: AOJu0Yxb9J2n7ohHjK8zv0wncNPAxHIE+yrJ/u0RZWSJ3lGSACTGSIMC
	GPpYxXyYqjIXOlozCedshLSAha+TGQnVhA9EMOxfUtW0nMdk4Zg9ou7iENgcGQ==
X-Google-Smtp-Source: AGHT+IFLxwTdMSiyaeqLoOgKMl1Ene20t6SG2k2rnn50xB6oOWu9hS/cIeVubtkEo9a2ceOAc//KiA==
X-Received: by 2002:a05:6a00:3c8e:b0:6e4:c592:deaa with SMTP id lm14-20020a056a003c8e00b006e4c592deaamr854224pfb.11.1709587189198;
        Mon, 04 Mar 2024 13:19:49 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id t26-20020a62d15a000000b006e04c3b3b5asm8283288pfl.175.2024.03.04.13.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 13:19:47 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Alex Elder <elder@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Gustavo A . R . Silva" <gustavo@embeddedor.com>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2] greybus: Avoid fake flexible array for response data
Date: Mon,  4 Mar 2024 13:19:45 -0800
Message-Id: <20240304211940.it.083-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5072; i=keescook@chromium.org;
 h=from:subject:message-id; bh=GzpZ/81jwqeQvoZLzsqYfc6Kb/FkPz/ssCrmMegdNyY=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBl5jrxN9hNacEYPFNk5QoT2iY8dnME3XUqQe4kW
 4SvJZfSbCCJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZeY68QAKCRCJcvTf3G3A
 JjA/D/9ZZh0WdLrPuYsTqE5waxJVDv77dJ7ZtPPon1KGE7ZBUoDU2617qGC0iPW7EBH6V0zqmzM
 zZwqpVFu/pGNwMEfVPMNXj+q0FPfqAxDDQXWcpH/KVpEYQ1d+y7j+4dENod3GgXzeJxqEk0hR4Y
 lgDr8tKheYkl7kSH+a4r8mM5Kn8akoAA9nWpvg5bDzQIefT7dAoUULSbzrMqEkiz4OdQr2XrGZo
 XPPKxbu09NtSJOLMXgkrQAXQJJue1JZwhQSzQ283Di6OjQXDZnwEDUM6ZubiIMztf5uRJ1e70NI
 m3ca/eug+fjncW2K5aciaPRf7FfISVjaXM9dHvSrLPy9KbKlLelXFeOb252L5fi4zz0g2ce8aVR
 k5QWe0rQRUjGAMfaf05h41sTbv8qppoIfNyysuPEx2tCdlX+ut7A9AV2wnIeoQU32JBgDIzHa5R
 Ayd05DxHwPoze3qRRg8H1D1DkGCsOp6V9K1EgLs/J94xN4kOM+X1CYfiFV+tw5pIFPuwIrYcjY/
 YMn9dLJ7lGZifd1eN6LmnKniG/o38iJhTJTL4bVsrsZHOfFHBE1O0E7X6gdjGYOkUOPV1Q1Eb+z
 VCFyTofIZ3UVEye8ohwp1XI3YF8sGZXa5Jtv4yUpv+9EskUlTq7C2p1iUkgQwl2pl6ZKftEqQ1b
 kGTKWup urpNnjpQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

FORTIFY_SOURCE has been ignoring 0-sized destinations while the kernel
code base has been converted to flexible arrays. In order to enforce
the 0-sized destinations (e.g. with __counted_by), the remaining 0-sized
destinations need to be handled. Instead of converting an empty struct
into using a flexible array, just directly use a pointer without any
additional indirection. Remove struct gb_bootrom_get_firmware_response
and struct gb_fw_download_fetch_firmware_response.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
Cc: Alex Elder <elder@kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>
Cc: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Gustavo A. R. Silva <gustavo@embeddedor.com>
Cc: greybus-dev@lists.linaro.org
Cc: linux-staging@lists.linux.dev
 v2: add comments about removed structs
 v1: https://patchwork.kernel.org/project/linux-hardening/patch/20240216232824.work.862-kees@kernel.org/
---
 drivers/staging/greybus/bootrom.c         | 8 ++++----
 drivers/staging/greybus/fw-download.c     | 8 ++++----
 include/linux/greybus/greybus_protocols.h | 8 ++------
 3 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index 79581457c4af..c0d338db6b52 100644
--- a/drivers/staging/greybus/bootrom.c
+++ b/drivers/staging/greybus/bootrom.c
@@ -243,10 +243,10 @@ static int gb_bootrom_get_firmware(struct gb_operation *op)
 	struct gb_bootrom *bootrom = gb_connection_get_data(op->connection);
 	const struct firmware *fw;
 	struct gb_bootrom_get_firmware_request *firmware_request;
-	struct gb_bootrom_get_firmware_response *firmware_response;
 	struct device *dev = &op->connection->bundle->dev;
 	unsigned int offset, size;
 	enum next_request_type next_request;
+	u8 *firmware_response;
 	int ret = 0;
 
 	/* Disable timeouts */
@@ -280,15 +280,15 @@ static int gb_bootrom_get_firmware(struct gb_operation *op)
 		goto unlock;
 	}
 
-	if (!gb_operation_response_alloc(op, sizeof(*firmware_response) + size,
-					 GFP_KERNEL)) {
+	/* gb_bootrom_get_firmware_response contains only a byte array */
+	if (!gb_operation_response_alloc(op, size, GFP_KERNEL)) {
 		dev_err(dev, "%s: error allocating response\n", __func__);
 		ret = -ENOMEM;
 		goto unlock;
 	}
 
 	firmware_response = op->response->payload;
-	memcpy(firmware_response->data, fw->data + offset, size);
+	memcpy(firmware_response, fw->data + offset, size);
 
 	dev_dbg(dev, "responding with firmware (offs = %u, size = %u)\n",
 		offset, size);
diff --git a/drivers/staging/greybus/fw-download.c b/drivers/staging/greybus/fw-download.c
index 543692c567f9..a06065fb0c5e 100644
--- a/drivers/staging/greybus/fw-download.c
+++ b/drivers/staging/greybus/fw-download.c
@@ -271,11 +271,11 @@ static int fw_download_fetch_firmware(struct gb_operation *op)
 	struct gb_connection *connection = op->connection;
 	struct fw_download *fw_download = gb_connection_get_data(connection);
 	struct gb_fw_download_fetch_firmware_request *request;
-	struct gb_fw_download_fetch_firmware_response *response;
 	struct fw_request *fw_req;
 	const struct firmware *fw;
 	unsigned int offset, size;
 	u8 firmware_id;
+	u8 *response;
 	int ret = 0;
 
 	if (op->request->payload_size != sizeof(*request)) {
@@ -325,8 +325,8 @@ static int fw_download_fetch_firmware(struct gb_operation *op)
 		goto put_fw;
 	}
 
-	if (!gb_operation_response_alloc(op, sizeof(*response) + size,
-					 GFP_KERNEL)) {
+	/* gb_fw_download_fetch_firmware_response contains only a byte array */
+	if (!gb_operation_response_alloc(op, size, GFP_KERNEL)) {
 		dev_err(fw_download->parent,
 			"error allocating fetch firmware response\n");
 		ret = -ENOMEM;
@@ -334,7 +334,7 @@ static int fw_download_fetch_firmware(struct gb_operation *op)
 	}
 
 	response = op->response->payload;
-	memcpy(response->data, fw->data + offset, size);
+	memcpy(response, fw->data + offset, size);
 
 	dev_dbg(fw_download->parent,
 		"responding with firmware (offs = %u, size = %u)\n", offset,
diff --git a/include/linux/greybus/greybus_protocols.h b/include/linux/greybus/greybus_protocols.h
index aeb8f9243545..820134b0105c 100644
--- a/include/linux/greybus/greybus_protocols.h
+++ b/include/linux/greybus/greybus_protocols.h
@@ -232,9 +232,7 @@ struct gb_fw_download_fetch_firmware_request {
 	__le32			size;
 } __packed;
 
-struct gb_fw_download_fetch_firmware_response {
-	__u8			data[0];
-} __packed;
+/* gb_fw_download_fetch_firmware_response contains no other data */
 
 /* firmware download release firmware request */
 struct gb_fw_download_release_firmware_request {
@@ -414,9 +412,7 @@ struct gb_bootrom_get_firmware_request {
 	__le32			size;
 } __packed;
 
-struct gb_bootrom_get_firmware_response {
-	__u8			data[0];
-} __packed;
+/* gb_bootrom_get_firmware_response contains no other data */
 
 /* Bootrom protocol Ready to boot request */
 struct gb_bootrom_ready_to_boot_request {
-- 
2.34.1

