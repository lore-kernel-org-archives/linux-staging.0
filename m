Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D10371
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 10:20:39 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id l4so25000677ejc.10
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 03:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dvmfAjhAD75vFCCwV7Fr+IU7OY4E5qiwJqveL+UcwEs=;
        b=uMlyqifqVFl76a2qS3JaTbUAuKVxnmP7ZjDUGoO5A0rDRibyZhWKK67CzIe1nABH4k
         WdY7wMIRIJoJrGZ9Vw7QIYvlgEwJfba85e+uM1Ycqpf2ZOBN7d9iuCZ0QhpozpDeJnCb
         /Qk2a1GYoH9/53XjiYhCfWhVz4WammPeG120HKy4wdPcoRl5vChyp3RSMykGxmSpzG5V
         GD8RIvY6l61Wik3G2ZZ7C5Wcmd/CUjkwrKhr5KtjcvqHTfGYwPmSw0WFyJ53pvIMsh2g
         LSmFprisskPRKpQ2qbQAEYXDiI190annCbYAaW0MUGCu+KHuOCpbfMu/YKTGx7t/qecm
         IstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dvmfAjhAD75vFCCwV7Fr+IU7OY4E5qiwJqveL+UcwEs=;
        b=ouAQtlL3gdOj6bU0Q/gVWeLSbuKhOfBLrPkdrAMLuLbJa/rv6jod28mfPQ5t2KTXbl
         87SfUFuKXsS34IwLkm2PX6/3k27pWE3GUXaWGDCcOZKA7weGDs3boiimMKS5ga5qFrtU
         3f6Vq88zJ+/sSCs2p/epaVQnkYQYjUKCyZxB0uOBJz1lB1pch2zySubmozXI9jfR8SN7
         TO4BYCAZMH8coXMPdg2b4z9uiyD852X+wfujaeKUrbbGkfEE0A8lKkgnXl8N37CMOnFq
         c7gojhZSvuRdRtqGRGYtG0Zk7H5gX2g+vfhhxbVaDrhc6EfKB1zFdX3goZ/EyZnw59Gs
         gycA==
X-Gm-Message-State: AOAM53197rVogn9iv7acCzx/zXXTtw5BrQVQA0l25GmXgjOEq/oJmQz/
	jO3aDa2SscnJPLk3km0Ym6w=
X-Google-Smtp-Source: ABdhPJzin6vzUy5rdpSDcOnbdYH95QlRx4lImMz+KTL6dlF1CZSYA7oX8krfgbzocjXLwfFkscU9qQ==
X-Received: by 2002:a17:906:524f:: with SMTP id y15mr31008850ejm.65.1618309237743;
        Tue, 13 Apr 2021 03:20:37 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id y6sm7496565ejw.83.2021.04.13.03.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 03:20:37 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy patch] [PATCH] staging: rtl8188eu: Move channel_table away from rtw_mlme_ext.h
Date: Tue, 13 Apr 2021 12:20:33 +0200
Message-Id: <20210413102033.24781-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Moved "static const struct channel_table[]" from include/rtw_mlme_ext.h
to core/rtw_ioctl_set.c because the latter is the only file that uses
that array of struct(s) in the whole driver. "make rtl8188eu/ W=1" output
several warnings about "'channel_table' defined but not used
[-Wunused-const-variable=]".

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/rtl8188eu/core/rtw_ioctl_set.c   | 8 ++++++++
 drivers/staging/rtl8188eu/include/rtw_mlme_ext.h | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c b/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c
index 1ef32ff900a9..17b999f45132 100644
--- a/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c
@@ -11,6 +11,14 @@
 #include <rtw_ioctl_set.h>
 #include <hal_intf.h>
 
+static const struct {
+        int channel_plan;
+        char *name;
+} channel_table[] = { { RT_CHANNEL_DOMAIN_FCC, "US" },
+        { RT_CHANNEL_DOMAIN_ETSI, "EU" },
+        { RT_CHANNEL_DOMAIN_MKK, "JP" },
+        { RT_CHANNEL_DOMAIN_CHINA, "CN"} };
+
 extern void indicate_wx_scan_complete_event(struct adapter *padapter);
 
 u8 rtw_do_join(struct adapter *padapter)
diff --git a/drivers/staging/rtl8188eu/include/rtw_mlme_ext.h b/drivers/staging/rtl8188eu/include/rtw_mlme_ext.h
index 77eb5e3ef172..03d55eb7dc16 100644
--- a/drivers/staging/rtl8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8188eu/include/rtw_mlme_ext.h
@@ -171,14 +171,6 @@ struct rt_channel_plan_map {
 	unsigned char	Index2G;
 };
 
-static const struct {
-	int channel_plan;
-	char *name;
-} channel_table[] = { { RT_CHANNEL_DOMAIN_FCC, "US" },
-	{ RT_CHANNEL_DOMAIN_ETSI, "EU" },
-	{ RT_CHANNEL_DOMAIN_MKK, "JP" },
-	{ RT_CHANNEL_DOMAIN_CHINA, "CN"} };
-
 enum Associated_AP {
 	atherosAP	= 0,
 	broadcomAP	= 1,
-- 
2.31.1

