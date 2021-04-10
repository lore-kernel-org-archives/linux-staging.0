Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020E36D0D
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 14:21:14 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id f8so9782835edd.11
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 07:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hm/qIgnpnFQqfRktyMoUjQ+eNm+mCcSEBpPI8cninMM=;
        b=BlaFFSRQbAEsZ0MlGWQH6QmDa7YFr7kk+hDjY6hXiB9W2bQscsmyooFeFnXFsDxNKv
         uZQI5xHuKh+IZT65I9eY5xyPqUT9gpxkJvhPf3XMiUMlPGWq8Fiiz5XV424qP9njoyUZ
         3ddytLAWPONthG/aDfAHKTuudbn9NIcCiPTreKf201/RwZXH/6dx4QEu1MPe5CBpg+BG
         ts7c7wIX3mTzP76vmpCedOGr2ORBX2NNkMEvqGZFK66kmlaICTEWU7PgGivTiJaRAO+N
         5jLNjWdq3KSSoAXh2+a2EG6MyjIuvr/Qmh862RBYEpzqTZIgiF3IsYnno6iX7dcQfDV5
         V2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hm/qIgnpnFQqfRktyMoUjQ+eNm+mCcSEBpPI8cninMM=;
        b=i/5Ev/aRd7AQYyd2BFfFMJQI40fiCIwoPZX6jfjfz8en1Oyz/4TpjJowzh+/L5f1uQ
         jVq+8WCUBQsXQovM1wQzX0FYf0WBOAIbFcNzKnMgrrg4cmE9a1jM592dkMijQ6h79Q1G
         x8pYDKYVDZmMaDtkBOs8gzAQAUNXUwzpug/mCH+cd8lnEiXPmXnBK9Cd6jLzmzwJuX3e
         FEcGxREvjCamRrASeTr8KaVkV0Jp7jLJ08psDLB4z1ExcUqOBITd6KBh4XuHUIOtfTc4
         mX3wR/djslCZN+s9Oqzm6ZZ0ikg+cBAjzpyU4L5bHyAE1w7Md29XgdWHF4Yf9mM28qpD
         pObw==
X-Gm-Message-State: AOAM5329qTDduojjS8UoEbwd/X+GOFjOBFbDl7CUgXyxQhYS+AN8nzrM
	gKZ6jWTf8y7kEUVwRW5pXAc=
X-Google-Smtp-Source: ABdhPJzkvTJR5DJhdl4awLQwrpneHDogeI/VTxTLo1jYUQ2sYMtmZls+4SggD0ZPIWQfir/3Q4qqFA==
X-Received: by 2002:a05:6402:2054:: with SMTP id bc20mr8960838edb.334.1618064473472;
        Sat, 10 Apr 2021 07:21:13 -0700 (PDT)
Received: from agape ([5.171.81.28])
        by smtp.gmail.com with ESMTPSA id p9sm3168261edu.79.2021.04.10.07.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 07:21:13 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 21/25] staging: rtl8723bs: remove unnecessary parentheses in os_dep/ioctl_cfg80211.c
Date: Sat, 10 Apr 2021 16:20:34 +0200
Message-Id: <fabc590b9f74f687cc0f7ea978577f0357df2974.1618064275.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618064274.git.fabioaiuto83@gmail.com>
References: <cover.1618064274.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix following post-commit hook checkpatch issue:

WARNING: braces {} are not necessary for single statement blocks
94: FILE: drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:1225:
+		if (pwdev_priv->scan_request->wiphy == pwdev_priv->rtw_wdev->wiphy)
 		{
 			cfg80211_scan_done(pwdev_priv->scan_request, &info);
 		}

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 617c88c6e4e7..39d0a0d24d2b 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1223,9 +1223,7 @@ void rtw_cfg80211_indicate_scan_done(struct adapter *adapter, bool aborted)
 	if (pwdev_priv->scan_request) {
 		/* avoid WARN_ON(request != wiphy_to_dev(request->wiphy)->scan_req); */
 		if (pwdev_priv->scan_request->wiphy == pwdev_priv->rtw_wdev->wiphy)
-		{
 			cfg80211_scan_done(pwdev_priv->scan_request, &info);
-		}
 
 		pwdev_priv->scan_request = NULL;
 	} else {
-- 
2.20.1

