Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D9220766E;
	Thu, 10 Apr 2025 07:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744269126; cv=none; b=Vbelosf/FHEw83Xz2t1iYmAjvIp2XCMlNPjwB7MaM7u6u1/PFnDE+duPuAQ3dTOijyei1iEH8+wqdbi//QPLl/aUH34boP7VFKQiwvs2gKCxmRE/PiC+ohO1AP8CVus2C6hHL+uE0r4cioKWW1zPlURk25lBvMc93IW/lKjnlRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744269126; c=relaxed/simple;
	bh=/5Jabjf2/VwLZmbye4C45Q8fKwbVmZpw1ehJK3tUXHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eJlkJdtpczVv1ib0WG8dXn+kg4LItJlaWQKp521mcVtb7BC9hV8kNmPLeLBhG2lxWiMNGLcmzVStjISd7lZzOS4Za1cqEum8/Q3kpYkJ3hEnP247PeABTaVm8/96jbCyV15r6pwf/zRaudGQeOm/aIUdrAmVMB4TBkP9f3g2aF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TaM/kRf7; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TaM/kRf7"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so1971185e9.1;
        Thu, 10 Apr 2025 00:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744269123; x=1744873923; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/kImcHus6K8wzdBbiGWobUyEVK/5YlVtUxGYAzt1sU=;
        b=TaM/kRf78+Dg36nkE2tU7FnTzDvFzoiOM4lUq1Duq8NH8Udrxe8BR75RW4lwmmN8KN
         zxcu4b3G2CIGrjvBD+ilI49tWQRH3InF4v71RZgLL/st5qSPSUf3e+WWV9ppHjGJ6zIB
         p1ufdgIpfGu7DARhlHEZ6ldGs+l3c5mKupbEYL65PNgwg8oUUy1FrHcTHbOqIPFG+yUD
         1/S0qxxjZEWiMq0U7/M7au0VYqhE5RZOALwNrmxElkJvAer95dzyXrt+Oql7TAXJnEXY
         eYy+Z5CNpiuYMomNBU9bA2HnCfVmVENBOEXRA+M53qQi7gruI3GRgxTEm6Lbs7LV7BGY
         IzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744269123; x=1744873923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/kImcHus6K8wzdBbiGWobUyEVK/5YlVtUxGYAzt1sU=;
        b=nqofHcwjeprUDNGZ9tLOkkEy/oNOXQpiNTQFuS5rG8pgzsuWPm98QM67cyJKqoNekR
         4kGuTI6a9i4kf5bzOyaAkllTGb+MTHrWp4PwHsr4NLN98SibkwHyCxzyMTAfXwRtOT68
         Oi4XswlOZOCCoNV1qgbjjSwLjrC67mLc/+UDMl4IxZ9MeeKFFXAVvPJ3EQi4f/+9+Ip4
         yecqWuyYPoghKlNAsZV9AHXLItleBxS/6wVytR+jTz44+npCUZZFX6otommP2f+tRO4S
         c+Vezp8Q9JlHGv9lkaUyAA1m37c322nGEq3JJZM5KtKvetP1adNQKyxzJttH8T9blz0q
         HrbA==
X-Forwarded-Encrypted: i=1; AJvYcCVpFqDyfdOzKHrRqR7XcT9hsUJd9YacCYOesu0c9dvvCJ7WZk6zoHZf3Lq4EGFiUxE18K3qD50Uajpb@lists.linux.dev, AJvYcCWBDpNjgeWbkrhUuoTCt6INLONnb40wYts1k7N6j1+PSDXqIwzoPLAYUrM9uRys/yJjC5o8GHVw3rbMUFYU@lists.linux.dev
X-Gm-Message-State: AOJu0YxTd3YY5Ym4oV6RgpwZWVUaDKcIMgGC1xxwdpbmaz4zIUqmG8T+
	W5GwpwGwodr8wKDUUXtNlBnYRc8kns7TJP2LeSi9R8lnJCtQS4K5
X-Gm-Gg: ASbGnct8agdd5+4N55Tkq2F4/078WC/7UKvBr6PrXiJhMFd3KOTsS1J5zNdLJzv5c+S
	eEByu4Q0Q0teH2wUeNHk+RxVq24YkPU3/7wG5tdGYR+MVuuHRz8dpInl+AHy3pi1VmH0kiC/r3v
	ny7rAPddnQd555s0oItTdaCs1f0RnK/5EJw7rJJfSpp6Hps0dYlFlAgaeJfPqAtYYrdL+SsGZJ4
	umwb3hvwD9jtAnjYQqdjrJ0ZLtea16BAx09jsBsTYM1HdE5j9gwimJhoRdQDqLWyqgKY50dqY9e
	bY4+dpTiLYj41KGU5xonBRTNN/UUdzSP+dfDIw==
X-Google-Smtp-Source: AGHT+IGUjWy5+GCs4lfK0gJgBU45n/jQLhkWrXhfLZ0eHcJXduI2FPHwhAfMdNh2iZjfetiYKjIHMA==
X-Received: by 2002:a05:600c:524c:b0:43f:2bbf:c228 with SMTP id 5b1f17b1804b1-43f2d959427mr13343395e9.22.1744269123184;
        Thu, 10 Apr 2025 00:12:03 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f235a5e90sm40831765e9.38.2025.04.10.00.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 00:12:01 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] staging: rtl8723bs: Initialize variables at declaration in rtl8723bs_xmit.c
Date: Thu, 10 Apr 2025 10:11:50 +0300
Message-ID: <0a2165d8135d2b4de6b9c05fdc56fe5d7408e7c8.1744268316.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744268316.git.karanja99erick@gmail.com>
References: <cover.1744268316.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the code more readable by moving trivial
initializations up with the declarations instead
of wasting a line on that.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 33 +++++--------------
 1 file changed, 9 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 5dc1c12fe03e..842e19b53421 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -120,13 +120,10 @@ static s32 rtl8723_dequeue_writeport(struct adapter *padapter)
  */
 s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
 {
-	struct xmit_priv *pxmitpriv;
+	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	u8 queue_empty, queue_pending;
 	s32 ret;
 
-
-	pxmitpriv = &padapter->xmitpriv;
-
 	if (wait_for_completion_interruptible(&pxmitpriv->xmit_comp)) {
 		netdev_emerg(padapter->pnetdev,
 			     "%s: down SdioXmitBufSema fail!\n", __func__);
@@ -357,12 +354,9 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
  */
 static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
 {
-	struct xmit_priv *pxmitpriv;
+	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	s32 ret;
 
-
-	pxmitpriv = &padapter->xmitpriv;
-
 	if (wait_for_completion_interruptible(&pxmitpriv->SdioXmitStart)) {
 		netdev_emerg(padapter->pnetdev, "%s: SdioXmitStart fail!\n",
 			     __func__);
@@ -408,13 +402,9 @@ static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
 
 int rtl8723bs_xmit_thread(void *context)
 {
-	s32 ret;
-	struct adapter *padapter;
-	struct xmit_priv *pxmitpriv;
-
-	ret = _SUCCESS;
-	padapter = context;
-	pxmitpriv = &padapter->xmitpriv;
+	s32 ret = _SUCCESS;
+	struct adapter *padapter = context;
+	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 
 	allow_signal(SIGTERM);
 
@@ -435,16 +425,13 @@ s32 rtl8723bs_mgnt_xmit(
 )
 {
 	s32 ret = _SUCCESS;
-	struct pkt_attrib *pattrib;
-	struct xmit_buf *pxmitbuf;
+	struct pkt_attrib *pattrib = &pmgntframe->attrib;
+	struct xmit_buf *pxmitbuf = pmgntframe->pxmitbuf;
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(padapter);
 	u8 *pframe = (u8 *)(pmgntframe->buf_addr) + TXDESC_OFFSET;
 	u8 txdesc_size = TXDESC_SIZE;
 
-	pattrib = &pmgntframe->attrib;
-	pxmitbuf = pmgntframe->pxmitbuf;
-
 	rtl8723b_update_txdesc(pmgntframe, pmgntframe->buf_addr);
 
 	pxmitbuf->len = txdesc_size + pattrib->last_txcmdsz;
@@ -557,15 +544,13 @@ s32 rtl8723bs_init_xmit_priv(struct adapter *padapter)
 
 void rtl8723bs_free_xmit_priv(struct adapter *padapter)
 {
-	struct xmit_priv *pxmitpriv;
+	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	struct xmit_buf *pxmitbuf;
-	struct __queue *pqueue;
+	struct __queue *pqueue = &pxmitpriv->pending_xmitbuf_queue;
 	struct list_head *plist, *phead;
 	struct list_head tmplist;
 
 
-	pxmitpriv = &padapter->xmitpriv;
-	pqueue = &pxmitpriv->pending_xmitbuf_queue;
 	phead = get_list_head(pqueue);
 	INIT_LIST_HEAD(&tmplist);
 
-- 
2.43.0

