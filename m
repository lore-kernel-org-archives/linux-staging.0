Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3292D9EEF
	for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 11:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752578727; cv=none; b=HQmhn7OuI0k4qWkRrXyVIpEqJYsiKf2DH5Ccm0WtJKQDNKAlV170vRsOrfoViJYtKVnvs0ulIQ7xl+G8HFVomaEjABitijZg4ZGUppJ60wcADdmWP+PUcuIscNDdg+QDvYIB7rooUnqkR/4VlfjAtlM8A+APt1Fv5PTj2F3wwdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752578727; c=relaxed/simple;
	bh=jHbaE+DWOPVlLwbyTIAvmC8OzDURw4LfeUDIJ89w3Jg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HrNcPnqVvbLMMpAvjAKLDmnjspEPnhJREBKCBlTIRuCAGqYqOGV6V4uHcdNQlnX2Qe4cmjkwR89FaRGVcScjzjzIZiUfQpMI08Mw2WCeRTpLc3hhT01iriygjl9hlYX3oFn8NepCi/GXMeRKDSNwytN7NQ6gmtds1L1H9GVqAH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IbtOLgEV; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbtOLgEV"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e812fc35985so4532302276.0
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 04:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752578725; x=1753183525; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vo34cMBbfu5ZCEstKlXmULPS9HKFY7p6hoApDHlHdqo=;
        b=IbtOLgEVJPmi+HNZ1LKlQQF1CiMKwu/+83grUOJGHp8SIQXOKoUUz1dbKy/3jjpIof
         ZWaRYSAJBCbxEnG/zybMrBmY2ZCEYUIU+vWBSt9M8NhZtfd/TFT1IN6pgnq5iuh2GelL
         ugDPsuonvpzFh/VBswsRJVx80jCAVa6BBVASIr8F8Rd1uKTgQJKU7EaxyDwL3An4+UIJ
         XYtsawyqMX13t/jJGHe672E6iADWcooYqLrxN7/OXWq0l1OEQIaitnXJVFsagdSe0gyv
         jenLFEonvSwOurrTAXrfq9AohegBtJuxgCFYGQYd4DT7+7jUzhPC+oVTlSDx7pAE/pyV
         Onsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752578725; x=1753183525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vo34cMBbfu5ZCEstKlXmULPS9HKFY7p6hoApDHlHdqo=;
        b=Xt4TI1ZABgVicd10CK+k7JLz41ucku8hmSFSQVz5gYD7dINCOs09lVzc7g3B7Z7vo6
         NaNxzvLfg7pnLfr0CNr8B3WQbZ9z5xrTVyVC1183elVOOtQSWRrFAD4yqMxmtdGMWAvU
         +kWv8vJNB3Ibp0DwcUGhCIxAihE1gJOxZ/LmeoTlBHgHXkNhLDuHNTPHO1soYTWefV9K
         ceiDavoslRPIpHbWs0kz7esfoj7pV/gIoPD31izfTTN/U9xv2Y2DoCUAftmHjwkz0C7d
         GbHumCbF6CifBcFAJ4m50WOu/oClaBZwpnQj4cUeO39026rE9o1b16nQKeiOhxZOz1Wy
         VP6w==
X-Forwarded-Encrypted: i=1; AJvYcCUJVni63QbFMPat2kjPy6Y8LsIz4wQ7HdCk4J+uAfdXv+Ju2ANATSNUov4z/TY3haWwW0QJnBbf02+VKuoP@lists.linux.dev
X-Gm-Message-State: AOJu0Yx44n4s/drChoqlw7wa57RCESo+qAFr9hWEbKtFUua2G4bqc4VI
	d5oBUNu61mhnBIT2OGJvF7h/PXIsl/Og4DFMUoNiZKl4IQtZpPmVMHvf
X-Gm-Gg: ASbGncu6GRAqwqfvqFNcs3fPS2Sdb1oh7YOmpbQtk6PgXmwVQC1jGR6lyqXN9TA/JkI
	YFHIbfKqJR7fg1y+DPg3RYWnGLFDZ0tAxLlTU43ZqyYsANpwGSA0uTjZZkbELzQofso/1GF9NiS
	oiJdmCzhkZN8rhNF/6Cybnnbfuv5cjowY/+NUYxRtn3UPxFafns307xODyhvp58aMg9J5KEJ1ww
	4uWt4nSatYhUjJAZ7z3q7u++mywSc9Jj+ob4fcKkAyutzfpNjaWzhTpVergCQpZxj0qXFk7kcRo
	xt8onL8UXeQlLIJiyHgtHfT61VkI09gP2ul5ba2gijYWid5bq7Sh9EcaJhPinyR7bLivJQXm3sF
	ebGOCrwB3+MDAUn/pNgJJiiJW+cx355tnsRie1g==
X-Google-Smtp-Source: AGHT+IH0IhETsj8P/JA08XcPMH7nWCokuLPtF1IOgO6LXzPBkyRklzIaRUiZn1jEXAuM/Zxi5H9xEw==
X-Received: by 2002:a05:690c:46ca:b0:710:d950:e70c with SMTP id 00721157ae682-71824c44966mr32166897b3.28.1752578724786;
        Tue, 15 Jul 2025 04:25:24 -0700 (PDT)
Received: from DebAmplar.DebAmplar ([2a00:5881:3041:2700:501a:6a32:a864:a47])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-717c5d891fesm23810387b3.52.2025.07.15.04.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 04:25:24 -0700 (PDT)
From: Ana Oliveira <anac.amplar@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	Ana Oliveira <anac.amplar@gmail.com>
Subject: [PATCH] staging: rtl8723bs: os_dep: remove blank line before close brace '}'
Date: Tue, 15 Jul 2025 08:25:13 -0300
Message-Id: <20250715112513.4541-1-anac.amplar@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error "CHECK: Blank lines aren't necessary before
a close brace '}'" in sdio_ops_linux.c:309.

Signed-off-by: Ana Oliveira <anac.amplar@gmail.com>

---

Hey, this is my first patch, I appreciate any feedback, thanks
---
 drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
index 4a7c0c9cc7ef..5dc00e9117ae 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
@@ -305,7 +305,6 @@ void sd_write32(struct intf_hdl *pintfhdl, u32 addr, u32 v, s32 *err)
 				}
 			}
 		}
-
 	}
 }
 
-- 
2.39.5

