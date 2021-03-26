Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6982770
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 09:10:04 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id a132-20020a1c668a0000b029010f141fe7c2so4534711wmc.0
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 02:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NTRDjOB0Z/XWkk3yB0atpiz7nFAoEAEsKk8b97HqiF4=;
        b=bAVfC9smoc/GoiPdohSLl1LGwUjJWSKELqk5eIpnhC/OaNb8662/YKOZUujOWa8h7Y
         bPd3lXPh73b/E7DYess+eeUQ59THsw+fBJqLXGCBFy2fd8TwaTtGvihCFm4sJ/61wSdp
         xdj6pOwspCqUEb3rRSBc3vmHED/3B6HdFhpz98KVCdCqid1mMD1OZC5lqvbl9uEqwhH/
         giDib/QOJzvo+x4E6D2agtIRzjflQqrDA2UTQ3xNavS9kUDs803JVXzut4FFsAfCvdiC
         fIKfQ5+yf31knWE9k56avQKmTOchgWaqE4ENmCgGH0wsTfp7D8NXxYrP9GmtnfWyN43l
         IM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NTRDjOB0Z/XWkk3yB0atpiz7nFAoEAEsKk8b97HqiF4=;
        b=XYIkU3YWJEc79+WHTAleLLWYlxI3pxkYUhRXDDVJqhQAybiCwV1MDPaVBCehYgcDQV
         kVyO1I0KT1O57UIfuIC8gB9YGSYu5+om7uJpWLo7Qw5lRKtM8pNMJCzJZhvGN6VlpYB1
         Rr9u0XMNrekoOCs8fefE9PEfthlCscPVQsb0xHh5NTKahXY2BU2g6fvp+ZXJ2QxEATDw
         aTX4Dbz68kk2zdupLMAyNE4Jj67zd2P+sEFZpCEhgQsczBExZjX0pTfqbQqUbzu/YRR9
         79JbCn0bDIECsyjuVi9b7ckbESmnmVJj86xaWGCpecqmOFajknpX2Tum4NAoSnivfk2E
         KbNQ==
X-Gm-Message-State: AOAM532vDJEBJWTY6Xntak8bAggS+PBSu5UkNGgHbj7gSZ0TL2N2MkG9
	HsX5LfbrpAPWW9JiZN7flb4=
X-Google-Smtp-Source: ABdhPJzvYoM3bWgJwFrjKJrXuCIwb2scEh8foTUS9y5Y5EHK/j1fjR7+rvUxcFbtnZHjYGGwSryJpA==
X-Received: by 2002:a7b:c3cd:: with SMTP id t13mr11862633wmj.109.1616749802846;
        Fri, 26 Mar 2021 02:10:02 -0700 (PDT)
Received: from agape ([5.171.81.75])
        by smtp.gmail.com with ESMTPSA id v3sm10014726wmj.25.2021.03.26.02.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:10:02 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 14/15] staging: rtl8723bs:  put parentheses on macros with complex values in include/sta_info.h
Date: Fri, 26 Mar 2021 10:09:21 +0100
Message-Id: <24e684c1eff8911dacff1b61957ce25bafc46631.1616748885.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616748885.git.fabioaiuto83@gmail.com>
References: <cover.1616748885.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following checkpatch warnings:

ERROR: Macros with complex values should be enclosed in parentheses
284: FILE: drivers/staging/rtl8723bs/include/sta_info.h:284:
+#define STA_RX_PKTS_ARG(sta) \
--
ERROR: Macros with complex values should be enclosed in parentheses
289: FILE: drivers/staging/rtl8723bs/include/sta_info.h:289:
+#define STA_LAST_RX_PKTS_ARG(sta) \
--
ERROR: Macros with complex values should be enclosed in parentheses
294: FILE: drivers/staging/rtl8723bs/include/sta_info.h:294:
+#define STA_RX_PKTS_DIFF_ARG(sta) \

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/sta_info.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
index abde3e3df988..1cdf93ec3b66 100644
--- a/drivers/staging/rtl8723bs/include/sta_info.h
+++ b/drivers/staging/rtl8723bs/include/sta_info.h
@@ -282,19 +282,19 @@ struct sta_info {
 	} while (0)
 
 #define STA_RX_PKTS_ARG(sta) \
-	sta->sta_stats.rx_mgnt_pkts \
+	(sta->sta_stats.rx_mgnt_pkts \
 	, sta->sta_stats.rx_ctrl_pkts \
-	, sta->sta_stats.rx_data_pkts
+	, sta->sta_stats.rx_data_pkts)
 
 #define STA_LAST_RX_PKTS_ARG(sta) \
-	sta->sta_stats.last_rx_mgnt_pkts \
+	(sta->sta_stats.last_rx_mgnt_pkts \
 	, sta->sta_stats.last_rx_ctrl_pkts \
-	, sta->sta_stats.last_rx_data_pkts
+	, sta->sta_stats.last_rx_data_pkts)
 
 #define STA_RX_PKTS_DIFF_ARG(sta) \
-	sta->sta_stats.rx_mgnt_pkts - sta->sta_stats.last_rx_mgnt_pkts \
+	(sta->sta_stats.rx_mgnt_pkts - sta->sta_stats.last_rx_mgnt_pkts \
 	, sta->sta_stats.rx_ctrl_pkts - sta->sta_stats.last_rx_ctrl_pkts \
-	, sta->sta_stats.rx_data_pkts - sta->sta_stats.last_rx_data_pkts
+	, sta->sta_stats.rx_data_pkts - sta->sta_stats.last_rx_data_pkts)
 
 #define STA_PKTS_FMT "(m:%llu, c:%llu, d:%llu)"
 
-- 
2.20.1

