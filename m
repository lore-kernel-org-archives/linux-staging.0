Received: from mout-y-111.mailbox.org (mout-y-111.mailbox.org [91.198.250.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637FC3C73DA
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 11:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774870977; cv=none; b=JqFC+64s6mrhWxJNk6GVQTjFAR66nkFuom5waJsH7zYA+jSw8YcyEuRihxIV50rClQjz7HzlLGCTnWa3fLx3gemfJctvWkVS4oTMynZyWZ+FaBSgX0NwTpoZuGaBPIosfMhcD23EdZ27Yuh6AHbOPCTXsxgEpkakx4SUbkoQsls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774870977; c=relaxed/simple;
	bh=ROqm1hYLo+dcYfbv6Qryit35GoyY868FBeh7JiaMJis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S3dBh0iigysuAkznBbDXzJvYD0ovyCmSP43vHydeMNkHeOV/jSVrr3JBKGlKFVKvckPSRN0nlCKg1NyyZtXivPlay4R6aS65+vxseP7/9ZmWsQ5K8icr/HsDvvab44SlA0oHoz54YWZ0+0roaEh7zEac5EjSV51NCKOWPfpKxSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hZt70jSF; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=mY6srZZ7; arc=none smtp.client-ip=91.198.250.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hZt70jSF";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="mY6srZZ7"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-111.mailbox.org (Postfix) with ESMTPS id 4fkqB52Wnkz9yH6;
	Mon, 30 Mar 2026 13:42:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774870973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+cWSbnVnyDwCKr8wXK+L+WhbYpdgsq+g5r+mJ9QK4G0=;
	b=hZt70jSFlSuvVToW+M1YjcJlS0LSWo9VWN1TIbFgfuG2cZboMeNa/t+ZZKSunnpQk5LV7w
	FZ9YmPx/ArdECTPo4RB7qUmsWfRVHb6sZq7rCvHETBn7mH2F/lulU5+/urJJLGzsOilK8F
	eoaPsehAzNzW/RYrby3xvKGHZ3BkDiCw/09/51y5CXpMdoQoKe/q0QemU/T26Au/YGnVD0
	ybq7wXfHttSXQDenajPymQFMrTfYPflBR66K6yUY2FTVZ8kax+25ZwKrlKT62QYMuOOWFG
	FBzm9WgtsClnTIGHg6FSZ94fleaLkFEBs6U1zZtdYClZIEk44qeTO/gyUCUmrw==
From: Mashiro Chen <mashiro.chen@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774870971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+cWSbnVnyDwCKr8wXK+L+WhbYpdgsq+g5r+mJ9QK4G0=;
	b=mY6srZZ7FVqvfmh/H2uosTX9sOU4vY0ayyTVSRKxIu2o+MTPgHqVQSIEfs53VD+8DhqiRV
	PKTOtizfYZ8UEBskBfxhB8yPBXS0UxZjr46F3BNUYRvPFypR2n408yxZt3xSdb//QzOfrI
	xplOl+fK9rGSApXacQrCn5VrM+AXegVtTtdP7NZtWZz2E7alqtXBZ5IV5O59Dq9AVO/01J
	GyHlwt24eDvkQD1xpBHJEXuROQOcaZ58apwzpiaBUGJw7QV2Hp6BuBX11p4U9bEgca80Vn
	sAKGSC12aLIo3GrrxK7iP01LVSAPPgzqqfRYMUjlyF5OUvoa0wZGHvHGnJMcsg==
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mashiro Chen <mashiro.chen@mailbox.org>
Subject: [PATCH v2 1/3] staging: rtl8723bs: remove unused WRITEEF/READEF byte macros
Date: Mon, 30 Mar 2026 19:42:30 +0800
Message-ID: <20260330114232.91431-2-mashiro.chen@mailbox.org>
In-Reply-To: <20260330114232.91431-1-mashiro.chen@mailbox.org>
References: <20260330114232.91431-1-mashiro.chen@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 95be57144fb4e5e471a
X-MBO-RS-META: kyerqpc61439tsazr4b38hgt1k15frmt

The WRITEEF4BYTE, WRITEEF2BYTE, WRITEEF1BYTE, READEF4BYTE,
READEF2BYTE and READEF1BYTE macros are never used in the driver.
Remove them entirely.

Suggested-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Mashiro Chen <mashiro.chen@mailbox.org>
---
 .../staging/rtl8723bs/include/basic_types.h   | 25 -------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/basic_types.h b/drivers/staging/rtl8723bs/include/basic_types.h
index 8adb95f9f1e5..69f7402d8e5c 100644
--- a/drivers/staging/rtl8723bs/include/basic_types.h
+++ b/drivers/staging/rtl8723bs/include/basic_types.h
@@ -42,31 +42,6 @@
 #define EF4BYTE(_val)		\
 	(le32_to_cpu(_val))
 
-/* Read data from memory */
-#define READEF1BYTE(_ptr)	\
-	EF1BYTE(*((u8 *)(_ptr)))
-/* Read le16 data from memory and convert to host ordering */
-#define READEF2BYTE(_ptr)	\
-	EF2BYTE(*(_ptr))
-#define READEF4BYTE(_ptr)	\
-	EF4BYTE(*(_ptr))
-
-/* Write data to memory */
-#define WRITEEF1BYTE(_ptr, _val)			\
-	do {						\
-		(*((u8 *)(_ptr))) = EF1BYTE(_val);	\
-	} while (0)
-/* Write le data to memory in host ordering */
-#define WRITEEF2BYTE(_ptr, _val)			\
-	do {						\
-		(*((u16 *)(_ptr))) = EF2BYTE(_val);	\
-	} while (0)
-
-#define WRITEEF4BYTE(_ptr, _val)			\
-	do {						\
-		(*((u32 *)(_ptr))) = EF2BYTE(_val);	\
-	} while (0)
-
 /*
  * Create a bit mask
  * Examples:
-- 
2.53.0

