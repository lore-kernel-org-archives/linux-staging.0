Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B53442FD8
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 15:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785513172; cv=none; b=KAhdq51aNeWKE99hwhHVOEN4bBqRiev4DLm/pPKyKPRVXIT33G3LgbvenovQcD2XplYsdc7uIaELst/b+wtTItzacgL3nK4iWUiotBGpS1Pf42Gf8FgLuEkJqNyt/N6nYcZ9sATyJlLV1wKCGmN3sjnn9UWpoj15n12Uj2nOzMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785513172; c=relaxed/simple;
	bh=a0+Z9k6sMPSnzJ+y4Vd/U9aGI8y7mXfbpjtyaBPpXhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yqb6u/eYh5OhbpaI3BxG/9qXgjYBuWkfMi3RPKBMdJNgjFjk94vZBF1hNoVR9ztHIvhM7XBwnyyW9rPeJhtueFia+zGNjpPmEW6Ft1SIlEZdNGovwheXMJa9RmeuUTvmhcm4mLojGJnFAtt+UdTnSGO5vwnKdzU0EwtJhEzc/x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AsuRW5Ud; arc=none smtp.client-ip=74.125.227.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AsuRW5Ud"
Received: by mail-pj2-f9.google.com with SMTP id 98e67ed59e1d1-38ed4d37526so621402a91.1
        for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 08:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785513170; x=1786117970; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k6xscdSdqtSuRhxAG9/cpxfE7oRD8F29mqyv1hfzFk0=;
        b=AsuRW5Uds56TaKY5mGUOf3xxuPeARp4i3mQid2+hG9pOydGJiQRiwaopiCATwYMu8/
         EGP/7xp3unG44LKAXLM5L2/iPfwIrWt5bSdNHfWXqpoRcs2UaZYX/B38f7n7UutU/S8j
         PKouLw4jqQ9zt/UVdrj1JW1Ly04CUQWLWx2Uzr5eIwjH0a5eE4DJvgEW+9wK0Tvl8MUR
         ijAkPubKq3wDJicKIenwDrT4sTxWLCjNvk/mebgWr49K2cpqwvrwM2wnViL5eRwZIzVR
         RkCfjzQ3c/kblubSZxyVkvDWghs+s3RvCLVywYex0wLCKWDRp/keT1XdhkBS5HuHp9Wp
         /q3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785513170; x=1786117970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k6xscdSdqtSuRhxAG9/cpxfE7oRD8F29mqyv1hfzFk0=;
        b=qL9lpHB873fy75T0KKFLTur6Ipeny6D89ECXO9fDkXReDRi/NvY66yntoDvNiPgW/+
         ifmYefgZRuxl8foH9QZcK0Dqc60l1UbN1rZ2vAjq9wImIkPcnH7nCvpnrR7Glg2KMAVb
         N/eHc+o/+A0GUOXidNnx3j/jU0vVwGxbSQSHhHEJt8ILWoI5DYxXGRkb1xS97nuvps8J
         O0k4zkjXRta1uKF35408pJkjt+m8IbRdiaq0C5LN6/XVrE5cR4XF8ALIZbwFlWu+w6ge
         IIxU1IBbfuAoIr5ayBt9We1hzv+ThVv5t0R+f7Gg1a2LV0KyKysmCLIbUAHgPrV+0eG4
         qdXQ==
X-Gm-Message-State: AOJu0YzC9aHeCIxyQycr/QOahxzTKUtRTymck6AYgtj2cBmhku9f6i3q
	noJl8oBS1u8kKwA5nWjAwGbxmMm3l4oFEFyyeRROtMVLjw0JekH6Tx4m9l05XSV/
X-Gm-Gg: AR+sD10U/glolpIMeR/+0Qy84DODGpjiIzO5+cu6jMkJiP4W+vxbMAUgXl9mCvm2OSO
	tJxtWeV5xVSV7HubyAOJpvRa6XMduAxwWrAGlYtj82nHVtXAZbo72c0Qu6/HxLDKxhj52yUKrW6
	IqTIJMcDmqdwmjU7mJY3FdVSlGf8SzIRegwOGRPj3EJtSzJaEp5WVl4BSeiqksa9GdA1ZLLW/OR
	95nMI8xTQFWLgw9ninqnS2xUROzPx4uw7nWeKbAm/wsetYjCT6YBU+vBKOyVXnWlKqtxgGGVm2P
	RJNrmYS6yO2p4/ZG5sVd681IqppVZYVjz0qiEM1UwffL9eglQMajv4y8zXsZF02PTUL7lHWQ7JO
	g2rTtnrtaZ7SKnbtnN17nmYPbu3+wDeDoTZvM92wwJ5l56IgvsCraB8A2Z4GVymTKv98kdijx0o
	7XV3NshNlz3oLBI5bOtMOsk1Ld07LSi7ln2tIbKMyB4escVjL/opX9bsonotgNxQ99vAxQ9XyY9
	IkfN+KX6bMdYISWjdBx
X-Received: by 2002:a17:90b:5102:b0:38e:4b71:8b0 with SMTP id 98e67ed59e1d1-38fbc4ff425mr387767a91.25.1785513170338;
        Fri, 31 Jul 2026 08:52:50 -0700 (PDT)
Received: from localhost.localdomain ([76.86.179.124])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c96asm7669604eec.7.2026.07.31.08.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:52:50 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2 1/3] staging: rtl8723bs: convert mgmt xmit coalesce to errno
Date: Fri, 31 Jul 2026 15:52:26 +0000
Message-ID: <20260731155228.22526-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731155228.22526-1-dennylin0707@gmail.com>
References: <20260731155228.22526-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change rtw_mgmt_xmitframe_coalesce() to use kernel-style return values.

Return 0 on success and negative errno on failure. The only caller
currently doesn't check for errors, so this change does not affect
runtime behavior. Later patches in this series will propagate error
handling to the caller.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c    | 8 ++++----
 drivers/staging/rtl8723bs/include/rtw_xmit.h | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 16e6c9567224..01512f438295 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1187,7 +1187,7 @@ int rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 }
 
 /* broadcast or multicast management pkt use BIP, unicast management pkt use CCMP encryption */
-s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe)
+int rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe)
 {
 	u8 *pframe, *mem_start = NULL, *tmp_buf = NULL;
 	u8 subtype;
@@ -1210,7 +1210,7 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 	BIP_AAD = kzalloc(ori_len, GFP_ATOMIC);
 
 	if (!BIP_AAD)
-		return _FAIL;
+		return -ENOMEM;
 
 	tmp_buf = BIP_AAD;
 	subtype = GetFrameSubType(pframe); /* bit(7)~bit(2) */
@@ -1341,12 +1341,12 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 xmitframe_coalesce_success:
 	spin_unlock_bh(&padapter->security_key_mutex);
 	kfree(BIP_AAD);
-	return _SUCCESS;
+	return 0;
 
 xmitframe_coalesce_fail:
 	spin_unlock_bh(&padapter->security_key_mutex);
 	kfree(BIP_AAD);
-	return _FAIL;
+	return -EINVAL;
 }
 
 /* Logical Link Control(LLC) SubNetwork Attachment Point(SNAP) header
diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index 917e846e9ce2..31decc210e73 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -424,7 +424,7 @@ int rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitfram
 extern u32 rtw_calculate_wlan_pkt_size_by_attribue(struct pkt_attrib *pattrib);
 #define rtw_wlan_pkt_size(f) rtw_calculate_wlan_pkt_size_by_attribue(&f->attrib)
 extern int rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe);
-extern s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe);
+extern int rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe);
 s32 _rtw_init_hw_txqueue(struct hw_txqueue *phw_txqueue, u8 ac_tag);
 void _rtw_init_sta_xmit_priv(struct sta_xmit_priv *psta_xmitpriv);
 
-- 
2.43.0

