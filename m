Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E177772
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 11:56:21 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id c8-20020a7bc008000000b002e6e462e95fso2023602wmb.2
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 04:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0HTFZgPJwMw3m+NDpRFzFTHJifno56RCYHQ1tpb2p/Q=;
        b=QEMihH3I0fCKzx7fMW36Fp8CRu4lmR8R/0UbWhpSoMZ8WLLhDnTshnxldeLZMF/NJU
         4GTjNampN0DIaMoyTws7AMT1b2nYdIabbS7TXhquB7NQiDSo3TTa1sppdc4iqXKCxHDU
         RqFV/ei59JYMgVMAfCNVVyB2qQ83RVTp1a6utUU/xv7dl/rdp7MeKaUw/fkvH8CgfEy5
         3k2Pfw941cy7/hzzMEq5UR7ylHeYFwAta96krzv+m00HFeGn1AC0bBxGNXq6cyyKLE8Q
         imkw64VJRfpXfZEn53YvYrQzt18mcmS1Gdqq0cS8qrpSv+snq5bB+1mrzhj/qMKh21ly
         FutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0HTFZgPJwMw3m+NDpRFzFTHJifno56RCYHQ1tpb2p/Q=;
        b=cyz7Ah7bQN/fjaBuoeesCs0ACvDKAWeC+/g89dRGANqdZEGcyZM84aaWmdrJm+pVYP
         zZgkvIyzbgTlcVuYSg/7ok4A+V9wfoc6bDaenGVaked3qqv1NKVYBda7kT6qPna70uVJ
         ksHdJ2yle0cGGTVMF0eOsJTKsl+A5YV+bIegEj8R9cCGFOuXp5JQlfTXDCsYxqAtDOGe
         HV09zsJ1MwJQiwgNh0Wxlqyubu08yMo/nVqwuEYXHEbKbP7QoNj8px/AI/z8qk5YsBr/
         2GgxGcmtsYE0sglSNp8D4a3r4xdzzYPJoD3awVgzrVs8CNNGTj/CWs7b4IouBEjKplZL
         cbOw==
X-Gm-Message-State: AOAM530DjPfoRPFiQ4vQKgI6W5h8jU9yjNYfpHi3OR6DGQOJroFg6/qT
	CTU7KNtFmTCUtjYz71UmEU0=
X-Google-Smtp-Source: ABdhPJw0bdEBGQeTVAktmdowqmzKg6bsEIBaWWNA+NtW91P0jjQWSmCBlNG+aQUNOro5wwhCXYiesQ==
X-Received: by 2002:a1c:1d13:: with SMTP id d19mr15003573wmd.135.1629114980359;
        Mon, 16 Aug 2021 04:56:20 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4058])
        by smtp.gmail.com with ESMTPSA id i8sm8397107wrv.70.2021.08.16.04.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 04:56:20 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 2/4] staging: r8188eu: convert rtw_is_cckrates_included() to bool
Date: Mon, 16 Aug 2021 13:54:28 +0200
Message-Id: <20210816115430.28264-2-straube.linux@gmail.com>
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

Function rtw_is_cckrates_included() returns boolean values.
Change the return type to bool to reflect this.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v1 -> v2
Rewritten to apply with v2 of patch 1/4.

 drivers/staging/r8188eu/core/rtw_ieee80211.c | 2 +-
 drivers/staging/r8188eu/include/ieee80211.h  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index 964255a8c778..53556f1af425 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -68,7 +68,7 @@ int rtw_get_bit_value_from_ieee_value(u8 val)
 	return 0;
 }
 
-uint	rtw_is_cckrates_included(u8 *rate)
+bool rtw_is_cckrates_included(u8 *rate)
 {
 	u8 r;
 
diff --git a/drivers/staging/r8188eu/include/ieee80211.h b/drivers/staging/r8188eu/include/ieee80211.h
index bc5b030e9c40..cbefd7af1d4f 100644
--- a/drivers/staging/r8188eu/include/ieee80211.h
+++ b/drivers/staging/r8188eu/include/ieee80211.h
@@ -1206,7 +1206,7 @@ int rtw_generate_ie(struct registry_priv *pregistrypriv);
 
 int rtw_get_bit_value_from_ieee_value(u8 val);
 
-uint	rtw_is_cckrates_included(u8 *rate);
+bool rtw_is_cckrates_included(u8 *rate);
 
 uint	rtw_is_cckratesonly_included(u8 *rate);
 
-- 
2.32.0

