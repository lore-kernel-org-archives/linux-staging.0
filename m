Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36B53FC8
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:05:43 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id u15so10386186wru.6
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z9p8PF9NWhXYm8/vlVRzN1zo7iSWjHxunaq2fDG+51w=;
        b=euKolRSbJmoASMOC8bo1KU69hczNJsHCAzssV/W/1/ZtHgEAsYBbVvrvDPcnNJnizz
         JnzUvkPIsN2DipdHxsdEzPVxhA5MsyPtejeDV5QHvBw6QHT/Wp4zuKljqupD+vKwAobB
         m64KwTKP+2Jj8DzHDVGU8IZMAhjwJMNrmv9dLWH8IJTaLMgajF7neqFdSrQTeatylWJS
         uEJSYwy8Vxx6J/IKJo2jlC/1NSYH6dp9I4Zvy1sK4SmuPdkqMs8wRUVyx1MBvxcIhgCE
         KBUIx2HUL22mmamvRNCeEuROnuFMj8SkdH+46jKUivaFXDMnszVvwMYssTjAjw7ECg/g
         T5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z9p8PF9NWhXYm8/vlVRzN1zo7iSWjHxunaq2fDG+51w=;
        b=1Rk+d82K7IFlezxFocViiCJyQU8xk6sjcWuB9ILQTVM3BmBGnPw4UeKX1nC2VZiDXP
         ke98K3JpBz+i4gZgpnCvUKVkpme0OjKXAV9D7cZwa0O7l0uK3PeIhWmAyCPTKd16WVT9
         nbyhBN/PdapQi0AzF0M/waHSgxj115aEuOw/hT5KvAnYu7oeOXpnr2ZBBWweVRq3Ng8y
         /vObGdGWC3JTpy6ovs5o8YTQExd1VD9Khnza+ppdMl2VfjThe/Wakkcf8NqN+Ft5/3Wo
         LVnzdZtudH0cxsVkMKEV2XWLvfKkQV28kTPFplUk1VB0Bwn8vagjqIMb85xl9Vhed3pi
         XOvQ==
X-Gm-Message-State: AOAM5313WdtqWmDn/jygokOI6i8OpIlaMTHO/YGY+VXkFIQGXWZxj27d
	db+aLQa2DO0LEnjwqkh+suw=
X-Google-Smtp-Source: ABdhPJw27EckKV9yUXXiyXaaGPA7XRo2epd7DDvuT3XA/oo3cbVcadPzqIqqG07WdXpt/F2HJ5lzvw==
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr937374wrr.278.1632341142496;
        Wed, 22 Sep 2021 13:05:42 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:05:42 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 17/47] staging: r8188eu: remove rtw_freq2ch()
Date: Wed, 22 Sep 2021 22:03:50 +0200
Message-Id: <20210922200420.9693-18-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922200420.9693-1-straube.linux@gmail.com>
References: <20210922200420.9693-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_freq2ch() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_rf.c    | 17 -----------------
 drivers/staging/r8188eu/include/rtw_rf.h |  1 -
 2 files changed, 18 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_rf.c b/drivers/staging/r8188eu/core/rtw_rf.c
index 321546c40446..2ec56012516e 100644
--- a/drivers/staging/r8188eu/core/rtw_rf.c
+++ b/drivers/staging/r8188eu/core/rtw_rf.c
@@ -53,20 +53,3 @@ u32 rtw_ch2freq(u32 channel)
 
 	return freq;
 }
-
-u32 rtw_freq2ch(u32 freq)
-{
-	u8	i;
-	u32	ch = 0;
-
-	for (i = 0; i < ch_freq_map_num; i++) {
-		if (freq == ch_freq_map[i].frequency) {
-			ch = ch_freq_map[i].channel;
-				break;
-		}
-	}
-	if (i == ch_freq_map_num)
-		ch = 1;
-
-	return ch;
-}
diff --git a/drivers/staging/r8188eu/include/rtw_rf.h b/drivers/staging/r8188eu/include/rtw_rf.h
index 48129da9c93f..fadb141c6945 100644
--- a/drivers/staging/r8188eu/include/rtw_rf.h
+++ b/drivers/staging/r8188eu/include/rtw_rf.h
@@ -121,6 +121,5 @@ enum rt_rf_type_def {
 };
 
 u32 rtw_ch2freq(u32 ch);
-u32 rtw_freq2ch(u32 freq);
 
 #endif /* _RTL8711_RF_H_ */
-- 
2.33.0

