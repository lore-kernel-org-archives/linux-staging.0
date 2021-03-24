Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CC26F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:44:58 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id f22-20020a7bc8d60000b029010c024a1407so1114702wml.2
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wf9g2Kh43VVybED730S7SPYnJ+kRMX+1vJg32efOke4=;
        b=nu1wNQF5ag5b9IAgZuNM7/DCC+8TKyWF+yCcb85sz7XxKFDn1UlxiJkLBK5Ef61ZXX
         D7oAbFnZrU1RLHKhL9K0U0pFTteGJdhZePTPhRChIv+aHmdhiQWcyWvJc2iHCDzRQhaz
         1QLo8xJM7cNWcx+Q0bMcUxTn6ZGlI75QaXzmXWLthYz+Sv2jJqWRugEztxbACbMJtXmp
         0NKbbo9i7xERZDFQNME+StCQTrK3UwItcK1D8XjMh6lVGMkGFun0RLekns1F4invC2VA
         O6g7GHmQnyE/ipa2/O85vHcj4IAOAraoFB+cy0t+UQrFslUcPaEiOvymqtDPq+oUM/bz
         j8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wf9g2Kh43VVybED730S7SPYnJ+kRMX+1vJg32efOke4=;
        b=sfIPmVL59LLQWe2VwxpY1AlARJI12Y4UjOIVQtQl0GBW8ZVSBfL+aUKgZsN2uMyKzH
         b7o1phZaKMt2YU6dnEef8y+VJbaR4wlNVe+/kcKKOTnPtlMoyHRzYAYhQadAffswPBAa
         q4m2ZXc/ExFfgP7Cj+xFKb+tlMzH0iYR2VXpztFZPHkYcpDAI6n+Vh303EPehY41Mncy
         PLmfiGB9yu3E8252IvpRJKOR7dbqe3yf8JDSWqhzTXSvUrwvKEnPoCSjm7vhU+nc6M2n
         rOTNsELyvTLKz4s5RHE5M5TVCOVt5a0wi8Tqj3YSfnNU31XEe+1B3kk/uSWVAot7uYkC
         AmRg==
X-Gm-Message-State: AOAM5304Uizbg43YWy/KHznnqX8N0FV5vkKWQ88v90xZf1cZxza01Tih
	pViukuGhDGshfmkSpR8FSrk=
X-Google-Smtp-Source: ABdhPJwgvvRBb4THKFgXu9LRzEslbYubt2cnyOSxJ8V50NUxQzsOtlQozCnxCqhZYp88SGj6LiDG7Q==
X-Received: by 2002:a1c:43c6:: with SMTP id q189mr2784107wma.80.1616589897515;
        Wed, 24 Mar 2021 05:44:57 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:44:57 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 11/33] Staging: rtl8723bs: remove named enums in hal_intf.h
Date: Wed, 24 Mar 2021 13:44:34 +0100
Message-Id: <20210324124456.25221-12-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum names or definitions in
include/hal_intf.h:

	enum rtl871x_hci_type		[name]
	enum hw_variables		[name]
	enum rt_eeprom_type		[definition]
	enum wowlan_subcode		[definition]

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_intf.h | 26 ++------------------
 1 file changed, 2 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 3cd46a670e6d..45bebbadb7ca 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -8,14 +8,14 @@
 #define __HAL_INTF_H__
 
 
-enum rtl871x_hci_type {
+enum {
 	RTW_PCIE	= BIT0,
 	RTW_USB		= BIT1,
 	RTW_SDIO	= BIT2,
 	RTW_GSPI	= BIT3,
 };
 
-enum hw_variables {
+enum {
 	HW_VAR_MEDIA_STATUS,
 	HW_VAR_MEDIA_STATUS1,
 	HW_VAR_SET_OPMODE,
@@ -257,12 +257,6 @@ struct hal_ops {
 	s32 (*fill_h2c_cmd)(struct adapter *, u8 ElementID, u32 CmdLen, u8 *pCmdBuffer);
 };
 
-enum rt_eeprom_type {
-	EEPROM_93C46,
-	EEPROM_93C56,
-	EEPROM_BOOT_EFUSE,
-};
-
 #define RF_CHANGE_BY_INIT	0
 #define RF_CHANGE_BY_IPS	BIT28
 #define RF_CHANGE_BY_PS		BIT29
@@ -272,22 +266,6 @@ enum rt_eeprom_type {
 #define GET_EEPROM_EFUSE_PRIV(adapter) (&adapter->eeprompriv)
 #define is_boot_from_eeprom(adapter) (adapter->eeprompriv.EepromOrEfuse)
 
-enum wowlan_subcode {
-	WOWLAN_PATTERN_MATCH	= 1,
-	WOWLAN_MAGIC_PACKET		= 2,
-	WOWLAN_UNICAST			= 3,
-	WOWLAN_SET_PATTERN		= 4,
-	WOWLAN_DUMP_REG			= 5,
-	WOWLAN_ENABLE			= 6,
-	WOWLAN_DISABLE			= 7,
-	WOWLAN_STATUS			= 8,
-	WOWLAN_DEBUG_RELOAD_FW	= 9,
-	WOWLAN_DEBUG_1			= 10,
-	WOWLAN_DEBUG_2			= 11,
-	WOWLAN_AP_ENABLE		= 12,
-	WOWLAN_AP_DISABLE		= 13
-};
-
 #define Rx_Pairwisekey			0x01
 #define Rx_GTK					0x02
 #define Rx_DisAssoc				0x04
-- 
2.30.2

