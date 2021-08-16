Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F76A72
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 11:56:24 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id k8so4245175wrn.3
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 04:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0LDHqraIzKirlInTJIoYLrVEJlKeEnnboAcXd2DM5Mk=;
        b=Wmd/GeQ+or/Of9GRotn0c+zCzNzddZ6F7OOLzoOmL+kkWsUGe0BBRkM87pklcrqE4n
         WKIXldpqjyMd/m7ET/YYeLRtVTPIIJ/eNbn5+maOMmGna6Hb9bEEDvmwj+IHJwOWlF6G
         7Qdepv6jh3sLAcBtj4KFQ58iziDtHeRie6/bjCy2AjwqiTvMV3Knir+CIMX0DLWNEMpC
         HloHtRk/5t7Nu2VLZr4B3yzUFip4uobOJkVNnT5bRJ1nMuh9WaB0nba0ZtTntuqx4FvU
         95RrNVlXVFivFncKXTIth9LH7h3WkVfQ0NvA0E7lBBsaowyaOcMOJckwisKj2lTsM88I
         LWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0LDHqraIzKirlInTJIoYLrVEJlKeEnnboAcXd2DM5Mk=;
        b=uNdG6uPrgPISSmOxmPZPstmKITi8jkoENcPLoytUIJ6tmDEH9HkTb75WemAdbhB3QV
         mXNViQxtK3WAgzJwHlJsXWCd0sutEk5Vsm8GV7Zm+Kp4g9UKWtRlvycJ9RbG3c+QUNCu
         RLWQcXFVsJZsqiTAhg2vTfneriarU97UlPKzBjWvDsJmHtm6vWkpm3Ih02gvcFMmywLE
         VYzh/liKuYYAUdsBUAURinlp2oe1x6IRtKV6DC0cnBRFmtov9o9CHfSbwYU8D5M8/naa
         amvenX+jTnggYlXeB8xW13MU+oh/yLqe0JeAZIY4Rl1GoIJiIVGpoHPodpJR5y/ePgsH
         51ng==
X-Gm-Message-State: AOAM532nrtf4QIvT/VOm83JuePD+kHEzYQckaK3tahbUL4kzkZ1qYZUS
	qk1pkuVptZPBTXZYTrASCFU=
X-Google-Smtp-Source: ABdhPJzUTX/0J/uYBt0TOUWJ9RKMBfqvDFf/RjLt/VMyKzppiasp2pkKnJs+Qtywbv08EZ0zaxIINQ==
X-Received: by 2002:adf:e28a:: with SMTP id v10mr17580163wri.289.1629114983152;
        Mon, 16 Aug 2021 04:56:23 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4058])
        by smtp.gmail.com with ESMTPSA id i8sm8397107wrv.70.2021.08.16.04.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 04:56:22 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 4/4] staging: r8188eu: convert rtw_is_cckratesonly_included() to bool
Date: Mon, 16 Aug 2021 13:54:30 +0200
Message-Id: <20210816115430.28264-4-straube.linux@gmail.com>
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

Function rtw_is_cckratesonly_included() returns boolean values.
Change the return type to bool to reflect this.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v1 -> v2
Rewritten to apply with v2 of patch 3/4.

 drivers/staging/r8188eu/core/rtw_ieee80211.c | 2 +-
 drivers/staging/r8188eu/include/ieee80211.h  | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index b1427e70cdf7..a91c8d52a123 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -80,7 +80,7 @@ bool rtw_is_cckrates_included(u8 *rate)
 	return false;
 }
 
-uint	rtw_is_cckratesonly_included(u8 *rate)
+bool rtw_is_cckratesonly_included(u8 *rate)
 {
 	u8 r;
 
diff --git a/drivers/staging/r8188eu/include/ieee80211.h b/drivers/staging/r8188eu/include/ieee80211.h
index cbefd7af1d4f..1205d13171b2 100644
--- a/drivers/staging/r8188eu/include/ieee80211.h
+++ b/drivers/staging/r8188eu/include/ieee80211.h
@@ -1207,8 +1207,7 @@ int rtw_generate_ie(struct registry_priv *pregistrypriv);
 int rtw_get_bit_value_from_ieee_value(u8 val);
 
 bool rtw_is_cckrates_included(u8 *rate);
-
-uint	rtw_is_cckratesonly_included(u8 *rate);
+bool rtw_is_cckratesonly_included(u8 *rate);
 
 int rtw_check_network_type(unsigned char *rate, int ratelen, int channel);
 
-- 
2.32.0

