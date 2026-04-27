Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1DC33A6F7
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 17:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311553; cv=none; b=OzIhOOsOl72GESxIscKCos1zKjGrOfIoYq06OaxkNOPM4QFsI/Bb7GK3k6ISyUgTMUbcInelxZnD1SMv3ftEdHfRk0ht8DLjy9y3CF9YLM4LVaxyFI9LqHd1GAsrflThRqnZ7ybSTTdHJnA4xAZ6z57mbzeWmfU1HB0U4an98R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311553; c=relaxed/simple;
	bh=h2DiuQT5RSKbJyUQkFVpTfeV+gyz4RZp71VEmrTVIuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XZmrEEIGYfubHhKGUPEOoYzgZ6Vjp0ow0Uxv3jdupkebl+xX8YaEb7gAe1g00ornD+Jcb336TYcVdm4EugYjr0GXR6m22o7ta0OXt3GGvfn4/+MapmkWc1GuMY4FkiZ9297xNFWOj2KQPP3zEpRVCVHOp9ideH20F/jq+3pAq3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DK/PEcNd; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DK/PEcNd"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38dd575bca3so101594901fa.1
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 10:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777311548; x=1777916348; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9d1vGRNL0HJRjtCNGA9boYkvS4ANZ5Jbt3ivUmyM0v0=;
        b=DK/PEcNdMxUqUmN+HnyW9iFabsAjykAtHtbU8FMKnuKY/ZF4FCIMfBY4AEWcVtx2NP
         YfCH9uZDs1AXHAb8pi2JgcMsaNWEA0bUwtOIrZaFKtY9qrFIzOrKwsJeuhSp6nr1kOna
         YJ5yN0q8AU4Fsuf48zQiubWUE00l8NYnkHMBtiguQshxO9v6yD/yOxUdI522SBTFo5hH
         NKDiT3zqM9UYo5CsVQVgQW2omDfGrrLPOOsRwg0JiCaJTTHLVbv/ZD97sWu4RrbNdxPN
         sVKUPFP2pOW52jswJgv1himcCCpSHLoXV4IX8l4rJObOnHO5LbdF7lThJGPzfVPO0ZWW
         kK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311548; x=1777916348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9d1vGRNL0HJRjtCNGA9boYkvS4ANZ5Jbt3ivUmyM0v0=;
        b=fHEVTypVHqrWVC9U0iAUR7BlNXp1+VZ1FomF+UpvWhEbcuZZtJcUGgO1w+4zLsCBkW
         ckZCFF59o4hTK+/zlsM8PxKGMhvJRhx1juEQ/adPuK4zdJAdqWT5olOIDlVumBxq+GCS
         nhGDws2tDp45XnFEMXgwsa1qWx8DTvE6NI3XxIgYbKajj3rfjpAg5LpQKqSU1LJrJXEA
         nCZZyk9kM8SX74I7dFOTHCmDSzb9ViH1fOJSFzvIOuGK8Y9Kwh7YwkQGz8doRnp65/OY
         pbvWa+a6628FKNxkRRiUO6iQMj9Lmbxm1oyL9T3yIy81qRiyL2ASppIX76ZEpCviqXBQ
         6W1w==
X-Gm-Message-State: AOJu0YyFXBE15o2Kmm+11CV3LHiFUTSaa+YNziVZmB/zHHSZKFWzA3sk
	IA/A6fq/pwXf1fmPIQlfayWvL73Mvj7ALP3wHFtbISGMSyhSoLuaXQ/QeK1kQ+S4+r4=
X-Gm-Gg: AeBDies8di6twUr5fNDqEsZJZvXeSivgGP5tPVkDxTSX0f0gC6ZhNFlphH7iN+RRlql
	zppbUd/EgoMDEk3aZESAXmJ2OxXDQV+3DvCqP6rpuzSPWZMhB2khw8zXOCplMJb+BTsZG5+Zc/2
	5CA0lV15P2LG4/9rxM1BJzTvL2zP4VpdGqe1uqLZjaQXXvmvx/AF6YbL8SeqcFug5mM5s7mR74o
	0lBzQ13i0KQdTNew7Li1iiXGijzc4tW2PEnO5c5WUrpuB0zb6KIYBp2vIF3XdsYgedAVEnTgWNd
	GgiAD1gyOcdQrrpNlGL5FL+mQ0onfzhD17LqKWQ77fSPG0Q8iU+DZkulcM+SfUZv8G+wchdewAh
	JnqczhbQTpGREpCT+NMl+3e/5rpfxC8s7jlMD7ofYzqddp5ePSxrq/PO5VHfLYjPjJmNXZwRoNA
	QQ3+yjFANlCI7CfrsZNL8CKQti4uYOeJG0eX58Jgh+PfYL+IqXMaqkD7BjAiXQ/kimZ+MvvS4X
X-Received: by 2002:a05:6512:2246:b0:5a1:3d08:cfab with SMTP id 2adb3069b0e04-5a7461cbb21mr26462e87.23.1777311548104;
        Mon, 27 Apr 2026 10:39:08 -0700 (PDT)
Received: from localhost (c188-150-77-196.bredband.tele2.se. [188.150.77.196])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a741a72f98sm1341338e87.79.2026.04.27.10.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:39:07 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH 5/8] staging: rtl8723bs: rtw_btcoex_HaltNotify() -> rtw_btcoex_halt_notify()
Date: Mon, 27 Apr 2026 19:38:54 +0200
Message-ID: <20260427173857.585742-6-linus.probert@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427173857.585742-1-linus.probert@gmail.com>
References: <20260427173857.585742-1-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renames function rtw_btcoex_HaltNotify to rtw_btcoex_halt_notify in
order to conform to kernel code style.

Found using checkpatch.pl.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_btcoex.c    | 2 +-
 drivers/staging/rtl8723bs/include/rtw_btcoex.h | 2 +-
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index 961c034ef719..24184c8d34de 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -18,7 +18,7 @@ void rtw_btcoex_media_status_notify(struct adapter *padapter, u8 media_status)
 	hal_btcoex_MediaStatusNotify(padapter, media_status);
 }
 
-void rtw_btcoex_HaltNotify(struct adapter *padapter)
+void rtw_btcoex_halt_notify(struct adapter *padapter)
 {
 	if (!padapter->bup)
 		return;
diff --git a/drivers/staging/rtl8723bs/include/rtw_btcoex.h b/drivers/staging/rtl8723bs/include/rtw_btcoex.h
index 6eced86d6623..d9ed8f2d8d14 100644
--- a/drivers/staging/rtl8723bs/include/rtw_btcoex.h
+++ b/drivers/staging/rtl8723bs/include/rtw_btcoex.h
@@ -15,7 +15,7 @@
 #define	PACKET_EAPOL			3
 
 void rtw_btcoex_media_status_notify(struct adapter *padapter, u8 media_status);
-void rtw_btcoex_HaltNotify(struct adapter *padapter);
+void rtw_btcoex_halt_notify(struct adapter *padapter);
 
 /*  ================================================== */
 /*  Below Functions are called by BT-Coex */
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d0feb28b7043..29cc97b29d0b 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -401,7 +401,7 @@ static void rtw_dev_remove(struct sdio_func *func)
 
 	LeaveAllPowerSaveMode(padapter);
 
-	rtw_btcoex_HaltNotify(padapter);
+	rtw_btcoex_halt_notify(padapter);
 
 	rtw_sdio_if1_deinit(padapter);
 
-- 
2.54.0

