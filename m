Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8482FB2
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 21:24:57 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id e26so789147wmk.2
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 14:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/7YDqqGJtJ3QDn9FqQDzakc4DzlPeBa/z6aADOfcvlk=;
        b=KYZY8ls3CXTujMl3yInD9mFM8A7RkDJXaAI9Mpr87n7IlkZWOvIRKHP1y3jh6N12GE
         ajYTIVKgkgqiYKeBP65ZJzVBgnTRTLmPHTbRIgduLfTWBfBS5enqA7T/NPdPKaBslIAT
         fl11FaoaI48vKxMm3kO4968hSsicqSHi3HSP7kABiTMuauVnNRzgg9N9LCDTQCTcpKFM
         gj+2YDzcPu2BkLMuuy6x+ZhA0u/KsjcpLDlj9rrqGI5Not1YKe2J8GBrGFMNG4E/F1x+
         MGj7QPmSbS1cdZ5mKCxOg588oRJDnGxzr5i1NyncKTOfMwk6RVZSE4fIibHqvY0uWSyl
         jkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/7YDqqGJtJ3QDn9FqQDzakc4DzlPeBa/z6aADOfcvlk=;
        b=RiNGrK9Uro/+7veVUiDZeXH9l5UrjEC6ZhGH89fNodb7g4XgwARDTLwmQWdcLIU5O+
         IYrcBZ8OjLIVtIDI8jS7i3lAhFyNZPe60KsXh9ZrjPlCL6MdGPujktd+AytYIcpi45C8
         kWsJRNd24gRpu/iqyxL6I8EVCP+p8qW9tcq/G72Gb63nFq5mWKTOmJ4O3S5bGnyLxDqk
         T2YMxMOxU0JeKF0fhAm2t8dEptfiK8UibLlt9yzKzotc2SH6te4AL4GeZh8AqTKkBZTQ
         +Uh+wWgelDuXwp3eBI3wjrrR/ZV6Ykv02sKxMXmY2UR56JCGBOYNKuVaBhJzlepIwpEE
         2SwQ==
X-Gm-Message-State: AOAM530k8ucwcBqCfayqKelbWkO4s8UM6G6eUkobDR6NhQ9kqEJu4T40
	wAw5t3Ye100hzFRKsyh2cC8Ftw==
X-Google-Smtp-Source: ABdhPJyCHNhJspkRjnJcy0D76OI4CN/ktjh2zAO6PvzgLZ1z3vWLnq1J9f6hum1jtJr8w6S2BlNPjw==
X-Received: by 2002:a1c:9d95:: with SMTP id g143mr15312898wme.187.1630185895896;
        Sat, 28 Aug 2021 14:24:55 -0700 (PDT)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id u26sm8645847wrd.32.2021.08.28.14.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 14:24:55 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	fmdefrancesco@gmail.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] staging: r8188eu: remove c2h_handler field from struct hal_ops
Date: Sat, 28 Aug 2021 22:24:51 +0100
Message-Id: <20210828212453.898-2-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210828212453.898-1-phil@philpotter.co.uk>
References: <20210828212453.898-1-phil@philpotter.co.uk>
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

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
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

