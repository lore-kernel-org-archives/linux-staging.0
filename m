Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB923EA96;
	Tue,  5 Mar 2024 04:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709614446; cv=none; b=FryAMBx9vVlgzethCXn6j+RC8Tx0W2Klg3K6YwmHrkCBkT4cjayiDAk2uY3kdOSBif2qFt79YWRsRMP4al7I3G3cmXtlfjQOTtpft5RqpsN0lHVzdrMJX55rrF5whxLUBWMqrXzFEY4lovCASq3+aRcUvNBUT0Y+QjGVLeogC9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709614446; c=relaxed/simple;
	bh=/71kuDzJizLk1aETotuFiq6Yvfeba53Jahr3NLeTUVw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o1ZAkQLB9PLPLbuUQtoIW/GHGAtN35GXZFgFTQ/N8nsOzt+bf9aKUV4PN7PfSI6rkmT0nmPch9u86G2TPJKdZ/C9qGh96cDs/t/Jlv8lVYFvVBRTvNZ/TTL/jgYw4seYMFj9w9407mh3rqmWsNfWO2zN7A7w2NEJlZsX+mUt5OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVzjdqnm; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVzjdqnm"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5643ae47cd3so7001481a12.3;
        Mon, 04 Mar 2024 20:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709614443; x=1710219243; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYAwummU5v15mvPDS8bHkza9KKI7KBb6rIoQ8Kl4uQE=;
        b=ZVzjdqnm9xO+nuXSWwplDcikXWjuxjp1BlhOVh4DbyxsXQADThp27z6lw5GqY5uPMY
         8580zyv/lU1BOG6dP9d0WyZX9k4xbD2dWpwMREJOPqa0+ya21sPl6CilfzhPj4XqHg17
         E03euP0JQdC9AsK3o2BQTVRsEck5ZTwc4BX2d/M8vZ6nQP4fA3m6ekonCWda+RsyCag9
         8YHiF+/J4+u6rmAACVDF0K9ohEveCMGzdIrw7VWbIWJL9cHJ9fJad6l+l8CKHVz31wZ7
         ZkvHe61VgYNQofZCN4FszQXJzqGIAkmVbtRsJeTJ6hba81qJjtAs4D1a6QXECCDeKWrn
         ZQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709614443; x=1710219243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYAwummU5v15mvPDS8bHkza9KKI7KBb6rIoQ8Kl4uQE=;
        b=ozN8USoepe3r3bxR0rRhAKy9Qef5T9mTwKBRVgoRsihNzpBPRzpKLxxCXBVzdhhGL3
         2Zi6YLquh5OODmFAgBnu0OUB91U8EEfMHwvDm9avjxaGneemv21S6DtvcCddKYLtsnsh
         Ce8eUTXJ7I2jBBfrb06dE+Qht67KNxh+1x/G6QGDZ3tNNY2LQ9df0qxV6RcuYN9aOFat
         65vbxjuAWIJ5tJ1n8wQA+WiJwTvgE1V8VLkOoM5Klg+FZSPTRbdtmwZDkrj1V8noSCZ9
         /Y2PQlWZZuHx8uPRVh7/VDK04zLh6wEtFST+o4nQTPaqJhkN/FSvz6Z1YRNaHEpVGPzc
         Ee7w==
X-Forwarded-Encrypted: i=1; AJvYcCW00+ixceZUZ79HuUxRtpaJ38q3glzyWjtz/H2YWDbhVe18Rr0iknqqnxb5GatkN2oEtHs96aHqRpd+BqSm/bjwpJo22QrWDdir6x2LgpXtdLv5bRs9psFmM4Il3JNdvXRQ0tprF8/CoA==
X-Gm-Message-State: AOJu0Yyybc7wWTLsl0Zg+oQoVrSjHXaq2DZmfm+vSiAz/JIXrE7Ga5IE
	txUw2GRW8XBCU07r39bXsa6QuqShSLRwarV78cVKiaVvZjdfQvP7
X-Google-Smtp-Source: AGHT+IH7d0LxzJV/QwA2UaFSK9I03OyhgrdOHcZ9BRKG9MhX/86AqdfgP89DeS90t/yRKe5T6NGSpQ==
X-Received: by 2002:a05:6402:1e86:b0:566:c388:ceb4 with SMTP id f6-20020a0564021e8600b00566c388ceb4mr7735469edf.28.1709614443335;
        Mon, 04 Mar 2024 20:54:03 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id g13-20020a056402428d00b0056793ab2ad8sm86998edc.94.2024.03.04.20.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 20:54:02 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH v4] staging: vt6655: Match open parentheses
Date: Tue,  5 Mar 2024 04:53:38 +0000
Message-Id: <20240305045338.4654-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2ac49025-0cd0-4ea2-b06f-f1bfb5f8ee8f@gmail.com>
References: <2ac49025-0cd0-4ea2-b06f-f1bfb5f8ee8f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align parameters in static void calculate_ofdmr_parameter(),
bool card_update_tsf(), card_get_tsf_offset(), and
bool card_set_beacon_period().

This patch fixes the alignment of parameters within various functions
with the opening parentheses.
This change improves code readability and ensures adherence to coding
style guidelines.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
Changelog:
V2: Modified subjects to be unique for each patch, as requested by
<gregkh@linuxfoundation.org>
    Fixed the warnings in the patches as suggested by
<philipp.g.hortmann@gmail.com>

V3: Combined the vt6655 patches into one patch as suggested by
<dan.carpenter@linaro.org>
V4: Removed the multiple signed-off-by as suggested by
    <philipp.g.hortmann@gmail.com>
    Omitted the cover letter as the changes have been combined into one
    patch
    Reworked the patch subject to be concise

 drivers/staging/vt6655/card.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 36183f2a64c1..3f807d898607 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -81,9 +81,9 @@ static void vt6655_mac_set_bb_type(void __iomem *iobase, u32 mask)
  * Return Value: none
  */
 static void calculate_ofdmr_parameter(unsigned char rate,
-				       u8 bb_type,
-				       unsigned char *tx_rate,
-				       unsigned char *rsv_time)
+				      u8 bb_type,
+				      unsigned char *tx_rate,
+				      unsigned char *rsv_time)
 {
 	switch (rate) {
 	case RATE_6M:
@@ -288,7 +288,7 @@ bool card_set_phy_parameter(struct vnt_private *priv, u8 bb_type)
  * Return Value: none
  */
 bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
-		    u64 bss_timestamp)
+		     u64 bss_timestamp)
 {
 	u64 local_tsf;
 	u64 tsf_offset = 0;
@@ -297,7 +297,7 @@ bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,

 	if (bss_timestamp != local_tsf) {
 		tsf_offset = card_get_tsf_offset(rx_rate, bss_timestamp,
-						local_tsf);
+						 local_tsf);
 		/* adjust TSF, HW's TSF add TSF Offset reg */
 		tsf_offset =  le64_to_cpu(tsf_offset);
 		iowrite32((u32)tsf_offset, priv->port_offset + MAC_REG_TSFOFST);
@@ -321,7 +321,7 @@ bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
  * Return Value: true if succeed; otherwise false
  */
 bool card_set_beacon_period(struct vnt_private *priv,
-			  unsigned short beacon_interval)
+			    unsigned short beacon_interval)
 {
 	u64 next_tbtt;

--
2.25.1

