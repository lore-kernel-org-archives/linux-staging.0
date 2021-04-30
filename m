Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359212F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:58:04 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id r9so105689980ejj.3
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ge3P0WNdYY2EQIE5X7at+1ZyKJ0Q7vBILrEN41L9FQE=;
        b=Hgx8hyy1cFZC3mkpVqjAytfUa89t/CaL1Hx/fiJvH8fUM8xI1mdh03bZIGjoE381dU
         GY+QvbYVx30NkVeUJqsK1RM9/jquRDPhF9vf6txUrE552+q7DkignXyVxNiYoOLnNLGb
         pB9slh4tikJwPCKeJNJ9876sbOX+OlxLEhLtOIhMz1ulIQUnf//Bg2ODWEV9WLD/LLyn
         kG4RKmFjRD0DDfs3tnAues4wNYbS5ogmFvihSlSeALod7cVnwKxS6zaZ1DDg1GSul3YM
         aqPVDLhyx3zRCz+AYrV9zfz+R0DSzno9CtwBEgCA5k2UU73ROkkY4vS8bOC38z83lb4h
         zW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ge3P0WNdYY2EQIE5X7at+1ZyKJ0Q7vBILrEN41L9FQE=;
        b=G/RwStka2vZMNrhOge4rbm9PYaCLKG4KIA+HL+cHuJOmz2y5r/ZH4lGQQJStKW8+0i
         t2Qed0ppaULXwfnld16wlgOuVftqM3rexE+W4urH3jcV95YHNXphCfuePTFHdlmHtiCw
         /a2vykV6XAMNpHA9R1q72pE+cCcd4RsJDyI0Z4ei2aQJyHp79fJHPpwGazBn9pw/Uvgw
         9h991qniGfnbpp7Fhx3cK8zlLItM/yt5dmLUaRAHxWUJfQcxCECzwDrHFeerpVcnt+Iz
         jTTfZR8NDL0jk5sZbtTy/0HZkiiziRBtMlUCx8KVnALWrPL+mrWXDbyYXAdko+/LRg9E
         bFqQ==
X-Gm-Message-State: AOAM530dMgwKHjnxKH0jBh0qnPKyG15c1tzjFMWJvOm6r7CmA5+5Q58C
	e2FLIP4nrtuuvCwiOYJPPko=
X-Google-Smtp-Source: ABdhPJxkSW0Pip1PO3Lpt5wxsfTps9tLXXV2Rp0WEhe+yQ2Jw7AtVL2+8f30d/t42yUOfmtuO3Bw2A==
X-Received: by 2002:a17:906:e28c:: with SMTP id gg12mr4779417ejb.483.1619794682862;
        Fri, 30 Apr 2021 07:58:02 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id d12sm2057180ejd.8.2021.04.30.07.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:58:02 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 34/43] staging: rtl8723bs: remove obsolete debug macros
Date: Fri, 30 Apr 2021 16:56:56 +0200
Message-Id: <a35b084444ca423ba3b8a212c38b974535a7048c.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove obsolete debug macros.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
index c4616a69425d..db9d8a529877 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
@@ -78,22 +78,6 @@ enum {
 	BTC_CHIP_MAX
 };
 
-/*  following is for BTC_MSG_INTERFACE */
-#define INTF_INIT	BIT0
-#define INTF_NOTIFY	BIT2
-
-/*  following is for BTC_ALGORITHM */
-#define ALGO_BT_RSSI_STATE				BIT0
-#define ALGO_WIFI_RSSI_STATE			BIT1
-#define ALGO_BT_MONITOR					BIT2
-#define ALGO_TRACE						BIT3
-#define ALGO_TRACE_FW					BIT4
-#define ALGO_TRACE_FW_DETAIL			BIT5
-#define ALGO_TRACE_FW_EXEC				BIT6
-#define ALGO_TRACE_SW					BIT7
-#define ALGO_TRACE_SW_DETAIL			BIT8
-#define ALGO_TRACE_SW_EXEC				BIT9
-
 /*  following is for wifi link status */
 #define WIFI_STA_CONNECTED				BIT0
 #define WIFI_AP_CONNECTED				BIT1
-- 
2.20.1

