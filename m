Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486B271
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 03:25:47 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id lr1-20020a17090b4b81b02900ea0a3f38c1so616815pjb.0
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 20:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dSZfSUphe0NnbZB4k0O50WfWli08mKIdprthWm9Rpno=;
        b=Q2zyqbhkJBE+68u2PKiL6DXL1fRUnCaElQ5huclQL9s5/ARpDjGe+BQ+/6Fwu6SJoB
         lhhqE++b+6bpKJBmIxMtXPtOeuYPrwxliwSyyhXxyVzMV5QMo4/pQnP+sbYWtMNCwzDB
         SaO3oIjJAr60Q6hHixI6zO30B/buCvH6clz1gwhuzujMC6zK1nYe8qCdDKTOK2Uo6tO0
         aLAWxN4au9GG2KGT9XT2uhSnpezXZJypo9G279gHbm/fPLZZi6uBZDj5eGqndlErlah+
         GXKswWWEDlemT8ZkZF1RlNWxogeMEZ4KFjNDsKxxvEDVCs/+Bdw+tz1eYQAx2GtPZKYR
         L8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dSZfSUphe0NnbZB4k0O50WfWli08mKIdprthWm9Rpno=;
        b=ps5nUumsJXlCkkeXBxbkEHtZhNqYgZejnToXcZACsEc+o47KG/WGhOazS8xqJW+orv
         BvCI48xxAj/JNVOM9mMYz7Wf+fYYmJI+bj4hErvzeBbAGwC1o394IbuGmSgnVpUNEDw1
         hOPVV414yZ6X9qmBUP6AicLObPNZDFelu2c7Ynklr3doMgEj6PuBPUx8mv/vxGHmjqYa
         F76SbNnGqcWas3mFZ4/JwHZlhGSL6XD2e4sQwwk3v0UiZxWhgKKuelae40F5nrfEAbDf
         E396OVLkRNbZfy6WnFi2MGlLnjFJRmGqOxEntbbzYBSN+P0MNYkDQE4/rXV7kV1ldVvN
         kxVQ==
X-Gm-Message-State: AOAM532nf9qj5zYp/cD9qjzXHi0O6wDI1d6nE3reptBRCgtT90C0tA3w
	Z1R2mcpxFCnnAQzwKbNDUSewb2QVB57YcA==
X-Google-Smtp-Source: ABdhPJyKAZCA9CN6M9vXmT3sUkhVKKtehRUoTVZaKf8uB1pYlKWygMK+JjrfoVEBNT56jYha6AGeBw==
X-Received: by 2002:a17:902:d306:b029:ea:bb6c:3c99 with SMTP id b6-20020a170902d306b02900eabb6c3c99mr15772422plc.9.1618284346794;
        Mon, 12 Apr 2021 20:25:46 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id k13sm10334636pfc.50.2021.04.12.20.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 20:25:46 -0700 (PDT)
Date: Tue, 13 Apr 2021 08:55:41 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v5 2/3] staging: rtl8192e: remove unnecessary ftrace-like
 logging
Message-ID: <460ba9cdd256bf1064c4e3a694caa046171cb60e.1618283232.git.mitaliborkar810@gmail.com>
References: <cover.1618283232.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618283232.git.mitaliborkar810@gmail.com>

Removed unncessary ftrace-like logging by simply deleting that statement
as we have other modes of logging like ftrace.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 
Changes from v4:- No changes.
Changes from v3:- No changes.
Changes from v2:- No changes.
Changes from v1:- No changes.

 drivers/staging/rtl8192e/rtl819x_HTProc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 0b1e92f17805..89d0e9ec188d 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -630,7 +630,6 @@ void HTInitializeHTInfo(struct rtllib_device *ieee)
 {
 	struct rt_hi_throughput *pHTInfo = ieee->pHTInfo;
 
-	netdev_vdbg(ieee->dev, "%s()\n", __func__);
 	pHTInfo->bCurrentHTSupport = false;
 
 	pHTInfo->bCurBW40MHz = false;
@@ -698,7 +697,6 @@ void HTResetSelfAndSavePeerSetting(struct rtllib_device *ieee,
 	struct rt_hi_throughput *pHTInfo = ieee->pHTInfo;
 	u8	bIOTAction = 0;
 
-	netdev_vdbg(ieee->dev, "%s()\n", __func__);
 	/* unmark bEnableHT flag here is the same reason why unmarked in
 	 * function rtllib_softmac_new_net. WB 2008.09.10
 	 */
@@ -832,8 +830,6 @@ static void HTSetConnectBwModeCallback(struct rtllib_device *ieee)
 {
 	struct rt_hi_throughput *pHTInfo = ieee->pHTInfo;
 
-	netdev_vdbg(ieee->dev, "%s()\n", __func__);
-
 	if (pHTInfo->bCurBW40MHz) {
 		if (pHTInfo->CurSTAExtChnlOffset == HT_EXTCHNL_OFFSET_UPPER)
 			ieee->set_chan(ieee->dev,
-- 
2.30.2

