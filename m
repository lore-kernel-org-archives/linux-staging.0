Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A803FC7
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 19:03:14 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id u14so15078000ejf.13
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 12:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vh8+u22pNgFmmQDYhuLqazbVUqiifTDWeSKfb70Q1zQ=;
        b=cfc0Thrf2j2pOl8FE13UIBaQct9YV6FwfNyxC+NVP5afcFm7UTerlLIU9ijGdePISP
         PrBcyRbeOSRSGyImBErOFQoNHuWOvMv9MBwhTAmaekXSMjK+meWS3T6QP9m2tkdeI7f7
         +Iqrw1/XMemAwBJcw303MY1b8ywCzQIGNndmTJcOX0WgXNwvSbJQ2f0yP2FopoPBqJ80
         xPQYtZxeZHkuxpRpt+Zw5qYeMXweChTkQ1EzlGwxYRunB8t+IW5kWLYmSc+Se1ePViFg
         0u05mGdm/o9oJCWsfye+mUi4zqBTCnoUHQbEnrtWbO7jbFJD39uuU2WbNfeA1aIc4dMP
         OwpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vh8+u22pNgFmmQDYhuLqazbVUqiifTDWeSKfb70Q1zQ=;
        b=bMdxLbjmHDDW7qfyjJdXQYLuYFaz7Svn6A6dsFvqsn8EQpdSbbp/hh4ITSHe0MDepa
         czW3R/jCszoH1L4L5ak8ifmqDhJejk5VM/4Uo+buVfJl4ZuozIi4Xb/so7gWM1J0XBlA
         e+kkQdRp0zLKNAUdCXGdhMqtv144Pr6avuoQA8g9xT00nNJeNTanLwFUqrJw5j8uDRi3
         rRhwCqNaSTGdHtS9pqGZhfN0hIcgOMZ8eRTFhQqvOnj639s55YehclA+Zt4CSwzfyq5Y
         2jtzMp6MGr7mJ5mTnFNA8ar0fjHcGMU9n41mhrTeDoo5wQvp5oJeqxQcABvDuZU9UuE4
         15Xg==
X-Gm-Message-State: AOAM532aimxPg/GSdc0laW+KCR+/JziNL/X4pbLJpWwLdYXHX75Nh4be
	XJ3H5HiuNpDsvASUxFE1dGk=
X-Google-Smtp-Source: ABdhPJx48kPMGUexlOkKBIiA68bGTTj0uOc0lKGIAQ90TSy1X6dPnvmGnHVPWgtOgmnlTsuWBRh4sw==
X-Received: by 2002:a17:906:6dcb:: with SMTP id j11mr14799311ejt.202.1630954993216;
        Mon, 06 Sep 2021 12:03:13 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id k15sm4372018ejb.92.2021.09.06.12.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 12:03:12 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 38/40] staging: r8188eu: remove unused function rtl8188e_clone_haldata()
Date: Mon,  6 Sep 2021 21:02:21 +0200
Message-Id: <20210906190223.11396-39-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906190223.11396-1-straube.linux@gmail.com>
References: <20210906190223.11396-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused function rtl8188e_clone_haldata().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 5 -----
 drivers/staging/r8188eu/include/rtl8188e_hal.h  | 2 --
 2 files changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 22750cd40d45..760ca114a7cc 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1741,11 +1741,6 @@ void rtl8188e_SetHalODMVar(struct adapter *Adapter, enum hal_odm_variable eVaria
 	}
 }
 
-void rtl8188e_clone_haldata(struct adapter *dst_adapter, struct adapter *src_adapter)
-{
-	memcpy(dst_adapter->HalData, src_adapter->HalData, dst_adapter->hal_data_sz);
-}
-
 void hal_notch_filter_8188e(struct adapter *adapter, bool enable)
 {
 	if (enable) {
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 40bc00a9b23b..13217789d495 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -438,8 +438,6 @@ void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc);
 
 void rtl8188e_read_chip_version(struct adapter *padapter);
 
-void rtl8188e_clone_haldata(struct adapter *dst, struct adapter *src);
-
 void rtw_IOL_cmd_tx_pkt_buf_dump(struct adapter  *Adapter, int len);
 s32 rtl8188e_iol_efuse_patch(struct adapter *padapter);
 void rtw_cancel_all_timer(struct adapter *padapter);
-- 
2.33.0

