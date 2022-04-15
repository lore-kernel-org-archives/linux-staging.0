Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907C315AB;
	Fri, 15 Apr 2022 02:48:52 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id 3so5895388qkj.5;
        Thu, 14 Apr 2022 19:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8uW8HDovjcYWMlVuqX7cK2tEDuwELYOJWlsZgLOTezY=;
        b=T9pY4aJr/Tpd8Txacuo9ZZRry1/sEf67pUNRbc9AgSvFHBDXD9KgEqMqwl+/FTbSRC
         Hy6xLkqluMcBP9tB4nwS35Ztr6NKZ2fK8iWm80EBvtrIWirwHuJDeLar30ggQzlHlXOl
         4ycHils44jiXtdhQ25ZT8M8u/XCpHhXBXxn/9k/33xuhYmvGE2CbfypC6/wUvpdhoeVy
         qta80dlGApRL085+rfDV/VxmHAiAthkesg/RmYLGyLwibK0g6A4l2GJ+biooHJL5I9Dd
         Nt8wn6V74bJMdKBvk0GevW1fFpZMErgg1gkW5tWOwkrPn4fSV7fkakUPbzAphdtUuvAf
         yp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8uW8HDovjcYWMlVuqX7cK2tEDuwELYOJWlsZgLOTezY=;
        b=KSRfGSt9cW4/6MvBYZlriGPXCOTP0BnfMVpdCDfENozlcUojm27Ij/5mRh6bks2uR7
         tvdO/G4/+nJkAhPXLRbU3Kw9Sm/13aK+gbhZMHzsR4XXdxe5+pBvqmxm4blS0MzD2/9g
         +T1vckOFw1aOpxHeaijQFvyA+/pvSxAAb2hAsy8CstQ2TZx38qTs6WHFDC4/ug6P3q1Z
         hjohgH9eRZHh8qwH6bF0ODVykH2CcRnS6/c+pAF8BfGHYQB+KnJVpNpGUK0DJcdqouij
         AEDDTZcEgur549vIxTLnYkmb4K2mvTz6CZueoMJyyzCy14af9ZX2yTOuPDwY+chRm886
         mKHw==
X-Gm-Message-State: AOAM533xUXNfWq1Ul/3ByTs50N6ABwGTthM3jgNl7QIrh+IbhiMAKRLf
	+yN3nwmZ48M8WETnwyvdzNs=
X-Google-Smtp-Source: ABdhPJxBOZ/V3SpJWAh6t0TYcIQfFR8yObffl/ZuJG7zbcCFMc6wg0JEa6zEUgOsI2TfP+uJYVH7dg==
X-Received: by 2002:a05:620a:2889:b0:699:bbc5:9b4b with SMTP id j9-20020a05620a288900b00699bbc59b4bmr4202038qkp.712.1649990931638;
        Thu, 14 Apr 2022 19:48:51 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.lan ([2607:fb90:1b7a:2349:50b1:5db4:a2d5:7054])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a22a700b0069c37e2c473sm1800085qkh.94.2022.04.14.19.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 19:48:50 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	jhpark1013@gmail.com
Subject: [PATCH v2 5/6] staging: r8188eu: replace spaces with tabs
Date: Thu, 14 Apr 2022 22:48:36 -0400
Message-Id: <b65ac8696e994e44c0d7dda5b6afa14cf7b8db74.1649990500.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649990500.git.jhpark1013@gmail.com>
References: <cover.1649990500.git.jhpark1013@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use tabs instead of spaces. Issue found with checkpatch.
WARNING: suspect code indent for conditional statements

Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index d57f2ffa069e..38ae8be675c4 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -716,7 +716,7 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 			pmlmepriv->to_join = false;
 			s_ret = rtw_select_and_join_from_scanned_queue(pmlmepriv);
 			if (s_ret == _SUCCESS) {
-			     _set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
+				_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
 			} else if (s_ret == 2) { /* there is no need to wait for join */
 				_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 				rtw_indicate_connect(adapter);
-- 
2.25.1

