Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2028328E5
	for <linux-staging@lists.linux.dev>; Tue,  5 Apr 2022 12:43:39 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id j8so10775270pll.11
        for <linux-staging@lists.linux.dev>; Tue, 05 Apr 2022 05:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FkFtcq8jG36lKpEqQXtgVBWpO9PXs+dvDcrkyl4I1JE=;
        b=K3A6+NSJs8BRIGtFtREYuYGdt+I2mfbSCX/qAgVN8Llkj+IqkdCnfKCE0OmVCR0oTL
         ZuQ3c53uY19nlODYpvTvtL6e+pdMZJzomxMY2twipmZFpfCjtCvMDW6n91+hsCXCjO/9
         SEJ4wUwiPIoumxXLjQKMitubVLWNKHTeOuDRaoprMeakAxZYyQMAULiHDXdNvPtbmOLs
         UXC4VhPTrG5tTZ2mzWL9Pc7C5YqeDBJ6ZKI+Hl6AESA4BgIIrbFskHFl7AOOmGuIr4Oa
         hbMKmf5C/jKh8/gf+IzMn5ywVlKLy0IPwvSBH8P2FO1gh+Y2a3Gxsjb63cktIDXT7UNV
         oCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FkFtcq8jG36lKpEqQXtgVBWpO9PXs+dvDcrkyl4I1JE=;
        b=u5iNAkqABSv7hrrVOxQmCR81B2xY+AC4mGbKVn37RoUpdvyAXjMf/FYhlUUIFNTc96
         AOI0ALVfijZwZ2cnfWtGo7l5wXwBMlN8+uK2vtIoewL+OeNeilIPXMqUTBLJvqjG2Y1c
         EOVSj7/WAvzHFdDzYdp+QxIQxpIKIvrpkhxtU0h7x/JtL2P2OVq7dbVk0EsNEUFg46L3
         fTjY8coVR4EKCXFAIhhdM0G8MHuwgpRgpJsbmG9z4rNxbLVzLWXuDlRAsq9vDt2iGiry
         d8oD7J/KjF38ni598HkO/mBSmrlP8urxXfE+gloG/ya2zJt9btwZeR4GvAa6JeA/iMOo
         Sq2w==
X-Gm-Message-State: AOAM5318KGC8xOZuDDsBNGNYhrXscTOLQuWNspSNUSaRYMEZyRZUAHfw
	eJydB1EJRuy3fYfS9SJ9Wfc=
X-Google-Smtp-Source: ABdhPJxA7BYupDalxQpTgWbwDIy06f39XbgqEQMzEvGNOezRhIRWoxVZMoYFVgURNXmPQjcaobeYZA==
X-Received: by 2002:a17:902:f243:b0:156:b615:dd38 with SMTP id j3-20020a170902f24300b00156b615dd38mr3322253plc.174.1649162618681;
        Tue, 05 Apr 2022 05:43:38 -0700 (PDT)
Received: from vihas.localhost.com ([103.85.9.59])
        by smtp.gmail.com with ESMTPSA id nl17-20020a17090b385100b001c70883f6ccsm2760014pjb.36.2022.04.05.05.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 05:43:38 -0700 (PDT)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 1/3] staging: r8188eu: drop redundant if check in IS_MCAST
Date: Tue,  5 Apr 2022 18:12:38 +0530
Message-Id: <20220405124239.3372-2-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220405124239.3372-1-makvihas@gmail.com>
References: <20220405124239.3372-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The if check is redundant. Drop it and simplify the funciton.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/include/wifi.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index e10cf17d6..88ed6b4a0 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -244,10 +244,7 @@ enum WIFI_REG_DOMAIN {
 
 static inline bool IS_MCAST(unsigned char *da)
 {
-	if ((*da) & 0x01)
-		return true;
-	else
-		return false;
+	return (*da) & 0x01;
 }
 
 static inline unsigned char *get_da(unsigned char *pframe)
-- 
2.30.2

