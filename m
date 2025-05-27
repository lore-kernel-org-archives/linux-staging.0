Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED2C442C
	for <linux-staging@lists.linux.dev>; Tue, 27 May 2025 05:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748322427; cv=none; b=a2TfL8SyT/qF1zJfxzyDlHpsROsKLx82VBhhCu9b6o7TA8ILwoORCskJmLU6yiv3EUmiKw8FBqWrFHsF9wmohaqamwfthzXdAIRfGn3XUyD0xdvH8neHc5JwxdgQvKw3yAzu23pdsIUJ/Ed0gmozWKMS3Cq5LZi/ecugmaDGTCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748322427; c=relaxed/simple;
	bh=665C0A0ywPp7IQwAfzFBpxxX8o89OwjurlTcLpd1Ovw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=icXI1nl51lKyM8UOmu91ZJihGdYEKibc+C5JH0sk033M4G3Fzu5PN4Bq3DytgNulrRDaIG3A7Mcz714o/9euoWNxK7+xg90WsPM1e0EAslbvKZnNVapl9xtMSwO2WlNIs3DSB1K4dE9c1+owvDP4aju+D26XQTCsJ+0MroukA1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b8cAJc9T; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b8cAJc9T"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-30eccc61eacso174954a91.3
        for <linux-staging@lists.linux.dev>; Mon, 26 May 2025 22:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748322425; x=1748927225; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bq5EwIkXOrraR/5nVIEtjR45/z8eeDLu8nm16aEaZ24=;
        b=b8cAJc9Tb4humBQqG966fpElxNUkj7AAyf9JQSv2XXAYf2jNI4uB6GOWBkaxP5L39a
         K7FjsTMzOcjRDLTfKKeyFiwbnkJ7Y0gd7cBPWcj4mbU8sIP9MzQJuBKOPZwYX37BCNpz
         ngg85g2mise1i+PxK2K4HAgT/qNlynL6tg4oDdAH2AXIQrVoUtoQBxWv5UzgXOucJtd5
         rrFTLUQQwROwTjiKHdG1lA8IhB4IBYJsI61AMlq+crH70heA2mzDAezgWyoNfuhDUN8l
         BDroTUckt6J6gIRfUUbwyQ38GrpdT00xya6KwuT9/a3WCzeg8u/psdBqzbVkpfSDUo76
         u8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748322425; x=1748927225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bq5EwIkXOrraR/5nVIEtjR45/z8eeDLu8nm16aEaZ24=;
        b=GdyQeRU7T9uz/3p2YIjlqaN3B1Dr/2sOZezMCJVXmygqk85sZOyP2/ur+NScFo/3+n
         Sjtq6SWpfUrKcSHgNniITOy8XYIyMQHTzjQB8ZhiekF5vVcz4j8o56Th44YbEZuXDDWZ
         9jwI1ud4rN96/VyArWPWVsfvAunBZO1uFUtnbcZTPGzUyjHSd+B7hbeYj/JuF6WelpUM
         HS74zz8MobBmQW4NfebVkeNJBqh5HUGmPIyJ1DIeQ3kbCb9nyKv3lWLjgcSDDb0me6S/
         Fej0eB8Pgxc5yPwZJrU7VnFVrXFG+/pDnvuGuu76999vSGi1h/F1yLfW0yOBjL/oQepx
         q7Dw==
X-Forwarded-Encrypted: i=1; AJvYcCVC9uDcLdJ2vh9P79SDR+UiwS87g1nnJYwA4Uzy04TM8TfzeIq8aA1lWIlGBxGMfXS9qdTXlmeBh2+7TQVB@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7b0y3HjM18MIRaPpxqEamMLsHCLF9QDlDj6r9RPVmOiF9kkt8
	4fS6lEZeS+FD3Y+Zg++Mu/3agRPzt11sNXON+9LDJDBPuHTUt0Sofpob
X-Gm-Gg: ASbGncslw/r97ab9uCGSr/Zr2HQ7NqNXSz5SAsYsqyHG45RCKkqtQt36FIPBxZWJtta
	dWKJkgaZ6eD9IYesymt3CYQa1vO+uMUbADFR6NlsNh/WuDeJeYDaYeJc8qc++EDEoXVupbRwbIA
	91mcNcDHP0oiBCvdEcMYhB7tbBiD8qh0mv0XmdY58I4pMwFPkaDNdmHMBWYLDYE4iYNiio1nvj7
	pLb2YuKfbqoyeOjnasE3QHkbpVWxNSJEA9IbWEQeV5P8ozB0PoxZ3mSpywq38RUrgVzMJKf6MwX
	oUknPOmdY4uTpn6Gz37HiaV2u2c96fPyqpVohjkoG34=
X-Google-Smtp-Source: AGHT+IG1ZpXlBdEq/GjPYtl6pc9EcGGLHPouogdxKALQB+704gWvgLlSpt5eYSZDLGVS4PrHfg2rcg==
X-Received: by 2002:a05:6a20:438f:b0:1ee:d6a7:e333 with SMTP id adf61e73a8af0-2188c3a285bmr6988282637.8.1748322424767;
        Mon, 26 May 2025 22:07:04 -0700 (PDT)
Received: from user.. ([58.206.232.74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a98a0ca7sm17883937b3a.158.2025.05.26.22.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 22:07:04 -0700 (PDT)
From: clingfei <clf700383@gmail.com>
To: elder@kernel.org
Cc: keescook@chromium.org,
	johan@kernel.org,
	vireshk@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	clf700383@gmail.com
Subject: [PATCH v2] greybus: Avoid fake flexible array for response data
Date: Tue, 27 May 2025 13:06:35 +0800
Message-Id: <20250527050635.946553-1-clf700383@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We want to get rid of zero size arrays and use flexible arrays instead.
However, in this case the struct is just one flexible array of u8 which
adds no value. Just use a pointer instead.

v1: https://lore.kernel.org/all/202505262032.507AD8E0DC@keescook/

Signed-off-by: clingfei <clf700383@gmail.com>
---
 drivers/staging/greybus/i2c.c             | 12 ++++--------
 include/linux/greybus/greybus_protocols.h |  3 ---
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/greybus/i2c.c b/drivers/staging/greybus/i2c.c
index 14f1ff6d448c..b248d6717b71 100644
--- a/drivers/staging/greybus/i2c.c
+++ b/drivers/staging/greybus/i2c.c
@@ -144,15 +144,14 @@ gb_i2c_operation_create(struct gb_connection *connection,
 }
 
 static void gb_i2c_decode_response(struct i2c_msg *msgs, u32 msg_count,
-				   struct gb_i2c_transfer_response *response)
+				   u8 *data)
 {
 	struct i2c_msg *msg = msgs;
-	u8 *data;
 	u32 i;
 
-	if (!response)
+	if (!data)
 		return;
-	data = response->data;
+
 	for (i = 0; i < msg_count; i++) {
 		if (msg->flags & I2C_M_RD) {
 			memcpy(msg->buf, data, msg->len);
@@ -188,10 +187,7 @@ static int gb_i2c_transfer_operation(struct gb_i2c_device *gb_i2c_dev,
 
 	ret = gb_operation_request_send_sync(operation);
 	if (!ret) {
-		struct gb_i2c_transfer_response *response;
-
-		response = operation->response->payload;
-		gb_i2c_decode_response(msgs, msg_count, response);
+		gb_i2c_decode_response(msgs, msg_count, operation->response->payload);
 		ret = msg_count;
 	} else if (!gb_i2c_expected_transfer_error(ret)) {
 		dev_err(dev, "transfer operation failed (%d)\n", ret);
diff --git a/include/linux/greybus/greybus_protocols.h b/include/linux/greybus/greybus_protocols.h
index 820134b0105c..6a35c78b967b 100644
--- a/include/linux/greybus/greybus_protocols.h
+++ b/include/linux/greybus/greybus_protocols.h
@@ -678,9 +678,6 @@ struct gb_i2c_transfer_request {
 	__le16				op_count;
 	struct gb_i2c_transfer_op	ops[];		/* op_count of these */
 } __packed;
-struct gb_i2c_transfer_response {
-	__u8				data[0];	/* inbound data */
-} __packed;
 
 
 /* GPIO */
-- 
2.34.1

