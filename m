Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5516D00
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 22:36:14 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id m3so54751wms.4
        for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 15:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mGUdj9/gWDuOqc4rQHS26+gQ8zPgw4CeoYiwIjeGZnI=;
        b=dRNE7DlBAfpQGAaZ4izQ1L5j5cHdiHzfP/Sg+boaAPj3TGEkcIupJHss+TvuXbXIEb
         XDb5tOp/GbfBNClyUKvYedkNv/YHjzdmzXxyvgSBx6b423eQ7RbFtK2+u/nW4EXxuxFP
         TGXgBVjG6+R1vVfwUFe5xq5tzc7GAWf4MTEdE672HP1+mbwIL0+mVsz0H9+Sy9WlVn1W
         95bbTtFO494lgAstB0+G6fBSC0cZLWoUUqFlAEnazsL+EPHWww87A4n0lEWYiaXltIAg
         tzBbzR+UY0HWXOAsUceeuhlUsNd7CpEw9EzhqYuXOHtlQ696ei6MwJz8kVVeV58XPSYo
         01Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mGUdj9/gWDuOqc4rQHS26+gQ8zPgw4CeoYiwIjeGZnI=;
        b=kjJN3d8wHyJ+tpYXgXJZlbjm30ZGMxOoMuT/z4MEWkx/ICQ/oDJMZRsy4p5d5JNTwp
         aMyDoZegTVWEI6C+ILPEuHlRVcx53s+VyxArRV5oVMPVv3BtLLxArkWYQQb+ATTEYCSv
         MK/MEGIfSXj4khluiqRChlKV04I1eUMD6b+NNOdrTSdDi0WyQDyrAnb4s37S8oT5Ypfj
         L188K9CNaHv/Msj6ZO9c5E8EL0syZWvUq2IfSu2+zAfG0NOjeYCmBoJWE5TgTBrfxD3U
         k8tAQxoXYzVYwLW33TolvDBzP3CrpbkKVIJYnHKvcREiFRl+Ojuq+64qELhFD+kJzcz2
         ZSpQ==
X-Gm-Message-State: AOAM530AsRDr1OkQ75z2oqoO7S327Hf2jI1e3AdUzrkmTNNsVBf49h8e
	1Rz3/YpOig14r4Jwm/pEZ9bcfg==
X-Google-Smtp-Source: ABdhPJw5RnKq5d0N3AZ5wTaOdhslKBA6d7JICwUf7eBF0rQYWt/CYx6w1sJEgGwysHY3y/2Ase3E6w==
X-Received: by 2002:a05:600c:4ba1:: with SMTP id e33mr7858113wmp.39.1623796573510;
        Tue, 15 Jun 2021 15:36:13 -0700 (PDT)
Received: from localhost.localdomain (2.0.5.1.1.6.3.8.5.c.c.3.f.b.d.3.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16:0:3dbf:3cc5:8361:1502])
        by smtp.gmail.com with ESMTPSA id m23sm3934791wml.27.2021.06.15.15.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 15:36:13 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 1/7] staging: rtl8188eu: remove empty label from mlmeext_joinbss_event_callback
Date: Tue, 15 Jun 2021 23:36:01 +0100
Message-Id: <20210615223607.13863-2-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615223607.13863-1-phil@philpotter.co.uk>
References: <20210615223607.13863-1-phil@philpotter.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove empty label at end of mlmeext_joinbss_event_callback function, as
it only contained a return in my last patch to make the code build. It
is better removed, and the corresponding goto converted to a return.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/core/rtw_mlme_ext.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c b/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
index 6107257900c2..d41fd0b8980a 100644
--- a/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
@@ -4253,7 +4253,7 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 		/* restore to initial setting. */
 		update_tx_basic_rate(padapter, padapter->registrypriv.wireless_mode);
 
-		goto exit_mlmeext_joinbss_event_callback;
+		return;
 	}
 
 	if ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) {
@@ -4309,9 +4309,6 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 		correct_TSF(padapter, pmlmeext);
 	}
 	rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_CONNECT, 0);
-
-exit_mlmeext_joinbss_event_callback:
-	return;
 }
 
 void mlmeext_sta_add_event_callback(struct adapter *padapter, struct sta_info *psta)
-- 
2.30.2

