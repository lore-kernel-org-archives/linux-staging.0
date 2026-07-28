Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153A8433BCF
	for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 12:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785242213; cv=none; b=EByojAMXS8N4fFA9ijDLhDRUfBo9lhUCq3SRvDBQHA+lj3seg3zhRUfgAoZuqQeG3szxeKykZobw8zoXJ3X1MCxLdkx835dkCUxZ8aVfQAVrQAixTJFl6hrIeiaCmsUQfuzenZojsRFaSA707x9w2H0cvSTz7mzgZ8vQ6TTH5sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785242213; c=relaxed/simple;
	bh=tgqX89SsgaaGhsGNirZ1gGCj8X5lbirTvu/3tsijwV4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sx5oFnOiHE8YIo6/J90f0o2bNtWBQtxTGWQ6KNJCUjUoh+BWHka+qdsbKXhH5lxYFsXZPsNiaMvL57JKUU9hgicVCut055Ew/LvGRInAldmOqV2+3Y4NzkygrZcw787qUmm0DTPwyFXzHxbgEt0ot4WVK3yJt30CxzSG7x/nVug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dAN5g8zv; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dAN5g8zv"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso26005495e9.1
        for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 05:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785242208; x=1785847008; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+KrojZSj9ZC5hejqqmrkDIluzMl1wUCkxnmnbZkaWjg=;
        b=dAN5g8zvmL2nRM4z/jDgCXx1g8crWsUugOvQjnvNA4rR5GU2PiWEprK/9p2CMZ/NXq
         LZjscs5LlYWgt/Q6rmvKnVJreyZRCzHWIjtzgirU0Ncn6Xk0ZH0PwzmoYYIfDcPYl5dK
         mAawRWTLcx5/1hbaBZxfGYa8oDbf1WE2c4aA1Au1HlwuuSMoASHovkuUJtDJR8svtGeM
         0yJZlD5tuSMqtzWeusp1S1frUOGgbQ8wgJf1ydGtV+6Fx1CMdAehZpVAopxc+Q6AOepq
         TziFBtluobv+N+vvhT6NSvz+pUPR0Evr0CLSZK5DyDSk4aSe6W872ob9u7FNnBFryagp
         zRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785242208; x=1785847008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+KrojZSj9ZC5hejqqmrkDIluzMl1wUCkxnmnbZkaWjg=;
        b=ISBBlv1YiqQlwwT+ZB4cIsgPfd3aWIK/KlUlBFghY9Y/+CFFIFs9gJWD57jliIuUsX
         rXRU4njdawgW7HFMv2T4nzilGgcomXLogehmdPne/dfv95mYdjnfnZONStDhQbCsCZ/E
         XCFElS6Ur/E+Ta3cg8oJpGuCpQVr79hG3djbPMo95aUqzIvRZN/NO/VUR0op9mxyiG31
         Vq6iGjBCuvw2mWrH/RBdxaczHJGFNyfTCCeyPWStWq8zECHaXjJzZH92hN9woWM6Jhaz
         wQMd/q/GqSaDitMelQqDiPcpEbNWedPPGa/1SXCEV6roLGLbONkvc5Z44Bgo9vZ2dNQA
         p8VA==
X-Gm-Message-State: AOJu0YyyjKdrt/eKSYuRwm+tEHVuqozBES1w5DKVxxBeUENtB8KNfjPC
	7XDqzz5PMz4ND1a+spf3JTe736IpkzQwube+DEomSIvLlLsSUnBMuEpJ
X-Gm-Gg: AR+sD111EckQBV76AJ1HzkvYMiSe7NlDy92Ygvqn2H87o2fAMYf4+nzGFVePiyzccDa
	KjYtHmeSRLyjGqqYVme0q0oxksKAD5C9aEhH63QNcD6kp5yPmzwS3W+stj838SOwR7JsPmJmXqD
	0dDWUCqULp1FhDDTLD9jec6z9+qw/jkDQMxzLnZPAaEjR1q5Exwjb2sq3yMhRHl2Rd82fTFLYWb
	9jiKY1GC83G8gk7SFRT7iCf+HUleMmoeYNkAWiqFgW4kA0KmW5FPzygdBEWdF9wCkFDDA42G6fo
	8jfNB+mRKFbj68qdGYiI2zad2G6fUHXCSEykcxGgixtJ0mMyADISVH93O6JH0+5MaBXW0EFDOpW
	051LUL5CVAdnHPqzIfJcScQjIdFf5pj57V/5SOcuuQ25Ul3p9M6QZrsa/zsTye4KgWDr/E+TMIU
	/BCI9gYddjdMjc9wzHp3CVPU7SdrfVtsQKN0Yo2e1sbakTtIQ0L8Aj4AuEcchKqQBAQ0+uc+/X9
	+bVzvXR
X-Received: by 2002:a05:600c:4fcc:b0:493:bfea:2780 with SMTP id 5b1f17b1804b1-496c643b124mr25612655e9.9.1785242208197;
        Tue, 28 Jul 2026 05:36:48 -0700 (PDT)
Received: from XPS-15-9560 (80-15-70-17.ftth.fr.orangecustomers.net. [80.15.70.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45b1c2asm77079485e9.5.2026.07.28.05.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 05:36:47 -0700 (PDT)
From: Olivier Tanoh <olivier.tanoh19@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Olivier Tanoh <olivier.tanoh19@gmail.com>
Subject: [PATCH v2 3/3] staging: rtl8723bs: rename Restore_DM_Func_Flag functions to avoid CamelCase
Date: Tue, 28 Jul 2026 14:36:33 +0200
Message-Id: <20260728123633.79735-4-olivier.tanoh19@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728123633.79735-1-olivier.tanoh19@gmail.com>
References: <2026072851-foil-womanly-4837@gregkh>
 <20260728123633.79735-1-olivier.tanoh19@gmail.com>
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
index c5d1bc77bfa0..065f8666f117 100644
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
index 2cd10810f9e9..e61905201194 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -434,7 +434,7 @@ void update_basic_rate_table(struct adapter *padapter, u8 *basic_rates);
 void update_basic_rate_table_soft_ap(u8 *bssrateset, u32 bssratelen);
 
 void save_dm_func_flag(struct adapter *padapter);
-void Restore_DM_Func_Flag(struct adapter *padapter);
+void restore_dm_func_flag(struct adapter *padapter);
 void switch_dm_func(struct adapter *padapter, u32 mode, u8 enable);
 
 void set_msr(struct adapter *padapter, u8 type);
-- 
2.34.1

