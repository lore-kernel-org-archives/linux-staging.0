Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB58A2C80
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 16:37:58 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id w20so2651080plq.12
        for <linux-staging@lists.linux.dev>; Wed, 09 Feb 2022 08:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MsEXiVlyQb6Rm4U4ImPG8xi1NQSKn3tPJmrja66493o=;
        b=Xym9iKiOnlUqKPHInpa8dBWlr8LoDSRrsYo66erdAECO2T2FbcwrAEcUxbWYq9ERjh
         DNKaBNuXdWjvV/LW4unjf4bBwved8dN77s8seRo6nC6tYjDZnzq8EIWjA+npHUDH23f3
         GhEyla7E6z/KhqLQUpIB0hdIH6mVu7bOXGo4MvSdhD54ou4M9b2LULFIgVxG7F8UKy7u
         +K+rSGSyif5CuxOEBGn/OaElsGDBOllEN8NZTArAKNma9AdWn7Rco0+prwTyfxliy65F
         uPfaGcWU8adUVmCjP56hRULk2ThGW2dlmXPFaT0r4GJGy9lXYxn50fPgDPmKm/uj8VRk
         oqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MsEXiVlyQb6Rm4U4ImPG8xi1NQSKn3tPJmrja66493o=;
        b=xMgq+azLtc01zgf1VfabJcq2smW11yUdbHU8PYAHyHFunjEIuUnDENg9zKQUFM7vn9
         xQfwEn1KlB827JMJSuNbKtuzZDZ3EFTKQBL+cDQuHQI2fQx7HaTUAnfZC0tKJbMaGSHa
         my7yXox5wDCx4sS98I1nJVr6Re3b522+/CtWOBEItuk6bSP2GqiSxSlUkjcb+3+LEBby
         Cdgp7BcX1cJdu/FoMOfVHo8p/p5IxDIKJu/L6SIRCjfmCOpPvBoVapo20oJ0gC5/s38g
         dkGD7l9UhPDeM4OU7T/OSQoX5u4mklsRhphaHmt2hfDda/N7lPgB4FN63aQwdlXyw5KS
         l0xA==
X-Gm-Message-State: AOAM5320IgDdVBiE3vut9nWgiXVoHsGeDlRCqw+wGa6qzWC5A+wo5lY8
	yF8gdG4JFzteILOHUxXJvGE=
X-Google-Smtp-Source: ABdhPJx6Vmie0LmAh8ASZ7G3tayhzdbM2ZCtfC7iiNPLS9M6lm3sFbvVWDEyfepwGoLdE4ddcoEVFA==
X-Received: by 2002:a17:902:b789:: with SMTP id e9mr2943646pls.31.1644424678416;
        Wed, 09 Feb 2022 08:37:58 -0800 (PST)
Received: from localhost.localdomain ([122.164.186.156])
        by smtp.googlemail.com with ESMTPSA id kb18sm7840199pjb.30.2022.02.09.08.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 08:37:57 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Abdun Nihaal <abdun.nihaal@gmail.com>
Subject: [PATCH 9/9] staging: r8188eu: remove unused macros in sta_info.h
Date: Wed,  9 Feb 2022 22:06:07 +0530
Message-Id: <c2453078b2d46119d167f2d0e4690cc87fc4b77e.1644422181.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1644422181.git.abdun.nihaal@gmail.com>
References: <cover.1644422181.git.abdun.nihaal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of the sta_* and STA_* macros are not used.
Remove those unused macros.

Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/include/sta_info.h | 46 ----------------------
 1 file changed, 46 deletions(-)

diff --git a/drivers/staging/r8188eu/include/sta_info.h b/drivers/staging/r8188eu/include/sta_info.h
index 24b1254310b2..874db17df8bd 100644
--- a/drivers/staging/r8188eu/include/sta_info.h
+++ b/drivers/staging/r8188eu/include/sta_info.h
@@ -210,53 +210,24 @@ struct sta_info {
 	+ sta->sta_stats.rx_ctrl_pkts \
 	+ sta->sta_stats.rx_data_pkts)
 
-#define sta_last_rx_pkts(sta) \
-	(sta->sta_stats.last_rx_mgnt_pkts \
-	+ sta->sta_stats.last_rx_ctrl_pkts \
-	+ sta->sta_stats.last_rx_data_pkts)
-
 #define sta_rx_data_pkts(sta) \
 	(sta->sta_stats.rx_data_pkts)
 
 #define sta_last_rx_data_pkts(sta) \
 	(sta->sta_stats.last_rx_data_pkts)
 
-#define sta_rx_mgnt_pkts(sta) \
-	(sta->sta_stats.rx_mgnt_pkts)
-
-#define sta_last_rx_mgnt_pkts(sta) \
-	(sta->sta_stats.last_rx_mgnt_pkts)
-
 #define sta_rx_beacon_pkts(sta) \
 	(sta->sta_stats.rx_beacon_pkts)
 
 #define sta_last_rx_beacon_pkts(sta) \
 	(sta->sta_stats.last_rx_beacon_pkts)
 
-#define sta_rx_probereq_pkts(sta) \
-	(sta->sta_stats.rx_probereq_pkts)
-
-#define sta_last_rx_probereq_pkts(sta) \
-	(sta->sta_stats.last_rx_probereq_pkts)
-
 #define sta_rx_probersp_pkts(sta) \
 	(sta->sta_stats.rx_probersp_pkts)
 
 #define sta_last_rx_probersp_pkts(sta) \
 	(sta->sta_stats.last_rx_probersp_pkts)
 
-#define sta_rx_probersp_bm_pkts(sta) \
-	(sta->sta_stats.rx_probersp_bm_pkts)
-
-#define sta_last_rx_probersp_bm_pkts(sta) \
-	(sta->sta_stats.last_rx_probersp_bm_pkts)
-
-#define sta_rx_probersp_uo_pkts(sta) \
-	(sta->sta_stats.rx_probersp_uo_pkts)
-
-#define sta_last_rx_probersp_uo_pkts(sta) \
-	(sta->sta_stats.last_rx_probersp_uo_pkts)
-
 #define sta_update_last_rx_pkts(sta) \
 do { \
 	sta->sta_stats.last_rx_mgnt_pkts = sta->sta_stats.rx_mgnt_pkts; \
@@ -269,23 +240,6 @@ do { \
 	sta->sta_stats.last_rx_data_pkts = sta->sta_stats.rx_data_pkts; \
 } while (0)
 
-#define STA_RX_PKTS_ARG(sta) \
-	sta->sta_stats.rx_mgnt_pkts \
-	, sta->sta_stats.rx_ctrl_pkts \
-	, sta->sta_stats.rx_data_pkts
-
-#define STA_LAST_RX_PKTS_ARG(sta) \
-	sta->sta_stats.last_rx_mgnt_pkts \
-	, sta->sta_stats.last_rx_ctrl_pkts \
-	, sta->sta_stats.last_rx_data_pkts
-
-#define STA_RX_PKTS_DIFF_ARG(sta) \
-	sta->sta_stats.rx_mgnt_pkts - sta->sta_stats.last_rx_mgnt_pkts \
-	, sta->sta_stats.rx_ctrl_pkts - sta->sta_stats.last_rx_ctrl_pkts \
-	, sta->sta_stats.rx_data_pkts - sta->sta_stats.last_rx_data_pkts
-
-#define STA_PKTS_FMT "(m:%llu, c:%llu, d:%llu)"
-
 struct	sta_priv {
 	u8 *pallocated_stainfo_buf;
 	u8 *pstainfo_buf;
-- 
2.34.1

