Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC898F70
	for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 22:03:44 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id g10so12511861wmo.1
        for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 14:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X2hw80KcuVAFiY4CDXg3tE7695ii5d+NENvOP8i9jB0=;
        b=naB3RXah16zS9TYfv3SuY5nU7oB2KZyejVbO9DWBDbuMl2nZHaPx25OzJhY9mvzUi1
         Yl1usIiQGf1EDfvF042o7yQ068rHWw9U07gIZfkIgAmexVHQvzygQXsLhMcRf86NOApJ
         XHPGNaihw4JbYMLuYkaiRHxC4F4kEfAk46MiiLGZ1FAJdBDnfTs0y92oJz9I1DBz5ntT
         EOl1mEZcEu4VqGid3XOgtIfnJjlfpQYTdiZQCoA9gIdIEkbEZJRb/xO5Yxwk6Xb25aTT
         6Ws9E7sR4y8TzGUGJIYyAAQ6d5BimVP6B1pPD4k0TRjP7GVkOaB9YO9a6moPYRpkE+Nh
         KGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2hw80KcuVAFiY4CDXg3tE7695ii5d+NENvOP8i9jB0=;
        b=V+91ue9zLeazgkUAMqYGdJAijx2FJYYAqbCbzVBh1c2PA7z3Ya2uWPaqhBk06G758C
         xhnY+epwu1X0cnEsAXG9Dfwc0EGh7K7FEBnYxlaqfW3MIRkGKFZIrQyBZduK+iBLK0iZ
         y6i9CmsIjvwYKsBUgw3hThHrHU1xhm5lgEifd23i3uFAUJVBTyrX/ZAo2dOG+PNtbiOK
         clHvzQircbN3m8SOE0mRzUHA/ThssiMHZcMsvbcu7QVuo5Ci8kyGFSZyIeUO8q4AoOac
         EBemi5HMZd/LTGTC25Rorh6GKkJ0ambIXmcK6tt1wBn98uTTFihBr/dbpguU1tKjmLCG
         YQlg==
X-Gm-Message-State: AFqh2kr+qB/xiAnmRP7R/Lqw0BLtKszdwz9kSk8oxNoLLj8w1bR7eboG
	DptBCaYa5jueUB8TCCCqzcs=
X-Google-Smtp-Source: AMrXdXsviwhZlPAxl3h3uQVg4/Jul77qoSKQNleBof+aidH7WdDd3WYw8pgsHsl8zUYXFBmbtoRWDA==
X-Received: by 2002:a05:600c:3b29:b0:3da:f7a9:50ca with SMTP id m41-20020a05600c3b2900b003daf7a950camr7698187wms.0.1674597822371;
        Tue, 24 Jan 2023 14:03:42 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id f9-20020a05600c4e8900b003d990372dd5sm37792wmq.20.2023.01.24.14.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 14:03:41 -0800 (PST)
Date: Tue, 24 Jan 2023 23:03:40 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] staging: rtl8192e: Remove unused variables numpacket..
 and received_pre..
Message-ID: <c90c54f7b0e122914d5c02d6849447897a268f16.1674596722.git.philipp.g.hortmann@gmail.com>
References: <cover.1674596722.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1674596722.git.philipp.g.hortmann@gmail.com>

numpacket_toself, numpacket_matchbssid and received_preamble_GI are
initialized and increased but never read. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 5 -----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   | 3 ---
 2 files changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index e9273dfb638e..c5ebc33dc7f1 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1685,10 +1685,6 @@ static void _rtl92e_translate_rx_signal_stats(struct net_device *dev,
 			 ether_addr_equal(praddr, priv->rtllib->dev->dev_addr);
 	if (WLAN_FC_GET_FRAMETYPE(fc) == RTLLIB_STYPE_BEACON)
 		bPacketBeacon = true;
-	if (bpacket_match_bssid)
-		priv->stats.numpacket_matchbssid++;
-	if (bpacket_toself)
-		priv->stats.numpacket_toself++;
 	_rtl92e_process_phyinfo(priv, tmp_buf, &previous_stats, pstats);
 	_rtl92e_query_rxphystatus(priv, pstats, pdesc, pdrvinfo,
 				  &previous_stats, bpacket_match_bssid,
@@ -1804,7 +1800,6 @@ static void _rtl92e_update_received_rate_histogram_stats(
 		rateIndex = 28;
 		break;
 	}
-	priv->stats.received_preamble_GI[preamble_guardinterval][rateIndex]++;
 	priv->stats.received_rate_histogram[0][rateIndex]++;
 	priv->stats.received_rate_histogram[rcvType][rateIndex]++;
 }
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 167c4aeea44e..70767238e721 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -184,9 +184,6 @@ enum reset_type {
 
 struct rt_stats {
 	unsigned long received_rate_histogram[4][32];
-	unsigned long received_preamble_GI[2][32];
-	unsigned long numpacket_matchbssid;
-	unsigned long numpacket_toself;
 	unsigned long num_process_phyinfo;
 	unsigned long numqry_phystatus;
 	unsigned long numqry_phystatusCCK;
-- 
2.39.1

