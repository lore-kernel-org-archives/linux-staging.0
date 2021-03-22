Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226896F
	for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 13:37:14 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id z2so16833382wrl.5
        for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 06:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zoyz2WjgS9xtPGEThIBq0k90KpGSwnaCsq/dEe/4rjc=;
        b=GmHRPTLsM37WqhJqFD4kROP+U72b29R78rWrPkMG1AZfrNFB3JvrpIm1BOSCaQimsx
         Qe6H0y3ylNuNh4XIroyluTH4iDGCjE7cYnGlxUUaBILxSGvPpkLBNqtxLq8svlgXk/b8
         EkD8uL8ByJRI5h4mW+Vn0Jwg/di8tVGnMDwNav0MKcxYKnOlwrLdGrbRQg/D3mSaLwet
         bKZQjKWIZhV8g1tRTqtS/+wSdKOF5CnPoM4HVB+9f5tvVdqjT6uLhkutTfXH5FkUtv1O
         pzk9GVt7h8V6gfyYz6JxAWPaIuAc+5n5EtoCsuoq/Yqit6/1Vy33kCsNBe8ybOebxvR6
         i3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zoyz2WjgS9xtPGEThIBq0k90KpGSwnaCsq/dEe/4rjc=;
        b=oZyU8rfRvXq7yV5xHwN2/3+ST/yEr+QEd9VxP3xtEpLDMO4lF5/7RRpwpTQK/TYTVT
         be31GVnRNPOhlX+k3ziQiBYrOz1oVCeo63JbfCL36QQoQghWUxctcgxMVh5G2ZN6VvGG
         MeMahETT+EbjTbRlmi1zJeUu1cp3vK51kew2G8WXrTpa4xGQce1HjvD/TH5rxDQfDmmx
         Nu9SMvwQxu8b/MZx9f2gaytvjjBmMnD79IGOv4IBfYgK4Qbrp9gowoB1cKvkXYaWEcQt
         s8tlOa4Xp+8sR84VB0r5cTMyFqRFvNRBKJf7XtAiWYsgXmgLBZwW3zwJv1W0+XMtNu10
         0Nyw==
X-Gm-Message-State: AOAM531IeJsCyyS1e3yjHXrTHY6zX3wUNh8wydoUb7DiNtzvuGiX4gmM
	beK0slxklrtPm7PAhTrn66o=
X-Google-Smtp-Source: ABdhPJyRCKnLzhKS5glRvrXZV/KCqmt8Y2RXpJgcHXqVOOH/jkpGp8VSaWTAuzSqiZouxTYE7wLfqQ==
X-Received: by 2002:a5d:6ccb:: with SMTP id c11mr18593437wrc.122.1616420232738;
        Mon, 22 Mar 2021 06:37:12 -0700 (PDT)
Received: from gimli.cesven (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id d204sm17091770wmc.17.2021.03.22.06.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 06:37:12 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 03/19] Staging: rtl8723bs: remove useless structs in rtw_recv.h
Date: Mon, 22 Mar 2021 14:37:01 +0100
Message-Id: <20210322133717.17797-4-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322133717.17797-1-marcocesati@gmail.com>
References: <20210322133717.17797-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unreferenced struct in include/rtw_recv.h:

	struct smooth_rssi_data

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_recv.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_recv.h b/drivers/staging/rtl8723bs/include/rtw_recv.h
index 3e2ee7f75e8c..2709c9413dbc 100644
--- a/drivers/staging/rtl8723bs/include/rtw_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtw_recv.h
@@ -69,13 +69,6 @@ struct	stainfo_rxcache	{
 };
 
 
-struct smooth_rssi_data {
-	u32 elements[100];	/* array to store values */
-	u32 index;			/* index to current array to store */
-	u32 total_num;		/* num of valid elements */
-	u32 total_val;		/* sum of valid elements */
-};
-
 struct signal_stat {
 	u8 update_req;		/* used to indicate */
 	u8 avg_val;		/* avg of valid elements */
-- 
2.30.2

