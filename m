Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB68C80
	for <linux-staging@lists.linux.dev>; Thu, 24 Feb 2022 06:40:58 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id m11so885384pls.5
        for <linux-staging@lists.linux.dev>; Wed, 23 Feb 2022 22:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KnvCoIs0/c2vqX4LLgh+v4j+mtPNEusN76pBE10KU9A=;
        b=adjXXIpKTM3UkYtOvwfXWKwU5zOSngzz1k+Q60tovu5Owx8jq56YeQL3zaMfC1yt24
         evxsv84d1hmtBicGADAhC1420eZufOvqHQP7HyX5L9GiBriKe/DyxwpfqGUntv63l90D
         mWvlxh6P3SFF1v5DRVgcZ17jssHSPlQxsN4U0CcPKFYG12Jb3FZPEZ08viFYXR93W0ww
         hhCitFlAwq29wKVEypjEANHbQhXq+8Vi/3esXLnCDd9uxpz8mdyoPurRWeuDDOoyq3gq
         90F6iBS6nhqcchg+U1ExJ2fgiH+Ns1pzbxI+7J9/FFkS7w37zEQKsM5riD2MoOS4yRha
         AuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KnvCoIs0/c2vqX4LLgh+v4j+mtPNEusN76pBE10KU9A=;
        b=EhRuBF7yIlvfQSX4FPi485y0gupy1xEeAebkSuqW3VXydD1UzenVxs8nHjwbx0YM2O
         lfgohuHwhanm5UwnmkEFkMAm0CwN6NQVDVOyD1DgjubbYAOrO6bumukNVmKKN90tr43Y
         TtH961E0RnowM0K6QVzLjNdvg52JNrspG+VS4ohnWY7H+ONwOM6rf7hLlnswuf9Ry/Mn
         yS4M4D+/6EkMZYNUviRm6Y8tMggNjOlHs81yugaEnveBm8O81Yt+pCuA5wuiSAnkGtO8
         fD7dj9Ba0f12zbLepOK8ZN8yt0grNPF7q8s7M7zSwgMosO6Oq4ZY/faO2mnjGsGg8yRs
         RBFw==
X-Gm-Message-State: AOAM5339BMkHe5RBJr0PbnIT7L5KgkeM7+7Wl2VA55NlGROYmKspFwik
	tB/I0ruuMtoRXmfQj0KOahI=
X-Google-Smtp-Source: ABdhPJzP+MOntAQn0G1ULYguihQZhslOvo9EMbQqn9LxmNgmJO+hSoIGJj3JY1KYuKuLoTxn5gghLw==
X-Received: by 2002:a17:902:ce05:b0:14f:8ba2:2339 with SMTP id k5-20020a170902ce0500b0014f8ba22339mr1190889plg.152.1645684858284;
        Wed, 23 Feb 2022 22:40:58 -0800 (PST)
Received: from tong-desktop.local ([2600:1700:3ec7:421f:47fe:f358:be6:4577])
        by smtp.googlemail.com with ESMTPSA id j12sm1729109pfu.79.2022.02.23.22.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 22:40:58 -0800 (PST)
From: Tong Zhang <ztong0001@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tong Zhang <ztong0001@gmail.com>,
	Kees Cook <keescook@chromium.org>,
	Shaokun Zhang <zhangshaokun@hisilicon.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: dan.carpenter@oracle.com
Subject: [PATCH v2 1/3] staging: rtl8192u: fix broken debug macro
Date: Wed, 23 Feb 2022 22:40:29 -0800
Message-Id: <20220224064033.1530924-1-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YhPI5iDRUpzYWDyY@kroah.com>
References: <YhPI5iDRUpzYWDyY@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There is an extra space in the debug macro, when CONFIG_IEEE80211_DEBUG
is switched off, compiler will complain.

drivers/staging/rtl8192u/ieee80211/ieee80211.h:470:42: error: expected ‘)’ before ‘...’ token
  470 | #define IEEE80211_DEBUG (level, fmt, args...) do {} while (0)
drivers/staging/rtl8192u/ieee80211/ieee80211.h:470:47: error: expected ‘;’ before ‘do’
  470 | #define IEEE80211_DEBUG (level, fmt, args...) do {} while (0)

Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
 drivers/staging/rtl8192u/ieee80211/ieee80211.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211.h b/drivers/staging/rtl8192u/ieee80211/ieee80211.h
index 15207dc1f5c5..ab1e380688ee 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211.h
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211.h
@@ -467,8 +467,8 @@ do { if (ieee80211_debug_level & (level)) \
 		}                                                              \
 	} while (0)
 #else
-#define IEEE80211_DEBUG (level, fmt, args...) do {} while (0)
-#define IEEE80211_DEBUG_DATA (level, data, datalen) do {} while (0)
+#define IEEE80211_DEBUG(level, fmt, args...)
+#define IEEE80211_DEBUG_DATA(level, data, datalen)
 #endif	/* CONFIG_IEEE80211_DEBUG */
 
 /* debug macros not dependent on CONFIG_IEEE80211_DEBUG */
-- 
2.25.1

