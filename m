Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B32127B6F
	for <linux-staging@lists.linux.dev>; Wed, 21 Feb 2024 21:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708551966; cv=none; b=p/hyP7sXwbbCxyQ/47n4CdSVd3jDQJLXv+SjxnH2Ja2Gx9aeyHuBNe2dpcpN/L3Rt5Wj+ESzf7h+QVvOaHCzeMnbZ0L6uoXvR4i7VEO0DrbVVL8dyGj0noblcwIKeiw603GqVya9dG/SEfjbvubaWMdb/5biRmGD0bhJTRjJ5S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708551966; c=relaxed/simple;
	bh=1OjWMBiL7QYaelFcEEUdanllK1rmxw4NgJWvRh4EmE4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QucuoSKH6uEd+prK9ouTi4sTN2scDYIOwdGsxutd7xTQ3yvwnsOfz59/2mTUp4jksSTkMrK2PGz3ocQWuUDUyB8OYDr6+T2EWZArU+scBATbRO58jUjcZXkvuAk/mITjBji96ImFRlQItD21IfD3wJzZn7iyTFoMXELdN+MG+9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hfnmF6u8; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hfnmF6u8"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33d817b3c0cso236883f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 21 Feb 2024 13:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708551963; x=1709156763; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EbGGBCSsuqXbhNe+nlC65PS6hYW27MmFIRLBgXUBQyU=;
        b=hfnmF6u8SHTTzCfzkXAPsjIevFQ4KNphHtHMFxbwGnt1znjpv9X7DfMMZ4MHCnsIc+
         ChjBxPEmob5R9RV+IjrCS8WSGzwMIdeSPoPrauvUj21gL89TtaVG6xdZ9OS6e/a9nO0w
         8YFQO9sIgDEZSeEhyU5nNG+rTZKxSgoP3ojrqN4egYqFIdWofg0VR8FgjeIvHvGhIaYp
         Z3sXgpRVvNXKdXtCi2ffNmWzEKh6ZqnRzk0iz7o+F5DOG7mBq+5WtClLQAVFVAWceoas
         7eWEap2rcIdc5onQGjHQy0Usy+ZThh/FPSsB1SnxtZdExlnvXI8uFYSx/aHerNs7pX84
         ztgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708551963; x=1709156763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EbGGBCSsuqXbhNe+nlC65PS6hYW27MmFIRLBgXUBQyU=;
        b=oNbZ+GrcpW9A1VO2lhH542z2STG+icwx6Dgt3ry8Rt1y4a+x2IXQiiLZPF2Pln0UT0
         wLjykwN4ttEeB6efqMC8aCL174f/eylai/BgKJ8hKcnIKTrD37DG+54/BzMP7rX0OUiC
         i2tAGxIx+D9EatypReDpI6h8LyKLAzp75dEKs7EYdCHWKqgOnhhr0YOC0YNeNDHSt0vu
         uXAogKtMoKsbt3kMukH6i+npt46XaGRVsx3rReVSoTih1srhvzEFCWUoSS03Yw1W30+U
         7l02+BqdYMM7nZHIdD0WbIgLDDfmqL22MAB89smRgjgI90TGATeFocxUwR0/c19tRpCn
         M63A==
X-Forwarded-Encrypted: i=1; AJvYcCWNs41qS/o/Ib+NzeyU/8QMxoqqEYTwYN7JUqphPZ0fWdBtV1eU0BwKlABJmObrvEIzkwzaAUII1Hd2a7ivaYl/u0tN4m17bKMNKXiHqg==
X-Gm-Message-State: AOJu0Yz/Wd0G3Bz9cFtKDjVi1OYYzjCN0klMN7l+JMJT72S88yT4qPgD
	XuSC0XpE6aHhQRtFdOoHsC3cwOg8mmq6C3Y+UXFyKvhHmR9mEbxB
X-Google-Smtp-Source: AGHT+IGlPeUKh3rdcoTeCFY3+wnaMUsu6TKE99XJtOo3czufk7zhEnsd5IyIiDKGSO7wvawhwxSM9g==
X-Received: by 2002:a05:6000:79d:b0:33d:7221:97cf with SMTP id bu29-20020a056000079d00b0033d722197cfmr3416180wrb.6.1708551963415;
        Wed, 21 Feb 2024 13:46:03 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id m6-20020a5d56c6000000b0033d56aa4f45sm9707962wrw.112.2024.02.21.13.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 13:46:03 -0800 (PST)
Date: Wed, 21 Feb 2024 22:46:01 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] staging: rtl8192e: Remove unused variables ntotalfrag
 and Seq_Num
Message-ID: <4a3f2d217631076ee9994b46f8672eceaea8568c.1708461563.git.philipp.g.hortmann@gmail.com>
References: <cover.1708461563.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1708461563.git.philipp.g.hortmann@gmail.com>

Remove unused variables ntotalfrag and Seq_Num as they are set and never
evaluated. Remove resulting local variables seq, sc and hdr as well.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 8 --------
 drivers/staging/rtl8192e/rtllib.h              | 2 --
 2 files changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index f1e97da8f077..b54dbc97d4ba 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1346,14 +1346,7 @@ static void _rtl92e_process_phyinfo(struct r8192_priv *priv, u8 *buffer,
 	static u32 slide_beacon_adc_pwdb_index;
 	static u32 slide_beacon_adc_pwdb_statistics;
 	static u32 last_beacon_adc_pwdb;
-	struct ieee80211_hdr_3addr *hdr;
-	u16 sc;
-	unsigned int seq;
 
-	hdr = (struct ieee80211_hdr_3addr *)buffer;
-	sc = le16_to_cpu(hdr->seq_ctrl);
-	seq = WLAN_GET_SEQ_SEQ(sc);
-	curr_st->Seq_Num = seq;
 	if (!prev_st->bIsAMPDU)
 		bcheck = true;
 
@@ -1672,7 +1665,6 @@ bool rtl92e_get_rx_stats(struct net_device *dev, struct rtllib_rx_stats *stats,
 	_rtl92e_translate_rx_signal_stats(dev, skb, stats, pdesc, pDrvInfo);
 	skb_trim(skb, skb->len - S_CRC_LEN);
 
-	stats->ntotalfrag = 1;
 	return true;
 }
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 6b33643ddae0..c18169725452 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -496,10 +496,8 @@ struct rtllib_rx_stats {
 	bool  bPacketMatchBSSID;
 	bool  bIsCCK;
 	bool  bPacketToSelf;
-	u16    ntotalfrag;
 	bool   bPacketBeacon;
 	bool   bToSelfBA;
-	u16    Seq_Num;
 };
 
 /* IEEE 802.11 requires that STA supports concurrent reception of at least
-- 
2.43.2

