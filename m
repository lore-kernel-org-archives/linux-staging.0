Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCC82C80
	for <linux-staging@lists.linux.dev>; Fri, 19 Nov 2021 12:26:44 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id x15so42087704edv.1
        for <linux-staging@lists.linux.dev>; Fri, 19 Nov 2021 04:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=38S9lb/xN7YIHKTpi8ddifaK2hGuRb5K16FaftQ2adY=;
        b=hpQprQQ+NXNkARP4s0bvv6VX5k09q3fNNG0DgtplcOSYyHhP80tD76rfROZCNv7x+V
         5SwES+5guz98hlK5VtiPv3rKlfGQM2gxp09p9DYkXO51vfgTjeqGOM2ZAC8+5LHAhjLh
         X814FSHLmzOHUlPRhWpuVEyNS+O3ozFFgY6OSvCVB0vCFxDFEx6c8hjATDG2ZcrRQPyx
         DWHoF4TX3Y+u8rnqNc3u2/cklTfIvktIsU/4bhlppx6959PkkS6Vf4Laa4HYzR4x89PN
         ORwTSKIQfQk5jdsR0X/Qc+xrUBw7HWe8VRrfqBfC7GlPDY7vmRGi/wReDvegC80+yo7i
         1H1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=38S9lb/xN7YIHKTpi8ddifaK2hGuRb5K16FaftQ2adY=;
        b=hbJWjiN970ha85W7TYR9KcidJoISmdUJFysJ9GfOU0YwuniRc7GPaNGL4IE6NfwLDg
         dhk3vkZhar1PAaYpRQ1DX8TeapLhBTDJPr9iu5BG6U5tac7nOehHbVI6VRP1aw86mIo6
         jgL2RexkY/q8nv02jPaY01rcVwZOCgCFiUAQRNLjKs10OkpwUMQOYFGsRTBHMJ8H6T+U
         fFTRxq5s/16ydO2hVqbnWPKkUry+90oOHhBCK1DMY5NpNxEPcZFsjqLNpYade2BlE96I
         ccW16LiKva9pn7dxBho9jOTXSRj/Zd1IQpDFa6MlOHgj4rkDu33o9J1w2k6JjM138WHb
         GQLA==
X-Gm-Message-State: AOAM533nmPxvkTc8W4Mb76/7WfM4e6byQc7ILh2tf2hldqkaBdMzNzpB
	Hq3IvUMuCPXlsgPT9I4Vh78=
X-Google-Smtp-Source: ABdhPJw+pLDazzlsZ1wuTvKbSJW8jfVF+KgeKthSXtBT02db2jM9yce2pKj4n4g5PYSc7PD3sPkTCg==
X-Received: by 2002:a17:907:868e:: with SMTP id qa14mr7500184ejc.564.1637324803274;
        Fri, 19 Nov 2021 04:26:43 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::79b5])
        by smtp.gmail.com with ESMTPSA id v10sm1374994edt.24.2021.11.19.04.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 04:26:42 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/2] staging: r8188eu: remove rf_type from add_RATid()
Date: Fri, 19 Nov 2021 13:26:34 +0100
Message-Id: <20211119122635.28435-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119122635.28435-1-straube.linux@gmail.com>
References: <20211119122635.28435-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rf_type is always RF_1T1R. Remove it from add_RATid() and remove
related dead code.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ap.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ap.c b/drivers/staging/r8188eu/core/rtw_ap.c
index c78feeb9c862..47bd84b67a08 100644
--- a/drivers/staging/r8188eu/core/rtw_ap.c
+++ b/drivers/staging/r8188eu/core/rtw_ap.c
@@ -318,7 +318,6 @@ void	expire_timeout_chk(struct adapter *padapter)
 void add_RATid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
 {
 	int i;
-	u8 rf_type;
 	u32 init_rate = 0;
 	unsigned char sta_band = 0, raid, shortGIrate = false;
 	unsigned char limit;
@@ -342,11 +341,7 @@ void add_RATid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
 	}
 	/* n mode ra_bitmap */
 	if (psta_ht->ht_option) {
-		GetHwReg8188EU(padapter, HW_VAR_RF_TYPE, (u8 *)(&rf_type));
-		if (rf_type == RF_2T2R)
-			limit = 16;/*  2R */
-		else
-			limit = 8;/*   1R */
+		limit = 8; /* 1R */
 
 		for (i = 0; i < limit; i++) {
 			if (psta_ht->ht_cap.mcs.rx_mask[i / 8] & BIT(i % 8))
-- 
2.33.1

