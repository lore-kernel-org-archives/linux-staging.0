Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88DC6D00
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 22:36:19 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id n35-20020a05600c3ba3b02901cdecb6bda8so2746343wms.5
        for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 15:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p3xtY9mPoivqNlxlTxZKv34gtKqQm9nsURNrhy81q2A=;
        b=Ci7VJYN0rCSCmIXqe49IueJeE4nNGn5FtJO63nb+NNydpvZ7lIHbFiLzBQIQJXD/f/
         WIgMNZjAC95AHsDLRGROFfArBwoKWmTLiOTioi56jzpuMTMQqbjqefqB9oq8+LSGJIA0
         lDdMZAs80ee2B84FusxB1bJmG4qHAYSgThESnfzX7UpUyFxDFWi3yIdsiXGqJtSOX5uK
         Yo8tRcEBzRzXsQbssXhOAv4b7ShZw1CLiXqb3/qWawIPYXYj4rR9WM+Q7Ub4zJwQsadO
         9SVUIrMD/jQYxRsDlSSfOuttFRYTjdqKjAAwUXn0Bogdq3EhiWWKSPHFHuW1/ZKa7nkm
         FOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p3xtY9mPoivqNlxlTxZKv34gtKqQm9nsURNrhy81q2A=;
        b=M4qggH6/BX3bWPqtxs13K+P8kGUV3+mbVaIwMMkX3BV6yiI/zFMMbEehAKmewhwFnm
         zFW8rfaf2BbgOk2dxhfMEAO+TtI7kNTUFtQ63Y/53DPTQ5s8BD19djf3ghi4H5GdB+N6
         g+UXfYHUJyxabKKBFLo5HlyJTAc1Ee8fet8HIgbkO8sXSnPC+xx//yCg8KftNgeGc0Ia
         qkg8B/nFDeoM4TFQ9YNss0ZJ65TIX2zBRXC4t1tFq7N15Z67EzjFDV786O4dn2s9+OHe
         Gpt9FKT84Cjk9tg2iiJ8LfXu4Z6HzzIPLQrLTM73002Wf5+4UWdUvuBKurNa4aIXH3ot
         GsiQ==
X-Gm-Message-State: AOAM530SBXDK6QoQX+sAdeuBUyqOfuKs0O036CMUczkC5V2JXy5OuFUy
	oTk3FpHYG424pwBeP+m93+85szVj/x5SuS7z
X-Google-Smtp-Source: ABdhPJyjBpt7Dzscmq1yI6ao0PppHxeTfUZpKwqbfixDLkMzsydDIYZ0NnVeo26TplSifH8/sMowrA==
X-Received: by 2002:a05:600c:3b1e:: with SMTP id m30mr583978wms.101.1623796578316;
        Tue, 15 Jun 2021 15:36:18 -0700 (PDT)
Received: from localhost.localdomain (2.0.5.1.1.6.3.8.5.c.c.3.f.b.d.3.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16:0:3dbf:3cc5:8361:1502])
        by smtp.gmail.com with ESMTPSA id m23sm3934791wml.27.2021.06.15.15.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 15:36:17 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 7/7] staging: rtl8188eu: remove _dbg_dump_tx_info function
Date: Tue, 15 Jun 2021 23:36:07 +0100
Message-Id: <20210615223607.13863-8-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615223607.13863-1-phil@philpotter.co.uk>
References: <20210615223607.13863-1-phil@philpotter.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the _dbg_dump_tx_info function from hal/rtl8188e_xmit.c, as
it doesn't actually do anything and is only called from one place.
It used to have some redundant debugging statements in it, but these
have now been removed anyway, so all it does is read information from
the adapter to set a variable 'dump_txdesc' which is then never used.
This fixes a kernel test robot warning.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/hal/rtl8188e_xmit.c   | 17 -----------------
 drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c  |  1 -
 .../staging/rtl8188eu/include/rtl8188e_xmit.h   |  3 ---
 3 files changed, 21 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/rtl8188e_xmit.c b/drivers/staging/rtl8188eu/hal/rtl8188e_xmit.c
index 0d5608766a0e..efa8960a7eb5 100644
--- a/drivers/staging/rtl8188eu/hal/rtl8188e_xmit.c
+++ b/drivers/staging/rtl8188eu/hal/rtl8188e_xmit.c
@@ -23,20 +23,3 @@ void handle_txrpt_ccx_88e(struct adapter *adapter, u8 *buf)
 					RTW_SCTX_DONE_CCX_PKT_FAIL);
 	}
 }
-
-void _dbg_dump_tx_info(struct adapter *padapter, int frame_tag,
-		       struct tx_desc *ptxdesc)
-{
-	u8 dmp_txpkt;
-	bool dump_txdesc = false;
-
-	rtw_hal_get_def_var(padapter, HAL_DEF_DBG_DUMP_TXPKT, &(dmp_txpkt));
-
-	if (dmp_txpkt == 1) {/* dump txdesc for data frame */
-		if ((frame_tag & 0x0f) == DATA_FRAMETAG)
-			dump_txdesc = true;
-	} else if (dmp_txpkt == 2) {/* dump txdesc for mgnt frame */
-		if ((frame_tag & 0x0f) == MGNT_FRAMETAG)
-			dump_txdesc = true;
-	}
-}
diff --git a/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c b/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c
index 7ca0a45dd0c7..729d3bbf4343 100644
--- a/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c
+++ b/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c
@@ -318,7 +318,6 @@ static s32 update_txdesc(struct xmit_frame *pxmitframe, u8 *pmem, s32 sz, u8 bag
 	rtl88eu_dm_set_tx_ant_by_tx_info(odmpriv, pmem, pattrib->mac_id);
 
 	rtl8188eu_cal_txdesc_chksum(ptxdesc);
-	_dbg_dump_tx_info(adapt, pxmitframe->frame_tag, ptxdesc);
 	return pull;
 }
 
diff --git a/drivers/staging/rtl8188eu/include/rtl8188e_xmit.h b/drivers/staging/rtl8188eu/include/rtl8188e_xmit.h
index 617c2273b41b..72a2bb812c9a 100644
--- a/drivers/staging/rtl8188eu/include/rtl8188e_xmit.h
+++ b/drivers/staging/rtl8188eu/include/rtl8188e_xmit.h
@@ -154,7 +154,4 @@ bool rtl8188eu_xmitframe_complete(struct adapter *padapter,
 
 void handle_txrpt_ccx_88e(struct adapter *adapter, u8 *buf);
 
-void _dbg_dump_tx_info(struct adapter *padapter, int frame_tag,
-		       struct tx_desc *ptxdesc);
-
 #endif /* __RTL8188E_XMIT_H__ */
-- 
2.30.2

