Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45226345751
	for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 18:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782153428; cv=none; b=C2yoRC7CbRHPOtoIhrehp5F8JxFQOQjlqwIg7ynjAGwraH/E3rr1QfJsTGLqwqSmSvaIeHEBBL41DFyWikrTYetFNXZAdCo7IH6jPY/mBDJMMiJe6cLQdSt3k1bR0d1WZ9YvcQRJ9vWj7UXrYg4KBas89AWEFIanuC6IFqg6cAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782153428; c=relaxed/simple;
	bh=FEcXv4mRr3d+joYV9sbijT3p44nzibD+AaejwnIGzcE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ISCg1k/gJcuhMBNvZ8UTf8UE0t8Yww7jkJBsfSAv7cNtB17p7e2jtRyWeix/m4FgiclEQB5wSek2qTGo0tJ0DJQWJ5YCuwx6Ro5nJ9RDMo9Q06w0GYhU7puRvoTMB6VI9xiMR1UG1rN6uIcr8cwtKJhyW3DR5TVY702cRwKzHIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nk0jcNYM; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nk0jcNYM"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-842307472d4so1987952b3a.0
        for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 11:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782153426; x=1782758226; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=06ZsWu47e46HDJuiXGwuVq9APSY1KVlfyNenOFoYkIU=;
        b=Nk0jcNYMOpf5HXywbQXsOYxhjYpUYKxbUwVvPwvuVS91HfHe8jLkXjshzzRNoAUCsq
         mT50/mYzkjLyjZ7sV40hZ+NXSqvQ9BF42fPrGcPlW+neYpuGMO8s60Pe6ReTjVIyuvER
         8k9xHRE8Y4fEXkV1mwftoW6i63V0UXE6KM7aMwtG3+XJy5RVkGK+Pow05NR4eWhprV2k
         GKADc82lSivGd1E579IMEu8Rv9ZNlEEnRFDQ2nnopKE85SiyT+FeAKKJtMefOLkENx9C
         pB1xIu+c7lS9OUSRyQw/kD4qwyRTpJSeTHrKoZUJNcLAGEiXpZtbDkWNY6X8T0wObFjU
         bTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782153426; x=1782758226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06ZsWu47e46HDJuiXGwuVq9APSY1KVlfyNenOFoYkIU=;
        b=DwAMovpzpfm7bFprI8Cg+LyVKUguVUE1KVasRlnBhFqn1mILx1C/7+e1SmHu/Mz4/9
         qlU9U5XtjfKy5cgV1F9J4m4isfPuvjS1KP5/Zcg2ipTPO1vKa8lYG5BFtMQOUHTUtw0H
         fC//b1cCCLhU5AbHQA7YRmQhSgFQKGf349DCT5AKf2UUlVjiolyWJGsT0CFksIcZ04ar
         1NAp4TcjJxuat8v/Zzsccy2y/oh1inA5hTVJDX6bm99LrB3UgzqCpUnHQekRhl91jvEO
         84+3IIIPs2LPupTsUHfoKv7YD/BN9/6K3wbPmC/VvKHSAYq4X0IXDzzIlnV8ENAnQYPd
         lBlQ==
X-Gm-Message-State: AOJu0YyBxIdtjMXHxWaVxsGwEg2JRuwDNluwgbaZl68IGEdHIn6js0m5
	lc3afRilAXmzfa2vzhtD6JWr/pLLafBmOblZ0lcJOFopnEYwZFP7qMUX
X-Gm-Gg: AfdE7cmIrH451nsVoDmH6FVLCyL1U6BBki+ZXY61J4S3gaiMHZigEFJqN3McxZwB8A0
	d4eZ6A95K1ZByuYDTj2gp/XODHsdCh/3siqut2tBPHa5UsGtWLtGnJLKKlbkBKhnWN4rmK0Hw+V
	oM4LEBhibr0tKikPGINeKushaKIdXTQdYJ8QrySm2ZuJbrLltDLUhZopYwXE+IjlyNUAqd/bkhX
	g2PONs4NS/VGu1eUEn0r3hyPWK+TvJQhVKZri/Gnn75qCevbrmXklid/smh8fmjH9oY+aiBL4yV
	XeUxpTnmst9WtbFAjzsTZYulC8Jn9c7Fn9WPmGJLWhnEc/lxFwOOnrA/VLLbko0RyVOUQFSU69p
	Fn2MWWR3en9nsrnbrFrRYL7Uc4r1IWRqzrnO/EhAs23EDXia31YgKs+fSkwpu9cP4yPuxlUyoar
	FcyekYOcDVLcWduICb124dIqcusZW+dDHnbnkletGlfJLCr5SUE3Pf
X-Received: by 2002:a05:6a00:3d52:b0:845:369f:5692 with SMTP id d2e1a72fcca58-84562535581mr11755576b3a.22.1782153426207;
        Mon, 22 Jun 2026 11:37:06 -0700 (PDT)
Received: from kernel-dev ([49.36.101.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ec335csm8228865b3a.49.2026.06.22.11.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 11:37:05 -0700 (PDT)
From: Aditya Chari <adi25charis@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aditya Chari <adi25charis@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unused function declarations
Date: Mon, 22 Jun 2026 10:55:43 +0530
Message-ID: <20260622052543.61590-1-adi25charis@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtl8192c_translate_rx_signal_stuff() and rtl8192c_query_rx_desc_status()
are declared in rtl8192c_recv.h but have no implementation and no
caller anywhere in the kernel tree. They are leftover from when this
driver was derived from Realtek's shared vendor codebase covering
multiple chip families.

Verified via grep across the full tree that neither symbol is
referenced outside this declaration, and confirmed via a full build
of the module before and after removal that no warnings or errors
are introduced.

This addresses the "find and remove any code for other chips that is
left over" item in the driver's TODO file.

Signed-off-by: Aditya Chari <adi25charis@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtl8192c_recv.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
index e2e9aa03f..b63625ab4 100644
--- a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
@@ -30,8 +30,4 @@ struct phy_stat {
 /*  Rx smooth factor */
 #define	Rx_Smooth_Factor (20)
 
-
-void rtl8192c_translate_rx_signal_stuff(union recv_frame *precvframe, struct phy_stat *pphy_status);
-void rtl8192c_query_rx_desc_status(union recv_frame *precvframe, struct recv_stat *pdesc);
-
 #endif
-- 
2.53.0

