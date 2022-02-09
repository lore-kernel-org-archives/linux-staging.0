Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1116C2F43
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 20:45:41 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id 189-20020a4a03c6000000b003179d7b30d8so3910373ooi.2
        for <linux-staging@lists.linux.dev>; Wed, 09 Feb 2022 12:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xm1Tr2nzcItVDKdJ9rf+wdRu6cxWSGf4prYg3I3bnUE=;
        b=NBGl6aQbAp98ukynCozOD6vcb7U3mC1W8x3sx+urs1D/Bzgy7+TwxssYr+Oqnj2Bwn
         vZ2WPAmXEXQU7wxdjENVrQ5g55yCXjrzvTdWZ1BlC/D4IGOZCNQgDMEnN8Wse78xpyyS
         fsKZkT9wIosEAxt/MwwPAKIIbTWmhItTvIok+5zN1n6kxEbJ6AapLt6hi+CzElNiOS+9
         RFFBsPMt5gFRg6CPDjf6flRabV3ZUCebnW6CFr4Q8NOkD46KlJMfutgWQBbGO0zm7qX6
         jF0cR0fWKeCSoskPVIaWI0LkBjXX+kS+nfDMQi1trpdZ74wq/ZQcyMDdQ0eoJDNbFP5b
         NzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xm1Tr2nzcItVDKdJ9rf+wdRu6cxWSGf4prYg3I3bnUE=;
        b=JWBDiVCzivoKohDSpVCeSWV8Xt4SAlI9qXLmmUOhI4B2fAuTI2kU0VE8frwfeeoYGf
         j4bpXqvRtog1ZdHXiimA8VQdS8650k0+/Qz92Rp+2RoncQDSCjwijU23akwmkizmRU99
         bppYRivYzVqnCWpkuF0NkVWpYoNH9B5p+dAAlgxIhsUvUoXIkkhTqYz+wMQcpSc+r8ZU
         8KJLpn1yjF3Dlp2QcP1NlCujE73Wn9IAx4rCdimpArX0ni7XeonxTLa8R2eIWh/ACdxJ
         CRqz4um3wW9pLtQpV41nDCL7CC07ZKbW8vjjNuEWvgqNb6Bi8L4xN/1VbtrDJEsjCrby
         3NAA==
X-Gm-Message-State: AOAM5307FHoyyCqyqttoWviLCM6iK1rht20bGLX0V5J4QX2oiJb9BBqD
	FRj6Zlu7Xg15A7YdESPqPQA=
X-Google-Smtp-Source: ABdhPJwGgR/vaGaQIeSh8grZh68qH9RmsC2xSnUT6J9yjPdDQbN2hUrBKaL2YgzPOJixTNmSPPZDKQ==
X-Received: by 2002:a05:6870:1351:: with SMTP id 17mr1300466oac.246.1644439541235;
        Wed, 09 Feb 2022 12:45:41 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:4cd8:12bf:758b:9a0d:6e95:934f])
        by smtp.gmail.com with ESMTPSA id m130sm7242730oif.21.2022.02.09.12.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 12:45:40 -0800 (PST)
From: Leonardo Araujo <leonardo.aa88@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Leonardo Araujo <leonardo.aa88@gmail.com>
Subject: [PATCH] Staging: r8188eu: core: Alignment should match open parenthesis
Date: Wed,  9 Feb 2022 17:45:28 -0300
Message-Id: <20220209204528.7114-1-leonardo.aa88@gmail.com>
X-Mailer: git-send-email 2.29.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the following checkpatch.pl warning:

CHECK: Alignment should match open parenthesis

Signed-off-by: Leonardo Araujo <leonardo.aa88@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index ef0dd395b1d8..e42119e16284 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -327,7 +327,7 @@ rtw_sitesurvey_cmd(~)
 	MUST TAKE CARE THAT BEFORE CALLING THIS FUNC, YOU SHOULD HAVE LOCKED pmlmepriv->lock
 */
 u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid, int ssid_num,
-	struct rtw_ieee80211_channel *ch, int ch_num)
+		      struct rtw_ieee80211_channel *ch, int ch_num)
 {
 	u8 res = _FAIL;
 	struct cmd_obj		*ph2c;
-- 
2.29.0

