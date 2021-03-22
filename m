Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF39671
	for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 13:37:24 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id j7so16846156wrd.1
        for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 06:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rNfBx9MC7Ds8C3FcPeI25hfmCerX8Avg2G8GZj5Twhc=;
        b=fSGAHQpIkGZ9uw96XG7+pH9mBsC9Em7h5zWimlABRbwU/Lq7zH/m31Xp73QJQ3Sl/i
         eXZQd+JtDhuoGTisyti24W1n8G+0+gejEvgTyKeJDbELQx5Suh3YU2qCY51bqCp7LEpV
         YdIG/3aS6FtAqG+nE//97fHWcTnUNTVEf3z0FPOVBfbGTGaCsn6tH66sAX7qP2FQak66
         L0ODUWmXxc6HbF+Z4gpkT0sTdsI06a/3A46dM+KIgFj5eRlhDSXw1cI6m/XNP/FJxi08
         6YQn8ZvCJy47QfZqbfrDtdBUrcGomyidVWv1R/E0giNJLRzO56TgQq6/o0TjdDlhrRR2
         yRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rNfBx9MC7Ds8C3FcPeI25hfmCerX8Avg2G8GZj5Twhc=;
        b=c7usFfd0vNtwvr1lHRMD+Bc6Xb8BdOWDytZKPCtIDYZ+59WlqXZ+pxxKLqf5Ykb6SP
         /aqvBUNLcenvay1ZtIo7aMUDYGPq/q2zHai+437YNgW7khLzP5LsOLuOEr9q7V9rQK5a
         RA3qbBxxD4r+UvpANNi+6cJgcpCnMCEeKbmp+zRkMQB01ncgHuGNJ1+2nBBEYTmH9iW8
         1lzoswylGNFUMAf6O1g9AebOB9jX/j+TESPon/xFagGMIfa1yohntYG1Qs9IGUxTSq7r
         PsRbn9C2eiUfH6OyE2t6Rw4PkPu0pwQ5Uz4hUCseGiH3vrlrMWMr8SQCZ95yVfpF/ovX
         2bCA==
X-Gm-Message-State: AOAM5311jC+lBoSRJm2qt1A2kfioW3CdErwchru3iZP8HHlC0oi9oW+G
	DzSx2A5NPQ0hwTEjkqUbsW4=
X-Google-Smtp-Source: ABdhPJxkyyXzIYuIr7ZNpqQ47W2B7anP3wR3iKe8CYo8M2/WcEjdbZp+aS/4cp5Qx165nsk7Myht5g==
X-Received: by 2002:adf:dc91:: with SMTP id r17mr18310661wrj.293.1616420243353;
        Mon, 22 Mar 2021 06:37:23 -0700 (PDT)
Received: from gimli.cesven (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id d204sm17091770wmc.17.2021.03.22.06.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 06:37:23 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 15/19] Staging: rtl8723bs: remove useless structs in hal_phy.h
Date: Mon, 22 Mar 2021 14:37:13 +0100
Message-Id: <20210322133717.17797-16-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322133717.17797-1-marcocesati@gmail.com>
References: <20210322133717.17797-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unreferenced struct in include/hal_phy.h:

	struct r_antenna_select_ofdm

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_phy.h | 24 ---------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_phy.h b/drivers/staging/rtl8723bs/include/hal_phy.h
index d2f5e7afcd64..90bb5d784674 100644
--- a/drivers/staging/rtl8723bs/include/hal_phy.h
+++ b/drivers/staging/rtl8723bs/include/hal_phy.h
@@ -146,30 +146,6 @@ struct SwChnlCmd {
 	u32 			msDelay;
 };
 
-struct r_antenna_select_ofdm {
-#ifdef __LITTLE_ENDIAN
-	u32 		r_tx_antenna:4;
-	u32 		r_ant_l:4;
-	u32 		r_ant_non_ht:4;
-	u32 		r_ant_ht1:4;
-	u32 		r_ant_ht2:4;
-	u32 		r_ant_ht_s1:4;
-	u32 		r_ant_non_ht_s1:4;
-	u32 		OFDM_TXSC:2;
-	u32 		Reserved:2;
-#else
-	u32 		Reserved:2;
-	u32 		OFDM_TXSC:2;
-	u32 		r_ant_non_ht_s1:4;
-	u32 		r_ant_ht_s1:4;
-	u32 		r_ant_ht2:4;
-	u32 		r_ant_ht1:4;
-	u32 		r_ant_non_ht:4;
-	u32 		r_ant_l:4;
-	u32 		r_tx_antenna:4;
-#endif
-};
-
 /*--------------------------Exported Function prototype---------------------*/
 
 #endif /* __HAL_COMMON_H__ */
-- 
2.30.2

