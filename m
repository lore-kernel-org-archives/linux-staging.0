Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929522BF01E
	for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 18:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752604119; cv=none; b=GZMEztlcR8eWOFZO2AXFgbPQ9N3tq/AZ28HQigBPvMSKoTZ1Nwz7BOAaB7YjdOwrV/Gn0NUoH5bjonjxgGWu6SW8omzg8GSzXz2Lr972KAby51g69hbNdY9n88Pwgtp2HgkOJnkAv5w5zwAQPeP9Pm/KlU68VCeQqgD99owN7HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752604119; c=relaxed/simple;
	bh=GolBMq6OFv1MR1lCKXX4qDABROYUnoVtl1R+maoxlSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mRSSi/ALo6YiP6J9CRJOozSxo0zHZuspbBmwi9mRhiQnkyiIbqHKEeieYfdQmfi5yLIb22jKHAU1ogdswK6jKOWZo6HfCiJM4bqrIZS7bP9uvwD0gXMdFlVWpb047FFtc71ULqfzYs2skI5jEYTHTHVeHYKOaQ0xXtCJU78wGhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HikOZGqe; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HikOZGqe"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae3ec622d2fso1016206666b.1
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 11:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752604116; x=1753208916; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNCDjASoME1LD5pZ8epvPobCM+XQAYfk2wfTrb5cxoU=;
        b=HikOZGqeCYa2zI66yL3McBxKvBKZD+54Gwk7Q7+sFV7XpUQ25VIrg0YKNEcn9OXvnD
         YupUVMa8IWwJ+DvwjZUwRctyWbbahp0ApRz5TszGwsK5ihOouFOFazVRJQ3Yx6nC5vTE
         xkRzx5oUeMCZiI0VshGY73QNvahWQZh03aw5FkJZSv1jlrzj1KV0Jj57h0L59qHJLR4/
         axeIGg51Xo6w3CZ0MpUMavEZnrC4u5Xh4qpvki1EnHkTnT0J2T+Ion72tJGvoAqdTCwd
         bTC9HB5VJnj1s+tEhuHXRMl0QGashWq5mp7ecXJ9ClU9rfJyuO1ceN6n251132v3PG2k
         BahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752604116; x=1753208916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNCDjASoME1LD5pZ8epvPobCM+XQAYfk2wfTrb5cxoU=;
        b=EjETtvxdfesJbQbcGW4ae2qV6BT/ivoVnnYPftxpmeKNUXeFmz04TO8FMGKKUKmnX5
         n0xfSSJi9E6lTfaO83I+aHV4tV/zvPOlh56JiMCHu96hj2vZ1eAebNHjU23MyYBh9A7f
         FOSYSUwW+mgwkpX0reXWZS80NZEw3fKZ8Ycn58gRRmXxpuhDJr44ls4biX4DMRp4GS0Z
         t4meFtWMu/2QJO6ndDPlifGLkW8hTAF0+Vr31NHy3m7qpktT1N6Tp0jkjyzJUgn/V1OO
         tvyGbUGOeHpisvS2lTzlJdH5cGdbyGNN7s8cwNa+XZyMyh1rKB975SHhBmWcJX07qYGW
         A0Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXa6O1NyEDqdhDwBUQLjb2l0/3tPZ5+VSYCkvalFl97ABr1TcRI6uetRGD6F+nJmNrgg8ML4yd3rC50x/dX@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7UKrhX4fOFdDVSr0Q7FVAXzMy6NjwgexOPSY288V6rVQ3VLwQ
	1sUOSMdiHhQIvSZ2QmjDM6rQ7W944dd9TFeU5PNktqIHLkrxoDlKp0zF
X-Gm-Gg: ASbGncu5ZzOXrMOqXR2dSKA+4oNN8hAZPpzHrr2EBxl31DPzQQ2Y8H1BVkblr5fYB4O
	QvZLnoeXsFlze0pIqIafbZyo8tlnDRGMCBfWzN1417jouSn+L3AIm03feI3zuWO8lRPGrRLvAjd
	9d3ttayfw2PfxrOzzfVZtELY+kphP08jif6XI/2M22d736kmejUXvmhaTEdpSuuUd4+aO4QIZqD
	59tTPXPzfyKDXV/ANDopWd+FHFxlm4mSCp2EmdyS/Aah9vdYc29GDklg4AWHynkQNcjcyF49pD+
	2+7fDwOWMKeyujiJg7vG07Cnmj8j7xxRhra7cGey74aaxwu8DnvW8H3vAFWOdpiH8JM70bsN+m7
	BJeCQ4Glgj+PINap2ycZfuVE=
X-Google-Smtp-Source: AGHT+IEG8G/3KDBgU7yI+WXfl1prf0M2J5Fz5nCF/bbi6kChEkhalhvHnS1TeS+8UZ/Gt7M4eiJMNA==
X-Received: by 2002:a17:906:d7d4:b0:ae0:c7b4:b797 with SMTP id a640c23a62f3a-ae9c9b598b3mr44074166b.45.1752604115776;
        Tue, 15 Jul 2025 11:28:35 -0700 (PDT)
Received: from tumbleweed ([95.90.185.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df2fbsm1039562766b.158.2025.07.15.11.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 11:28:35 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 10/11] staging: rtl8723bs: remove function pointer c2h_id_filter
Date: Tue, 15 Jul 2025 20:28:13 +0200
Message-ID: <20250715182814.212708-11-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715182814.212708-1-straube.linux@gmail.com>
References: <20250715182814.212708-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function pointer c2h_id_filter from struct hal_ops and use
c2h_id_filter_ccx_8723b directly to reduce code complexity.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c          | 2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 1 -
 drivers/staging/rtl8723bs/include/hal_intf.h      | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index dea38bb8424d..961b0563951d 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -303,7 +303,7 @@ s32 rtw_hal_c2h_handler(struct adapter *adapter, u8 *c2h_evt)
 
 c2h_id_filter rtw_hal_c2h_id_filter_ccx(struct adapter *adapter)
 {
-	return adapter->HalFunc.c2h_id_filter_ccx;
+	return c2h_id_filter_ccx_8723b;
 }
 
 s32 rtw_hal_macid_sleep(struct adapter *padapter, u32 macid)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index c35b0235d3c1..1e9447633465 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1315,7 +1315,6 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 
 void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 {
-	pHalFunc->c2h_id_filter_ccx = c2h_id_filter_ccx_8723b;
 }
 
 void rtl8723b_InitAntenna_Selection(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index d6fd692aedc8..248f54f04c5e 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -161,7 +161,6 @@ enum hal_intf_ps_func {
 typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 
 struct hal_ops {
-	c2h_id_filter c2h_id_filter_ccx;
 };
 
 #define RF_CHANGE_BY_INIT	0
-- 
2.50.1

