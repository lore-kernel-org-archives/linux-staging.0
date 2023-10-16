Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2CD3717A;
	Mon, 16 Oct 2023 23:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nsD65TVm"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5a7b92cd0ccso64119347b3.1;
        Mon, 16 Oct 2023 16:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697497267; x=1698102067; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BM4Q1Vnc/0W8axRuOl3n1yPV7eDUAdwd9TGgc08N9CQ=;
        b=nsD65TVm86mgmGni+MAeW7Z9AQBW1cLZIXbLKVSBQ/umAnXPwwqJFQtU6C8AeJCkoS
         WvX2qwYQKqNHwemY1BAQWBlck7io/y2+WX+/mJ8ndB1qvE3vUH1AU4abuUkbA/ioYIl6
         aWPJCIqySw4q5WpU1yN+Jds5e/TvUDRCX6VCBeGyzvanJ6uZ7Vm6xv2RJqMQjornirxT
         9KafJ2eF26ecrJfVwTygRxik91+9zgDyU7t6rzXWfMNsP9a/pUJwHEvzSuKyytGIK/wQ
         ChVC/sWNkDwsvlpLuL6uAzRqAqTSKCDLfh2IgKslniExR29LMqZ4uiB/UW3V/ajwaDWQ
         6rQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697497267; x=1698102067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BM4Q1Vnc/0W8axRuOl3n1yPV7eDUAdwd9TGgc08N9CQ=;
        b=IzVVmY8cL3xRsJcasqPWaS1q0up0kqRkIT6H+u64ObTgLedwJ8XpiOisHXaTACAyEs
         RIqmFuDvSaLZQFniZa3FGFLyilcv4egJuvihunFxxqK6g70DGBW0S6mFLKU8nxDDuJM3
         nf7OqJC5u6BowQoWMZXIlFB+SQM/9lSraFQhnPDscOrBu+09QklDrs+fUI+a1kiA59cg
         1iu4zpuFpboLiMgg0bGXcckRPwqySEis6wWzwtStXHsa+xMIDNOvaum5R0DmG8Ql/uUG
         sXAFir9P1XhrTgehtMrYT1f9tF6wR6IcXIjUVe5Sd5dw7/8Ov/V33dYMFPk8PFc2Pkst
         S33g==
X-Gm-Message-State: AOJu0YzVFyQsPNZwqDdvY3ruT1w5P++bZTpnKJs2hv9G5ScbBWtXSOdl
	mVRtM1FSuoXF/IseP+8v1hA=
X-Google-Smtp-Source: AGHT+IHx5ZNSxjJc69qNKXiA+XlymW5cp6SvHC1eWLaSckCOeDlHLcJo7Li/Hc9AwtbuFR+56SLodw==
X-Received: by 2002:a81:8341:0:b0:59b:65d4:4d73 with SMTP id t62-20020a818341000000b0059b65d44d73mr558954ywf.27.1697497267371;
        Mon, 16 Oct 2023 16:01:07 -0700 (PDT)
Received: from gilbert-PC ([105.112.31.148])
        by smtp.gmail.com with ESMTPSA id s124-20020a817782000000b00565271801b6sm94387ywc.59.2023.10.16.16.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 16:01:06 -0700 (PDT)
From: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
To: forest@alittletooquiet.net,
	gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gilbert Adikankwu <gilbertadikankwu@gmail.com>
Subject: [PATCH 4/4] staging: vt6655: Rename variable byBBPreEDRSSI
Date: Mon, 16 Oct 2023 23:58:57 +0100
Message-Id: <d525f5837bb343001447646fe17746370256694f.1697495598.git.gilbertadikankwu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697495597.git.gilbertadikankwu@gmail.com>
References: <cover.1697495597.git.gilbertadikankwu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove byte Type encoding "by" from variable name and replace camelcase
with snakecase.

Mute checkpatch error:

CHECK: Avoid CamelCase: <byBBPreEDRSSI>

Signed-off-by: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
---
 drivers/staging/vt6655/device.h | 2 +-
 drivers/staging/vt6655/dpc.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index 6df1694d556b..2b5f9bf6aa5d 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -253,7 +253,7 @@ struct vnt_private {
 	unsigned char bbvga[BB_VGA_LEVEL];
 	long                    dbm_threshold[BB_VGA_LEVEL];
 
-	unsigned char byBBPreEDRSSI;
+	unsigned char bb_pre_edrssi;
 	unsigned char byBBPreEDIndex;
 
 	unsigned long dwDiagRefCount;
diff --git a/drivers/staging/vt6655/dpc.c b/drivers/staging/vt6655/dpc.c
index c6ed3537f439..7ada188e2048 100644
--- a/drivers/staging/vt6655/dpc.c
+++ b/drivers/staging/vt6655/dpc.c
@@ -79,7 +79,7 @@ static bool vnt_rx_data(struct vnt_private *priv, struct sk_buff *skb,
 
 	RFvRSSITodBm(priv, *rssi, &rx_dbm);
 
-	priv->byBBPreEDRSSI = (u8)rx_dbm + 1;
+	priv->bb_pre_edrssi = (u8)rx_dbm + 1;
 	priv->current_rssi = *rssi;
 
 	skb_pull(skb, 4);
-- 
2.34.1

