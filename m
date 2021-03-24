Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FE35F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 18:38:45 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id k8so25470642wrc.3
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 11:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tS2bX0aRV3uP7MitLpt1OlLCSi5kRUbkK1lZdpFWQEs=;
        b=E7Pl8e9vqFlHLNzOSfkfZ29fqa0ygXerBImKGiYM7eqGOlicnxt1jS3H+fCAnlVOXt
         B/nEYtlcI2iTUsTeoc5ig+LVpj42F0EkxaqbWrYXMKODKdp4KSF2XlZRo+rWnZdZVGko
         S2R/CPnOyvL9GjeHLCaeOpHl+tjLeXF7rotd7twGDwgsAOHySDXz56IeYXQxe9PZUWiu
         gIco9jk3jbIv8WoIQBXeBSQkj/NidmFWci+Hp3RZWO2BakJS48Fmg2xw6OCzWCetau2e
         qFNtyneP4TxTQpSl2laR20hvNDi4KGtuxgtDYZ7KMulsUlT4Ao0m9LjlDBxcmyW/4Hvf
         grug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tS2bX0aRV3uP7MitLpt1OlLCSi5kRUbkK1lZdpFWQEs=;
        b=AGH3mz8BAme7JygUTpMZ7NlkgvwEjcbEUuk8ivrZECfWiQx4ka3W4vWmw/ddoEQnIc
         lm2WjwDeSH46A09Wdj7sEPSaT7lAq5vyv22zPymfi0nA0g3PVnx+AK3/To4NsVnC14xn
         d9a4TF20vkrXM7pkgtWtfsFCJSNk4H8EM9sqsYMif3GxSCWgKoJcJJ5+684vhOiEqu2q
         JK2Bknk21Ewy8IY7x9BNTYTvEja/0QXWQXnWQMx+ogcZvy+9Re59rfD0P3DO2tPoiDcR
         mlC6uXxDzWnU8plVP0IxOH1hZcvC0dCTXsjhsqieWHeqyCU8W8yk53Y2jS7LeWwu9P+i
         +5Ng==
X-Gm-Message-State: AOAM532RlB5jxbmeT13rrGvjd7XFKCefDWiWaeyjT2agBt8aOeBoPG98
	9R7VpXSsUVaT3NT9vt5vDm8=
X-Google-Smtp-Source: ABdhPJygNI9Ob9Q5WAZ8zl7+pXIiJwjs3tEuhRddTKttBFJIDiW/EKLkDVBb1E8V3gokiFwQQgF9lg==
X-Received: by 2002:a5d:4521:: with SMTP id j1mr4920728wra.354.1616611124447;
        Wed, 24 Mar 2021 11:38:44 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id z2sm4358040wrm.0.2021.03.24.11.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 11:38:44 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 07/21] Staging: rtl8723bs: remove enums in hal_intf.h
Date: Wed, 24 Mar 2021 19:38:33 +0100
Message-Id: <20210324183847.5595-8-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324183847.5595-1-marcocesati@gmail.com>
References: <20210324183847.5595-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum definitions in
include/hal_intf.h:

	enum rt_eeprom_type
	enum wowlan_subcode

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_intf.h | 22 --------------------
 1 file changed, 22 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 3cd46a670e6d..b45cb33af23b 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
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

