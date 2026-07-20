Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C80D41A782
	for <linux-staging@lists.linux.dev>; Mon, 20 Jul 2026 12:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784551562; cv=none; b=ZKuxNQgtv4JdzT16eOQIfvWDjJcqtNdElMKXvxueNgfwGtV8p3e2/Lu6MuGxX0jRavpdAKILBe6IpnFgir7joHzkwZA8+1j+IvVyCcFon/klWYH8K9ofO4oRJx6yD2uSTrWYKbdTKFal39juZeJraFsETykXI4yDo2uStW6gYZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784551562; c=relaxed/simple;
	bh=XU8fUo7CMMam8TgKb5tg5HD2A1JtwIDBWtoX7F5EtoY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dg+8gcsflgAaFVumK+UQ2tvqC4N2fBGksX7jzk9beQNF4JpCop3KAHbK5YBWnfhcwfi27+wRO6kRfbBMnUu3iTFmxCg40eP/NEX8jE4/OolkWclHES4btK8Z/8JbaId7WGMCsqomuw4o0FrndFb4NK4kOe6MK7sO7Y7E9MLLxao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDVMBND7; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDVMBND7"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso17110385e9.3
        for <linux-staging@lists.linux.dev>; Mon, 20 Jul 2026 05:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784551558; x=1785156358; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UEJyGGLB482pGvQKeptboND/Bg0M9vxY1Itc8qHQfjs=;
        b=mDVMBND7kLgvOtEDJAA5j1rJIRn56O/m3RxtyoiN8unYggRLJ3Xk8csv+iXYFcXF7T
         arHi51s0JeI1ucsX085k5ue40HUymdS4ivSpH1ikxMcb/gconxhkyofbTtU/4yB/Z51O
         D2SBGO4L4mrbdaF4942lQ8l5S3N4XvDh4mb6RlCGBADe9s2G7AtJviOi8HEyXce1uKaU
         7S2bo23suMcZtKKRmCVr1YthYkbLFDBFrzRsykM7G8X284E5oy4zpZXyqGm/HkDYWQGx
         1pzRyXez0e7YfdA2sD3SieO2QU5ijnD3Cp4Ecvv+6mfuM+MglGyKUng0wyKkaMDCo+Er
         qpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784551558; x=1785156358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UEJyGGLB482pGvQKeptboND/Bg0M9vxY1Itc8qHQfjs=;
        b=Q5QaLFsto4F9waYUwyfys95KZ1kvTsmcYmFt2FqCvIXLiOFocowahd8KowhHuQ+/lz
         t9Oxbtvyt7iKIXs5173inKLhdbqOF0ALZgfxEuEfyt40CrPN92qn1c0WWBwsu/A0sWei
         n7actnwXZ8XIkE5aTc/NcPXrMh++xtw3NMGa/V+RaK9jkPAye69MHpq/CgNOiG0+Me2A
         JXbI/DD8s4l6Rw2a9hlcaRQr5nw5idiWAPjzPfqo6yL0ux9rTcXhX1mT5BhhjuBxvzbL
         bMxJrHE9EyXKfkdz44W1jqnX933SyfXn7y5whd80ewtf7fRObbnftkiRoWRTSpmBz5Et
         Sndg==
X-Gm-Message-State: AOJu0YzEfdO2okTPtg8cFdzBW9F9N5hs1mrQuyacJj7PP0n57QO5L2sT
	929U/AKASXTw97xWpQZe75gyW+rKKrTqH5b4CGyMSnldmBPXPn8pul4j
X-Gm-Gg: AfdE7clPhoIMhxuol5//RcvZ9vvTLwydYtCeEPDC+G4n3iD86XV6QQrjEmm3O+dvfsa
	0h6/ZNYtI7p8vBtFp6RSn/asiwimfhuezYxpem8jtB+yeHeXf8QHL16xTv83CqVZVfoZFm5eFzy
	4D16jmINd53kqbOhRt16HoovlI2SMfQawUMwVc1T755bmK95TRwKOBJGuf+2Ys70SoHAQDvkqBd
	sW4EmETa1z9ZteERc16QbJqMSug6l1ANp6TsDS4KpxFneBHkVBHj9YJ3naVhBT1NvT+2c6f69um
	puQWXNoDuyPR6nmLhtnnJOVmKq+ZxGnREWYkwJYu4v7G1zRn+9qs1fjATKuKyGzUwsSfX7kuGJc
	poFPX0ezj3QWCljFeB5Ydjkd3fzRpJnxSwF/7I4+mUVDWr+sLVi4qArckZUU1Dg9hYk0/Y7g4/P
	TEMwlRjOeImbmuRJrJsRtuMnAkeO/bn4fIUz0qj7wz8APBis0a
X-Received: by 2002:a05:600c:3512:b0:495:4572:21af with SMTP id 5b1f17b1804b1-4954a3ef7dbmr148080135e9.9.1784551558107;
        Mon, 20 Jul 2026 05:45:58 -0700 (PDT)
Received: from XPS-15-9560 (80-15-70-17.ftth.fr.orangecustomers.net. [80.15.70.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2e850dsm309092385e9.9.2026.07.20.05.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 05:45:57 -0700 (PDT)
From: Olivier Tanoh <olivier.tanoh19@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Olivier Tanoh <olivier.tanoh19@gmail.com>
Subject: [PATCH 3/3] staging: rtl8723bs: rename Restore_DM_Func_Flag functions to avoid CamelCase
Date: Mon, 20 Jul 2026 14:45:44 +0200
Message-Id: <20260720124544.63457-4-olivier.tanoh19@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720124544.63457-1-olivier.tanoh19@gmail.com>
References: <20260720124544.63457-1-olivier.tanoh19@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename Restore_DM_Func_Flag to snake_case
format to comply with the Linux kernel coding style.

Signed-off-by: Olivier Tanoh <olivier.tanoh19@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 2 +-
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c   | 2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index ff5e5fae3ef2..f7b11d2a5abd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3812,7 +3812,7 @@ void site_survey(struct adapter *padapter)
 			initialgain = 0xff; /* restore RX GAIN */
 			rtw_hal_set_hwreg(padapter, HW_VAR_INITIAL_GAIN, (u8 *)(&initialgain));
 			/* turn on dynamic functions */
-			Restore_DM_Func_Flag(padapter);
+			restore_dm_func_flag(padapter);
 			/* switch_dm_func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true); */
 
 			if (is_client_associated_to_ap(padapter))
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 155564bb7251..8726796379f8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -227,7 +227,7 @@ void save_dm_func_flag(struct adapter *padapter)
 	rtw_hal_set_hwreg(padapter, HW_VAR_DM_FUNC_OP, (u8 *)(&bSaveFlag));
 }
 
-void Restore_DM_Func_Flag(struct adapter *padapter)
+void restore_dm_func_flag(struct adapter *padapter)
 {
 	u8 bSaveFlag = false;
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 08f8e722fd03..679e88de4baa 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -434,7 +434,7 @@ void update_basic_rate_table(struct adapter *padapter, u8 *mb_rates_os);
 void update_basic_rate_table_soft_ap(u8 *bssrateset, u32 bssratelen);
 
 void save_dm_func_flag(struct adapter *padapter);
-void Restore_DM_Func_Flag(struct adapter *padapter);
+void restore_dm_func_flag(struct adapter *padapter);
 void switch_dm_func(struct adapter *padapter, u32 mode, u8 enable);
 
 void set_msr(struct adapter *padapter, u8 type);
-- 
2.34.1

