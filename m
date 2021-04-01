Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F50B5F
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:21:44 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id e14so1813579ejz.11
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fZoX+gcDb3Jy18EAvERN1m52sSx5ol5SrYTmapPbGFM=;
        b=c8qLMSuUvW7O8XKFffGsVUB88bbNVNadGNaUEIWDZfLsaiEFNGYragC3sNLhsKs4KO
         7nseukTup75+zaYe3G4Elb9QexF9cFgKtvixrtUvZqqjSCApnAKFdwWyrjOQxAAgBgnS
         UZUO9n7T+4ISW+yPpOHJIriT//mTgriavAK2GDlK4bZRufpZPnBxetvx5FyPE67kFRJC
         9bXfE3Q4KZjANhkNMHh4rx29Gb51bEw9AYjTvz+BsN+T3KvxNyU3GIycSdsJ07MCNm5X
         Ni2yGL6QCQ4q+hskxgYqhNOQIQAr8EPdDKnoGBHNh68DLr0bg5U45BPVTZQZTixclxVy
         jZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fZoX+gcDb3Jy18EAvERN1m52sSx5ol5SrYTmapPbGFM=;
        b=Ox6iFC993qp0VDmpgZ4Wc2Rj7m8a5r2Pchl49Cyss7w7I9BuBS3nUd/UgrZNvTMFWI
         NYS8OC9uSqngopgAbXMZE3LjYfITTmPlAhFPJCfTUyhzNQJCKxO19X5h9dn+hGC7kh13
         PQqVja5+mmlKJu8q81yU0qw9Kg4A3ap99TXAeGZ8NQz+a/Pp9Oo8/WRwFcWiKgTMwIt3
         H/EzqAZMweNk/xQxUD+3RCOpz5lJb8XAIWKklFAAvtBF42RCOJ4xMueOL4PG1EPCJlX0
         nqn6ciLHVoYNYQagAqZkLtA8edWvj8N/pACJzp4+onhJsJo+/O3P9TyIRyYLde9yEA6P
         sgmA==
X-Gm-Message-State: AOAM531eCiuUnCn3ZNYYyAMdXR/q2AfN0EiuvEdBkm2pEkJlHEO/LTx4
	9fIJ9tuFTuqNbrlv4mvlTY+o8822h4VYtw==
X-Google-Smtp-Source: ABdhPJwlTfZjI0tCBAlW5Loil26MaOOM22YKasC5KhJyUoOi0WHpcGAZBS4v1cITumALi8b+h9xzCA==
X-Received: by 2002:a17:906:af97:: with SMTP id mj23mr8363312ejb.419.1617268902696;
        Thu, 01 Apr 2021 02:21:42 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id y17sm2487620ejf.116.2021.04.01.02.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:21:42 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 12/49] staging: rtl8723bs: remove empty if-else block in core/rtw_mlme.c
Date: Thu,  1 Apr 2021 11:20:42 +0200
Message-Id: <b18a50293d92c0cbb598e852a8e4f0a497f6ce3d.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove emtpy if else block, the condition is just a value check

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 09409330bf9d..84f348ab807b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1251,10 +1251,6 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 
 	rtw_get_encrypt_decrypt_from_registrypriv(adapter);
 
-	if (pmlmepriv->assoc_ssid.SsidLength == 0)
-		;
-	else
-
 	the_same_macaddr = !memcmp(pnetwork->network.MacAddress, cur_network->network.MacAddress, ETH_ALEN);
 
 	pnetwork->network.Length = get_wlan_bssid_ex_sz(&pnetwork->network);
-- 
2.20.1

