Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9323125771
	for <linux-staging@lists.linux.dev>; Sun, 19 Oct 2025 09:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760865481; cv=none; b=uLdaFPIcg3hCHpckRrLrLh6Tip25+8WU6ncw2eGqS0vnMZ/nKWQnquP4kUo6lQl7SSD30sTf5w5zQgJ5+yLqGW8QvvVl4Zy0NhNZpD6JiMCEiqb8iHilJigHsGTy8CLR9RhEuG+3gWmsAR+E8YdW0WGHqwN8qJZKEv46ySRAhs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760865481; c=relaxed/simple;
	bh=aeXS1LHoMWOHpm3UeF/7pqAihivkrZfZ84wDRlWV57Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IKfpfyFPgc5uuApnXluuA/M4Rx/1QLYWSwlcJjxAjNNMb2P+JsUZoIDKy28x6wxeaQRYAYDpSrZPnYFtH4fK/09nQWa5huHcrV4aOPUgR4bzB2eiNp44OHn4ed6SjzcZzdmEnB0DDr+LwRX7OwqbA7hLsq8U7vGG5QywBIoESjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jhj86o83; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jhj86o83"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-470ff9b5820so5461135e9.3
        for <linux-staging@lists.linux.dev>; Sun, 19 Oct 2025 02:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760865478; x=1761470278; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qsqA0j9uErta8Gq+08EGKvefqA2bgWAjvTmY5kZkeX4=;
        b=Jhj86o83PKC6+JJeCl937TXiTKSMK7ZmLZVv5cKJo/KQpLjsX3pYAy76IHsR/XD3uu
         c8zHi2UEP7KkOIMrHCwln84H+sOWI17sEYtI63u2ZG4Y2R8RS+6uBE9KUf6L2iMf0XEp
         HYT1b11eelryjZ6G9o8hOQV+Ry2BtlBu/DWTv2rLScn+t9pgsZtnoAss6wcLggBkWPBC
         AwEc4s1jYXG9/12CLgF1+4hPsRCXvhQj/QwRlZ9TXfGkbi1pqoClk4LoRVpWbME0TtOJ
         cRkmlXY/O8Wss1yyM3F+gU/BzLY3emC6xi8DuBayMpxo69pyikekhJrp9bdCApEARDG+
         H77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760865478; x=1761470278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qsqA0j9uErta8Gq+08EGKvefqA2bgWAjvTmY5kZkeX4=;
        b=HLZS7WV0jGGjIPK9KJ61rS24T0psHec9KdZLE8uT5RxHYkYr7MC0b2zZ0hlY3SKV+b
         qDRQtGP+bBm+lNQAEJC2nfBColoT9LM1/fQs/WKigj6wZ90WAE5E/Dnpv9aflcKRtN2d
         BQfFmCLDoDJa9GbSI5IqjvmVXgMn1qlxszBtEAcyS94ssLXlZSWueOgIdl+78tMOrHjp
         89iZYql47AqZRG29C4N8NjYRE8BX/4lJMPlJa5FrnD/4vPi2F9o2xYPHauLGxrxPvRaK
         oWZ8dseaYuSA1n8CFOEo9Llotf0JdX7tcQUu+nh0e8knNgfNRMKjqxpnDDF5LPTd5vxp
         d09w==
X-Gm-Message-State: AOJu0YzHusOHxHdj1KJh60MU5hIi7jbaTzz509Wp+BtAsBSzwOtkN1zV
	HKLad8rscQlnsW0NeWYh40WEWgbS6LnQ1C02gsKU/eAsrQaFoCBMH1Zp
X-Gm-Gg: ASbGnctJcY7ic5hkxnsCeoqzw3bgFRtA1JvkkcAbuez8150lTqkkgBuA/wOCA2SNTpH
	fUuX1jFXbYpmkLws8Yq65zhOsuiDTOiaCIMGD8cov277n93eAmHtfZbhzMRy250PoSPH1yf42jm
	Si/xKeKVPUAzENzcldxUKEzV8gOfX7LnM2rAIa0NmIvMI/ykm2ZNs0B6+UJmPmhZAeIo4m//RLI
	EQtqB6Ndwi5Ljz6epskQpPWiEFe51woq8Xxjne5OAjN/UpTeU2/iXDh2SIlKOGGs2RLXwiwmrEg
	jDj0CKdCwapDtdzoJpx19Q3pREfgENFB11zr/3jpS/9Qrl3TIyNtH7vD9eFSVMfrZag79RF7hAB
	g7g/EhzlY+Z4lp9NesZVkZqw73VnABTkI8yLeLab2+16Ji+XHWrvMwYTJMvsX/uCM95htUCLX9w
	55dfln0i9jcBlkAp/nzSlos56wBQ0A6PK0Y5SiKzhV5ko=
X-Google-Smtp-Source: AGHT+IHiXSsfOwJ4r9c2wXkBzr/KDkrfx3WcClJ+qnIi/oGAHcH9o/SadrbMUWtPQ6khNflX8v5idA==
X-Received: by 2002:a05:600c:470d:b0:45f:2d07:7bb with SMTP id 5b1f17b1804b1-4711790502dmr32321735e9.4.1760865477721;
        Sun, 19 Oct 2025 02:17:57 -0700 (PDT)
Received: from fridge ([176.216.135.252])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ce56csm9085706f8f.50.2025.10.19.02.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 02:17:56 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Emre Cecanpunar <emreleno@gmail.com>
Subject: [PATCH v2] staging: nvec: remove NVEC_PS2_DEBUG and dead debug macro
Date: Sun, 19 Oct 2025 12:17:31 +0300
Message-ID: <20251019091731.3064-1-emreleno@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2:
Also remove the unused `else if (msg[1] != 2)` block that referenced NVEC_PHD()

The NVEC_PS2_DEBUG macro and NVEC_PHD() are unused and only add clutter.
Remove them completely.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
---
 drivers/staging/nvec/nvec_ps2.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nvec_ps2.c
index 575233fa1677..2db57795ea2f 100644
--- a/drivers/staging/nvec/nvec_ps2.c
+++ b/drivers/staging/nvec/nvec_ps2.c
@@ -23,14 +23,6 @@
 #define DISABLE_MOUSE	0xf5
 #define PSMOUSE_RST	0xff
 
-#ifdef NVEC_PS2_DEBUG
-#define NVEC_PHD(str, buf, len) \
-	print_hex_dump(KERN_DEBUG, str, DUMP_PREFIX_NONE, \
-			16, 1, buf, len, false)
-#else
-#define NVEC_PHD(str, buf, len) do { } while (0)
-#endif
-
 enum ps2_subcmds {
 	SEND_COMMAND = 1,
 	RECEIVE_N,
@@ -70,18 +62,14 @@ static int nvec_ps2_notifier(struct notifier_block *nb,
 	case NVEC_PS2_EVT:
 		for (i = 0; i < msg[1]; i++)
 			serio_interrupt(ps2_dev.ser_dev, msg[2 + i], 0);
-		NVEC_PHD("ps/2 mouse event: ", &msg[2], msg[1]);
 		return NOTIFY_STOP;
 
 	case NVEC_PS2:
 		if (msg[2] == 1) {
 			for (i = 0; i < (msg[1] - 2); i++)
 				serio_interrupt(ps2_dev.ser_dev, msg[i + 4], 0);
-			NVEC_PHD("ps/2 mouse reply: ", &msg[4], msg[1] - 2);
 		}
 
-		else if (msg[1] != 2) /* !ack */
-			NVEC_PHD("unhandled mouse event: ", msg, msg[1] + 2);
 		return NOTIFY_STOP;
 	}
 
-- 
2.51.1.dirty

