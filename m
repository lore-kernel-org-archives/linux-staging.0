Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82A472
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 09:49:23 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id f22-20020a7bc8d60000b029010c024a1407so4576879wml.2
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 02:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OmWS1qUJ5YaBqLsn7vq5tr1Fq+olzTCspmcQ+a0RiMY=;
        b=qGElEP9okREA8l5rJd6lznZgRSRbuEMEiN81CgjLu3eI83m5AfZ7+rVKUUGklivQlC
         Py8WzrKvM7lunZ9g6mr6T8q/jh2k8b1+DBJ5Ti1M3/q+u6FOPgGzYqGu/1RPgDFHtrGH
         TRpG6icePLg4/748XF5ixxcSGYK75s8OOGwlmH5YIQJwwcBKCKbkuBfhBWSj20YKHZR9
         BM7UNM0qKvFSXZ8/LsI+LTcz2VLngP/I19CBmAGKVi0PnpHFEw8iM39z901iNuJlaORa
         jDUbfSOHJ9b70txQC+5wmgO3FDyF6QUfGCZ8vC+NYMpdTW6wIEtJzTSG91Ukbxcwfe2j
         Qm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OmWS1qUJ5YaBqLsn7vq5tr1Fq+olzTCspmcQ+a0RiMY=;
        b=feehQlXDJiYJ38f3XGkFPmb6MeDS+jhknXw0RssP87nSAboRwuxHK/cE2K8sFnVYL9
         /TfI3AKA6ZhNM8WxoO6BXJkTrBktSUEBbXcIgtUnJ+HLN3MZcRjLKewiDH49tPlGThW9
         eFYxzLk2Spg0bjyttGkn9mVJoqDYmtGkH51JSi65KP/XTZtZRX8+WxpnXOjdS0gASJde
         3Q7s17dXMd0gK1JU+i5bR3xa2eYAAP7Prd6fSuyvLp0N5Sp1t3tt3FusA6/WOTVvJ+0D
         6449jU3bah/uJ7TEd8tSTzrXELGSPoIrzBwOxxDg2LDF05uZKkLRJcU+3dp/uvg0q2O4
         7Vvg==
X-Gm-Message-State: AOAM5306uczG5KhhlAxv/rKDXxcodoDm3Tcn1OxJrX39/KbGs0et/Xoc
	hHxbh7zURFqcQ6vjJNUTdWU=
X-Google-Smtp-Source: ABdhPJwJxDId7naINbDzBrgotI+DWZ6M9+BkDbb0elECL+IvzDSSA3+uyddkjFiawrpQeiXGfYq7sA==
X-Received: by 2002:a1c:5455:: with SMTP id p21mr12091070wmi.138.1616752162273;
        Fri, 26 Mar 2021 02:49:22 -0700 (PDT)
Received: from lorien (home.raoult.com. [78.214.78.108])
        by smtp.gmail.com with ESMTPSA id r206sm4191161wma.46.2021.03.26.02.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:49:21 -0700 (PDT)
Received: by lorien (Postfix, from userid 1000)
	id 39F561402FF; Fri, 26 Mar 2021 10:49:20 +0100 (CET)
From: Bruno Raoult <braoult@gmail.com>
To: gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	zhaoxiao@uniontech.com,
	dan.carpenter@oracle.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bruno Raoult <braoult@gmail.com>
Subject: [PATCH 4/5] r8192U_wx.c: style: Unnecessary parentheses
Date: Fri, 26 Mar 2021 10:48:34 +0100
Message-Id: <f42993e183e1127dcc9fce3f0ed42dd6d795c647.1616748922.git.braoult@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1616748922.git.braoult@gmail.com>
References: <cover.1616748922.git.braoult@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix checkpatch.pl check:

CHECK: Unnecessary parentheses around expr
in drivers/staging/rtl8192u/r8192U_wx.c

Signed-off-by: Bruno Raoult <braoult@gmail.com>
---
 drivers/staging/rtl8192u/r8192U_wx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192u/r8192U_wx.c b/drivers/staging/rtl8192u/r8192U_wx.c
index 03791613853f..e0d32f7b0ace 100644
--- a/drivers/staging/rtl8192u/r8192U_wx.c
+++ b/drivers/staging/rtl8192u/r8192U_wx.c
@@ -778,7 +778,7 @@ static int r8192_wx_set_auth(struct net_device *dev,
 	struct r8192_priv *priv = ieee80211_priv(dev);
 
 	mutex_lock(&priv->wx_mutex);
-	ret = ieee80211_wx_set_auth(priv->ieee80211, info, &(data->param), extra);
+	ret = ieee80211_wx_set_auth(priv->ieee80211, info, &data->param, extra);
 	mutex_unlock(&priv->wx_mutex);
 	return ret;
 }
-- 
2.27.0

