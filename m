Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9E7DF43
	for <linux-staging@lists.linux.dev>; Sun, 24 Sep 2023 19:50:53 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3175e1bb38cso926249f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 24 Sep 2023 12:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695585051; x=1696189851; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ad41TGXwIahQ49MHw+UdUbfiHlgxk7kDHjA1x4UOf8E=;
        b=S3obYCqFJTZmFNp+cYx64io8j/ctOArBNNAjYbZR+m+jx4J09QZ/zfsjttA/OduVnR
         bWx7CphvqOSozGcud+aSnX0ID+GEZyXAtF330ssVXxADzvOb5m0AK1Kq4IHWcISras0Z
         iqiHFHA1FVxTw6/EE2yZ74xJ2vHN6uzFqtaQV3doCaoggVryFihI3KDSK/GlIsqyMpvS
         o/E9dF8bNwwJSJvrr0lhvDNY6KF6dKaEBYEALKJhzAP+Y8jwhZxp0EboIcUbRqI+93d+
         GUpP5+HKmLNQnmAHMvgeAlGZio851ea3bS2NfJu++VYeOIx6/3Np7AqOPtRgjkjSa5xA
         ZTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695585051; x=1696189851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ad41TGXwIahQ49MHw+UdUbfiHlgxk7kDHjA1x4UOf8E=;
        b=uWJDAxS0cor+/2l37rBkHZWYdl1eWz+QeadFBpA1kfuHkKiS97+GeNBtdu4+d9Sao3
         DecZM4l5o4lSr6XqmXQIJ5T4TNtK8WQ+AeoH6Pdtfp3Di3toKyI878ij5pJmRchJWdOR
         iQPOZGzt14veUNHtc3peHK4HW9tse233INnbvOSR07PKYD2rB9XfyOOvG9lpeu9m/P1f
         4F5gndqi7kZa3ldYeNIHU9SVtrL+f3QnoakkqwmKOjMAGacmjD51jgn8FSKtv4lyPx+x
         4jJPGdMvZ0uavrT+IMdy8FvZoBopuuN4InHrCN77T8oGbn1LhkHD/OPuN8uYNSALc6UY
         KKuA==
X-Gm-Message-State: AOJu0YzlzF15V/5M6QJ1sSR/la7w+N34uNT3/d0f4fapM3r3GtIIs4xX
	xbLxVjpsVoPGpuog2CqvOAM=
X-Google-Smtp-Source: AGHT+IGNP2pZpAtLJmnr9Np23Qt3h8YDzNGMTMBeRErqYnZDanSXWZ4oGsDt2pHasl8f/J/F1MMmbw==
X-Received: by 2002:adf:d087:0:b0:320:b1e:7e6c with SMTP id y7-20020adfd087000000b003200b1e7e6cmr3764106wrh.3.1695585051315;
        Sun, 24 Sep 2023 12:50:51 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id n14-20020a5d400e000000b00321773bb933sm10020959wrp.77.2023.09.24.12.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 12:50:51 -0700 (PDT)
Date: Sun, 24 Sep 2023 21:50:49 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] staging: rtl8192e: Put kfree() to end of
 rtllib_softmac_free()
Message-ID: <85b63c62780356af91c30cc63280c5f59cd29210.1695582999.git.philipp.g.hortmann@gmail.com>
References: <cover.1695582999.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1695582999.git.philipp.g.hortmann@gmail.com>

To reverse order of initialization put kfree() to the end of
rtllib_softmac_free().

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 982578e1c0af..d3468b646ca8 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2462,8 +2462,6 @@ int rtllib_softmac_init(struct rtllib_device *ieee)
 void rtllib_softmac_free(struct rtllib_device *ieee)
 {
 	mutex_lock(&ieee->wx_mutex);
-	kfree(ieee->dot11d_info);
-	ieee->dot11d_info = NULL;
 	del_timer_sync(&ieee->associate_timer);
 
 	cancel_delayed_work_sync(&ieee->associate_retry_wq);
@@ -2476,6 +2474,9 @@ void rtllib_softmac_free(struct rtllib_device *ieee)
 	cancel_work_sync(&ieee->ips_leave_wq);
 	cancel_work_sync(&ieee->wx_sync_scan_wq);
 	cancel_work_sync(&ieee->ps_task);
+
+	kfree(ieee->dot11d_info);
+	ieee->dot11d_info = NULL;
 	mutex_unlock(&ieee->wx_mutex);
 }
 
-- 
2.42.0

