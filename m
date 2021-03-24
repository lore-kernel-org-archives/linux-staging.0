Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6A371
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 18:38:42 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id e18so25482890wrt.6
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 11:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Pl4h3gBZerzzHX1WEFH7mViXbozHYLPSMKqv8f+XYgY=;
        b=HAalqPkIjKqx6kEU7D7IHYau/qDIPAOQOfDyu8H1oKO4Qd1zRp+89U2eQ8AYlmi+PQ
         X/eemh5WHyjlVd19H2IDsEWuDZWynxlsBCTUty+7lS8UE9aC1kN6Cv3QfDozDALozHI5
         9N/mDekD7FJjdK5D/S8sWwFK44KwOwfPvmlBy01hFQpmeq5jW864ykbl3qKBpZAeMnZI
         kqs8S5srWdHS7fQM9i36OYLGhuOTHM8Qp+xiCl4L7IUzIcaDVCHRQGW+IX/kaU0pN0A0
         ctbRHLEEe2oKU+EFa5A3aLmPMNrjYbkHSj+LbAFm6ggJwu6fXltCoaISyaJw/Njt4rrY
         sPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Pl4h3gBZerzzHX1WEFH7mViXbozHYLPSMKqv8f+XYgY=;
        b=o5/ncpEyHaJ5cJNBpM+/DOCbPJb+TJqhKCsnR+emYXI2FzkjbNkDGwnq3fTLzHzMrc
         MltF3LSy6MrJyJRydial2lFosZOYtjo980CN1Pa1avvsx+rUiVzuNFRx2TTGoUDfoELG
         Hu/l21aOkiwQmXNXUuitI0Qnpwbw0w7b59qKuyN+5mO3YajnKnaKW0ZhUNLFJQEIBQ4v
         +QzFcupYW0mqxOcP75xZIjfSdT+TboVkaJbmyQc8K8ustSErwHYgQMBohL3QBpFxFh/5
         8EK2ZTXo05b+WFq0bLKeFVkx7vhbWvFP5jnU2bYkjejDYb0SqInxcstqgNkmbfTXO7jb
         7urA==
X-Gm-Message-State: AOAM531qV7EpPHJm6UiA0hpjd+PTCVC1zaqqIM4oe/bf3uiRhsA8nl9Q
	I/A4DxsWumz8sZy7OhMdSuc=
X-Google-Smtp-Source: ABdhPJxuoeAnhpkz8h3TKfSSs0A4s0Oi5yYgwSvQM9MBT95ikT2r9QODjRvI65+0GUIp+HbWtA5PXA==
X-Received: by 2002:adf:b313:: with SMTP id j19mr4832435wrd.188.1616611120892;
        Wed, 24 Mar 2021 11:38:40 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id z2sm4358040wrm.0.2021.03.24.11.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 11:38:40 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 03/21] Staging: rtl8723bs: remove enums in drv_types.h
Date: Wed, 24 Mar 2021 19:38:29 +0100
Message-Id: <20210324183847.5595-4-marcocesati@gmail.com>
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
include/drv_types.h:

	enum _nic_version
	enum adapter_type

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/drv_types.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 1658450b386e..243db42b7716 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -24,15 +24,6 @@
 #include <wifi.h>
 #include <ieee80211.h>
 
-enum _nic_version {
-
-	RTL8711_NIC,
-	RTL8712_NIC,
-	RTL8713_NIC,
-	RTL8716_NIC
-
-};
-
 #include <rtw_rf.h>
 
 #include <rtw_ht.h>
@@ -353,12 +344,6 @@ enum _iface_type {
 	MAX_IFACE_PORT,
 };
 
-enum adapter_type {
-	PRIMARY_ADAPTER,
-	SECONDARY_ADAPTER,
-	MAX_ADAPTER = 0xFF,
-};
-
 enum driver_state {
 	DRIVER_NORMAL = 0,
 	DRIVER_DISAPPEAR = 1,
-- 
2.30.2

