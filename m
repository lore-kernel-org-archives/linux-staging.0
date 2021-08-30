Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74043FC4
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 12:15:50 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id o39-20020a05600c512700b002e74638b567so9306174wms.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 05:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ykIIFku5+vbZUnxk+devw/re+bV9Aj//c6+PrJONt+A=;
        b=gqJXO904PPfLL3EP6MgmiZc50UqY0bkRjqkpyorUiiYxwanCzmexIJSMXG1ERz1d61
         0N0oIEZCKRLl7D+Ir0Z5pTsKPHGD9YXD58zzjbk2UjMBg5tUeLuJSEZY2CJBnPyKpH61
         vRlHUYTwL9aHdd8GDDo5VPGCjzXHqS/b20+LVafq1XLfrsAx5dukkTnFZRTbkKw1MiVm
         rLqQRmMvofc0jKS41YVmebTq9XJidPe2VWuo2X3tqXN2wzSUwqYKTHIEMIyyIpD6wjtd
         wbriECVE+WMpNLcuICuh4c49qa/FcwEoYqW8gf/eq+xq+6VKvXFBl3iXNkdXrawN+SFE
         Yc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ykIIFku5+vbZUnxk+devw/re+bV9Aj//c6+PrJONt+A=;
        b=eVI9RKs/OkMaZpkRW17pUDvHy/unTfzHeCmBJinuTpI1GRBbsqw6RRZg/2a2QkMyZY
         An0gc57NUvSWa5IfYhfax+wQ6zELEefGg9YH2Nnte0QOZ6c5117aBb4pntck9in7sLtE
         h27lV5ovllBzvciTd/bkGCY1SFKZYz1TEaGO27dXqGMa9Yg1R441bxG4qdwa6+qLKdAB
         U94Sav5LwAxt5oxMC8bex6gNcDpacMMcJYyzQSsMqebcDhkhM8CmYzwGovndbAP+3XxJ
         TufCQmu/FppOlwHUmAfBRNdkeGxfBpybqIsS7TDNjCe53XriT7C/lR3FVbiLqerWbxG5
         Nzdw==
X-Gm-Message-State: AOAM532TvJNZykRBsk5BE/HOkBr5ustkWRMjV6eprD+HsQ4xzZY2v4xP
	LGlrnKy8+jMnUtlnPvzIzOM=
X-Google-Smtp-Source: ABdhPJz4lz9Glp0CP3yYvCy0L8tI1okEmv2kK6cTAAPXILbfZeuxR1ItdN2vepsxpiRNLvJ+1vNNOA==
X-Received: by 2002:a1c:cc05:: with SMTP id h5mr32766792wmb.5.1630325749142;
        Mon, 30 Aug 2021 05:15:49 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with ESMTPSA id x11sm15492116wro.83.2021.08.30.05.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 05:15:48 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 6/8] staging: r8188eu: use ether_addr_copy() in rtw_macaddr_cfg()
Date: Mon, 30 Aug 2021 14:15:06 +0200
Message-Id: <20210830121508.6411-7-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210830121508.6411-1-straube.linux@gmail.com>
References: <20210830121508.6411-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use ether_addr_copy() in rtw_macaddr_cfg() to copy the mac address.
The buffers are properly aligned.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ieee80211.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index 370a710ab7cb..c37358be631f 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -1026,10 +1026,10 @@ void rtw_macaddr_cfg(u8 *mac_addr)
 
 	if (rtw_initmac && mac_pton(rtw_initmac, mac)) {
 		/* Users specify the mac address */
-		memcpy(mac_addr, mac, ETH_ALEN);
+		ether_addr_copy(mac_addr, mac);
 	} else {
 		/* Use the mac address stored in the Efuse */
-		memcpy(mac, mac_addr, ETH_ALEN);
+		ether_addr_copy(mac, mac_addr);
 	}
 
 	if (is_broadcast_ether_addr(mac) || is_zero_ether_addr(mac)) {
-- 
2.33.0

