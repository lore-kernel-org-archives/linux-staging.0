Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B61D2CA3
	for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 09:00:28 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id d187-20020a1c1dc4000000b003474b4b7ebcso6147694wmd.5
        for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 01:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hv6GKoLKoAgQtrfvNhQxv0aNjpwK6o2iQIchk0LCYiA=;
        b=pv5fF+gLctrVTwbNNZ2zuqzuAl7dn8cXteKEnxPcbzhPDmDWMeb/WLa4ZyIq4dt0N7
         lWqFpmYILgGSQLLLc35UPFjCSToboH32HUaQoT599I9ubGjctI7BNCxQJ/KLhCpQvJNI
         WvK6E5wO7LcnMq6u5/Af8LXNHHp+/t+Yhj4f5byuCBQYaEjUV3PtOHF/Ywxi5tACDwya
         DlcwBe32rTaKgzAJKpyC/Ab+HRBmwFNfj+NX1no2EqXntbtmkwAHqpLxWDm17xEu/PJq
         qdlqqljoYdP37xfSefYeiAmOz7iRzJruIWhloJs42Zs9MsT06WBEK6e0yNHOnIpNEvvv
         csag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hv6GKoLKoAgQtrfvNhQxv0aNjpwK6o2iQIchk0LCYiA=;
        b=VTr4Cftuwe9drgi2FD0FpKZ8PlA4O/r/qXqpY2dkgHUouRMnc3Tj8XGri09KRXZpaW
         jDtqtd4FjzV/ZpT0RlVhQaZ8XNv5+ZxQ6gsVlgpiidZgqFUqVpeZU6gUzgR7MZ14TvQB
         1fejEe+4QTIQeaiD11Zz/Slx1gRXihWsBtS577X/FnOelEbJqsY/VxWmUn9dKKvQKz4W
         Qk9UNRCF0t/LNJGB/2GCnLmF3hSICRY7h/yuBdbyZfdukaSnhU1WUsybVD3VSX+ayuWV
         h5L1m2v7yQglkPUzWesE5HB3IO8mKpSuCu9gBxklRK5QnOASM4f5UsAQ0pVkuBIZ3sKW
         LEDA==
X-Gm-Message-State: AOAM533vOa9TaZAEA8MXPmNMmMh0fKcytoXt4AczpjllT4LtTe94gqCP
	RRKcRzA7zMMwrFQhXrYK1ZkuGw==
X-Google-Smtp-Source: ABdhPJwODe+jUhhnYVxYqigggVQ7Uv68lwjain+B3p60pQcnC9n4UvnwEK0O6wFIcXmZ/CBMnZzPDw==
X-Received: by 2002:a05:600c:19d0:: with SMTP id u16mr20980802wmq.148.1641805227026;
        Mon, 10 Jan 2022 01:00:27 -0800 (PST)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id m15sm6263287wmq.6.2022.01.10.01.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 01:00:26 -0800 (PST)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] staging: r8188eu: convert DBG_88E calls in core/rtw_sta_mgt.c
Date: Mon, 10 Jan 2022 09:00:20 +0000
Message-Id: <20220110090020.6800-8-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110090020.6800-1-phil@philpotter.co.uk>
References: <20220110090020.6800-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the DBG_88E macro calls in core/rtw_sta_mgt.c to use pr_debug,
as their information may be useful to observers, and this gets the
driver closer to the point of being able to remove DBG_88E itself.

These calls are at points in the call chain where use of dev_dbg or
netdev_dbg isn't possible due to lack of device pointer, so plain
pr_debug is appropriate here.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_sta_mgt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_sta_mgt.c b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
index 54561ff239a0..de5406a5870c 100644
--- a/drivers/staging/r8188eu/core/rtw_sta_mgt.c
+++ b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
@@ -104,7 +104,7 @@ inline int rtw_stainfo_offset(struct sta_priv *stapriv, struct sta_info *sta)
 	int offset = (((u8 *)sta) - stapriv->pstainfo_buf) / sizeof(struct sta_info);
 
 	if (!stainfo_offset_valid(offset))
-		DBG_88E("%s invalid offset(%d), out of range!!!", __func__, offset);
+		pr_debug("invalid offset(%d), out of range!!!", offset);
 
 	return offset;
 }
@@ -112,7 +112,7 @@ inline int rtw_stainfo_offset(struct sta_priv *stapriv, struct sta_info *sta)
 inline struct sta_info *rtw_get_stainfo_by_offset(struct sta_priv *stapriv, int offset)
 {
 	if (!stainfo_offset_valid(offset))
-		DBG_88E("%s invalid offset(%d), out of range!!!", __func__, offset);
+		pr_debug("invalid offset(%d), out of range!!!", offset);
 
 	return (struct sta_info *)(stapriv->pstainfo_buf + offset * sizeof(struct sta_info));
 }
-- 
2.33.1

