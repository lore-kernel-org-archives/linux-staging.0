Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24F76D0D
	for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 23:50:53 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id l34-20020a05600c1d22b02902573c214807so3107017wms.2
        for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 16:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5PnowbGgyFz0o3O9tmzMqVdFTTxzq97bhMSS4g0mQmM=;
        b=XaH6a9gVk8AKJdNZHaj3v+zGqxoEMGBvy/ZkcexgAtNK6q0IkRRY7bxZTWzpV3YKt7
         hZLYa74eV3Pqvtfk+yLYlThudFjL4lrHNR8AIF811P4Y7n0z8fZuO+4I73E5X9XhA1Go
         n5t4SpmL6nxxxUEYk54ndE+/F7vAQ8ZqM6rFsZpCFWaALjmXKLfILSXLrggDgtkImTzF
         8ZbDbauFiD1Lzi/7NLcT0SsMCEGH9Ry+YJPVbuKc2mzrhZIqsfRadqolGVus+ySSSJKk
         WxR/RK5/etSl14amrpU8ea8gSOUhMARhPMQagIUFTM8If91gxvl1avJggZzoyIaXQhJh
         sKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5PnowbGgyFz0o3O9tmzMqVdFTTxzq97bhMSS4g0mQmM=;
        b=AsMUdR8TUgvXe9W7DgiA2ItR3XOAuOxT3aqoT1WHlYTmYKgukEUVqIUmyh9jI/ZApt
         fcao2qvRmEJCfpdq4VksHGKaXwSNBtolGfsvxDdzOMNZPppMwSvT7/4HYyhppO9dmNQo
         4eXyMNCZRKW4V1vDI9ctDAmWRfhWFfP8bLUoMGmFGOYzmuthBODDd8Mjp+KWJ15/IFVd
         njhBcPY41qLtCQQlHp1ofZsnnOHCYKTepY39FK4G1c9lXy3LMneHBhmRKqiinZIgRllJ
         H4hmiFHLhPIqmcwke1er5soIckSjb7dtE3JmIsO3xViisDL7dpWJpwYLrHOf9gzGSTd1
         3JUQ==
X-Gm-Message-State: AOAM533ClMK2mI3cnWbXreMMf8xAbth0R+NSjHgo9H+7r0J+pjjw1Occ
	STF7a9z/zru/mxsk3GuUeKvZ9A==
X-Google-Smtp-Source: ABdhPJw4058de38ifBB1VTshpNABi1nV7pHXqVNu/7rYv2TWDf5BrV5hQB8Z7ZZBFLA86HwQnARAtg==
X-Received: by 2002:a7b:cd86:: with SMTP id y6mr6858733wmj.181.1628639452029;
        Tue, 10 Aug 2021 16:50:52 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id p14sm13881220wro.3.2021.08.10.16.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 16:50:51 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] staging: r8188eu: remove rtw_mfree_sta_priv_lock function
Date: Wed, 11 Aug 2021 00:50:43 +0100
Message-Id: <20210810235047.177883-5-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210810235047.177883-1-phil@philpotter.co.uk>
References: <20210810235047.177883-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove rtw_mfree_sta_priv_lock function from rtw_sta_mgt.c, as it does
nothing and contains an unused variable.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_sta_mgt.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_sta_mgt.c b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
index c9644a3ecc4e..a74d0741658a 100644
--- a/drivers/staging/r8188eu/core/rtw_sta_mgt.c
+++ b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
@@ -127,13 +127,6 @@ inline struct sta_info *rtw_get_stainfo_by_offset(struct sta_priv *stapriv, int
 	return (struct sta_info *)(stapriv->pstainfo_buf + offset * sizeof(struct sta_info));
 }
 
-static void rtw_mfree_sta_priv_lock(struct sta_priv *pstapriv)
-{
-#ifdef CONFIG_88EU_AP_MODE
-	struct wlan_acl_pool *pacl_list = &pstapriv->acl_list;
-#endif
-}
-
 u32	_rtw_free_sta_priv(struct	sta_priv *pstapriv)
 {
 	struct list_head *phead, *plist;
@@ -162,8 +155,6 @@ u32	_rtw_free_sta_priv(struct	sta_priv *pstapriv)
 		spin_unlock_bh(&pstapriv->sta_hash_lock);
 		/*===============================*/
 
-		rtw_mfree_sta_priv_lock(pstapriv);
-
 		if (pstapriv->pallocated_stainfo_buf)
 			vfree(pstapriv->pallocated_stainfo_buf);
 		}
-- 
2.31.1

