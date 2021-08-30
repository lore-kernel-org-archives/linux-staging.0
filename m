Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900883FC3
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 12:15:46 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id d22-20020a1c1d16000000b002e7777970f0so14524524wmd.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 05:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7HirnwGNf7jyImc4ZKCsenDbRLWYzFjlPI/Sq6s9Xg8=;
        b=UFvBRBSmv4S7/WfQHzjLKHvB9xm1czJJ7wCtAi0G2eBu94+12fvx3bWNl/Y/W0GM5+
         z/gtmQ+N3UWRtSohOLkiJWPW+E4n/V92lIbQqJF2s6aadlULKpCJDAua0xV4jeD06bdO
         2VL3plu7i31ieC2VBBErzkbuMJf9GK+wb3QjcxGSsYdGoprG3YQZDZpxv05uU3a1rTRv
         xCVF+pHOoim8QRhjGohb4qRtR5oswq19D8yo5ywmAxi+Ki0mOOawgaW6+VHp3TOooj+s
         dqVquwbu/Ul1SjEV74YGoAEgbRNH2IPcqCqmdpd99TkDgrab5OfRL2gqmN0b2qO76xKR
         lkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7HirnwGNf7jyImc4ZKCsenDbRLWYzFjlPI/Sq6s9Xg8=;
        b=tmUBdYYKxx8XXkx7ZsT25DVgMUeMfZDv/4UradZ8jZw0g0bmW3trJTvb18n/MxDedY
         HeZAvWzn38zTUlLG4D0Mr5A18gP0J+q1IDg0EqWYH1wjf9skDHlKkpSlOwbkHgOM/EHi
         YBOZzOdPP3ZP9XRK0c3ChC2N7wLhdQoXozgrbczTP1R9/8snVHqjhFtVPJcHYWjBCibr
         Y3oyYznHmHmi0UR8xXZbcqFvL+kA3TLyWe8aaiD/zOYzTCrXSWyZ8KGcTulHLYWN56/a
         mpmCihN59BeHC5n2ThtPIMM/aTMOx/I5BVX7eH53xL44Xp7XQiEPs/l2UGWKKehxiAKj
         7PwA==
X-Gm-Message-State: AOAM530krOu59VaoRoszPqnoPoTo8xYQiulzoj0EYLSkyGXMgaxwgNwq
	LNN4MczKssW96eAiNn3xADI=
X-Google-Smtp-Source: ABdhPJyGecg1TI9i5bdRoPpRqAix6J9TFzwP+pYBLhOXDX/8ukPB+18iFtXB7gNeNTQgI4bsPf2DvQ==
X-Received: by 2002:a05:600c:298:: with SMTP id 24mr31638529wmk.172.1630325745115;
        Mon, 30 Aug 2021 05:15:45 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with ESMTPSA id x11sm15492116wro.83.2021.08.30.05.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 05:15:44 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 4/8] staging: r8188eu: use is_*_ether_addr() in rtw_macaddr_cfg()
Date: Mon, 30 Aug 2021 14:15:04 +0200
Message-Id: <20210830121508.6411-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210830121508.6411-1-straube.linux@gmail.com>
References: <20210830121508.6411-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use is_broadcast_ether_addr() and is_zero_ether_addr() in
rtw_macaddr_cfg(). The buffer is properly aligned.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ieee80211.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index 205798b76cf9..35a548e1c92e 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -1032,10 +1032,7 @@ void rtw_macaddr_cfg(u8 *mac_addr)
 		memcpy(mac, mac_addr, ETH_ALEN);
 	}
 
-	if (((mac[0] == 0xff) && (mac[1] == 0xff) && (mac[2] == 0xff) &&
-	     (mac[3] == 0xff) && (mac[4] == 0xff) && (mac[5] == 0xff)) ||
-	    ((mac[0] == 0x0) && (mac[1] == 0x0) && (mac[2] == 0x0) &&
-	     (mac[3] == 0x0) && (mac[4] == 0x0) && (mac[5] == 0x0))) {
+	if (is_broadcast_ether_addr(mac) || is_zero_ether_addr(mac)) {
 		mac[0] = 0x00;
 		mac[1] = 0xe0;
 		mac[2] = 0x4c;
-- 
2.33.0

