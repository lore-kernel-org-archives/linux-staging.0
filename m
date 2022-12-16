Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BC52F2A
	for <linux-staging@lists.linux.dev>; Fri, 16 Dec 2022 22:39:48 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id fa4-20020a17090af0c400b002198d1328a0so9632979pjb.0
        for <linux-staging@lists.linux.dev>; Fri, 16 Dec 2022 14:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yjEe+X5ai3YWKYGRZlLXYmobd2SS86iVTcoqGfxRbbE=;
        b=VxNX8eyUQb3zZYlBnW5S7ZI9VykZHgS/jkDy6zng5xEZH1jF944iWMGoR7xFVzypd0
         rp/quzNibbqoxoDA0w7J8iTZyo8E3Rg8sC0J2Caee84D+8O6z5vXhVDPDC+7u7LXUVfG
         cKEA9NX5mxAaMraVmZ3TrZ3f4Mqw5eMZH4IePswnc7lAeq+sWoSHKztSgWjGsTXrX9CW
         +VgZZSFJlH6ItJTF1w2EAuVcch7aW7wDAdksgmATtt7X83KFRiQ7k4CvFuqBvNMTdm4G
         v1aj0MIiSeFxjXHVt5M7f+rpwk41w3q6IUpfFUXwi5lYEAjQA6tCTmBmEadbB1B9K5R3
         Y+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjEe+X5ai3YWKYGRZlLXYmobd2SS86iVTcoqGfxRbbE=;
        b=CUs2sYxuOS4T+jNTQtlecE2sWvNJKwOncxcbww1zkowwTbXFVyTDpWtBPKvPm0+4sW
         JZQCM4ipKQydQYdzMwu9DP1TieJDMpRKvMlC43D00sDhE9kQMIEt/viWWC2ptDqZh6hB
         5zLeTxv+WjhxkZlbMuDhD7RmSvGnJrDABFW63PWow0aLdPdYtzHNz7iJ0pni8TYGR1zo
         ZHEvL1qXSJUPju0iVQTQQgJp9RMY5LKGCtSDhMw+ooRZ6TEB/zzL7S3EbG06BSKgEG7u
         db+nX4VX30h/xpX5vuToz/Eel6gnseyJZDtwhF1fXfCLtnzqgUtSi4NkxmOARrTj45nT
         Ui7Q==
X-Gm-Message-State: ANoB5plMXVTCfprL93/KNgMNgB1J/DAuMDLIQwNibvRxr5+n+j4IDeLH
	apsV6CRMtDeS1YY1Pcp9SIY=
X-Google-Smtp-Source: AA0mqf75zoe5LtK8gvuEH7ivaB6zaeayqoUteJTi3v5FfVT5ebMwlMi+8LF+ABC/TBzztgGUhjHY6w==
X-Received: by 2002:a17:902:b093:b0:189:dcc3:e4a1 with SMTP id p19-20020a170902b09300b00189dcc3e4a1mr31886523plr.9.1671230388169;
        Fri, 16 Dec 2022 14:39:48 -0800 (PST)
Received: from localhost.localdomain ([14.5.161.132])
        by smtp.gmail.com with ESMTPSA id h14-20020a170902f7ce00b00189c93ce5easm2107031plw.166.2022.12.16.14.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 14:39:47 -0800 (PST)
From: Kang Minchul <tegongkang@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>
Cc: Pavel Skripkin <paskripkin@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kang Minchul <tegongkang@gmail.com>
Subject: [PATCH] staging: r8188eu: Prefer kcalloc over kzalloc
Date: Sat, 17 Dec 2022 07:39:42 +0900
Message-Id: <20221216223942.334221-1-tegongkang@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed following checkpatch.pl warning:
 * WARNING: Prefer kcalloc over kzalloc with multiply

Instead of specifying (number of bytes) * (size) as arugment
in kzalloc, prefer kcalloc.

Signed-off-by: Kang Minchul <tegongkang@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 34494f08c0cd..36ce1e3f9c81 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -1564,7 +1564,7 @@ int rtw_alloc_hwxmits(struct adapter *padapter)
 
 	pxmitpriv->hwxmit_entry = HWXMIT_ENTRY;
 
-	pxmitpriv->hwxmits = kzalloc(sizeof(struct hw_xmit) * pxmitpriv->hwxmit_entry, GFP_KERNEL);
+	pxmitpriv->hwxmits = kcalloc(pxmitpriv->hwxmit_entry, sizeof(struct hw_xmit), GFP_KERNEL);
 	if (!pxmitpriv->hwxmits)
 		return -ENOMEM;
 
-- 
2.34.1

