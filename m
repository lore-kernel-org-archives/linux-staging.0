Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3383C6D1B
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 23:48:58 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id q10so6096204wro.2
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 16:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FQuW1UPh3Qs0vR7u5Lk7AhOqAgYjFhwozqp9XjEra30=;
        b=LjMMxr8+48vSzkduH9suiWS3ftr4PGwOKXPDm9GP1o5TMbSHANEnuOTem1LDMac0Le
         EjakbP8nw+HFWZ5GwGehyjeZQTPcTmIE3meez+OGb0Yho4Xm0Bf1DFyBuHB7iY0RT/t7
         Jdk4guS128Eehp7GASg96z9qWYaXwdy87dwKjAdOkiAuQCj3hEB86C0pNhjF1TtMYu6s
         R6dUgnKSNmwpC+eKay3tl7ebFc4kNtBAX6scicVGV3FtUj3P6WxyuUTVfd6uP6UrE4yv
         /7zeFneTaPHJR6VPA8PXPTICXHrMMG8wq86zaGn95Q4t6QO5lje3B9v1GXKOpVjtudGn
         xbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FQuW1UPh3Qs0vR7u5Lk7AhOqAgYjFhwozqp9XjEra30=;
        b=TKiDgOr+6cq/LPBGNRPiKOZcyt7QpblioT70VkLl4co72LZULquO6S+WDeY+8VPzay
         mCTLkVrvMBLEjUeFr78xjvJwN7LAtMYYJYjYle0q8I0eZ1jA5nhCvCro5hst1HxqwBV5
         XgjUQK0xBwzUAXX0FEu/cBlj9hMTgsRbFenNiV7vXhS3MmUNRViRDAF0vJyrTIjw8QoX
         +OXBQE7QFqasZ8JJeH0FCMgtQL2KWjoD2w/8Ka05za/juS53M4S9CI2qC60dhqFuLhbS
         1Af+jnj5gGSECYccVhjfQ4B/J1qmy373wluQLMkDQjIke7Or80Qc8dwvCE//NOaXScrN
         xJDw==
X-Gm-Message-State: AOAM5338TP0xJqTUFT9rMiD0OYOsV2ecKPctzDFboHRolFdxgCALstgr
	0wio10LrPwl3dEkgpyF6f1bhQBNLSNIWrZHA
X-Google-Smtp-Source: ABdhPJyxDilCGdCZiE90L6A5eSL+XivMU1+LsH8vV6Po34fGDaIUIZMjfGz4jB0CqcF9E6cVR6Z3+A==
X-Received: by 2002:adf:f282:: with SMTP id k2mr73219wro.255.1629330536679;
        Wed, 18 Aug 2021 16:48:56 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id z8sm1205916wrt.77.2021.08.18.16.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 16:48:56 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	martin@kaiser.cx,
	straube.linux@gmail.com,
	Larry.Finger@lwfinger.net
Subject: [PATCH 2/7] staging: r8188eu: remove rtw_vmalloc preprocessor definition
Date: Thu, 19 Aug 2021 00:48:48 +0100
Message-Id: <20210818234853.208448-3-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210818234853.208448-1-phil@philpotter.co.uk>
References: <20210818234853.208448-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove rtw_vmalloc preprocessor definition from include/osdep_service.h
as it now has no callers.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/include/osdep_service.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index 157ffe46c3d2..a9f147cd42fe 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -173,7 +173,6 @@ extern unsigned char RSN_TKIP_CIPHER[4];
 #define rtw_update_mem_stat(flag, sz) do {} while (0)
 u8 *_rtw_vmalloc(u32 sz);
 u8 *_rtw_zvmalloc(u32 sz);
-#define rtw_vmalloc(sz)			_rtw_vmalloc((sz))
 #define rtw_zvmalloc(sz)			_rtw_zvmalloc((sz))
 
 void *rtw_malloc2d(int h, int w, int size);
-- 
2.31.1

