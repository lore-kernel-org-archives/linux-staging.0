Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4210D3FC5
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 09:02:22 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id i3so1543039wmq.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 02:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OSOSsriq+ikZA4mrzrbiyfyFu2Bj3tXb4d5edmqNKB4=;
        b=BsQk5m21j2misJqF/GKeuIt6tbAX366ctFPEqmK0ynxh/LlC7hozkCFoBYP7lFicIB
         EJNb6SvhRJfREFgSB4aN4Qid8P+V+dgp6M79seSU0YdAgfMPgw0zghKyoDYNexU1zUri
         6HQdazENt9XTsQ+wr22CmnA6TXNOkYg/4vP82fUdrl8sk/dlIgFcSZHQyrT7TcCtkkSr
         plS+Ju90/cJCxc71W4DV/SDAI4scqXYebW32/L4m1CNpbtI9MRcrMbtyTlgul70xThiK
         h7IgjvM5/4iI4QHwLN2Im8cosP+VgFR0D0WIg0NDMEAZvH8FLuHGVxPp5iKKEXXAtr9t
         rMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OSOSsriq+ikZA4mrzrbiyfyFu2Bj3tXb4d5edmqNKB4=;
        b=x9uBli9VS46SSCzN1VHSuyeJGHKdnuScYMNkvb31DP2ni7Ti3QPwRulW9piujO6KvH
         L6uENkACaRycWdgDdMakH1TaL3VZfEQMQai9BkaqIYk4unqnk+Bq7Msjjz8ioPfs6IcT
         CVtYBi8V/Qz3jWcNPtqmHNFihq/99ofc38MpilfKzh9jcE7g/yyzmshosyYm8w9Xa4v6
         0CFAhN50e1fWZt8Xbze8MON3DuPDeNUMmer2O3v+Alh0NoIDMwa9XK1UYPaTlbBJer60
         sWdvuxDtz4KEwpT9lFw95uFeHQzPg5e1kjTd+C2lpWOfG4WnTl1VCUmcqNEfwTPL8Ot5
         eXHw==
X-Gm-Message-State: AOAM530PKC+tv736SI4pyt1Vad2WcmV3fpEfgU/hRYNtb5qZsZFIDnq3
	ob8jIxgPW6WR0wLZ2m939AI=
X-Google-Smtp-Source: ABdhPJxUCe9xdchxwi1Avh3jaJ3oPD+ebF7vl0C0+V6AyCX1T7IIkHRKhornkYVYeNW47auKPqtOow==
X-Received: by 2002:a7b:c959:: with SMTP id i25mr3263162wml.55.1631696540721;
        Wed, 15 Sep 2021 02:02:20 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::1db2])
        by smtp.gmail.com with ESMTPSA id n186sm3565530wme.31.2021.09.15.02.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 02:02:20 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 4/4] staging: r8188eu: remove unused field from struct hal_data_8188e
Date: Wed, 15 Sep 2021 11:01:56 +0200
Message-Id: <20210915090156.4169-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210915090156.4169-1-straube.linux@gmail.com>
References: <20210915090156.4169-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Field BluetoothCoexist of struct hal_data_8188e is unused, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/rtl8188e_hal.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 17913dcc9fbe..e7e7064dd356 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -289,7 +289,6 @@ struct hal_data_8188e {
 	u8	CrystalCap;
 	u32	AntennaTxPath;			/*  Antenna path Tx */
 	u32	AntennaRxPath;			/*  Antenna path Rx */
-	u8	BluetoothCoexist;
 	u8	ExternalPA;
 
 	u8	bLedOpenDrain; /* Open-drain support for controlling the LED.*/
-- 
2.33.0

