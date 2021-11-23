Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501542C81
	for <linux-staging@lists.linux.dev>; Tue, 23 Nov 2021 23:26:29 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id x5so844479pfr.0
        for <linux-staging@lists.linux.dev>; Tue, 23 Nov 2021 15:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mlAFOYJJELBcb2TVaSzn/i78GajJV1vHST7kCQwulgU=;
        b=DieFE11Nad3azkwEymKNvMKGZ3b+ZHRUWsngy8vvj2ED0Yk4A2eJDOHTFlFrshjVs0
         NIGQzlpCfARFgpgIuuOZKGg5O741HN8Qzf217JFFVN+sti4KniZpHNTtFnZ2xkLp5sAb
         mNFCj1xHOrvJ3UsLbnu8PjWLz/rQ0ix1TfmL26zGgcA+s3C6sxDjvDLY6PWmq+iuTBog
         vE6nQBBxZydWlTgny1MEb35wDMQlGqNajdMe/nQTngKqk/1bviayapOD6bVBJkOVqk8g
         Enmf4X7wIe/DfzLB6iCpeiWxF3gDwlJvtahMh98MuYqbqeox7ufvhGxVy4tE6gsgcQ0T
         5pBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mlAFOYJJELBcb2TVaSzn/i78GajJV1vHST7kCQwulgU=;
        b=jv5YFKWBpKkXGfaO09iwa3sG3rtFO33cRzAEz4NCcNKkW2aHeD2JukPPyTwwulnUE9
         Y3PqJDCT6Q5K8uc1Xev0xXpu6RqFVZT+knBxu4mN2xozpWMF23FRNNn3wsHmLDeWF6c7
         HKqo1fXMNY5/+f7+6iWHIMfOPVzSH87xNGJPQEgkHbNopwlNfVHgeqjQHM63bzn4ZfR1
         y8WlJy8l8omkse+KnxETmEDzWFKThzjgooVqBmTeXZ1VWf8GZRHkJn4xDs60DCJ/IyBy
         t6Vqq2c1F2n4EbQfQAGrLqHwvfCWbOQFBC+6Yns18PeyP8bDk3HCtKI0C+PuAXX4wpLy
         Qm7Q==
X-Gm-Message-State: AOAM530rFKo7Tthsa8BJ2Ho7dWHbxJgY3I6fk6kDi78ZzsKG9ZJHkmED
	QrBuAkhcMFZgL8Uqa4IuK0w=
X-Google-Smtp-Source: ABdhPJz6TO98H/bXryOdnUQ39IAWQaxdaWdZ3g3ByBdhJl8GGkGbluL6kuPwxpTXutnC4hKSMvlE1g==
X-Received: by 2002:a63:914a:: with SMTP id l71mr6407376pge.224.1637709988846;
        Tue, 23 Nov 2021 15:26:28 -0800 (PST)
Received: from localhost.localdomain ([103.85.8.147])
        by smtp.gmail.com with ESMTPSA id r16sm2632037pgk.45.2021.11.23.15.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 15:26:28 -0800 (PST)
From: Vihas Mak <makvihas@gmail.com>
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk
Cc: gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	nathan@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Mak <makvihas@gmail.com>
Subject: [PATCH] staging: r8188eu: use max() and min() macros
Date: Wed, 24 Nov 2021 04:55:51 +0530
Message-Id: <20211123232551.210016-1-makvihas@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

use max() and min() macros to fix following cocci warnings:

	drivers/staging/r8188eu/core/rtw_wlan_util.c:719: WARNING opportunity for min()
	drivers/staging/r8188eu/core/rtw_wlan_util.c:724: WARNING opportunity for max()

Signed-off-by: Vihas Mak <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index 6d4e21a16783..d8fc54cc2389 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -716,15 +716,11 @@ void HT_caps_handler(struct adapter *padapter, struct ndis_802_11_var_ie *pIE)
 			pmlmeinfo->HT_caps.u.HT_cap[i] &= (pIE->data[i]);
 		} else {
 			/* modify from  fw by Thomas 2010/11/17 */
-			if ((pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & 0x3) > (pIE->data[i] & 0x3))
-				max_AMPDU_len = (pIE->data[i] & 0x3);
-			else
-				max_AMPDU_len = (pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & 0x3);
-
-			if ((pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & 0x1c) > (pIE->data[i] & 0x1c))
-				min_MPDU_spacing = (pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & 0x1c);
-			else
-				min_MPDU_spacing = (pIE->data[i] & 0x1c);
+			max_AMPDU_len = min(pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & 0x3,
+						pIE->data[i] & 0x3);
+
+			min_MPDU_spacing = max(pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & 0x1c,
+							pIE->data[i] & 0x1c);
 
 			pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para = max_AMPDU_len | min_MPDU_spacing;
 		}
-- 
2.25.1

