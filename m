Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC9472
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 17:08:47 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id m25-20020a7bcb99000000b002e751bcb5dbso6497732wmi.5
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 10:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4vE/Cb1JpypKyZ8g1mn3fwNhnyQED17T1jZXZclaen0=;
        b=nM49oPSgWF18YFAWypKALIlbBPhBuDeFQX7dH6/7z1QEjuc67BmwoFQilAZNUTYLQQ
         OqkWu6GiP1zXBsZYwKOZk4+3ygtblnuzSJlX2xElbW68mAHg+I3MejBDRhmg5IYvLQhn
         u6MoUToSXjevN4unPUIAQHTkBjDG4m8Mylid6tMh3YjeVndNQV7ukR132we1RH7oq3pO
         I6fKEzO3JuHiSzRSpZJqGqMXSbM34NmKB+JvhJHas7SAKpTRonVR2oK8wgauk+38EmQF
         XBeU3O79/vTRaN9MJspRHJtA1NUbAV++JrJom/iYQxtvA3/UFN1cwOcXgqrriEi9LVC9
         2L6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4vE/Cb1JpypKyZ8g1mn3fwNhnyQED17T1jZXZclaen0=;
        b=Q2dDVO/74qCpBemY4uxvGUsjXAHOrzZie/jfb6vsKRFOQYlcSS6DjDlDirNORh/1li
         EAzOe47qmNj3hxoXLsUIjn3Ohtp9plFVi7vb8px2B4A+rJxlkOGw5c7zHYqgLumRBt4f
         1u4aHvId6me7j/+iiSP1RYT8x7RRgzwwjtYeEu/RUfMKnuI/0h0iJvxKxeyxZ4O9tiSr
         u2LpfEdXfou67/hQb14iyiiDFQkpACDYHlvrzjwIf+zqh/dvWWptEuZ9wumyPePQMNub
         aM9Rjfc6ZFJpVBlG61Mkwqw87gRnqAbkmabB0FmgLcwMcJ17wbcHX1IwHLXSqWKpjQzn
         zXQg==
X-Gm-Message-State: AOAM532M4VYw40owZOy9JKHJ6OYLKTY+0Ve0hLDqBvYAKoydYG+vQ2o6
	X5kmbvcEa2KGukOYmlSE1sc=
X-Google-Smtp-Source: ABdhPJwVydkeaDGl7YASlJQG4eND6KNdkuHPcjB7feaFFi+aaIvjTnAmBB+uEVJwMBfUHsI8gnnUIg==
X-Received: by 2002:a1c:19c1:: with SMTP id 184mr25408435wmz.98.1630170525567;
        Sat, 28 Aug 2021 10:08:45 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::884b])
        by smtp.gmail.com with ESMTPSA id u10sm10046515wrt.14.2021.08.28.10.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 10:08:45 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/2] staging: r8188eu: remove rtl8188e_PHY_ConfigRFWithHeaderFile()
Date: Sat, 28 Aug 2021 19:08:33 +0200
Message-Id: <20210828170834.31388-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtl8188e_PHY_ConfigRFWithHeaderFile() is not implemented,
remove the declaration from Hal8188EPhyCfg.h.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/Hal8188EPhyCfg.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
index 4370ec2fa981..d15ff69b8485 100644
--- a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
+++ b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
@@ -188,8 +188,6 @@ int PHY_RFConfig8188E(struct adapter *adapter);
 /* RF config */
 int rtl8188e_PHY_ConfigRFWithParaFile(struct adapter *adapter, u8 *filename,
 				      enum rf_radio_path rfpath);
-int rtl8188e_PHY_ConfigRFWithHeaderFile(struct adapter *adapter,
-					enum rf_radio_path rfpath);
 
 /* Read initi reg value for tx power setting. */
 void rtl8192c_PHY_GetHWRegOriginalValue(struct adapter *adapter);
-- 
2.32.0

