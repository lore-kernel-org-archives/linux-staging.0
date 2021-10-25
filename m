Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287192CA4
	for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 14:32:25 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 84-20020a1c0457000000b003232b0f78f8so13409025wme.0
        for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 07:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CN1bzN5gAX0mR9pVVX4XrUmk+ae17sN/41d9NohOKlo=;
        b=H/9Cig8TOUsoag0xHxHxcJ/HsWnggINCOtje/+QkLhac5dV66z44hGoxQnqHUF8AGl
         w7jtIXbazQqtQ2AgdJUfyzNvSWKmTSONasOuqgbg6BcEWnFUB7jRTrR73H4sFEs6FIU4
         P6Nhk/+0B6kmAvbk9/MygP7msalRWELE0s2mM8Gck2Gg/4npsyNM+kYwFJB7dKBqWEpC
         SX0Xgvy7EH/dxbIeEaU8Qg06F33xOrd34INByymtnXHRjU5cGr56y0Yv/YBLQ5OXn6Z/
         QtFMJoVQsDBhDOjh+rtjBP60pZome3FJsJxxeIJOnenDywmDX+0LKDWMymCqiGXAZPWc
         P9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CN1bzN5gAX0mR9pVVX4XrUmk+ae17sN/41d9NohOKlo=;
        b=53ANyAGR3YAS/CiBIkR7WEq94MpA1mIkFnzYZwbJhAgnAq4s9IrRr7+kMcxgNM7aXl
         QOZUnmNaTgeVBCsKThGf3YuzKpuLM+bqzz3fNwr6lleFLUc5+YmIi1mkYrWmmz31McNL
         xxq2xqtroKo0iJmlEz215RQTZWdBe0piskdxqLdCO+3Lxk5PMrKbRpvD53zJubPZIQhV
         qrCy8efwGZgNCdrIwPh4hBg9omizxzlM728gSFWL4d90mvsT7hie2Y3QTkLzbmM7JiHy
         gl0cLOySX9ZzDhLFKkorryIk3HrUoHfdsLWZfdxAkxVznufxHsqSB+coqzs2rVeAS1M3
         9jug==
X-Gm-Message-State: AOAM531sCMNKPCPzcrcZDm5ji5pFDUe1qiVW5ZXz971hhwvWlnXJ32dM
	wptSNc/btMuOYBGGVWAw4zQ=
X-Google-Smtp-Source: ABdhPJygyqKtnaXeDlxyVcg1MB+e1ms+aU7jU7tx7KOZEI6kEpoFJWE7TuDwpRzzTad7yhAyrMTl+g==
X-Received: by 2002:a05:600c:4f8b:: with SMTP id n11mr19798568wmq.54.1635172343529;
        Mon, 25 Oct 2021 07:32:23 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id x8sm13011500wrr.53.2021.10.25.07.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 07:32:23 -0700 (PDT)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH 6/8] staging: vt6655: Rename `dwAL7230InitTableAMode` array
Date: Mon, 25 Oct 2021 15:31:32 +0100
Message-Id: <bd97b801861fac2168625c3e4ea1f97b9960e962.1635171519.git.karolinadrobnik@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1635171518.git.karolinadrobnik@gmail.com>
References: <cover.1635171518.git.karolinadrobnik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To align with the kernel coding style, remove the type from
the variable name and do not use CamelCase.

Fix issue detected by checkpatch.pl:
  CHECK: Avoid CamelCase: <dwAL7230InitTableAMode>

Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
---
 drivers/staging/vt6655/rf.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index a5c8dc5875eb..d132a21faf24 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -176,7 +176,7 @@ static const unsigned long dwAL7230InitTable[CB_AL7230_INIT_SEQ] = {
 	0x1ABA8F00 + (BY_AL7230_REG_LEN << 3) + IFREGCTL_REGW  /* Need modify for 11a: 12BACF */
 };
 
-static const unsigned long dwAL7230InitTableAMode[CB_AL7230_INIT_SEQ] = {
+static const unsigned long al7230_init_table_a_mode[CB_AL7230_INIT_SEQ] = {
 	0x0FF52000 + (BY_AL7230_REG_LEN << 3) + IFREGCTL_REGW, /* Channel184 // Need modify for 11b/g */
 	0x00000100 + (BY_AL7230_REG_LEN << 3) + IFREGCTL_REGW, /* Channel184 // Need modify for 11b/g */
 	0x451FE200 + (BY_AL7230_REG_LEN << 3) + IFREGCTL_REGW, /* Need modify for 11b/g */
@@ -719,7 +719,7 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
 				MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), dwAL7230InitTable[i]);
 		} else {
 			for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
-				MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), dwAL7230InitTableAMode[i]);
+				MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al7230_init_table_a_mode[i]);
 		}
 
 		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al7230_channel_table0[channel - 1]);
@@ -923,13 +923,13 @@ bool RFbAL7230SelectChannelPostProcess(struct vnt_private *priv,
 	 */
 	if ((byOldChannel <= CB_MAX_CHANNEL_24G) && (byNewChannel > CB_MAX_CHANNEL_24G)) {
 		/* Change from 2.4G to 5G [Reg] */
-		ret &= IFRFbWriteEmbedded(priv, dwAL7230InitTableAMode[2]);
-		ret &= IFRFbWriteEmbedded(priv, dwAL7230InitTableAMode[3]);
-		ret &= IFRFbWriteEmbedded(priv, dwAL7230InitTableAMode[5]);
-		ret &= IFRFbWriteEmbedded(priv, dwAL7230InitTableAMode[7]);
-		ret &= IFRFbWriteEmbedded(priv, dwAL7230InitTableAMode[10]);
-		ret &= IFRFbWriteEmbedded(priv, dwAL7230InitTableAMode[12]);
-		ret &= IFRFbWriteEmbedded(priv, dwAL7230InitTableAMode[15]);
+		ret &= IFRFbWriteEmbedded(priv, al7230_init_table_a_mode[2]);
+		ret &= IFRFbWriteEmbedded(priv, al7230_init_table_a_mode[3]);
+		ret &= IFRFbWriteEmbedded(priv, al7230_init_table_a_mode[5]);
+		ret &= IFRFbWriteEmbedded(priv, al7230_init_table_a_mode[7]);
+		ret &= IFRFbWriteEmbedded(priv, al7230_init_table_a_mode[10]);
+		ret &= IFRFbWriteEmbedded(priv, al7230_init_table_a_mode[12]);
+		ret &= IFRFbWriteEmbedded(priv, al7230_init_table_a_mode[15]);
 	} else if ((byOldChannel > CB_MAX_CHANNEL_24G) && (byNewChannel <= CB_MAX_CHANNEL_24G)) {
 		/* Change from 5G to 2.4G [Reg] */
 		ret &= IFRFbWriteEmbedded(priv, dwAL7230InitTable[2]);
-- 
2.30.2

