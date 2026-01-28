Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E885330B15
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 17:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769620641; cv=none; b=OCvv69OVXXgS3Q2jHYy2NnALWacDoY/PZBL4kE2NTxgqqdRugvCUQLpqAoP84ghRHzllOusOENk7D99epNHXXcVy8CtmlsLs18M38a7Z2vIwnSWE89dErmvjgmiYLUj/OXQOkJwYg3HRsOGpTDr8grSuzXl/wC1GSnA8tzKEVHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769620641; c=relaxed/simple;
	bh=b17qN9TRMwWcYBHs/O83G6kpC+Tqs+yX8Pc/R+LpkPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SQY4AGPelbySQcZShYInCUFxdhfyXQV6cfMnF6Fy03b/nEAqMMgjh3DWytgQcm0dghP/zX3VY4Mtee2QxlOMAYmN5JfyfTtrDpxeJC4yaRbM4lbcyvzvXwkhGfapETFhUODH+i7VSxuR151vDtPTOsY0e6liy/OkXajxrylo7+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mMK3UsfT; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mMK3UsfT"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-435903c4040so90128f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 09:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769620638; x=1770225438; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLV7wE3nutGmWkql5tDpzdltMWLai9dDTzGyRecJ6+I=;
        b=mMK3UsfTyBbGlpM41wGUWokKhoEPT4X14gbFFulctdHuUvw/8JQMKT29zdYmZSnun1
         aPGxlPwYrsT+Cq87+AUIyT6yUSrZ4SETS4CpMyiKJFjG8pcD8Szd9eScruFgD8bQiDgW
         hOIPCokyUKqyUzUUeQgjCZAl4MheVamdPWPaQTXi5TJ1ynAw8kQzBlo9gTlzV/5+7Usp
         7qrOBmV0c77nrTnZJEvcQunRg4X3FV4Wdq3BeXJ+lTtOvUozhbvoeWebyk1sZx02CYCB
         qaxylKdHY+Imi/GSoWKYwU6+ii7hZ/pk9dPQdJDhvRGPCtSxnkaziK62yCUNJrSImCGp
         s3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769620638; x=1770225438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YLV7wE3nutGmWkql5tDpzdltMWLai9dDTzGyRecJ6+I=;
        b=cbLy+BhOQwm2VHTcnqJvr5TAiECHo982V2OPWJIxuJgSM0JoGX3rzRl7kwcwm4d5NF
         lOBpJC+C6q3GIueITG4mnXcwlOe3R1aQBQdSeCoSiuHDMT72ZSUjyKLDNBW1DU5yHZxA
         NOTXustViazdbAuxAVGjileowEdOpbg3kvCENwU3AndzYm0pydmPAOlpUYHNLAIcdwyI
         RrfWaOgwpcvlHdT5ik8pZEOz0dqXzqxPD4O/9PHJK4YAh6m225yXKQZry0ADlSiNslH3
         udvLh6VGZM964yOorhFE4F/AHNsFrt36FnqSoTwmS7v6J+1N9Er7ZwF7ggqttj7f9NNg
         wAVw==
X-Forwarded-Encrypted: i=1; AJvYcCU3d++nXj525ebyDsUMz6RO2SlS752m8EVN8APu911inBoI8EbLFo8g+uxrO57hjuAwTT8JattKuLALnvFr@lists.linux.dev
X-Gm-Message-State: AOJu0Ywgi0dnsa5oDMZixhusPzv7Rivy0ReVS3+T+hUsNXnBb1TU71ys
	/pHmnmx2Q6vh+KicZQDLPiHbrQ72A4qt7LfoRbqAZuiE2D//JJnCfcA=
X-Gm-Gg: AZuq6aKI649oMI/5oZ8p+sMd03ZJzPtJ8JPj7GKh6Ggj1LISUFTd4aGZqBqaEJMVmth
	r8PO46JZEhvaaQfI9wKXRVQS7M9Uwl3edP912pjFT89+1+80bJ+Q3Dew+18/cQvx+ROuaAXpAer
	tMzyvXREwYhHknvYu5aJQwsWSY+d4YszX73Xz5z/J5DMLl4ykjEsXTIySM19wyDe65kvFPGGBzy
	nzsJdI5yy7f6Qt+L8GDj/uEq0tfrcBA322Mqrd8GFls39G6uPMfLj/5qbJVSie5QKvLGeRhgfdn
	hFXFwsVtY72F+YVQglkfXvkE/qBUJcVQIRDCtkeLEVhhkIw5obGqoqFscpLRxCUZVJpDY0SRlmB
	KenBgbw2/7QZnV9H+41sXkWQvzRz4GW+3SUMX/FBVA3a0+MLLlyWSZ/qbll5YXiENgZPnydA5h4
	xpuA==
X-Received: by 2002:a5d:5d83:0:b0:431:b6e:8be3 with SMTP id ffacd0b85a97d-435dd0b69fdmr9307581f8f.38.1769620637760;
        Wed, 28 Jan 2026 09:17:17 -0800 (PST)
Received: from LGPC ([31.223.131.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10f82aesm8758853f8f.19.2026.01.28.09.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 09:17:17 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH 3/3] staging: rtl8723bs: remove dead debugging code in rtw_mlme_ext.c
Date: Wed, 28 Jan 2026 18:16:35 +0100
Message-ID: <20260128171635.39879-3-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128171635.39879-1-lukagejak5@gmail.com>
References: <20260128171635.39879-1-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The if (0) block in rtw_mlme_ext.c is unreachable and contains
manual hex printing code that is no longer needed.
Removing this cleans up the driver and follows the staging TODO list.

Signed-off-by: Luka Gejak <lukagejak5@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index ac49bfbaa5bb..b61841bf16a5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1849,7 +1849,6 @@ unsigned int OnAction_ht(struct adapter *padapter, union recv_frame *precv_frame
 unsigned int OnAction_sa_query(struct adapter *padapter, union recv_frame *precv_frame)
 {
 	u8 *pframe = precv_frame->u.hdr.rx_data;
-	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	unsigned short tid;
 
@@ -1865,14 +1864,6 @@ unsigned int OnAction_sa_query(struct adapter *padapter, union recv_frame *precv
 	default:
 		break;
 	}
-	if (0) {
-		int pp;
-
-		netdev_dbg(padapter->pnetdev, "pattrib->pktlen = %d =>", pattrib->pkt_len);
-		for (pp = 0; pp < pattrib->pkt_len; pp++)
-			pr_cont(" %02x ", pframe[pp]);
-		pr_cont("\n");
-	}
 
 	return _SUCCESS;
 }
-- 
2.52.0

