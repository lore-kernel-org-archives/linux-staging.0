Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F82770
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 18:38:50 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id e18so25483266wrt.6
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 11:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x5iGgkkQI12bcMbT4mdELuMlFCgQKpKrgyOI10nb5Pg=;
        b=Ws7kXcAUkG34RAER4CEOcF4+kWbGEdISw74NmhEko11AO4tGAQTJ2oIt0ujfqWSDwr
         Xzmd/5wDtzR49ady5DeXBoer27QpvzWVd3aJqbqZ5ujtgC4mHDQjF5DNmZB9v6jSNNeV
         DqxGcbjfHlidKMVzrpLEIoCR+0AbJ8dPLikPZzcToVR6T6vHxTZfPyBqhNrwur0ub6pV
         PzeUv92tAGJ2Ei8/K49LNuKfc7WBE/AHzzbMwIf1ofhCNWIVkd3+6o+MlSevLLUlfYsz
         6yxM5URyy7/w//A6xcJ43U95cVOzTNyP3sm/GqAijEZilgHUFL19TuMo888PszSOz/vn
         e3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x5iGgkkQI12bcMbT4mdELuMlFCgQKpKrgyOI10nb5Pg=;
        b=cWxg8+f3VjWCHbFq4sMF2wCTxR2xRXcz9ZW76pH+z7SLmJvHwNZWRrO6KMbnkEl/WM
         mSWNjr0vaQC5zHl3rXLLhMdA5rfdkZHFJSOK+8Kg26+MdXp3S3QNpKOuJmrcCsE5ZP/c
         W1UZFAkKuZkfhO7DymWruosy/OQubQHzNxoc7vMuLoald1SE2YEI4E9LIvTUi/6cGLyu
         8DpQcq0EphcXDEaWh4thLxOkRmqtrPTetV6qUxvVU9IRAZHOIh1imufqyNsbUinVtzHo
         xoMXapIcyOz8Juefk4FrJvGMgeKR0eu0FKTlcVLc3gXyNJqg8Sk7bP7S8C6UiH81068L
         3Lvg==
X-Gm-Message-State: AOAM530kWGW+L6kUHng4PLK7hu/LklJbwVBRxFAXVZ4MuXwv9EKYyBeS
	O/2V/POdYNlN7jP8+3iEWmo=
X-Google-Smtp-Source: ABdhPJwVUAwLQh9WVdOnnEvo2ay1oj9OHyl7cx8Uq01P8rTX9l3EU/i7LXWUCZN/g3rCPvERjoYH7A==
X-Received: by 2002:a05:6000:54d:: with SMTP id b13mr4822385wrf.417.1616611128715;
        Wed, 24 Mar 2021 11:38:48 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id z2sm4358040wrm.0.2021.03.24.11.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 11:38:48 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 12/21] Staging: rtl8723bs: remove enums in rtw_mlme_ext.h
Date: Wed, 24 Mar 2021 19:38:38 +0100
Message-Id: <20210324183847.5595-13-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324183847.5595-1-marcocesati@gmail.com>
References: <20210324183847.5595-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum definition in
include/rtw_mlme_ext.h:

	enum Associated_AP

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index fb283dc04ee2..cdf4e2126bf5 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -258,18 +258,6 @@ struct rt_channel_plan_map {
 	unsigned char Index5G;
 };
 
-enum Associated_AP {
-	atherosAP	= 0,
-	broadcomAP	= 1,
-	ciscoAP		= 2,
-	marvellAP	= 3,
-	ralinkAP	= 4,
-	realtekAP	= 5,
-	airgocapAP	= 6,
-	unknownAP	= 7,
-	maxAP,
-};
-
 enum ht_iot_peer_e {
 	HT_IOT_PEER_UNKNOWN			= 0,
 	HT_IOT_PEER_REALTEK			= 1,
-- 
2.30.2

