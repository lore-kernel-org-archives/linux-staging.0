Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AA53FC8
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 23:45:45 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id g18so12373254wrc.11
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 16:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G0NXrISK+mcr2itODcfepntdJfu4OArow0xKYoZmmZI=;
        b=0GL1LNv57T3N7cNKbuW6/OS37gSr45WTRs3im0EByxm6dW1Cnmlx4sLsNuAZTNUxH0
         5+uzFiQyaHHZCxDqz6iqku3qN01L/4Z6iKOFm60maaLuylsgtaxCaFd9hqLCKBf/xBnV
         SzkNbOTZ/OHRcBSgvg15kGcQIcG6triG1BDoZzND1/tFEj5uZYxVo7KkArSzFkiwGtOW
         InSmgbgbJT3OuPZrT4RuQ8SIGwnpEoIN15gnGPvoQ2wiaeKsirJYiNqnTqUGEk7+me2J
         Nw4Ahm/V+LqZxu7pj+eq/Im3waOFOc5MbP+Gj1gRJbxXsc1mSWL3f0KFnuXSyc7RLjO5
         lpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G0NXrISK+mcr2itODcfepntdJfu4OArow0xKYoZmmZI=;
        b=BZYmjVfWl3TBnWq20EuHk+HQSTuVoTtMFegMHxiD2WXcQdmvq9OSGnsHVxqxEmc0bm
         YZMk9OZFrgc5eOTSS5a1g7lkfE4SNw1MUFF1BYPW81qIkw6FlG6S7J7N+VT8oF2v3PIn
         KxMg3Yj5xf/K0Mybu+hfrJQL3X6AUB06qicXtHQ8hI8WhzG7ZZK4LZa+RbcKh0W70QbH
         epr7y6voVkprdL4e/F5t7jgOThQ4MsSU0HO98Q5a4tPJZ+S44LsPCzduZJpVx+wJCqGx
         bpzBGKslB6AY8VONuWEeEwpIIoxkpmhannU/otfYCbYiXB61nWbyrx6DwBuIVhuzeHys
         mXaQ==
X-Gm-Message-State: AOAM533Vf1fVKdfs5uumi3o26m80w26nobecQBgptZ54aAR5u1RJMvGH
	N+NfTSsdT7GpN+xRp+noFb8LCA==
X-Google-Smtp-Source: ABdhPJzERpL6mO8xHjhhZ+qhRZfKM4biSJquzfEwb+SU0HGBk4xcpe+okr2AvADXZcCnXiZB/3OXfQ==
X-Received: by 2002:adf:f984:: with SMTP id f4mr22681367wrr.331.1630280744394;
        Sun, 29 Aug 2021 16:45:44 -0700 (PDT)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id r25sm14500574wra.12.2021.08.29.16.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 16:45:43 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	fmdefrancesco@gmail.com,
	Larry.Finger@lwfinger.net,
	paskripkin@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] staging: r8188eu: remove c2h_handler field from struct hal_ops
Date: Mon, 30 Aug 2021 00:45:39 +0100
Message-Id: <20210829234541.946-2-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210829234541.946-1-phil@philpotter.co.uk>
References: <20210829234541.946-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove c2h_handler function pointer field from struct hal_ops in
include/hal_intf.h, as it is never set in this driver, and remove
the check for a non-NULL value in the rtw_hal_c2h_handler wrapper
function in hal/hal_intf.c as well. As the function always returns
_FAIL anyway, just modify it to do this unconditionally.

The motivation for removing this field is that it is more code from
the unwanted HAL layer that can be stripped out.

Acked-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Acked-by: Michael Straube <straube.linux@gmail.com>
Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---

V2: Same as V1, reissued as part of series for clarity.

---
 drivers/staging/r8188eu/hal/hal_intf.c     | 6 +-----
 drivers/staging/r8188eu/include/hal_intf.h | 2 --
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index a6d589e89aeb..0c835f9cd181 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -428,11 +428,7 @@ void rtw_hal_reset_security_engine(struct adapter *adapter)
 
 s32 rtw_hal_c2h_handler(struct adapter *adapter, struct c2h_evt_hdr *c2h_evt)
 {
-	s32 ret = _FAIL;
-
-	if (adapter->HalFunc.c2h_handler)
-		ret = adapter->HalFunc.c2h_handler(adapter, c2h_evt);
-	return ret;
+	return _FAIL;
 }
 
 c2h_id_filter rtw_hal_c2h_id_filter_ccx(struct adapter *adapter)
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index fa252540e596..4603f9212030 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -251,8 +251,6 @@ struct hal_ops {
 
 	void (*hal_notch_filter)(struct adapter *adapter, bool enable);
 	void (*hal_reset_security_engine)(struct adapter *adapter);
-	s32 (*c2h_handler)(struct adapter *padapter,
-			   struct c2h_evt_hdr *c2h_evt);
 	c2h_id_filter c2h_id_filter_ccx;
 };
 
-- 
2.31.1

