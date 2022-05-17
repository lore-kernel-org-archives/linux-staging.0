Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9297E1383
	for <linux-staging@lists.linux.dev>; Tue, 17 May 2022 14:06:47 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id q15so1038692pgr.4
        for <linux-staging@lists.linux.dev>; Tue, 17 May 2022 07:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TNdJuu/j5yzS384N3qJa/cn4HaocjvrZKpgiycrMSE8=;
        b=NMICY8qO480E8MtNAZa+IURSCN4xcvsbZJ4Lew2+Md4VhJq9ThZkFwdm0p2EVy5pKR
         QqwjeR/Bsc5uinknc8OYbIfL4WUhvIWZT+mHqHRthGwidkzWWRJ4h98mcAns6aUtFKRs
         dvNkS9G3AcznYLU8fS1UebfoWq/kI+USfdIY6eG5zqt+MtI7YaZCum8KBDhqJJv+lxqc
         kmjUM6230WefSl5gT3Qcls4NwZ0lYvmWYJQ4XOd5BqO2gSZFWMow6zun97o2nIshaXDP
         fSRHhluP5JNq9lP7yCcPz3WtdPspKkcLFBP67rWar3bAyoKukDR8VxK3/ZAzFu8QbzHw
         KP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TNdJuu/j5yzS384N3qJa/cn4HaocjvrZKpgiycrMSE8=;
        b=PhRTJQ3VHCI345BbG92qTIzxwXpgMTGb/SuqNmEmWGqxiKV7LLEi44R5eZIFb2S1Iz
         Mxq0FtZYYXRptfNacsvzQWDvdU9TuzE0mZZdv210kzijROTg5CCnnCaDiFJMpU4XJ52u
         D31f+ujlA/z6MRXj7HyDcw/iaq7T7ynjKhGC9E183OBvcYHbNyI5sh//AEwxn86lv1a4
         6Poynm39E5bmlvQY2sTW4sCkp5LIIFmlq98i+c1UOi1VYMpfiE7wZplj+2eRIGE/nq+X
         Ck4MWTlGUDH+indYJUm2IhzANyyZ6VEkvCwB0DRgE0rlNvrbXMU16ERNfXF4iYw596Mu
         YRGA==
X-Gm-Message-State: AOAM531Z8l6kstZ3EIsfkwtBW5zud2egmAYsZjPHzp1T/+0sqJJrqDQk
	D/AuSzxtlV19/0Q3ilwQwN/QFLI1A+9FJQ==
X-Google-Smtp-Source: ABdhPJxX9ileI2WmqX6uf7SYTsGgUhniZrweG7+ql+M+jKSmO4li39cSDPQsAxQEEU8bOCBcvx1ZuA==
X-Received: by 2002:a05:6a00:1494:b0:50e:23d:831c with SMTP id v20-20020a056a00149400b0050e023d831cmr22872210pfu.31.1652796407136;
        Tue, 17 May 2022 07:06:47 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:1:3174:ae5c:a49e:4e77])
        by smtp.gmail.com with ESMTPSA id z34-20020a631922000000b003f27f91135asm3113289pgl.76.2022.05.17.07.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 07:06:46 -0700 (PDT)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH v2 3/3] staging: r8188eu: fix warnings in rtw_wlan_util
Date: Tue, 17 May 2022 19:36:26 +0530
Message-Id: <20220517140626.3716-4-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220517140626.3716-1-makvihas@gmail.com>
References: <20220517140626.3716-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the code to fix following warnings:
    WARNING: Comparisons should place the constant on the right side of the test
    CHECK: Comparison to NULL could be written "p"

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index 27035eac6..3f4456901 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -962,7 +962,7 @@ int rtw_check_bcn_info(struct adapter  *Adapter, u8 *pframe, u32 packet_len)
 	else
 		hidden_ssid = false;
 
-	if ((NULL != p) && (false == hidden_ssid && (*(p + 1)))) {
+	if (p && (!hidden_ssid && (*(p + 1)))) {
 		memcpy(bssid->Ssid.Ssid, (p + 2), *(p + 1));
 		bssid->Ssid.SsidLength = *(p + 1);
 	} else {
-- 
2.30.2

