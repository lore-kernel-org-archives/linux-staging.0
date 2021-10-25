Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336DB2CA4
	for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 14:32:19 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id r6-20020a1c4406000000b0032cb5539960so211207wma.0
        for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 07:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/+z/ZcoReYlIJ2lw4E6zEFrJlcdgWlKqR/PEXpbV0jM=;
        b=c5N5lccctg9plGihtX+N67paNhze1WZdjP2QwnI5NzwvGbFDif6mEOJhif7BQjNDPk
         t8WXA1LwbIiYV/aUPog/YZ4+zOelQO7sElg7hckVd9/eVKJ1MmZ4RGYVX3Q5kx2/VUeY
         QrH+a1dlA8xAc+p9zWXpyGIVdDzwXMKxygwDWfxU5j3g0opYLC3T12jnxQUHC9M3Tp7m
         NySuBuiUZVdWUoisLwvKEBJ/6zm5CfIJhcqN2LDW2c3gNHltPGdtGLcmxcT5AI6Bu6Wk
         VKlmDvsda04hFtJGr1z7Xpu6s/jW6OPLQDaWseJ75q0f3/6XQFmR7qkhKYI4A8AudLDO
         NYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/+z/ZcoReYlIJ2lw4E6zEFrJlcdgWlKqR/PEXpbV0jM=;
        b=QjwzzLxXjxa6fkXhBjV0tOyvHbR6//1U05sKx5745aDsO2z9IQGDh1lmpX4aQZepIx
         6Cjucn44FqWFOsFIG0od3XXGfaMaQkxa76T/1WkqU83Skl7ZKAykH34DGYpsCfM8ofcb
         e438Rs4jB1ifS2byIGJ5ZOG30Zv7AnAEUxcgrMjYxQ6j+Dl3u/VpPIHShxRgakWbEJus
         r/OdWv77/N/Ep++OLAu4FkqikLyXSFuJGdDYsnvk9tuqYfqxZAGPwYwZ6G3CgDHGaB/v
         d+AgmvApUN48NLDse/7PePExuBlRlJxzr4baXvTi5knWC+NynpQBpbHBasfsKeifCEAc
         gtbg==
X-Gm-Message-State: AOAM530oH6DYnoSFS7Yf0Yv8n7zRcyRX68ZVpkspWfhO93m8omLKqMLS
	guubmlopng3NwUxlgi/ywldHUVG6bE8qjg==
X-Google-Smtp-Source: ABdhPJwUgOwYsaaK3lzD6UmOwcrEE/14iUIL6PVhS6+LI1VJxr7jc9xQQDPhTBNwKNdJnYxEdXMpXA==
X-Received: by 2002:a7b:cb82:: with SMTP id m2mr14762190wmi.11.1635172337582;
        Mon, 25 Oct 2021 07:32:17 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id x8sm13011500wrr.53.2021.10.25.07.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 07:32:17 -0700 (PDT)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH 3/8] staging: vt6655: Rename `dwAL7230ChannelTable0` array
Date: Mon, 25 Oct 2021 15:31:29 +0100
Message-Id: <c05a9a1928e84cbbf375f1bfb2dd2ba31438c842.1635171518.git.karolinadrobnik@gmail.com>
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
  CHECK: Avoid CamelCase: <dwAL7230ChannelTable0>

Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
---
 drivers/staging/vt6655/rf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index 866734ce6195..3235585a67bd 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -195,7 +195,7 @@ static const unsigned long dwAL7230InitTableAMode[CB_AL7230_INIT_SEQ] = {
 	0x12BACF00 + (BY_AL7230_REG_LEN << 3) + IFREGCTL_REGW  /* Need modify for 11b/g */
 };
 
-static const unsigned long dwAL7230ChannelTable0[CB_MAX_CHANNEL] = {
+static const unsigned long al7230_channel_table0[CB_MAX_CHANNEL] = {
 	0x00379000 + (BY_AL7230_REG_LEN << 3) + IFREGCTL_REGW, /* channel =  1, Tf = 2412MHz */
 	0x00379000 + (BY_AL7230_REG_LEN << 3) + IFREGCTL_REGW, /* channel =  2, Tf = 2417MHz */
 	0x00379000 + (BY_AL7230_REG_LEN << 3) + IFREGCTL_REGW, /* channel =  3, Tf = 2422MHz */
@@ -463,7 +463,7 @@ static bool s_bAL7230SelectChannel(struct vnt_private *priv, unsigned char byCha
 	/* PLLON Off */
 	MACvWordRegBitsOff(iobase, MAC_REG_SOFTPWRCTL, SOFTPWRCTL_SWPE3);
 
-	ret &= IFRFbWriteEmbedded(priv, dwAL7230ChannelTable0[byChannel - 1]);
+	ret &= IFRFbWriteEmbedded(priv, al7230_channel_table0[byChannel - 1]);
 	ret &= IFRFbWriteEmbedded(priv, dwAL7230ChannelTable1[byChannel - 1]);
 	ret &= IFRFbWriteEmbedded(priv, dwAL7230ChannelTable2[byChannel - 1]);
 
@@ -722,7 +722,7 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
 				MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), dwAL7230InitTableAMode[i]);
 		}
 
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), dwAL7230ChannelTable0[channel - 1]);
+		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al7230_channel_table0[channel - 1]);
 		i++;
 		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), dwAL7230ChannelTable1[channel - 1]);
 		i++;
-- 
2.30.2

