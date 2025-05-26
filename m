Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E1E1F4188
	for <linux-staging@lists.linux.dev>; Mon, 26 May 2025 11:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748257693; cv=none; b=PEXqbQbWsWTovvpzoQLSq9qeHePJpF0QlYbSFVsmQGZdgwMUwF9D/SucpTN0gbaABElRVwm85Vucdp8kFb4juIfNhoSojkGv4iiAAkRYiexgADXS1s1mFJlxvktGGCf3zguGV3VALFW3/GbZ5xQLRUoYyHAn86tBwiOmg9oKc3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748257693; c=relaxed/simple;
	bh=O+dE09fzj62OmqV+UsjuQLQsX2ktS32WrQkumdnCevU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DBPlSeXBV6b2kNJJynjMwHNWXR2/rNnjmNyk/KpaT1rsCoihrBZ/qyqiaKT3QgvjEMamaWpdFI23JdhtjgHAyUk/XzjNKsZ2Nf8OM5aA0qpvQLsYo4LdPFP2hDkbEtiiGHaKHgnwvmzY+zZR1B3cLiU9a3dljS3dnALbMO4ZC8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=REazI7dR; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="REazI7dR"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2344fc24859so1158565ad.0
        for <linux-staging@lists.linux.dev>; Mon, 26 May 2025 04:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748257691; x=1748862491; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TYrv+P2HDOOtjJG1Ylbuyew/XFq9E/PugmdWiaigIXA=;
        b=REazI7dRRO9GqzDWEQZv+Dcg47aFkI8PVqAi9n1faB3RUV2YS7GYLeAWTkg9LzlhoV
         DU4QTNaTT/J6WSxMHwrw6zY397r9pgIkdXgY26EBpVlomkJ1WSxR3ZfLdLoiiOT3na42
         YIr9qDrnWkswU/Bbi7itPCgPltdItStgEeOuqZShdVUgDk/MxXGgidERAcWnqSjhH8+E
         gMAwOq/ao/dL+WZE4sIVPU4fc7v2fNQ5n0GAmHZrBY3YHepnBL7YG9XjkhJQmwK2qV8M
         gbTtuuJpMJ7dduC7+L7rFotKeS/bEHgIuq9yd69r6WsDUpipXdd6f9/7f7elWBVrfJd+
         mJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748257691; x=1748862491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TYrv+P2HDOOtjJG1Ylbuyew/XFq9E/PugmdWiaigIXA=;
        b=p3RIt3CRnVeKcgH4yDyFGK5QQh9KMfdhT1hgDIYg5P9feAVWZUmAqqa4DVE3NTfKwb
         2wgpXOsB+z7fdXOvkNPjjvw6Vz4Tb8VFmzBuY6V8B5l5QNEHc/QPn8GpDyiHiZcePMlF
         QZifTBnS9RlIoFgzzhPJLKwhA/oHPH7Qdomd1TwD4Z8CYSLWbNkEd/Q755ZSSDFVsyAz
         lAni7ge0zviqNgyW1WF7d4kj5/hLi2ewnGQwhy7qA5+9DF2H06J6qYMLOKZDy2s8NXkG
         rtOUrW8CKHROlo+cDHSKlNDTOLxpyXybLTC4XFYwE9jo5yI8lNVY6ffQNfkk40p07tVc
         518Q==
X-Forwarded-Encrypted: i=1; AJvYcCUMBdpZHAM0HNnu23uPl4gZUwgYrPjsSZZh4aeg6mEqhtUp4/aVYCyx+78srineQ096CanDNzazmEs1fh3L@lists.linux.dev
X-Gm-Message-State: AOJu0YxnlNIFDvIpVJWTvszDGzOZ5VwN7O039RLyuq8gumVAkw2dgvso
	M0hwPE8v6M4trU0PAPFP70Bzzc+QX52OKgy/Vsv7iKlZccOjjTyjeGsC
X-Gm-Gg: ASbGncsDLjPNOy7I693rfwu3XTWWBUnGzWpAgQwGGqo1xeecez5hd82gXDGkjMabEO7
	lIfHg9Rb9qpsDb0yeSBcG5xjz8Gq0ZLQ5ICpWuMQzHEOeJKpsV6HFP6APeyuhApDFe+QOBjeQu2
	lx4EWdQzkw0b6TKlipGHsVmLSz4Kx9T9tsEGw5kFV5/OjeAqP+RS1CN0Weh2Sbx/6aYuwsPAYqZ
	12UJyOVkhKdt5uT/vbJS4ukJ4tZWHqJ88+XYigKDcroP0fmREiOeKCBgxswtUs6cxGbR4n5WZX8
	kxD1zYjYfJ1Ip11stl79Rv8Aj8RvJQ==
X-Google-Smtp-Source: AGHT+IHq3w0bF9u3FNLf9NfvqS8horvVYf7CrW5lhlByo7h0D4LInhkkAn5Rq1vWblX71HzqOcrmxA==
X-Received: by 2002:a17:902:db03:b0:223:5525:622f with SMTP id d9443c01a7336-23414f2fca5mr49499585ad.1.1748257691042;
        Mon, 26 May 2025 04:08:11 -0700 (PDT)
Received: from user.. ([2001:da8:283:e049::9:6ed3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23435e7671asm28156875ad.89.2025.05.26.04.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 04:08:10 -0700 (PDT)
From: clingfei <clf700383@gmail.com>
To: elder@kernel.org
Cc: johan@kernel.org,
	vireshk@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	clf700383@gmail.com
Subject: [PATCH] greybus: Avoid fake flexible array for response data
Date: Mon, 26 May 2025 19:06:54 +0800
Message-Id: <20250526110654.3916536-1-clf700383@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As https://lore.kernel.org/all/20240304211940.it.083-kees@kernel.org/
pointed out, to enforce the 0-sized destinations, the remaining 0-sized
destinations need to be handled. Thus the struct
gb_control_get_manifest_response and struct gb_i2c_transfer_response
are removed.

Signed-off-by: clingfei <clf700383@gmail.com>
---
 drivers/staging/greybus/i2c.c             | 9 ++++-----
 include/linux/greybus/greybus_protocols.h | 9 ---------
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/greybus/i2c.c b/drivers/staging/greybus/i2c.c
index 14f1ff6d448c..2857c2834206 100644
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
@@ -188,7 +187,7 @@ static int gb_i2c_transfer_operation(struct gb_i2c_device *gb_i2c_dev,
 
 	ret = gb_operation_request_send_sync(operation);
 	if (!ret) {
-		struct gb_i2c_transfer_response *response;
+		u8 *response;
 
 		response = operation->response->payload;
 		gb_i2c_decode_response(msgs, msg_count, response);
diff --git a/include/linux/greybus/greybus_protocols.h b/include/linux/greybus/greybus_protocols.h
index 820134b0105c..14395f9300d6 100644
--- a/include/linux/greybus/greybus_protocols.h
+++ b/include/linux/greybus/greybus_protocols.h
@@ -110,11 +110,6 @@ struct gb_control_get_manifest_size_response {
 	__le16			size;
 } __packed;
 
-/* Control protocol manifest get request has no payload */
-struct gb_control_get_manifest_response {
-	__u8			data[0];
-} __packed;
-
 /* Control protocol [dis]connected request */
 struct gb_control_connected_request {
 	__le16			cport_id;
@@ -678,10 +673,6 @@ struct gb_i2c_transfer_request {
 	__le16				op_count;
 	struct gb_i2c_transfer_op	ops[];		/* op_count of these */
 } __packed;
-struct gb_i2c_transfer_response {
-	__u8				data[0];	/* inbound data */
-} __packed;
-
 
 /* GPIO */
 
-- 
2.34.1

