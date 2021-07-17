Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1DD72
	for <linux-staging@lists.linux.dev>; Sat, 17 Jul 2021 14:56:59 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id f190so5968985wmf.4
        for <linux-staging@lists.linux.dev>; Sat, 17 Jul 2021 07:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zyox365Ii1ilVd+ni/OL8Ydjg+OlcC8rNpEGzbROUls=;
        b=UQuxlyza12DYczTfoUDXY0/pu2r92CUSmUQk39mXCq79nviyKAzsIZUnHqFNzWmFD4
         KzrZSS8P19xgBkNliturf9ikvSSA8HywlhaMxcQKtSKkaBnddt11nS1a9okLlJYaR4iM
         e3U0US2QOP1g4DuKpnUkfsfOcjuAbedDzN7OPzaj4wPeDmXGms3caPX7rXPdoGfrH7Yv
         UN30PO2FkU79moqEjlaziodADwP35/GPtXm8ETPhMbg+z5Fxwis/QeeavNToNz+h01uR
         qNvlyA5IP5VTJhHaGt8sw5np6/9qjBeImuGlGhReP8zDv+sNkFyQyEGKDM1gwmN3s5za
         yf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zyox365Ii1ilVd+ni/OL8Ydjg+OlcC8rNpEGzbROUls=;
        b=i6USCOZwTbCkstfvlTpWVuX36znTbSStuRhiJSTaGjfypos4/+3e3jdyrFyVIP05N5
         030ucISGqqAzNlOE9LPevY4NUqw3ptBW98VCYr+q4Sj4hOVjzA0mhjC6rN0gAjLmpTFL
         ZWSCjmnmC2CIS4IVxgo6e21d9wwi/lkXVSxEvfdLHguBjDo8rgSU2YwzLQeBPNTLNoQr
         SuZQtqHC5/0fAaP5nOqzkZ3FT4A2Bt4q+AZPI3SblrZQmywRNDbYppnLBtoFeqC609rW
         kZzKu/0gfL5jEUEMn87ycY6t/pSmrsbAw2rZiF45GwM3YinFe2L4SuzVrYdDkhPFvHo+
         VYJw==
X-Gm-Message-State: AOAM530c4SsO1SI7OGe23UHlrzqTGyBGEpsQaKRfvKqJ/T3CRRP8nsoN
	D7kwu3Tqh8H7+O8ezIXukg0=
X-Google-Smtp-Source: ABdhPJxiZbm48x1DxBPFGDb1bhtM+lB300QKeBEa1GW1Yma3/C2hDhYDNK/aD0nEhLYq8oU84ULdvg==
X-Received: by 2002:a1c:4b04:: with SMTP id y4mr23129505wma.185.1626533817809;
        Sat, 17 Jul 2021 07:56:57 -0700 (PDT)
Received: from agape ([5.171.72.101])
        by smtp.gmail.com with ESMTPSA id p12sm10619283wma.19.2021.07.17.07.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 07:56:57 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/10] staging: rtl8723bs: fix camel case issue
Date: Sat, 17 Jul 2021 16:56:44 +0200
Message-Id: <a708b2b9902bedf5bd0466b05516a4c5b4f43723.1626533647.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1626533647.git.fabioaiuto83@gmail.com>
References: <cover.1626533647.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix following post commit hook checkpatch issue:

CHECK: Avoid CamelCase: <NetType>
45: FILE: drivers/staging/rtl8723bs/include/ieee80211.h:170:
+#define is_supported_ht(NetType) (((NetType)
	& (WIRELESS_11_24N)) ? true : false)

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/ieee80211.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 8eb0557a077a..b2c1a7dafcee 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -167,7 +167,7 @@ enum network_type {
 
 #define IsSupportedTxCCK(NetType) (((NetType) & (WIRELESS_11B)) ? true : false)
 #define IsSupportedTxOFDM(NetType) (((NetType) & (WIRELESS_11G) ? true : false)
-#define is_supported_ht(NetType) (((NetType) & (WIRELESS_11_24N)) ? true : false)
+#define is_supported_ht(net_type) (((net_type) & (WIRELESS_11_24N)) ? true : false)
 
 struct ieee_param {
 	u32 cmd;
-- 
2.20.1

