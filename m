Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07006303C91
	for <linux-staging@lists.linux.dev>; Fri, 22 Aug 2025 13:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755870914; cv=none; b=HcDXeDQpOVajnUXrZttGQCnV5CFmqVcZ+/eDNy3UWujCwkQrmBY3TXdfovv4DOuJOeonLVHW+8YSmMmrazufM7LstMRSxQE2/Py+J8+QnPBa4BwhcTPyXgck2IDOMbxqBMN5nXixRy5fhx44ZlNB+tIXUljXLDXjbnnCHAHZMz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755870914; c=relaxed/simple;
	bh=omUgS8Yqp2omTlRPv7EC7YyaMeOkk1VdjJAoSlVZVog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X9EfKp9MVZuI8VmL2lqxtePyghSpN/8iTHNKnYIF7vy/5Boop2RHH2oaBiNB76Nl/M6WzSdqoAx76YPFLZCN58UAg0F1yiHDuin1FIULzzkhraT0tFG+kOWtS8euOCFzrhYa9nUPI+zj/KEQ/eUCLCmGUmmYVJ1g6hQfW3sKzPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQg7j5Ew; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQg7j5Ew"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb78c77ebso317591866b.1
        for <linux-staging@lists.linux.dev>; Fri, 22 Aug 2025 06:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755870911; x=1756475711; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+i/BZ4RMqL70daqwvgERJaIFeycaTJmwAWOLgqc2v9g=;
        b=QQg7j5EwdqqYNtvo5Ix0ESiJTJitx+RWvhzt4zjYig3y3vuGjIar3lLnV5c7PymwmA
         /+/Jw3Hl38WIjNZxlqDJLjglSo8cfayWk0Pt58Iv5VPXpx2ENWG6+Rna8qsyUtWDlJxg
         F5Dscrc57fQ66BLntm+s6YPXML/vmTT+IrQtvmVQg48BIhOcGxElvX0U5ZoOEz4L3tIl
         G21NNw+c1EWaRWa4rcsZX9BBHS+lRpknBEcqTzX9cgjvdre4hw0wxow8MHtCrnmQrKaG
         cDgnWpTd0TfHkVhopUhipDWTJGsYjeq6LZUFV7bHlg21FrLcgqnPzWwR4yP2SSfFY4E4
         YWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755870911; x=1756475711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+i/BZ4RMqL70daqwvgERJaIFeycaTJmwAWOLgqc2v9g=;
        b=QATMGXDsadMcOwZhbpvmzcuyWp3FnMrJV6fBV1VSoR4OzXiXv3tFK0qSzfBsWeYZQB
         WlRn6uPtuGTVFeDr6SjXjDFGY6pHGmvJv8eYYT/9Fvk5b7PiUZ6STQA0fOmTQHm51ZRi
         skJiCt2nD6j7zcL8NTPJL5QhK4k2rBvRM3OwHU45UjkQsznSWE54ZepgBMT/YBQoCm8t
         dvnKbJT6v5lMLKMHRMS+f/r0DMkuW37iYSAzi2bcIiJw8nz5cfc4xAzCWmt783A+f3QY
         YYGNazAKhLdicAwmeCFGG8M3Vmoz36ExIJo59IrLzsFT6UHzfkMydeiWLFNzK6P3FJmU
         qLrA==
X-Forwarded-Encrypted: i=1; AJvYcCXeE+fIp8rEZCGnjM83ecgqK7UEPcdT7BxIHun1hvXe2eMvalCUY5UaWwSD/a13WLkrXdEBW4cwXgoEc6fW@lists.linux.dev
X-Gm-Message-State: AOJu0YxTyDRsZIJ0FJtPItWMf0Yqw8OZOiLDZjdMw6+LLB+rwCaTNJW+
	dNTz4s39AkK1NID0ZqzKREesZ0seVv0UbAtl6hS6CPJ0ADEfhGpjta/4
X-Gm-Gg: ASbGnct2plhwXEHxXlIt4PuRJtrQJ0bxtVZg1frmpJX3JwBqQkmGJJEt17ktoQsD9y7
	yR0qRkuIvkmHzZAMqP/Wj2jn5y5hBRCQZaxUK3SGz69dtAcZ40lEnpx+sqTVrW1IE2Z/h41lDl6
	7xnjTnrQsk8XR47Uwvd8HESYtp9cSt3+Dc6ikXsfxrDtDh71GsjIPLENwp8G/R5lIGY0gacisbb
	i4xnsDSFEgZrlSG2Vu9ehp2A9JXmwW7XOWk6lLMl9kiFux0EQL5eq92aen5d0Raz/ZEzYhbJoAR
	8xXGm1flXJaJv5E03CTi+msOHzcwMTyW1mmc6oyzEfi0CbhGEggG63WjZCZh3flEGEhKfDPfYNX
	G6CyLv2E7RlTqZUoli12ObCRAbQ==
X-Google-Smtp-Source: AGHT+IHjV2lpd+GIDQ3QFTXMtmjzan9Cn3jVvnnDSQyLnJNTiIo6GZsubevyigZZwWvQdae/6KDBRw==
X-Received: by 2002:a17:907:94c6:b0:af9:8438:de22 with SMTP id a640c23a62f3a-afe2958a13amr298510766b.39.1755870910955;
        Fri, 22 Aug 2025 06:55:10 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded307138sm612353866b.45.2025.08.22.06.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:55:10 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 01/13] staging: rtl8723bs: remove wrapper rtw_init_recv_timer
Date: Fri, 22 Aug 2025 15:54:06 +0200
Message-ID: <20250822135418.118115-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250822135418.118115-1-straube.linux@gmail.com>
References: <20250822135418.118115-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function rtw_init_recv_timer in os_dep/recv_linux.c is jsut a wrapper
around timer_setup. Use timer_setup directly and remove the wrapper to
reduce code in the os_dep directory.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c   | 4 +++-
 drivers/staging/rtl8723bs/include/recv_osdep.h | 3 ---
 drivers/staging/rtl8723bs/os_dep/recv_linux.c  | 7 -------
 3 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index 4d51e6993ca2..d1f6030799cb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -247,7 +247,9 @@ struct	sta_info *rtw_alloc_stainfo(struct	sta_priv *pstapriv, u8 *hwaddr)
 			INIT_LIST_HEAD(&preorder_ctrl->pending_recvframe_queue.queue);
 			spin_lock_init(&preorder_ctrl->pending_recvframe_queue.lock);
 
-			rtw_init_recv_timer(preorder_ctrl);
+			/* init recv timer */
+			timer_setup(&preorder_ctrl->reordering_ctrl_timer,
+				    rtw_reordering_ctrl_timeout_handler, 0);
 		}
 
 		/* init for DM */
diff --git a/drivers/staging/rtl8723bs/include/recv_osdep.h b/drivers/staging/rtl8723bs/include/recv_osdep.h
index 83330ea98fbf..ea0b58aa0ba0 100644
--- a/drivers/staging/rtl8723bs/include/recv_osdep.h
+++ b/drivers/staging/rtl8723bs/include/recv_osdep.h
@@ -34,7 +34,4 @@ void rtw_os_recvbuf_resource_free(struct adapter *padapter, struct recv_buf *pre
 struct sk_buff *rtw_os_alloc_msdu_pkt(union recv_frame *prframe, u16 nSubframe_Length, u8 *pdata);
 void rtw_os_recv_indicate_pkt(struct adapter *padapter, struct sk_buff *pkt, struct rx_pkt_attrib *pattrib);
 
-void rtw_init_recv_timer(struct recv_reorder_ctrl *preorder_ctrl);
-
-
 #endif /*  */
diff --git a/drivers/staging/rtl8723bs/os_dep/recv_linux.c b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
index 98d3e4777210..a507a29686bd 100644
--- a/drivers/staging/rtl8723bs/os_dep/recv_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
@@ -216,10 +216,3 @@ int rtw_recv_indicatepkt(struct adapter *padapter, union recv_frame *precv_frame
 
 	return _FAIL;
 }
-
-void rtw_init_recv_timer(struct recv_reorder_ctrl *preorder_ctrl)
-{
-	timer_setup(&preorder_ctrl->reordering_ctrl_timer,
-		    rtw_reordering_ctrl_timeout_handler, 0);
-
-}
-- 
2.51.0

