Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6C13FC6
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 12:02:31 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 79-20020a1c0452000000b002e6cf79e572so13914693wme.1
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 05:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6Ie2LUKLvJAhCwfhxzRAdWNjRl3Humfcq+0FcV7sa3Y=;
        b=WzySwQycekqnCDlzSJwb1TqW7FIpgS3zAdjfyy9l/2QS36+VTiKFmSS9WLLDXl1+Qt
         0alreyYG8aa5bMLogGQXqJFl76+C44B54fr7a9JR8e1MV7YfUG+s9NgOzRJZwT9W/yOu
         FFx/vzCu9YF/5XPKhRhuMJazJdFA1xiqhDBZk7JIKhy8r6ErP/LYTANI0gjURwFZ6VDr
         Ec0aQgY3bgHB5yWjGLK5Jlh8HyygnST9Hg+DdaQ7G2O4bcjXMcnWAfjAfevxr2sJG5+h
         ArgbGJgPM9PypBk6ImpJicRmsh+awk0HH4LhqFpWjmOAe4GRDCN9swkkgnTLxZOR9uVj
         SWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6Ie2LUKLvJAhCwfhxzRAdWNjRl3Humfcq+0FcV7sa3Y=;
        b=bT9w4HFm4T1V7GlkQTXs3oJeyEgtvuQDsXlWDpBdW5EEBY/AaELn0DDilwSpBcHWoI
         N0r1rXg8JWUYSNpDHa4L7EyotEy2ULJwB1LoIkxelRvC9Qifpus9aOE/zwKtlUdHPpXv
         NKVV1rgk83M8klZ49guABjpHqXMjqQq6cMUBK6Tbf8crWKn9xD3+OlfohLxme82zVYdj
         +IRP3gnNtExCNa+CfugaeKOYTHY2QikiqLac629k1moS01kKCHL+J7tOReheZtXnMe7v
         GwYre+d9+fgIgOdKi7q/EdCO6t39C6e87XB22pi8kduxRYh1V+4BzfRoL479TmnPk6hz
         r9PQ==
X-Gm-Message-State: AOAM530sWe7keeMLKJvY8pw6xfvWhE9dTmwrqsWbH68s2UXFkgAN3gVQ
	IfciPPtQoJDf9owQkaHF1T4=
X-Google-Smtp-Source: ABdhPJyEf5urADYIU7VVIagTAr4fmlOdU1Jn2KdrvJvRPwx4PziGYIdDNhLJu6ArYKW/RGOw1t/idw==
X-Received: by 2002:a1c:7e8a:: with SMTP id z132mr15791563wmc.75.1629720150218;
        Mon, 23 Aug 2021 05:02:30 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::3c39])
        by smtp.gmail.com with ESMTPSA id g5sm901332wrq.80.2021.08.23.05.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 05:02:29 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 8/8] staging: r8188eu: use is_multicast_ether_addr in os_dep/recv_linux.c
Date: Mon, 23 Aug 2021 14:01:06 +0200
Message-Id: <20210823120106.9633-9-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210823120106.9633-1-straube.linux@gmail.com>
References: <20210823120106.9633-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use is_multicast_ether_addr instead of custom macro IS_MCAST, the
buffer is properly aligned.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/os_dep/recv_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/os_dep/recv_linux.c b/drivers/staging/r8188eu/os_dep/recv_linux.c
index b4c5333bfff0..dd3113b6d4f3 100644
--- a/drivers/staging/r8188eu/os_dep/recv_linux.c
+++ b/drivers/staging/r8188eu/os_dep/recv_linux.c
@@ -132,7 +132,7 @@ int rtw_recv_indicatepkt(struct adapter *padapter,
 		struct sta_info *psta = NULL;
 		struct sta_priv *pstapriv = &padapter->stapriv;
 		struct rx_pkt_attrib *pattrib = &precv_frame->attrib;
-		int bmcast = IS_MCAST(pattrib->dst);
+		bool bmcast = is_multicast_ether_addr(pattrib->dst);
 
 		if (memcmp(pattrib->dst, myid(&padapter->eeprompriv),
 				 ETH_ALEN)) {
-- 
2.32.0

