Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5570572
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 11:56:23 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id r7so23297145wrs.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 04:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=agGKHzXwsFX9a4EiFCXgJQ425GBEK8BAre8y2mUmDZ4=;
        b=aBL+60Vd+Kc2YWVqZyk5e+wengD/6Vy9lfWKWfJ5dUf2P305UmeyXmAqOvovXUk7X3
         FPO+jIwvzgMGFNx5B5R8ICOq0e439hgT8mAZ38uOflWmcupckxeec9uwJ6sAwMBiktie
         ukq/porwWp6wxBicYz4C73iIVo5U2Fx6ga52XMzTUbNtqw2SkdCg0aK+lAK9ZAYoQy1h
         qTOQAIlfvndF2qGWpG6YptTpgC89nU6M0tJwDB81R/BBMMFamwPFud0gstsuZbH08GhH
         +FYnJCIqzIzVmBvxTdmmvVihy7KKIdevUBGXKAv/DKOVMrEyyZWNFgms1dRSJ7gGG1Gr
         0WpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=agGKHzXwsFX9a4EiFCXgJQ425GBEK8BAre8y2mUmDZ4=;
        b=Q9mVbV3i5c1aSMoiZgbwYPUIYcluuO8k30pJrer4OEQyO/qZEFAwSuf7o8xQTgh9OE
         GPEjA3TS9zQgRV11bfAxAsODbXTWPEULqOk22ZWycm0GKrzEcK/oH24RtIxBw9DVpbdj
         TbuPQzKIhhZkWBDyi+uNRwAes06csUET7rwyvSlDHVP5TphaVGa5sdSCRtunxVRPh/O1
         ETKBgjqujIdqRvyETJ/d2sxsfGCq0zvjKcoguEeINJAvfOl20tUtq7mlVBNns4QDYfrg
         MzBrvveq5VWNxcBsEmetkYCJvM0McQw4TR1cp2CpSFglARW/ykZKWYum/zKjrc+x9/71
         Qoxw==
X-Gm-Message-State: AOAM532N+isqmiWidJ6krP70R269I6VX10uYlf0M7ezxXj+haGcQr//s
	a8DmycARe51s8UQR8ZIb+5w=
X-Google-Smtp-Source: ABdhPJzkONR7lKqf/HSdp4DMrb00viVhYPq2RH77SbQ3eHpruUbeG+Rrk1o0vS2mQH8XgRiI/iPAQA==
X-Received: by 2002:adf:ea49:: with SMTP id j9mr11903642wrn.340.1629114981779;
        Mon, 16 Aug 2021 04:56:21 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4058])
        by smtp.gmail.com with ESMTPSA id i8sm8397107wrv.70.2021.08.16.04.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 04:56:21 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 3/4] staging: r8188eu: refactor rtw_is_cckratesonly_included()
Date: Mon, 16 Aug 2021 13:54:29 +0200
Message-Id: <20210816115430.28264-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816115430.28264-1-straube.linux@gmail.com>
References: <20210816115430.28264-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor function rtw_is_cckratesonly_included(). Improves readability
and slightly reduces object file size.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v1 -> v2
Refactored to more compact code as suggested by Joe Perches.

 drivers/staging/r8188eu/core/rtw_ieee80211.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index 53556f1af425..b1427e70cdf7 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -82,13 +82,11 @@ bool rtw_is_cckrates_included(u8 *rate)
 
 uint	rtw_is_cckratesonly_included(u8 *rate)
 {
-	u32 i = 0;
+	u8 r;
 
-	while (rate[i] != 0) {
-		if  ((((rate[i]) & 0x7f) != 2) && (((rate[i]) & 0x7f) != 4) &&
-		     (((rate[i]) & 0x7f) != 11)  && (((rate[i]) & 0x7f) != 22))
+	while ((r = *rate++ & 0x7f)) {
+		if (r != 2 && r != 4 && r != 11 && r != 22)
 			return false;
-		i++;
 	}
 
 	return true;
-- 
2.32.0

