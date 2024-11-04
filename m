Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A051D0178
	for <linux-staging@lists.linux.dev>; Mon,  4 Nov 2024 17:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730742643; cv=none; b=ql4sRrxltRfTYsmwprPxW51DmA4osfmUm55KtJh9uDOMlUzAjJSREHb9goVjC81RBe1oNIVuD05Mk1zwHk+kLeQzTWtMWQklRJUT8Ga1Tk/N2GMljp0An8v0cXPQlPNn0ZGbGRFs08OAjbbgFBdqSKgcwJKYLxLf+FSAJ7HrvzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730742643; c=relaxed/simple;
	bh=r8oDawuzwrCTjMJNkuzF+kmtf/cLqFGhI9bi3b/8YqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nUKbycatvVRdtBWQf3WuI5S9Tjk1ZfePHeSOhbHhtaUnIabcFR/uzz6HOEq1JOB2i7U0/gEOTOj/W7/MClzRD1FYfVAXztBZttST+Y9JiVoHHNZA+KPsedodptVzh64QO5YniFf2WPN6X/rGniYN4LFZ3XXvE/UASxi/5yPrqFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DGmF4Thw; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGmF4Thw"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43152b79d25so38593605e9.1
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 09:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730742639; x=1731347439; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OnCRniz6rwW4FxyVUqUDwT3HfYK1tMoSQehysVO/b1w=;
        b=DGmF4ThwshVv/5IrpaZDz/YKLijof8jky+QkSgo55lVP81d4YcWTqpHDHbYcCF0Eu7
         uF8fn/kscm3lVsqSBTKi9yo0J2Q455joAl12MPFjzBVuwQG49aoptZXoHxj6IFE+QP0i
         wTUWFXg4kxTnA7GAnB4/eyIwu6I5Ccv0kqmeIkrXuSa/rxQvCoEB0TIr5CM9/jgYhOIU
         lqqe9jYLQK9iYMsgNav7p13/z31Ln8u9XDOvlezpyP4GriEg7Op/0u7VfVUjjW4VssZ6
         rnMylBLxDKgarDuacgNs4I53tq04Y67qdkJDtrRNDaCT05koQzWDs2V1m/LznVJxx45N
         AOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730742639; x=1731347439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OnCRniz6rwW4FxyVUqUDwT3HfYK1tMoSQehysVO/b1w=;
        b=oVz3gk4H09HIUwOqeRrxxwl37ANaW0AlCK3zeRoMsQKBn6KiS/GEeZ/9+bTO/5sQuB
         f8+CfII86wW9ADopfQDKp8+JQpD5RQxpo1OBwORWPmiXHCJX04+qRBC4BVmQxwHqdN3X
         CE2xjKg045WjNocLu5/cCRRDqAj6hazXCVdyTZU39u8gOqdK3Uw2V3HgfwiaVYhLkNM6
         iQc4Zs/j0dnXYlX91rjIYyTlUc5m/xJ1v4ISHNV7J4+iGWuXZMkhaEQJ1V9VpJ0ItXSf
         SlhaUX7E0W+v359aX25XqBPWWOGxYGDf2QJQiyqeatbf58F9B7CTNKYBwbqAW91vBrrI
         2yJw==
X-Forwarded-Encrypted: i=1; AJvYcCWik9qw8sW+FI8Q4IMApL9+gltfAiS8RgTDXXY3SQjuXrlp/SEJfnoy3TnOJrmagReppnnHwfECO+k032NU@lists.linux.dev
X-Gm-Message-State: AOJu0YwnMIAStXnmb/ZkPkm6lQUtSK2807d54x8+kJ/jj40Z6YJc8wJt
	alDkBSmBm3c/cunermz5gpAokmMVXJ9owyPTbnM4EzPw0YVu0MGm
X-Google-Smtp-Source: AGHT+IGNRKQXMXIFktTsqSu5Cqzlhbz5LhgCV8zs8OBKycVfuNRvFw3mF9TjCqlV/c3pcFyFe6H3dw==
X-Received: by 2002:a05:600c:3587:b0:42c:c401:6d67 with SMTP id 5b1f17b1804b1-4327b6f464amr133648605e9.6.1730742638570;
        Mon, 04 Nov 2024 09:50:38 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7f80sm13839821f8f.20.2024.11.04.09.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 09:50:37 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@linaro.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH v3 12/12] staging: gpib: Correct check for max secondary address
Date: Mon,  4 Nov 2024 18:50:13 +0100
Message-ID: <20241104175014.12317-13-dpenkler@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241104175014.12317-1-dpenkler@gmail.com>
References: <20241104175014.12317-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GPIB secondary addresses can be between 0 and 31 inclusive
unlike primary addresses where address 31 is not a valid device
address.  When 31 is used as a primary talk address it
forms the UNT (Untalk) command and when used as a listener address it
forms the UNL (Unlisten) commmand.
The library was incorrectly not allowing a secondary address
with a value of 31 to be used.

Fixes: 9dde4559e939 ("staging: gpib: Add GPIB common core driver")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/common/gpib_os.c | 4 +---
 drivers/staging/gpib/common/iblib.c   | 6 +++---
 drivers/staging/gpib/common/ibsys.h   | 3 +++
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index e84097ac8f69..0285180ae1f0 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -525,8 +525,6 @@ int serial_poll_all(gpib_board_t *board, unsigned int usec_timeout)
  * SPD and UNT are sent at the completion of the poll.
  */
 
-static const int gpib_addr_max = 30;	/* max address for primary/secondary gpib addresses */
-
 int dvrsp(gpib_board_t *board, unsigned int pad, int sad,
 	  unsigned int usec_timeout, uint8_t *result)
 {
@@ -538,7 +536,7 @@ int dvrsp(gpib_board_t *board, unsigned int pad, int sad,
 		return -1;
 	}
 
-	if (pad > gpib_addr_max || sad > gpib_addr_max) {
+	if (pad > MAX_GPIB_PRIMARY_ADDRESS || sad > MAX_GPIB_SECONDARY_ADDRESS) {
 		pr_err("gpib: bad address for serial poll");
 		return -1;
 	}
diff --git a/drivers/staging/gpib/common/iblib.c b/drivers/staging/gpib/common/iblib.c
index fc57e760c144..db1911cc1b26 100644
--- a/drivers/staging/gpib/common/iblib.c
+++ b/drivers/staging/gpib/common/iblib.c
@@ -479,7 +479,7 @@ int ibsre(gpib_board_t *board, int enable)
  */
 int ibpad(gpib_board_t *board, unsigned int addr)
 {
-	if (addr > 30) {
+	if (addr > MAX_GPIB_PRIMARY_ADDRESS) {
 		pr_err("gpib: invalid primary address %u\n", addr);
 		return -1;
 	}
@@ -498,8 +498,8 @@ int ibpad(gpib_board_t *board, unsigned int addr)
  */
 int ibsad(gpib_board_t *board, int addr)
 {
-	if (addr > 30) {
-		pr_err("gpib: invalid secondary address %i, must be 0-30\n", addr);
+	if (addr > MAX_GPIB_SECONDARY_ADDRESS) {
+		pr_err("gpib: invalid secondary address %i\n", addr);
 		return -1;
 	}
 	board->sad = addr;
diff --git a/drivers/staging/gpib/common/ibsys.h b/drivers/staging/gpib/common/ibsys.h
index b78ca5ea4da1..da20971e9c7e 100644
--- a/drivers/staging/gpib/common/ibsys.h
+++ b/drivers/staging/gpib/common/ibsys.h
@@ -16,6 +16,9 @@
 #include <asm/irq.h>
 #include <asm/dma.h>
 
+#define MAX_GPIB_PRIMARY_ADDRESS 30
+#define MAX_GPIB_SECONDARY_ADDRESS 31
+
 int gpib_allocate_board(gpib_board_t *board);
 void gpib_deallocate_board(gpib_board_t *board);
 
-- 
2.46.2

