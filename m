Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157846D24
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 23:48:59 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id l11so6092949wrx.4
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 16:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DIsb231Pzs9Ci09M3Kwp9nT6qlCilUWD4WzaGDN4HFI=;
        b=u2UKk7P4VRuMDtu4iF98WVeRSSODVjSTBA/Xfev1uDExRQcRzNeV2Agh6xlrnYVKeX
         uweLpZxP74HcprDM1Nq1Cy+0+SjoucZI5oCww61COywZ3Ax2TcAHX5GiLRGx10bvPJlq
         20jfr8S8H8AcchOtpzYqGe+4ZJb2P7ORCE4I6J+6IVeH+AXm45XrbZd8LJyRYoSr4fNw
         Imy4beT4b/nNxxMqyAh/zaklI777c3FifjkggSiY1c6/Eybv/HY29bWISPg22Bx+8gvZ
         sMq9JFFREr8cf2zBlwk+ZCDBNAvsDS+/4uJSo0YxUmd3PXTUsyrFwEvN9betsWC9O9en
         Ap+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DIsb231Pzs9Ci09M3Kwp9nT6qlCilUWD4WzaGDN4HFI=;
        b=nQyrq4JRTWcQUGQ3nKmijpYp/JYRQ/QQS6lLtG8wyjyjZr2/oH4GlfHs6PNnyh/pz2
         6faKbMcqr+7OiRsjdcGodyAx/S8w83q9K46yY8HPHr4EUHQuW0l09Rj/jc2OVE1wMlTn
         xu+q+luDCGYPWH9rZyKXAUcwCanDuKN5PtXjxTq46T5Me2Z25k1oihteXESg7zfJ3NJK
         cvTu4uCuYV/1JdzeFFKMqWZhGlkP1e3LvQLPckM4DxbZqvr3qrPDc3/exYgoiwas0lf7
         zsWbc6oUWehEY3AFrPI/Q25F0b/rosVokGuW0eDgp0MmUSm/dLDbewWQdQbxaLxCKOHQ
         +TlA==
X-Gm-Message-State: AOAM530HiaXOqlZb4x5DdmKmWzrhw4hFTrJGGr3VyPhuXr5x61AXuBVr
	KpxmPV62bmUtjBy0IKC0IDheYQ==
X-Google-Smtp-Source: ABdhPJy8DF6Jo/vKMfTwimcU8Ii6uOAeu55Kl2VVct8CySOUkIco1hp98iZ/uConoaph5j69gUJ+FQ==
X-Received: by 2002:adf:e60d:: with SMTP id p13mr74282wrm.291.1629330537535;
        Wed, 18 Aug 2021 16:48:57 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id z8sm1205916wrt.77.2021.08.18.16.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 16:48:57 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	martin@kaiser.cx,
	straube.linux@gmail.com,
	Larry.Finger@lwfinger.net
Subject: [PATCH 3/7] staging: r8188eu: remove function _rtw_vmalloc
Date: Thu, 19 Aug 2021 00:48:49 +0100
Message-Id: <20210818234853.208448-4-phil@philpotter.co.uk>
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

Remove the function _rtw_vmalloc from os_dep/osdep_service.c, converting
its only user (also in os_dep/osdep_service.c) to use plain vmalloc.
This function is just an inline wrapper around vmalloc which returns a u8
pointer, which isn't needed. Also remove the declaration from
include/osdep_service.h.

It is considered generally bad practice to declare functions as inline in
the majority of cases, as not only can this qualifier be ignored by the
compiler but the compiler generally makes good decisions about inlining
anyway.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/include/osdep_service.h | 1 -
 drivers/staging/r8188eu/os_dep/osdep_service.c  | 9 +--------
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index a9f147cd42fe..4c00adeb72ee 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -171,7 +171,6 @@ extern unsigned char WPA_TKIP_CIPHER[4];
 extern unsigned char RSN_TKIP_CIPHER[4];
 
 #define rtw_update_mem_stat(flag, sz) do {} while (0)
-u8 *_rtw_vmalloc(u32 sz);
 u8 *_rtw_zvmalloc(u32 sz);
 #define rtw_zvmalloc(sz)			_rtw_zvmalloc((sz))
 
diff --git a/drivers/staging/r8188eu/os_dep/osdep_service.c b/drivers/staging/r8188eu/os_dep/osdep_service.c
index 6218a9052ee9..800f493f1000 100644
--- a/drivers/staging/r8188eu/os_dep/osdep_service.c
+++ b/drivers/staging/r8188eu/os_dep/osdep_service.c
@@ -36,17 +36,10 @@ u32 rtw_atoi(u8 *s)
 	return num;
 }
 
-inline u8 *_rtw_vmalloc(u32 sz)
-{
-	u8	*pbuf;
-	pbuf = vmalloc(sz);
-	return pbuf;
-}
-
 inline u8 *_rtw_zvmalloc(u32 sz)
 {
 	u8	*pbuf;
-	pbuf = _rtw_vmalloc(sz);
+	pbuf = vmalloc(sz);
 	if (pbuf)
 		memset(pbuf, 0, sz);
 	return pbuf;
-- 
2.31.1

