Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157925F
	for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 13:37:15 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id j7so16845008wrd.1
        for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 06:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zZ4lG4fl9i6EkG0M/cl5xo2h6MaxtP42iPfqhtNmaaI=;
        b=A/QYBE8PUjDdmx3/5yV1/fEFBnkItU+Lh1iomkP6a58eBgHv6wuzQ3lEp8gPB+qixT
         hCGwf7fXL5Ly48UiCvLEEblu1F1nlaYAtnbovy1gZjhHmzsAaGcCe5PoOJfij9hfjL31
         uwnvuezUEByS8zWBluCe5xw1VodOHn63hUDI9NRUi8MC+OPhqcy/UZDhHf7+s0kHdf0L
         8UqXiSmue/+8Y646BVVua4EKEfSUGVauCm5s19yfG7p+9CqBv1tVKCBPATbsEnsVBS6G
         sNAmVO7bxp5oNBVylXRKGW2zioxlsigur4l+9UfUrDdzq6piuGYkwZQwlEVO+p+oXG02
         3gKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zZ4lG4fl9i6EkG0M/cl5xo2h6MaxtP42iPfqhtNmaaI=;
        b=CIxpQNWlmX4X4idu7O4z+wwTPmEAdJ6qOk/s+21j9PeFwmVmIMnrjlXS1+Kn660Tpd
         hz2By79WppN9Fu2urcgULrSPNO0+FD9U+LHyzIkKxRPWPN3NZe7xHmyaZY+iC+ScxO0J
         +DXTmEs+hXYUFbv3PH9yvQwzNAiPGrTPoP4Cgb1aIS09jZQip/ybJv8peYv0CTmwHtn7
         7yVdiApNrhH/CJkb+xn8FePjwT5Ts1J9r633y+CFPYW3miECNuW+37Y5CjpmY5usBix7
         jEyx7lyggaAMdvZWT74Ivc6DAEVsqO0bQGqLNtS+p9gXhTO2O9+99YBAFasehDfWf5Hh
         mQUQ==
X-Gm-Message-State: AOAM532W/6h+Eefuq7FYjyTEyULnnx2j4HPDlyvqGUmzOyNyyXJ8ygHJ
	yc2igWDebwTtTfpI93s/8tA=
X-Google-Smtp-Source: ABdhPJyAksyQ+7qDLMbiPJUJEKw1DYeHVp13IZQloBtyerc2s4FA6HhJTOAG7KhkakSyR4+233P1AQ==
X-Received: by 2002:a05:600c:4292:: with SMTP id v18mr16023848wmc.23.1616420233623;
        Mon, 22 Mar 2021 06:37:13 -0700 (PDT)
Received: from gimli.cesven (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id d204sm17091770wmc.17.2021.03.22.06.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 06:37:13 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 04/19] Staging: rtl8723bs: remove useless structs in drv_types.h
Date: Mon, 22 Mar 2021 14:37:02 +0100
Message-Id: <20210322133717.17797-5-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322133717.17797-1-marcocesati@gmail.com>
References: <20210322133717.17797-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unreferenced struct in include/drv_types.h:

	struct specific_device_id

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/drv_types.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 3119acea4389..1658450b386e 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -77,15 +77,6 @@ enum _nic_version {
 #define SPEC_DEV_ID_RF_CONFIG_2T2R BIT(4)
 #define SPEC_DEV_ID_ASSIGN_IFNAME BIT(5)
 
-struct specific_device_id {
-
-	u32 	flags;
-
-	u16 	idVendor;
-	u16 	idProduct;
-
-};
-
 struct registry_priv {
 	u8 chip_version;
 	u8 rfintfs;
-- 
2.30.2

