Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147B126A0C6
	for <linux-staging@lists.linux.dev>; Thu,  2 Oct 2025 17:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759425833; cv=none; b=AKqO1bbvs+2A61zOdC039DgE7F2hiFfCIKCf3h+QFq8zdllgSbIOw9daYOTT9SOVYFGMdXux5TUahLyB1eTITejelOQr8+bDWuoWrXmZ8eJN2f0ZP17+vG4o+QJIgAbZbIguitoRnA++uH13oNObAGloMG0FIUZ2x0tIvKnXxHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759425833; c=relaxed/simple;
	bh=JmI3rvfGEf1Z1riF8sZuENvE+ZlBl4htm6xrdJ3xaEw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E8s1FSlIOKyaeFGxdN0hD8youTP/6EB9EnoIy9j0qEZjbTKY2J0sMI6uzlo1v7qzbvOurfJ29/GFJ8CEpnEJEDjbMpVvSOZCrtZBodqmwfSUgHkY+QXxqUhb+npG0/r3BUiBAkNpIUch57DSM3AjTn9LQ4GcgQFc4Re3RAK4DPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1305Fw1; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1305Fw1"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4df0467b510so17246871cf.3
        for <linux-staging@lists.linux.dev>; Thu, 02 Oct 2025 10:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759425831; x=1760030631; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=420xhJpXeiS8O0VHfKZK4Z2TaOUNPYgxom/AXLmk2uA=;
        b=Y1305Fw1X3SOyTRHUx4JlWBVyR6Bq5AV/VxXiuN/9P9S0JU9yv3amSlOpqD1dgbR0A
         AXO+4muV8JLlwOcHxsl2t9dpYDCOyZqTJaDh30oClCzUkp4e7jgF7go3cpTnJXt0RQsH
         hPNIDxknJ4MMWm2+OSPZxQM8H1sfpBmK1ujZrixbKQCPGXOKeCOXeD7j8kikGH0pUepB
         LBUT+YWOdUnM3F/CA/Tk8sigA8jAKjjtLXhPH4nFedclGAvSHJOFrp3Y4I4AgM5rM1Gp
         NXHnlfgL/qqzZygTCStm4rV8TUXpN06mkvd0BMVW+ru/c3udH9oENlqqYAIyGOny74Ch
         SV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759425831; x=1760030631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=420xhJpXeiS8O0VHfKZK4Z2TaOUNPYgxom/AXLmk2uA=;
        b=IXbYMAJAKRxaInoXC1fRDYNyW8ddkL1u6SX5Bm83aQ3Qy3Un4kVjplsUvW4XFdI+vn
         Z9y7kyxtESAzIiWLi+jpGsWejYNxyv6IkJbzW9CkMhgtGPpv2OD+YyE/onrw7PPO2S/p
         JK3pD1HL1+PTwPOY1/5rDgTfDJBpqpFYGZxdqg1IyfLpm/V0Th8Vq2UlY4g55HvBrpNd
         bH5/ef9C64euJVGPSKNINNsPRctthj/U1iy9ZSE2iIkUjAciyBvwfZU5yZljFIeOUAAh
         emVwIYXM86TuInyhozCIUr/6gV4Y1e346ed3S2SOBVtkN8i7GiuoLF/bnNci9cJ5rNb/
         +2nw==
X-Gm-Message-State: AOJu0YyJtBukt4GwNk6mOg2sQlEa+R+/U9eN+s61CSYOa3kLseo2M4h7
	F7Gpsf0u7o3mOvzot/VzZGbU99j7Ckwj/zTOG2BY0s4Tr4Smg5a+zlpM
X-Gm-Gg: ASbGncuPLpS8Mgei7oWWNB7URb6IZna3YPweUvQVsNt5t3TU9Zfh/AFmtGcIO/NMexT
	ERvLMgwlt1Cpil/5T8/Yt0UiZOlFODv8QoKNIoxOviLiHqXOz/I9c3291L1Z8JxR8gtnfsRX1zt
	N4TAJpYhgux+QMLsu0udCdrYkKHGTURMjwFSAGGHkk9P218C/EpJjEdjpvWqQE5QpxiGd5jPIRL
	nV+HG9+YZmobtrx1RRJzg33Kx8I9BtCz3pXHEtqI6FzSwMpo22o1OurlJYnTgLjR8BcjN1rAkXo
	EFzW+0cTrX/B4fkpT47nPXJ/w95ESG8EvmR5XhWrMAO4xxvr/xyYJlf4hJa9YAbWsjRLxh9heCC
	NzS9ontvif5qSFzgu0j3EJtq9OzJiXsOqDSKHtu/mVWLAnTmPbUyDkbQaBPi6+uPCN42U2cfYwA
	k=
X-Google-Smtp-Source: AGHT+IGfItm29WSvAQomqrxHJt7hMmXfIayQsgFHSLYDyuV5Lb7XaNWV6JC3vLeWw7ZLk3ala1Fd4g==
X-Received: by 2002:a05:622a:14c7:b0:4b5:ee26:5366 with SMTP id d75a77b69052e-4e576a7bae4mr1456461cf.26.1759425830892;
        Thu, 02 Oct 2025 10:23:50 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55cbd3d9fsm24504971cf.32.2025.10.02.10.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 10:23:50 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v4 02/16] staging: rtl8723bs: remove unnecessary space after type cast
Date: Thu,  2 Oct 2025 17:22:50 +0000
Message-Id: <20251002172304.1083601-3-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251002172304.1083601-1-vivek.balachandhar@gmail.com>
References: <20251002172304.1083601-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary space between the cast and the variable
in two instances of type casting. Improve code consistency
and align with the Linux kernel coding style guidelines.

No functional changes made.

Identified using checkpatch.pl.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 516e736d03f1..43244e950faa 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1101,7 +1101,7 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 	rtw_update_protection(padapter, (cur_network->network.ies) + sizeof(struct ndis_802_11_fix_ie),
 									(cur_network->network.ie_length));
 
-	rtw_update_ht_cap(padapter, cur_network->network.ies, cur_network->network.ie_length, (u8) cur_network->network.configuration.ds_config);
+	rtw_update_ht_cap(padapter, cur_network->network.ies, cur_network->network.ie_length, (u8)cur_network->network.configuration.ds_config);
 }
 
 static struct rt_pmkid_list   backupPMKIDList[NUM_PMKID_CACHE];
@@ -2547,7 +2547,7 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
 
 		if (issued == 0) {
 			psta->htpriv.candidate_tid_bitmap |= BIT((u8)priority);
-			rtw_addbareq_cmd(padapter, (u8) priority, pattrib->ra);
+			rtw_addbareq_cmd(padapter, (u8)priority, pattrib->ra);
 		}
 	}
 }
-- 
2.39.5

