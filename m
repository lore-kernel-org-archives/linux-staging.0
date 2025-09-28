Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAC41D7984
	for <linux-staging@lists.linux.dev>; Sun, 28 Sep 2025 09:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759051108; cv=none; b=lgvqSt/yF4Ry0zE14gZLb3sM2nXCIndFQq5WUexy2saJDhnXMXgBi6stSSF4Ad6L7tIeCu43gINCxcAUwd02P0z/Q1FJA4XX7z0CmhMHKQ59SiFCfF9X/pg2IPG/5SxCoIHyMIWFIS7by1tyOI+/nXb+Iqy20XaPFAD3e3puQpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759051108; c=relaxed/simple;
	bh=ofqEcQ9NXDQgEKIfDsHRwO/RRELrot1TTFph5IPeXGI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cHFHvSAk6lXEEA3vD/R3ykEvxFDgv8TOAziCoROn+6MK0gc281aNp35nnDKdfaTDm9b/adIIN9BSF/HquEhfcBSO5zCBFaOrF8Nn84N3h/C6k2K9v15hKfQUtRvAHoQRnhSg+0sHl9aonFCEX/ICcYVCCkJr3gSEJxHPbI7V8Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jdYsbnyw; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jdYsbnyw"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3fa528f127fso2737319f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 28 Sep 2025 02:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759051105; x=1759655905; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QBCINZFXBb6AVWDqgr+Mk+Uw/H22zFl0IVt/zipxIk8=;
        b=jdYsbnywUUCEPNDqbV1fwRsIEqazjwXK6LMKM/ngCAGiQ8YpukdmSTFvt6A6WGmZfm
         h0QMTsd0WGepWCyIGZ6XXcpCM9lNOf6hgx12Yqj2XmWgRXKQhO23BJidK0A1b38dFeSl
         ZVDeB1wgZm+MxMA2mWmaaKnTu5jx+nbrv8LNgdQUFf7cXNhlOHQvZ4HR1z8RwQwwE4a+
         9DTyUxizomlM/e+sd2YpVwWoi3lyNx5i3Ss/ZHEIuVNUFTbFF4Yext/OT2duTtpjlpAR
         /QH9mwIs+a01pJfPzVqGBZKP6QJLQEOnYasJcvv8BIc1mbfxNolOixMNKVyAW+hprHzL
         EGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759051105; x=1759655905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QBCINZFXBb6AVWDqgr+Mk+Uw/H22zFl0IVt/zipxIk8=;
        b=YgVW+Cq/jKEUuE0Q6Vr2gAXIF17vpxeA7UhQQrwKpsDPLm9weyz07c3hyxiKk6TeBz
         mLjtWGE5597yc7f772vpYnmvIGB7bWE1akGeR8ak3gpyQfj2r97sAtmMJic3T3T3EzKZ
         AX4TbP6bSQ/pjmpZ96DGEE4QhF/dbOQxotCA03+6tJKhrtqE7OqpdTgL8MfVd6n4GLze
         TFI7y2JSQ9JSoNDcAA1xDUe7Xo7UmeFpA+UAlMgYgYYTettTOU7p7B4+S35CeGxOLOeP
         saR2BrVOXsjoq9aYdD8PVvuOFeW/5n8Js24ZiuY/j76dKzAlUVkRE0QjrU5G5bN3fzUV
         LJqA==
X-Forwarded-Encrypted: i=1; AJvYcCWtI2jjRRq0H2P1DwbAikYjxwYBd1x4fsLzLUocO98Xav/5C9lv44sevEtA6MF/xQBLiGzcbjaOWnDJHh3i@lists.linux.dev
X-Gm-Message-State: AOJu0YyIsED6XeCEKLHmsXu2SsYJ9fF3hueKfK/JphZLZnQfh0oSPpJB
	W858GNZIuyLc66AbHE1NCsP5hj/BfUqgiGXzkawEOyawXBd/acqKvSir
X-Gm-Gg: ASbGncuXcPLaNXyR9rNpWpZ5rkmLcYFEdCSW9fDLDUQykD3E6POn7B09ge7Aj7qN3Q/
	CDFmCJs7M8gAytxQk+NGB3s/V+Qnw/cOZIvPw6MegSEtxjjC0jgql2I9SIsiKG8dxa5MJ1jAdbS
	EIVTZwwtcaXu54r5Sj047Iurf2aLROrvTmJJ156AUZY+mrYmQ+MQdLlajXfjd2AxvRhSiuTvm3H
	dDv5reBh/J/+rZcGymVy+d4NtqjirvbJwFO1F/jYnrqpS65nr8cSnJ8neaXHugD46B1Bj4rvODB
	BeZRulIBI3wNFGTyYSvsEV0XWluNP39xet5feDtse92w+ENQXLyTRLzFE2vLC7qhZac73CCztoM
	VQ8p7G01uaxWWBugt89nJ0v9T43JBD6pWzhHP7xzYjJ7rpBwF
X-Google-Smtp-Source: AGHT+IErP8ERPQgt2nHabO2vaauhPtQUS3TOjxY7+8HVednMIgZMbS0DXgA80j05eErJB8vH8T+2WA==
X-Received: by 2002:a05:6000:1acc:b0:3fa:ebaf:4c53 with SMTP id ffacd0b85a97d-418077a5f34mr4553981f8f.29.1759051105153;
        Sun, 28 Sep 2025 02:18:25 -0700 (PDT)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc7e2bf35sm13859710f8f.53.2025.09.28.02.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 02:18:24 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH] staging: gpib: Fix no EOI on 1 and 2 byte writes
Date: Sun, 28 Sep 2025 11:18:18 +0200
Message-ID: <20250928091818.4243-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

EOI (End Or Identify) is a hardware line on the GPIB bus that can be
asserted with the last byte of a message to indicate the end of the
transfer to the receiving device.

In this driver, a write with send_eoi true is done in 3 parts:
  Send first byte directly
  Send remaining but 1 bytes using the fifo
  Send the last byte directly with EOI asserted

The first byte in a write is always sent by writing to the tms9914
chip directly to setup for the subsequent fifo transfer.  We were not
checking for a 1 byte write with send_eoi true resulting in EOI not
being asserted. Since the fifo transfer was not executed
(fifotransfersize == 0) the retval in the test after the fifo transfer
code was still 1 from the preceding direct write. This caused it to
return without executing the final direct write which would have sent
an unsollicited extra byte.

For a 2 byte message the first byte was sent directly. But since the
fifo transfer was not executed (fifotransfersize == 1) and the retval
in the test after the fifo transfer code was still 1 from the
preceding first byte write it returned before the final direct byte
write with send_eoi true. The second byte was then sent as a separate
1 byte write to complete the 2 byte write count again without EOI
being asserted as above.

Only send the first byte directly if more than 1 byte is to be
transferred with send_eoi true.

Also check for retval < 0 for the error return in case the fifo code
is not used (1 or 2 byte message with send_eoi true).

Fixes: 09a4655ee1eb ("staging: gpib: Add HP/Agilent/Keysight 8235xx PCI GPIB driver")
Tested-by: Dave Penkler <dpenkler@gmail.com>
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 94bbb3b6576d..01a5bb43cd2d 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -182,10 +182,12 @@ static int agilent_82350b_accel_write(struct gpib_board *board, u8 *buffer,
 		return retval;
 #endif
 
-	retval = agilent_82350b_write(board, buffer, 1, 0, &num_bytes);
-	*bytes_written += num_bytes;
-	if (retval < 0)
-		return retval;
+	if (fifotransferlength > 0) {
+		retval = agilent_82350b_write(board, buffer, 1, 0, &num_bytes);
+		*bytes_written += num_bytes;
+		if (retval < 0)
+			return retval;
+	}
 
 	write_byte(tms_priv, tms_priv->imr0_bits & ~HR_BOIE, IMR0);
 	for (i = 1; i < fifotransferlength;) {
@@ -217,7 +219,7 @@ static int agilent_82350b_accel_write(struct gpib_board *board, u8 *buffer,
 			break;
 	}
 	write_byte(tms_priv, tms_priv->imr0_bits, IMR0);
-	if (retval)
+	if (retval < 0)
 		return retval;
 
 	if (send_eoi) {
-- 
2.51.0

