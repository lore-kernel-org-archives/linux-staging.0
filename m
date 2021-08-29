Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69D172
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 09:25:25 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id u14so23968333ejf.13
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 02:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ssZbkXOIC8Nc+zuDyC8swwWy/mmc9lT9t9cyKL316Ho=;
        b=dOtYhdlQsClPRuAS4N13+n5zgEgSGoDsxsEsSGOTnh2nJvDF6kMdVxJ8JqwEsgpjyp
         YPbBN6NKzI617+WRtYiBm52gRaikB7yCWncuBG2+d6Uuf7AtthzD5cVW1Tl3fkrphCBq
         GX1P8SB2nQ6ZtWShMujhqcr3Q77Ke3/0BIEH+8IKkK8MLfXKpcfg3KfAzNdauFYkWPWB
         /eEbEvBIAsiegsvf+BINH60b8EmF7yGrgcoeLnyVHuqv9PkBof0Tu/D/e0MYguRdIGkd
         bgZS/UStu/ikMuIPrKhxURIGzYS18k333wbNpYQLm2wpM2vmPxqsBw33Q33rkZCncjyo
         WpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ssZbkXOIC8Nc+zuDyC8swwWy/mmc9lT9t9cyKL316Ho=;
        b=dYscV5QXH/ac28TY66lkeS0Lpl22G+s7a+FbUaLzvpFqBDE93DRFbptIaq+/14HgpY
         efVCAD64Nz/TBF1FlmCNWrE2lqs9YzgKt4xt66bRrlnWNB3vtn/e50RIoeb43rmyoLEQ
         BvTfI2dNbGw6C5UmlEto2VhN4tkDbJnDXN5C8OLFKBIxco0lQ4FlP0UhoqK+PFnjhCks
         IleASmSufA/e/XXH5MnpKPdBMWly5sY9NjDTzyOnnh0HGp52nPGUtFJYfLi9SOgTnCNn
         bEF9J5HWt1K6Pn/nNiyEQZFbb3oxFV3l13yaBA6O6lrMSQClOJ8SO9ME6HETZ2F2IYUl
         QDNA==
X-Gm-Message-State: AOAM531phHRSonnkZDP3OOA9vqAPBdWHT/IPl30q18LaU8c7Tb/IIoQt
	raj/F3Dj8C7NWlQf4dQFPTk=
X-Google-Smtp-Source: ABdhPJxuz0SCg+0G9G78XYDNCr6JniNYVg/mYCJdp5hKRjU82zeR98CSKeZuhbYmuLOVVgRPi0eQeA==
X-Received: by 2002:a17:906:b14d:: with SMTP id bt13mr19410856ejb.39.1630229124427;
        Sun, 29 Aug 2021 02:25:24 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with ESMTPSA id d23sm5814414edt.39.2021.08.29.02.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 02:25:24 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/6] staging: r8188eu: remove get_bsstype()
Date: Sun, 29 Aug 2021 11:24:59 +0200
Message-Id: <20210829092502.3658-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210829092502.3658-1-straube.linux@gmail.com>
References: <20210829092502.3658-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function get_bsstype() is unused, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c   | 10 ----------
 drivers/staging/r8188eu/include/rtw_mlme_ext.h |  1 -
 2 files changed, 11 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index 57330b3a66d7..bc10a08d01e6 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -363,16 +363,6 @@ void set_channel_bwmode(struct adapter *padapter, unsigned char channel, unsigne
 	SetBWMode(padapter, bwmode, channel_offset);
 }
 
-int get_bsstype(unsigned short capability)
-{
-	if (capability & BIT(0))
-		return WIFI_FW_AP_STATE;
-	else if (capability & BIT(1))
-		return WIFI_FW_ADHOC_STATE;
-	else
-		return 0;
-}
-
 __inline u8 *get_my_bssid(struct wlan_bssid_ex *pnetwork)
 {
 	return pnetwork->MacAddress;
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index fe3a32f17308..c6b17da73c5f 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -473,7 +473,6 @@ u8 collect_bss_info(struct adapter *padapter, struct recv_frame *precv_frame,
 void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
 		    struct adapter *adapter, bool update_ie);
 
-int get_bsstype(unsigned short capability);
 u8 *get_my_bssid(struct wlan_bssid_ex *pnetwork);
 u16 get_beacon_interval(struct wlan_bssid_ex *bss);
 
-- 
2.32.0

