Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F56C3FC3
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 12:15:45 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id u9so22095811wrg.8
        for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 05:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eF8hUMXIhBsRJkAF7DIG+jKUHZ6c4iXSE2pyRmvKCds=;
        b=mvf86/q93n6Lwm976tOSViTKEdu5SNinrbjpM4CzmDzRbbAoIfZWDuFvZvUMWiJeZm
         9us4DgjI0GC1+A2zqv01WzST5eBV50kELy14PoJ8hoN1gcZNCBnlDlfx/ysEZP0DJ6Sp
         RgCPntLM/QJzNZGTSCTHNnWz95y33xR7tlrbFM51JEwYq449oU1yNzpDbB1e3APRTCHZ
         n7LLp+Uhi1C6XBNtjoPnCcoEm7lJ3boh+drWY3nv3791KUUIs/mcdZxHmwkWb5iMUi/i
         X6JhIn7BSVJMzDolEqzoxVfGm9Fx1Y+hsE3eUqSMBOpJdrvDpJ/6aOwTrUdno71shKd3
         2svw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eF8hUMXIhBsRJkAF7DIG+jKUHZ6c4iXSE2pyRmvKCds=;
        b=DeHJzShIc3LyPfQZZ9pEaFolONJC8D262wHVhzgxVQBHgxfXPmvaM8OPZoTFYg4sE1
         +cEblhg/anc2yA8aGhc55MMRaw3A8Od5IBQOM1rAs8sFiHEltGa8g+DJrd3ag3mxwIRc
         VyyYB2sqA8eeWPMmMfgxSIt4C+Pop1cwNM5rbl6EOO9zRj/Yjmxfv9b0V4MC9IMX2/86
         7EJ4X7KYeuXrm21O4ikslMmfs1j0XxkDa6nt63fN2OEjsokCbQJ5GCExVuEbB1DXmBbe
         xcWq15AuNNva+Le00hsGQuOJMQ+YLgc9T2SJ9oT8UKf/+P2Z/17uY90LRQpIluzVIvdO
         +m3w==
X-Gm-Message-State: AOAM532T2BtxNQDjVAoQTCOEPtMyjUrXPunYm6dqRmQfAwkv0HWKGEgC
	4agq60uyTsvr1IrMEhbm4xs=
X-Google-Smtp-Source: ABdhPJyl3rAxqQrt5eRZv/pCgx/o50rAK3ATJtra8lZGmZT/6G2AX7ysZFK5u2hfnEKl8rfd0oxfjA==
X-Received: by 2002:a05:6000:343:: with SMTP id e3mr17514382wre.96.1630325743933;
        Mon, 30 Aug 2021 05:15:43 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with ESMTPSA id x11sm15492116wro.83.2021.08.30.05.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 05:15:43 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 3/8] staging: r8188eu: use ETH_ALEN
Date: Mon, 30 Aug 2021 14:15:03 +0200
Message-Id: <20210830121508.6411-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210830121508.6411-1-straube.linux@gmail.com>
References: <20210830121508.6411-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use ETH_ALEN instead of hard-coding the value for the mac_addr buffer
in struct eeprom_priv.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/rtw_eeprom.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/rtw_eeprom.h b/drivers/staging/r8188eu/include/rtw_eeprom.h
index fb591a764dac..d0c812cf5cc2 100644
--- a/drivers/staging/r8188eu/include/rtw_eeprom.h
+++ b/drivers/staging/r8188eu/include/rtw_eeprom.h
@@ -99,7 +99,7 @@ struct eeprom_priv {
 	u8		bautoload_fail_flag;
 	u8		bloadfile_fail_flag;
 	u8		bloadmac_fail_flag;
-	u8		mac_addr[6] __aligned(2); /* PermanentAddress */
+	u8		mac_addr[ETH_ALEN] __aligned(2); /* PermanentAddress */
 	u16		channel_plan;
 	u8		EepromOrEfuse;
 	u8		efuse_eeprom_data[HWSET_MAX_SIZE_512] __aligned(4);
-- 
2.33.0

