Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEB43FD5
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 01:01:15 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id c8-20020a7bc008000000b002e6e462e95fso3781891wmb.2
        for <linux-staging@lists.linux.dev>; Sun, 05 Sep 2021 18:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sea6MiaLV8n1Cp/HayFm3TFpoTDQDNzXC3Yp/P/PQi0=;
        b=cY75c2n9NkN9mypYbeQK3yWiAYdXe+6s3c2oNt7zPRrtgTdTnyICfVP7qcpPSowYQ+
         jH5NNgIm6UNPhGCuzEz5T9Kz7nF8nHzSlLbtDSSM8r4o9A/h2HxBuAJAjuc8Q5CBd22k
         1gisACa+CM17cVDbfgv9Z134xj9Yt7n+w5F2hCnlr7wEb8d0c7Z/WOpvdMp52CSgq/XU
         tNnS1vfxjprdjDkE6EhrhWqGf3xY9vKDOhdqqhOFny6RHi26T05jjC//4TtG7D0aTsCb
         K0hRjpzW8zcxg3wwAXRJ4ZVNicac2ZQMBdFHBssGRJQ4SX5sC8AnSyn4jvLgT3dCaYoQ
         SgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sea6MiaLV8n1Cp/HayFm3TFpoTDQDNzXC3Yp/P/PQi0=;
        b=XCXce3LglVa71RLwJNlSJAIHpTtFnNSOHk3NbNyxLmDZxM6S9Cq6jdbQr5vM6GVRsD
         IqA62Ze7SPv3ns2xxPqAM5Jb+bJ3FMXVmELdw8iN+Ls5qFZrJ6FvLPrYdKXhzhYYRFcU
         SyE5j5dX9RWa/6XFjj3CZWCTJn7PHFAYXXNojZxFE92Qn/qrkre8MFXb7zC/DxOFgYo4
         IHm/uTkj8iFlZE3piFCEknAh1oqhRXX/cA1wHDwtzECShjDT/FFX2nCbeYJJlIbQzAlL
         XaKnIy9EHfPm/5ej72mVWTzxdsRjsenTWBCWSVbVPQlCHlcwHO3lwhxSZK7OmmSAOTDF
         GTyQ==
X-Gm-Message-State: AOAM531+1ynnJpTTI4GuWxYJovlwdaUPpVFRjC+6U0ueW3eA0Fr4hLud
	xgLFzLengLGkYindNVtYhNKYxQ==
X-Google-Smtp-Source: ABdhPJzrPQSoHOItu2lIxDB1VIZh0etqSAzo37bcF6js5WHZGHlVzuY3k1SB2gtx8mCNlX7C4MyrkQ==
X-Received: by 2002:a1c:3bd5:: with SMTP id i204mr9012699wma.53.1630890074113;
        Sun, 05 Sep 2021 18:01:14 -0700 (PDT)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id r25sm5151232wrc.26.2021.09.05.18.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 18:01:13 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 06/14] staging: r8188eu: remove disable_interrupt from struct hal_ops
Date: Mon,  6 Sep 2021 02:00:58 +0100
Message-Id: <20210906010106.898-7-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906010106.898-1-phil@philpotter.co.uk>
References: <20210906010106.898-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove disable_interrupt function pointer from struct hal_ops, as it
is unused.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/include/hal_intf.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index e45a45dc1ec1..f3951c405927 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -156,7 +156,6 @@ struct hal_ops {
 
 	void	(*read_adapter_info)(struct adapter *padapter);
 
-	void	(*disable_interrupt)(struct adapter *padapter);
 	s32	(*interrupt_handler)(struct adapter *padapter);
 
 	void	(*set_bwmode_handler)(struct adapter *padapter,
-- 
2.31.1

