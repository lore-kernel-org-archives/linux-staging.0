Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9333054F0
	for <linux-staging@lists.linux.dev>; Fri, 22 Aug 2025 13:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755870919; cv=none; b=Yhngml0lJdJxzUrtfa3FUg/Lxz2FJLQfgFSXf0hv3jlzb1xcv+J6dngWMi+BL47TWJnmSVAE5IddscuGC11eNDU87+wkHpXT/oLyg3hTYOv/mwzICtv+kK0F5FL2mZOqFqN9acwc/O4ymD3k8Oa+xrphfQbMeoxZ1CO1BbMU5rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755870919; c=relaxed/simple;
	bh=qYH1LzDiPPlAHY9+cSz4R3P+vnjLbibGIO/7xznJnX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OOL1Tv8SryTBs+fLFvtSKV3EIwknntBoSTvenpCI0CC1rpkojy9uj+2ndhqfsC4JMnoJ7ke7U99CHYbbg807JbR3g9qKFwWhGSAf1Wt0CdLjvg3lwO3toYfN6fdburOjUZLFqaSDdFbk5d4CqZYK23rfAsGgcaFOFbdVVmwYYls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AltEnPb+; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AltEnPb+"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb78f5df4so373167766b.1
        for <linux-staging@lists.linux.dev>; Fri, 22 Aug 2025 06:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755870913; x=1756475713; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDYM9GUYw13zPxd0/F3QTUJsD0b0URDjcGtSkdeqcr0=;
        b=AltEnPb+qIUjHs6AKDy+8ZHoMWjpHF4BHSbDpQE39Xpp4gzTf3gEUvbtl2VAbhMT5c
         LFqxb17RWI7Sq3WDSIDYSUEhSmNQ9BF6KpMlzWIT0T0au9fVS5AQSCrPsqyp1SwDCudu
         z1OgL0RvD3xT2tNIsxmqpNUJYubXuke3YqwqMziEvsVx1hhhs4XoeAEaRYCmN3B7n8Zm
         NBtHKVXEUDFevhi7WegUr1Ah/3VxuwwvP9nrSfhEtvmbG9LRPIkenaQoXI92sXvS1lub
         HOmc00ddstdR1A11dRPzwkUEA0U6GtGl7PpIKRulqDk23UiKYe4ktIAhicvjL4/3hohN
         8h0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755870913; x=1756475713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cDYM9GUYw13zPxd0/F3QTUJsD0b0URDjcGtSkdeqcr0=;
        b=S48NiRF3OeA6Uw1e/kPCvJcZsnOAvz1Zq/JTQafYbWYJPWv6G8hef3nCwyfC1U5fPt
         ts2+0S8/xV4NMs2j0Rjdaz3Eb9iHWZUx8wEpNYr4aJ89jhGxj6Kaq29xDRz3VOgmHkrA
         MNsuLhVwosLZjr30BrHcstNGvLmxWIo9rohEuHMKmhzUz3JSn/oWVcVcgVZgGc6gQ9+q
         y77KMXa1kgRq9Jk2b8dxxNhoIs4cjjUDMIbYVBXmuS2TzOmG+b8ve1tTeU98nEIelIiy
         iw0UUIpzoMNMbucc8LE3iT7pkWILcR8XIbld7MnePAIeIeyc9uJZgbNJE5RzegEVXzv6
         3fEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHCPYOJw//5FHV7ThMBb4Oo0qllNkmqGJMiMeoDcQlCykTKPa/iUcDKEn8UczL15R6hCp7x+94QMd922/K@lists.linux.dev
X-Gm-Message-State: AOJu0YyW4rRfXu8V0qQNPexF629Q6LNJwjNPSTqR/TPX1C3wbT/T9iIB
	B94jnAzWN4xlfdocMfkC/oxFBb0v6G393A6QokpWCJG5/zecrmYSYgYz
X-Gm-Gg: ASbGncszNyCvoTK4qMfYx3q3PgAaIevYUsBR2sanHPfGxkI0t1OkYRESyZJIblU5vZF
	TBieLbbEtib2Doq5UYw5wEoHmEdMu1PXwhVyVFxP/ebSzkuecpBMUK11pQMt3A4XKK8uvjFmo6/
	cvlyerzLfmhLYGlp/bNLZcRK2UjSYHBa0dxvPbtx4nJRI78i6A7KN1nHo2PfZOu23uQ7S4zltlE
	x7kEb40ZnVRuZSSRNdKyXy2Hd7jI3of4wZHhkcU0i+0lVPuRYE1iW48N0wJkwuNvZsvGf79ZNJq
	DZcDUJApPsxdvW7W/I+4SGEb5LB48xSGslTPcjVSUm2M6YGwxr7gYoCNaGXLyj30TU1CBGCSAEn
	d4A4dGDnJ6KuJ+WW07lDsJzkNDg==
X-Google-Smtp-Source: AGHT+IEm9nwRaxSxo7IQRjlWikJKBnSRPGMUuhZHfRurgI9V8ukE1SKdkTw6q1fm8tsg5/KRVSjFZg==
X-Received: by 2002:a17:907:1c84:b0:af9:4fa9:b132 with SMTP id a640c23a62f3a-afe29548f36mr284396766b.33.1755870913432;
        Fri, 22 Aug 2025 06:55:13 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded307138sm612353866b.45.2025.08.22.06.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:55:13 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 05/13] staging: rtl8723bs: merge rtw_os_recv_resource_alloc into rtw_recv.c
Date: Fri, 22 Aug 2025 15:54:10 +0200
Message-ID: <20250822135418.118115-6-straube.linux@gmail.com>
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

Merge the functionality of rtw_os_recv_resource_alloc into
_rtw_init_recv_priv to reduce code in the os_dep directory.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c      | 3 ++-
 drivers/staging/rtl8723bs/include/recv_osdep.h | 1 -
 drivers/staging/rtl8723bs/os_dep/recv_linux.c  | 6 ------
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 2b054525b3fd..fcc28d4556c5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -66,7 +66,8 @@ signed int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *pada
 
 		list_add_tail(&(precvframe->u.list), &(precvpriv->free_recv_queue.queue));
 
-		rtw_os_recv_resource_alloc(padapter, precvframe);
+		precvframe->u.hdr.pkt_newalloc = NULL;
+		precvframe->u.hdr.pkt = NULL;
 
 		precvframe->u.hdr.len = 0;
 
diff --git a/drivers/staging/rtl8723bs/include/recv_osdep.h b/drivers/staging/rtl8723bs/include/recv_osdep.h
index 51b52d6b0367..763ddef4ad90 100644
--- a/drivers/staging/rtl8723bs/include/recv_osdep.h
+++ b/drivers/staging/rtl8723bs/include/recv_osdep.h
@@ -19,7 +19,6 @@ int	rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter);
 void rtw_free_recv_priv(struct recv_priv *precvpriv);
 
 
-void rtw_os_recv_resource_alloc(struct adapter *padapter, union recv_frame *precvframe);
 void rtw_os_recv_resource_free(struct recv_priv *precvpriv);
 
 void rtw_os_recvbuf_resource_free(struct adapter *padapter, struct recv_buf *precvbuf);
diff --git a/drivers/staging/rtl8723bs/os_dep/recv_linux.c b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
index c5819c3c59d8..ccd00f8bee7e 100644
--- a/drivers/staging/rtl8723bs/os_dep/recv_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
@@ -9,12 +9,6 @@
 #include <net/cfg80211.h>
 #include <linux/unaligned.h>
 
-/* alloc os related resource in union recv_frame */
-void rtw_os_recv_resource_alloc(struct adapter *padapter, union recv_frame *precvframe)
-{
-	precvframe->u.hdr.pkt_newalloc = precvframe->u.hdr.pkt = NULL;
-}
-
 /* free os related resource in union recv_frame */
 void rtw_os_recv_resource_free(struct recv_priv *precvpriv)
 {
-- 
2.51.0

