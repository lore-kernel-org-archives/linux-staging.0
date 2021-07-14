Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4719C70
	for <linux-staging@lists.linux.dev>; Wed, 14 Jul 2021 15:11:21 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id g16so3661909wrw.5
        for <linux-staging@lists.linux.dev>; Wed, 14 Jul 2021 08:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zyox365Ii1ilVd+ni/OL8Ydjg+OlcC8rNpEGzbROUls=;
        b=ZD8s4DPOC3TwbMAg+1aCt7u1StwxGMAUHjB03GK3mYEOflCSzbbxGSxgHg8E3JLna9
         0munI40MRScQQUqDXASBJTj3eOjUh5dv6YkKbWN5fQjkNDyneXJ1hXLnMZvzRd341s93
         3JRSt+xirFz8bRTHr14uzPYm7VDsQRhjwc48cx+fvlPXWIIhNKk7vm7IVlpDKNnWvm6c
         dv7GCiisgovNbXpa3V4/tIKjBXg0hs1JvtZ2qWkxNRHuNHy3h2x3Qbu33ZGLEP3x+Ejf
         6DUVKlejlA6vRkoON47p38Rs3jr7dfjlliwTj/2y6a4J+TcbiejwJZzET5vh8FYHW9Sx
         vSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zyox365Ii1ilVd+ni/OL8Ydjg+OlcC8rNpEGzbROUls=;
        b=tNcrOE6sfa7jMfwJ4+FvhDZGKlJoDjLLUt7bPHdpRUJDIIqnxNdgJa6hbU4bK1Wdwa
         rVSowBTEc6gT590FcazBqbhK6HT1misYz8ykD27l0prEeRXgijc7R2K7PryaX+cCxUDR
         TtaXYNW2ZN5svYDs55nVa7zuXtDM6NyrhV3aMovhQ2C44sUQSpIrctG41MWhvitbKlSS
         vSxzlyCOdeWtMYoIntcYCMFO1eLJD5ZwlkBfv9YHazYnuWMUbPmvdlPIuwkSdT5CzOmg
         hYEM3C4HugwOz2iBxh1KuzzFAXxbq53WN521Cc+EdNqrOfEdFiqhNBVnWJ51M5MgnIJU
         gMEg==
X-Gm-Message-State: AOAM533SApUXLn+5YELBtRX/XiQcuOSBUL5V2jsY032fmzYxzTB8W5jn
	WLH7tuhwjnnorU6p3N3r1Cg=
X-Google-Smtp-Source: ABdhPJwoI0gHScSZ086DexxRaXyQoEy4B+/YFie/X2ZPOoFJxDlZDVbaU3twTVOjiDR9wyrVATmgXw==
X-Received: by 2002:adf:f9c9:: with SMTP id w9mr13428258wrr.107.1626275479758;
        Wed, 14 Jul 2021 08:11:19 -0700 (PDT)
Received: from agape ([5.171.72.142])
        by smtp.gmail.com with ESMTPSA id 204sm2415441wma.30.2021.07.14.08.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 08:11:19 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] staging: rtl8723bs: fix camel case issue
Date: Wed, 14 Jul 2021 17:11:14 +0200
Message-Id: <a708b2b9902bedf5bd0466b05516a4c5b4f43723.1626275102.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1626275102.git.fabioaiuto83@gmail.com>
References: <cover.1626275102.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix following post commit hook checkpatch issue:

CHECK: Avoid CamelCase: <NetType>
45: FILE: drivers/staging/rtl8723bs/include/ieee80211.h:170:
+#define is_supported_ht(NetType) (((NetType)
	& (WIRELESS_11_24N)) ? true : false)

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/ieee80211.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 8eb0557a077a..b2c1a7dafcee 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -167,7 +167,7 @@ enum network_type {
 
 #define IsSupportedTxCCK(NetType) (((NetType) & (WIRELESS_11B)) ? true : false)
 #define IsSupportedTxOFDM(NetType) (((NetType) & (WIRELESS_11G) ? true : false)
-#define is_supported_ht(NetType) (((NetType) & (WIRELESS_11_24N)) ? true : false)
+#define is_supported_ht(net_type) (((net_type) & (WIRELESS_11_24N)) ? true : false)
 
 struct ieee_param {
 	u32 cmd;
-- 
2.20.1

