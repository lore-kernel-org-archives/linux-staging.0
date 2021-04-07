Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DCD6D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:43:18 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id v8so8824333plz.10
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZAuGglzaZUilwxmfKh+vB3j+5qRuKYKMV1iFQ03oySg=;
        b=g6gIelmtiXWSl9iuGdO97naDvYmDnPLLIeCo+nOz0LwZQrG3lVCa7DRF+/9bVjM2wr
         iDgR3R00ajkdSNzDQdJpXxcq/WnHvAHMspdV7Cu6w6Z6ysrJSpOjG8zF9gapZh+7/1bg
         S7N7c136/ZrRf4Xtgbi+nPXD+6YJr2CZ+Cce1/TAyzMc60R9mB3Nv59+gz7AXVk94ZWt
         53/IYMrtJ5hJ8MfKPZ7z/ZhoaIwrCnKS3lWkvUz8WFpvuufWEILVtctw70t/eoxLFzol
         hG3hwEpk3M6SIFgDJ87GJrCkB2ZVg8KuwCWNP+y718zerzJDUP1P91PaQbzP96ebVzoY
         PTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZAuGglzaZUilwxmfKh+vB3j+5qRuKYKMV1iFQ03oySg=;
        b=VIZSyL1upFBIqs74EfPameCaIR7GxP1nZVV2qcu/f0WrhOE98uuotm6kt/yi8HjGD4
         Zu/hqtKkN41eAAXAOVXooGn11n3MCyBceG9JvNuw/QHyvYQhiQrYB3CvZsV+8ZbfsVco
         3my9tf15jnX6uU8E75DpXk6qpzUNhBUNRIUshqacUCeE6f9uiES2QMpjdm5qBZAAlT2g
         S+DdyrCHKFJwvpIr7j+hhNHrYSAqsLbyf4RmmclQBrq45tTm5t/kGmyG8L0v5MV+x/jW
         mnYfdNRxDa8N1LddhOPdMI9hDsCKC1YsflUkw6t/ttIlPGNEpRh9ETo5Wc/1Kc9JS7k9
         E7DA==
X-Gm-Message-State: AOAM533H5zUg973sqdLTFegO2O3w/L5n70jZj+nvYA6HEOBJJ0iokP76
	bu/8dpGnMnmybLSVrFjWK9s=
X-Google-Smtp-Source: ABdhPJxWSmAXAukOFlyPPiMrn1UKacPWX0YrpPIz/Oc7rAqf79rADJkQBtWoKzOPV9hdfH5AU+ht7A==
X-Received: by 2002:a17:902:ea0e:b029:e4:81d4:ddae with SMTP id s14-20020a170902ea0eb02900e481d4ddaemr1859233plg.12.1617777798266;
        Tue, 06 Apr 2021 23:43:18 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id c11sm20233683pgk.83.2021.04.06.23.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:43:17 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:43:15 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 18/49] staging: sm750fb: Rename function params of
 sii164_init_chip
Message-ID: <902ae58f025b3cce6004b83d8ee8fbc3f6ecee7a.1617776878.git.pavle.rohalj@gmail.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>

Fix "Avoid CamelCase" checkpatch.pl checks for function parameter
names of the function sii164_init_chip.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/ddk750_sii164.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm750fb/ddk750_sii164.h
index cf17b9029496..ceafac60340f 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.h
+++ b/drivers/staging/sm750fb/ddk750_sii164.h
@@ -16,16 +16,16 @@ enum sii164_hot_plug_mode {
 };
 
 /* Silicon Image SiI164 chip prototype */
-long sii164_init_chip(unsigned char edgeSelect,
-		    unsigned char busSelect,
-		    unsigned char dualEdgeClkSelect,
-		    unsigned char hsyncEnable,
-		    unsigned char vsyncEnable,
-		    unsigned char deskewEnable,
-		    unsigned char deskewSetting,
-		    unsigned char continuousSyncEnable,
-		    unsigned char pllFilterEnable,
-		    unsigned char pllFilterValue);
+long sii164_init_chip(unsigned char edge_select,
+		    unsigned char bus_select,
+		    unsigned char dual_edge_clk_select,
+		    unsigned char hsync_enable,
+		    unsigned char vsync_enable,
+		    unsigned char deskew_enable,
+		    unsigned char deskew_setting,
+		    unsigned char continuous_sync_enable,
+		    unsigned char pll_filter_enable,
+		    unsigned char pll_filter_value);
 
 unsigned short sii164_get_vendor_id(void);
 unsigned short sii164_get_device_id(void);
-- 
2.30.2

