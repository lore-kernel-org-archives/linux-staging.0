Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6B023E350
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 15:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846116; cv=none; b=MkAhqiswax2a1VMrjwKCWH3zZ/HmqkaH8322XqwG369L+POSS04JhqcKKKfTeYHQoiqPJJCY6bEnbdvVB9tWyKrzBWpGUY2qJqFNhMvYAaXPxmUz0kaMErCbLG3PU7E/hxdYfC/SVUkQgVZfjbxyzsHP9duTPbZjLq2OsA2KiNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846116; c=relaxed/simple;
	bh=rqfmhHQLfxm9/4TesUach/THvryh3k9yZCb0TxqHVSU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dflM7NGcd18QhqJT22o1K6qYKBriyBrmBWY25Is3LSiqoUYa5CZcNVPO9jU0WQRO1kclvYI3psvOlCMZnCniohp6BKAMCp7Lqf7McFzTJ+OghDY7/mCRTLQSt2B+FzYX2KQE3vHGh2EV/eOUN++ENX+mtpiFJ48kzsBdBBeNMkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lk/p+wjr; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lk/p+wjr"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-485409ab264so7954875e9.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 08:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773846113; x=1774450913; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kENSnLYM/x/CNhbNgx3082ef2TB/Ac1zhglyWeS7Flc=;
        b=lk/p+wjrn0hN5y0HJFyFc8zjWqrR5qPjwbIzcl4NezEuS3cI9RahVkE7sJcjkm0FYi
         zb2rwyltyyGwfbnGGGaf+sG4YBDI57jHESdblvWnJ3XURyIj0PKjaaw4YRpM3S2/51kK
         016U7nPshrHejGV/spsSCu4p++m1rZAPiaXMH5GNzGsrvjT4eol+7JTwMQE6IIDGR0H8
         LsETw78C4iBgxRJ3Uz8hqWPexk4phDwCdUYOF23B96SHL6TD73UNJwP2zcBzDwe/s2A5
         U33tZlfJWoCCrjMOuRJvxxW9ELdqVC5Rp/21tKE7owoiRxZrSedthVvQ/Munhs0Uuc8o
         kchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846113; x=1774450913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kENSnLYM/x/CNhbNgx3082ef2TB/Ac1zhglyWeS7Flc=;
        b=n/rabXlkKf1y7Wb0sAz58sR4M9xeVuPJG56ozNbuc52H2h65MqnlXKJmF8nwIdK91T
         4Sbtqg3eCXmPZUNz4Cz97LHFxaasdQPZP4ALOMtdc5dXcsaoK8TkbzjzJqZGGxMnHKdc
         pnW1tmoS/22zAoQ4467L0Ldbz18kJrm74zo6EmSLY6Zi1IOBMaQQU369x24OqR6WsPvi
         ClRc/WOpZWoevI0a5Ig8k1PwnRiiYkOKgR3r8GuD7EXB6jfVKrtXrrpFMIU5J445NpcU
         rvyTGlTvpvVp13m6DAfE6W8HNdzVe1isY4uEUxsysQpoquWlevxRyqBollVb2WTGLSE9
         nLmA==
X-Gm-Message-State: AOJu0YyP55WuF7RzfTV+6Ma9Qtlwb8dgon3myhmn5+s7pqjbzqbGuMk7
	c7sRvlU434JXJSH2K25bOPQBv4fdaa00FnIYBDYRxE1H5B4MkxxLp8Ag
X-Gm-Gg: ATEYQzw0GuoDqpktme4VyzacnPjkgTxg0mgKQWB02Rb7ZbyRq3BFshbeZucsoP7hA8F
	ntQbuCfCDT1f7nnJnIb6efU0RBUbap+JFZVfsW5Emqr4lhv6jLSuS8ScmlqCyWqbFr5dDJ1Yq8o
	AqeCS1G/TWgKDBLvVFU8kPsPjY2OWFjjJDQj0SHTwnE4tghD4urwY6+P4CcGPPhg4fPu/uHpoRt
	dcuL4iZo4wDuJXt1LoQicM+Y0nZzT4i1VWbDZotiziae84FeUE/XJZc22XYuz4cwW7bjy2sQdaY
	Y+aormoTCjvId7PVnZ9e/n8bXYi7Nf1u5EVlHa5DDyTuymcXdMdFPLpMbNEGaJBTnROLO3+BFch
	WJe/QAZFtlMZoXLKjmVh5AeVI8Yp0qkhdtoB0CjAQXFWOeHgiSCzwyDuOiPijv0GePsHcCivwSz
	l8yYx3e1VR0RCUPFQ8wvNdUl5QN69JI/WrMZ+Lu1F4uUJz3V7bAEL/aA==
X-Received: by 2002:a05:600c:1d14:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-486f40c19a8mr64650835e9.11.1773846112629;
        Wed, 18 Mar 2026 08:01:52 -0700 (PDT)
Received: from localhost.localdomain ([176.216.150.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4ba847fsm27715445e9.25.2026.03.18.08.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:01:51 -0700 (PDT)
From: =?UTF-8?q?H=C3=BCseyin=20Can=20Erdem?= <erdemhuseyincan09@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?H=C3=BCseyin=20Can=20Erdem?= <erdemhuseyincan09@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: fix code style issues in rtl8723b_hal.h
Date: Wed, 18 Mar 2026 18:01:46 +0300
Message-ID: <20260318150146.8226-1-erdemhuseyincan09@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace __attribute__((__packed__)) with the preferred __packed macro.
Add parentheses around macro arguments to avoid potential operator
precedence issues.

Signed-off-by: Hüseyin Can Erdem <erdemhuseyincan09@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtl8723b_hal.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
index 7ec84304a..cd3b49338 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
@@ -28,7 +28,7 @@
 #define FW_8723B_END_ADDRESS   0x1FFF /* 0x5FFF */
 
 #define IS_FW_HEADER_EXIST_8723B(fw_hdr) \
-	((le16_to_cpu(fw_hdr->signature) & 0xFFF0) == 0x5300)
+	((le16_to_cpu((fw_hdr)->signature) & 0xFFF0) == 0x5300)
 
 struct rt_firmware {
 	u32 fw_length;
@@ -133,7 +133,7 @@ struct rt_firmware_hdr {
 #define EFUSE_IC_ID_OFFSET 506 /* For some inferiority IC purpose.
 				* Added by Roger, 2009.09.02.
 				*/
-#define AVAILABLE_EFUSE_ADDR(addr) (addr < EFUSE_REAL_CONTENT_LEN_8723B)
+#define AVAILABLE_EFUSE_ADDR(addr) ((addr) < EFUSE_REAL_CONTENT_LEN_8723B)
 
 #define EFUSE_ACCESS_ON  0x69 /* For RTL8723 only. */
 #define EFUSE_ACCESS_OFF 0x00 /* For RTL8723 only. */
@@ -171,7 +171,7 @@ struct c2h_evt_hdr_t {
 	u8 CmdID;
 	u8 CmdLen;
 	u8 CmdSeq;
-} __attribute__((__packed__));
+} __packed;
 
 enum { /* tag_Package_Definition */
 	PACKAGE_DEFAULT,
-- 
2.47.3

