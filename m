Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA423FC8
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:05:29 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id q26so10365844wrc.7
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7e0J/R3gJQDabLtHpyjQtJohAsSE1y48rkqb7f3qtUY=;
        b=hgDUzJx9Wklh5ga++9Ww6PwBSw3PHmNLidI7GjhFVbFYKzKO80hxVYClgQ44rIUZ2i
         k7kQQDHmskPF3VfOXddFbDh77rEOYpn2FLtWzEsooSX/ZmRDgNabR1L/+WSrggQB20tU
         iIXVS0imaFljey5tguIDydky4IzzgsEpjMqHAd5MmeTIOR1O3ihbkLsZWGPshfZDsaWc
         1bvfLFGlCNeHTNDcvbYn5Ua8CcE2NK9Ccsf55laeskzrSMKA3jwRTg1m3a1mJ+HgJBXb
         wgyP4/bjg2c3LOk5qGzmbxx1oj2MvbaU+Z0LrSHgF56jdYzaV0vXfZaVF+coBEATg9hb
         Xv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7e0J/R3gJQDabLtHpyjQtJohAsSE1y48rkqb7f3qtUY=;
        b=63hG3qg5m1v25aNN6cz/h17XWcaDEWCh9aHXuNCwXHxSKwpxUdhDOnKX64BZufQ7Ei
         IoYl5n3DOKpptTv3wgU24m6x5AWhM0dkH0yiqUd3NmpKRhs3aF1AgIzMYqMQ91+2fTWw
         JjeJ+C38/pRH/LPFDWKZWvc9OyoQpurnh4RVoE1+Xl/8K2ut4MBxFZtveu0kNQSkVfNH
         4+7ZlhjvyAoH9ii7FFBwqo7rUqBYeygDMy90PZjrn0uDv8YUTWZSF4wgkwK9BiQ0OS65
         OmjTByoeogc+oLhBH1UkL2BZfqcMv+EbUjC0aNSjFjr2T5XjP2f8G1QHe6SgYygxv4fI
         SbSw==
X-Gm-Message-State: AOAM533RGLoPrdV+dtEB7AadfnoXTkGBIFTDcYx08uzubMXAdGHKbZI8
	fjiyKZ1ms5sGU2ZyheYpwhA=
X-Google-Smtp-Source: ABdhPJx9EuC82Fw1eD74bNVhvtvthXqtmBWDVjaxdniMkpMlE6EsAOYlXgBoXdRQFaUIe40CLjm6lA==
X-Received: by 2002:adf:cc82:: with SMTP id p2mr907133wrj.5.1632341128165;
        Wed, 22 Sep 2021 13:05:28 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:05:27 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 03/47] staging: r8188eu: remove efuse_GetMaxSize()
Date: Wed, 22 Sep 2021 22:03:36 +0200
Message-Id: <20210922200420.9693-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922200420.9693-1-straube.linux@gmail.com>
References: <20210922200420.9693-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function efuse_GetMaxSize is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_efuse.c    | 7 -------
 drivers/staging/r8188eu/include/rtw_efuse.h | 1 -
 2 files changed, 8 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_efuse.c b/drivers/staging/r8188eu/core/rtw_efuse.c
index cb4ad21f00c1..ef7a50d31c01 100644
--- a/drivers/staging/r8188eu/core/rtw_efuse.c
+++ b/drivers/staging/r8188eu/core/rtw_efuse.c
@@ -279,13 +279,6 @@ u8 rtw_efuse_access(struct adapter *padapter, u8 write, u16 start_addr, u16 cnts
 	return res;
 }
 
-u16 efuse_GetMaxSize(struct adapter *padapter)
-{
-	u16 max_size;
-	rtl8188e_EFUSE_GetEfuseDefinition(padapter, EFUSE_WIFI, TYPE_AVAILABLE_EFUSE_BYTES_TOTAL, (void *)&max_size, false);
-	return max_size;
-}
-
 u8 rtw_efuse_map_read(struct adapter *padapter, u16 addr, u16 cnts, u8 *data)
 {
 	u16 mapLen = 0;
diff --git a/drivers/staging/r8188eu/include/rtw_efuse.h b/drivers/staging/r8188eu/include/rtw_efuse.h
index a6e36be6ee76..de98b732fce0 100644
--- a/drivers/staging/r8188eu/include/rtw_efuse.h
+++ b/drivers/staging/r8188eu/include/rtw_efuse.h
@@ -101,7 +101,6 @@ extern u8 fakeBTEfuseInitMap[];
 extern u8 fakeBTEfuseModifiedMap[];
 /*------------------------Export global variable----------------------------*/
 
-u16 efuse_GetMaxSize(struct adapter *adapter);
 u8 rtw_efuse_access(struct adapter *adapter, u8 read, u16 start_addr,
 		    u16 cnts, u8 *data);
 u8 rtw_efuse_map_read(struct adapter *adapter, u16 addr, u16 cnts, u8 *data);
-- 
2.33.0

