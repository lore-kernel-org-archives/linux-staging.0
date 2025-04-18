Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A29213E89
	for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 15:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744990952; cv=none; b=RGpmAKpfQnhd6nk74gPOUO2OOQrlyaAgbq0NBGmOUOIkLB6cgtExzlZAKHqYWGf6cXhpYfFni5HyzJ73Lrf87l+r27yWWT2YsfmnBBtZUgRoUwKHt9wrG9WjePMU+Iq6zoj4ny1wTCi4PVEifBLlYG/dQGlcpscDdWC5wKyEH/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744990952; c=relaxed/simple;
	bh=chPzjK0Y6d/4/rESwcFrsvyNA2pkcRF2YGDzqvtbNg8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ltlKy1SirDPO0y0q5HqMfdvj35v/1kZOSVTw4FxRNjfbUdL3twekOXV4RcrfBZAffYcW8EkiupYV9VYO4lk1zROpdmhxA8DUoKnG7aowJIXG1OjzldCHp3TXVzDdTd/vTxcRDcwSZ8Sx+Qs3/u+d323jgUjYXUTlEsN77XgQsvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZgbUhvWX; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZgbUhvWX"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-391342fc0b5so1629828f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 08:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744990949; x=1745595749; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0b90C4lr8yP65JgT3uHcE27HOgYLSSWJG01aMf2J+lA=;
        b=ZgbUhvWXIHEHNLyp6dvs/Bz7LWLBSRNd47UxtMSt5vtcQGRIWVqxzzuHYYDwISBVeb
         eh2O1YC2clFmtV7BksKEDtHGtV7QgNe53eu1TCfYMhjsuQU7Qa90QlgqZbVtOn0py4Td
         eLG4BjHn5eNeWA+bFr3AGJBRZZdf88+ftJQJZXR+Zk0DP38sPURM0yJh/K/eh8UOJ6Nl
         adqoEpTP53ffl0TnUmaNdLwdyk+OIvRn664KVox3/pA2/DN5T5xsgsD0ekoQ07y3tyyU
         HLbuWxU4f1/LzGYEHwYy26KWFwtdiKYNXNeiuWYWqSm73h/lv0YLjZf5mmxJuZXj63wA
         OFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744990949; x=1745595749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0b90C4lr8yP65JgT3uHcE27HOgYLSSWJG01aMf2J+lA=;
        b=d0QwTvQ8nH44IWUwfv3eLcY6v5e+lQlXHUBMoh9H9lnj0uAbX3Q7htIEJYBNBin9TS
         sZtB5kBb4midppv8huuvvO1+G+OLH7Y8LahlTpveaggLwDKFXVsJ1yuJ+ukMl4Xmz2ik
         9/Hr0Bq/CNh7dwI0gc/b8Xj5LAM0/omUCodg4fdofvKnh/RdTAnExd3iDzo33cOk2yrW
         8eyO5LZg1Nj3rAQVC4PRgiOi+sQZ++yv2wTbYNr/fpHselzOzvj+wem2tBe/5Cuqpcxq
         ZnIxDgpVFYZEJWhB0vqekCDKB5HTCj4ZU/yzYzEvsFVyPu6u2dnY51RYW9YhDewPjwiH
         scbA==
X-Forwarded-Encrypted: i=1; AJvYcCVacYYc8I3jmgQ8DJ/+ozsEz5lQIytdpWVYTefbYYzF946cm91gMr+EK6n1R5fzcHE4YmaOfDsrUUM/by8G@lists.linux.dev
X-Gm-Message-State: AOJu0YxAeSRPvk7IKIfrCE6be0POn7TGwn/C56UXoSEC3E902SMYkUg4
	E22WLYT4V5SuWSdxD3WUtd7756M4ApVUbUQrMlUw2fNbh6O6hl9Q
X-Gm-Gg: ASbGnctTIImhYIP9diAJR5U7k/lsgCy2GlMUHWCi97qUNE+BBZspa/U23Ei9VeI2ml1
	HF0jLSqZuS0HDA2cEqH291s7iWHuURa9pxAOc/Gh+SRJ+JreeV6xLPIHo4hLfTXLLbvAQMbCya1
	81IIOdrxZfs7dtcDteTWLzvWdktHC9T+1adEBD3Jm1TjMt5no+azpBVArbWkIOQtEdIXdNz9tE0
	EXzW3Dx+c0UQdQnADFeI/aW6hQ1Uz9hQlRolAnqsScDWDc5JtcqEJNFaWe6DEHfNpbBpatpIU9Q
	9Hw6PHLRSU3XOA3exRZlL5zUTVnbJTqEAnw7iA==
X-Google-Smtp-Source: AGHT+IFz7MKBqADDjiLz0R8iijddpAAhVZVxCPRJR9FSy4ojOMYYkYvkqtBkxw511//nnxrOkwkIuA==
X-Received: by 2002:a05:6000:4a1b:b0:39a:cb5b:78fe with SMTP id ffacd0b85a97d-39efba8a4f4mr2270637f8f.34.1744990948698;
        Fri, 18 Apr 2025 08:42:28 -0700 (PDT)
Received: from ubuntu ([102.88.77.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4207basm3059496f8f.5.2025.04.18.08.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 08:42:28 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: julia.lawall@inria.fr,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	dan.carpenter@linaro.org,
	andy@kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v6 1/2] staging: rtl8723bs: Remove duplicate NULL tests on pstat
Date: Fri, 18 Apr 2025 15:41:56 +0000
Message-Id: <016d5429e5db0596a4fc8bb25b1c23ff94ff88b4.1744990405.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1744990405.git.abrahamadekunle50@gmail.com>
References: <cover.1744990405.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pstat pointer has been previously tested for NULL after being
initialized as seen from line 970-973 of the file.
The first NULL test is shown below:

		pstat = rtw_get_stainfo(pstapriv, GetAddr2Ptr(pframe));
		 if (!pstat) {
			 status = WLAN_REASON_CLASS2_FRAME_FROM_NONAUTH_STA;
			goto asoc_class2_error;
		}

Remove the second NULL test to avoid redundancy in code.

Found by Coccinelle

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index e74fb7d5dc37..863c188a3cfb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1323,7 +1323,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	spin_unlock_bh(&pstapriv->asoc_list_lock);
 
 	/*  now the station is qualified to join our BSS... */
-	if (pstat && (pstat->state & WIFI_FW_ASSOC_SUCCESS) && (status == WLAN_STATUS_SUCCESS)) {
+	if ((pstat->state & WIFI_FW_ASSOC_SUCCESS) && (status == WLAN_STATUS_SUCCESS)) {
 		/* 1 bss_cap_update & sta_info_update */
 		bss_cap_update_on_sta_join(padapter, pstat);
 		sta_info_update(padapter, pstat);
-- 
2.34.1

