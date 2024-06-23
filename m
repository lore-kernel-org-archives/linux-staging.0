Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0BB1849E4
	for <linux-staging@lists.linux.dev>; Sun, 23 Jun 2024 17:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719165474; cv=none; b=ZIG/LkmSfjr8au04eFnS3DNMogb2N0n115GqLuMzjil0I2pSwqRUPxdflTLdxanpdkUYO3Sr9wTs8lG7DfHV/oYbGj37u/zC4Gv+mNTpAjVoPSfHe6jmE7VMfWir1y76TEJQTNTSNjP9FBdgZiv6coFAFtjZZwUiWJ9YXoNUTpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719165474; c=relaxed/simple;
	bh=k2pXJazt4d1jjxZb/wUSVEme55AeCZ/0RLf0i7Q9H80=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AUInWzAXQ3VTWRBN0D8Vv50cW4x0WSgKRoLnefocxI5ChqYX4fwk60a+h2TXsZrEmCBrmO51lVsKyMgII5cjQbGcy2WrfOjcIil+U6ooQSK2qadfJNzt5gr2eYxE8XgLgtJNg59m+qDY/Q8Y+XXYXKOzN1D0xV/PEkqPvC6B1EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BmAhByvl; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BmAhByvl"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57d16069321so374228a12.2
        for <linux-staging@lists.linux.dev>; Sun, 23 Jun 2024 10:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719165471; x=1719770271; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=us8E5vDLoSO4M4RMp0uTUWJe7+6fXoztBOD5gWfqUsg=;
        b=BmAhByvl6DLTHX7a/dYAYVqxYFetGihdrObgdtkgM4eKasDgMOvoXqq8T/t/JpUJzT
         3Mee/Wxv+E1do7tKGh4t1avqMB4Z5glcfyYkJvrbPTAQPR4ckpae5DUswXl38k7p3lQ7
         T+Oc4ibutQ50ORuAg8s7vqQIGpEwlehlC333afr0oS8Uae03KkCHzC6gqH2Mfx0o7SvQ
         TMRvupfSUozvZ2ldN2wrcScDsATFhTTssY9u8aadxfRdkfXmpnWrWZsU4YmAHUP0ISRk
         iBeJbVcZ+F3knWOr6NUNbMkVC6Ub1fJ7wPLAotn9WOePTQJG7K05/qjUBQlpt3c7Pjfo
         QeVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719165471; x=1719770271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=us8E5vDLoSO4M4RMp0uTUWJe7+6fXoztBOD5gWfqUsg=;
        b=Q95QHAvl93NjwHoy76DYHqDhU28FX4c8JDQpiDcrvSS5xW1A09no51U9UUNGPntsoh
         lQ2jSsow24BB0GZe7Puw0TaoBOKaxqTewhJREDEmcR5+JdFbUqa2b6VUj84VQ8m5fSs8
         vNArf2FkVBdsThTa4V2QK4CYaLXL7l6QNKiEN1arQCtmm5J0k1/PMTgGQaqo0V+2Ne77
         G5R+QfHgRgWShCnD8kLKPWrYklzkIki91LAf851kJkOiSm8swmE+Y7/H8WEO8gx0EF1L
         cXdtRwpzbtIPJr/GjXCEvnfExA7fHbF4GTFulF4ynOCN37fk9GSxwtbtOcnd9ac3BeuW
         b4fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgSr/3YPu7f3umdQERbWJP8eQ1tNzuX6IH2ZQYFSmJNy1WzCGKJUAx4VwU7y6YVV3s1v0NmtCGSRS9alkDeipzJUxSL3R4cp+D/9f5Tw==
X-Gm-Message-State: AOJu0Yw2WYGEJr5eyv9/QSd/IzmtLiq5VNlwiWiKQtA4uiGf7pOm2Kls
	cj5AmgT7ldPG2nWjGFPpEqxorwKMHxvcjAltZTBxzLkrMFjFZAPp6qfVzQ==
X-Google-Smtp-Source: AGHT+IFWDDAhpWFXRz5D4xudjIIA+RJlu4D7h0rcBpDuiuFdUPanvBxhvd7exQKGm9eyDuzmL1jlHA==
X-Received: by 2002:a05:6402:51d4:b0:57d:43c3:842b with SMTP id 4fb4d7f45d1cf-57d43c3853fmr3074330a12.2.1719165471380;
        Sun, 23 Jun 2024 10:57:51 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d3040ea36sm3749019a12.21.2024.06.23.10.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 10:57:51 -0700 (PDT)
Date: Sun, 23 Jun 2024 19:57:49 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 09/14] staging: rtl8723bs: Remove unused macros in rtw_recv.h
Message-ID: <e9f61bab428def7298212aecfab3708a32469cef.1719155208.git.philipp.g.hortmann@gmail.com>
References: <cover.1719155208.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1719155208.git.philipp.g.hortmann@gmail.com>

Remove unused macros.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_recv.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_recv.h b/drivers/staging/rtl8723bs/include/rtw_recv.h
index fef2fd0e8c84..c93594f75436 100644
--- a/drivers/staging/rtl8723bs/include/rtw_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtw_recv.h
@@ -9,8 +9,6 @@
 
 #define NR_RECVBUFF (8)
 
-#define NR_PREALLOC_RECV_SKB (8)
-
 #define NR_RECVFRAME 256
 
 #define RXFRAME_ALIGN	8
@@ -18,21 +16,11 @@
 
 #define DRVINFO_SZ	4 /*  unit is 8bytes */
 
-#define MAX_RXFRAME_CNT	512
 #define MAX_RX_NUMBLKS		(32)
 #define RECVFRAME_HDR_ALIGN 128
 
-
-#define PHY_RSSI_SLID_WIN_MAX				100
-#define PHY_LINKQUALITY_SLID_WIN_MAX		20
-
-
 #define SNAP_SIZE sizeof(struct ieee80211_snap_hdr)
 
-#define RX_MPDU_QUEUE				0
-#define RX_CMD_QUEUE				1
-#define RX_MAX_QUEUE				2
-
 #define MAX_SUBFRAME_COUNT	64
 
 #define LLC_HEADER_LENGTH	6
@@ -178,7 +166,6 @@ struct rx_pkt_attrib	{
 #define RECVBUFF_ALIGN_SZ 8
 
 #define RXDESC_SIZE	24
-#define RXDESC_OFFSET RXDESC_SIZE
 
 struct recv_stat {
 	__le32 rxdw0;
@@ -191,8 +178,6 @@ struct recv_stat {
 #endif /* if BUF_DESC_ARCH is defined, rx_buf_desc occupy 4 double words */
 };
 
-#define EOR BIT(30)
-
 /*
 accesser of recv_priv: rtw_recv_entry(dispatch / passive level); recv_thread(passive) ; returnpkt(dispatch)
 ; halt(passive) ;
@@ -363,7 +348,6 @@ extern union recv_frame *_rtw_alloc_recvframe(struct __queue *pfree_recv_queue);
 extern union recv_frame *rtw_alloc_recvframe(struct __queue *pfree_recv_queue);  /* get a free recv_frame from pfree_recv_queue */
 extern int	 rtw_free_recvframe(union recv_frame *precvframe, struct __queue *pfree_recv_queue);
 
-#define rtw_dequeue_recvframe(queue) rtw_alloc_recvframe(queue)
 extern int _rtw_enqueue_recvframe(union recv_frame *precvframe, struct __queue *queue);
 extern int rtw_enqueue_recvframe(union recv_frame *precvframe, struct __queue *queue);
 
-- 
2.45.2

