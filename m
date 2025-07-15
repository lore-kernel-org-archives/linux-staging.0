Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4786C2BE653
	for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 18:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752604117; cv=none; b=PN7/AJZpoh8XFKU3fa8pG85aWAktYv/xj28or/wEnaljubFLIIosFrBr9qznvrsrXUbimd2hnLJ0xP72IaeNkxu8yJfRTp8OTpLcA8DKfjFX8hq9sgWA7CW9Uw56aecQXxc8In3GEyQa55miPizI1iOt8XQWbr1yUIjknYWA9D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752604117; c=relaxed/simple;
	bh=TkTC7lCUvRX5IgkEtTiK0ajKdF5IVeXDZfOY0NHXRgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gCA6vV1/fYzvJWjG22BTHEvfzeNzF1cyCdvpIfOlrKj02tifMTQvak0nBd349T07s/4cKP+36NGR2c/GDIzDyb7i0YHmaCzLuQaM7mGD+JQylwLj8BT5jCLgaPemJicedimawDXKbeLKUZzTkuAmAmOqKmKlpNvtGG00AEJPstk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6y5YEYv; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6y5YEYv"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae04d3d63e6so1121532266b.2
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 11:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752604113; x=1753208913; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYbT1bwVU7Da+KtvSfr27h+1VS/LPzjDzfer1EdRGO8=;
        b=S6y5YEYvsduixtbMdzTp3htLvq7I+bwJlsHC5vxK5XpYvd+iLMJ1jAsaALmEymERb9
         Iby/xqj+m1U/xS24scGVKde0ZHeS16yjrBRdJ8BZpLl7KmWIz4FRN/Pn89IIc+BuobaJ
         PYECl/2V7kb8rdBkHmnADQ7L5Y8Xhnu8HiECcvT0jJ0+oNAsTv2336HCjtg3obDbapyo
         7BHvBNkDG6gkBRXCCac9PapTluuEgljoyf4aOTIX/+kP8Pumv4q9ZelCe/3EJDjT49s7
         U4etqSCjAhlAAUZ7LQK1ZEyMtRQNR/dUuj8v/u2YwxOFnsK69J8LSTPMeH/9abjjtRV6
         VXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752604113; x=1753208913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYbT1bwVU7Da+KtvSfr27h+1VS/LPzjDzfer1EdRGO8=;
        b=X/csqrtfLJwCx/KHzSS0YOH9NfPZsl3ESIvPXmFzJ439OnAGw0PLkHcbCt5MKKQThc
         i4QxRW8oSw6oQNB9PqY4bi9vilSkojJKaLY7D9DbxtQdpKtpSv4VzInLDxRvtAoe5dvR
         0svIKjN4Zt9Dqyfe9aw3zZ4FOhXltgBoAGJ8cMUDZn+I/YtYWOXuYQYZrBkRdPbzZlbF
         V9qLat4t28Cn0LLM53iMVkD6MHmSOMHRnDKf3sPqTfKydXbHauDJZIyXJWcChEGT/HoK
         sD4ycd9yXBYzu2TkuMXy2/2ulKzV1tfeJ3hpNjX6L+mZuunuUuw+cs0kGeLXpUfqujg+
         HrpA==
X-Forwarded-Encrypted: i=1; AJvYcCXOzIVVoxxYm57GM0xo6GyB0LYUcXrYMMH2CR6XEpEqLy8L52LEvBLhrzDlC+R29li2wcAazp/BwR2bLDdA@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1QGLMBt6vHwJwZA386RlWVPn5x6c8jWfDN3DyqV49PxogKix1
	8eCiKt9+ATdIH25Ll8qJjlls8MIOuPSgAfeiZnLibc0WVPyFVDKp1LFy
X-Gm-Gg: ASbGnct1m44hJir1JkwV33dtlgYonYtEeRikwGdLReaSWTvcWycxg8bHlJizpqfAncy
	/kXB/0UAjH0QbkTZk9vvlXL0aMpoVayVO6rISsJziwTLyFm06yn1aOnGXSwzy0eBopUmnfmlp8K
	HUnB1c7QN/lJjFWuitEVax7qiaA2BMCKGD9ZHfXwpU3dVJx+vSQLszvZA0bvdPVLpKPppYrvjFU
	/c4oV77MR7c8p7e4bVLbqxkEZyo1G2zl2L6SpucnvXgRZYm5y/+D4Mn6zoy1jVb3ELiHAu0t+Yp
	2zttR7gRIIDFSZkcpVLO6cjFu6BvPkEnf6huwBSdy+8Kqm6NzW2EWM8Ib6u9jGG1ehlA4GzDG77
	1VvbyS+S+GULyBGskt7mdYZ0=
X-Google-Smtp-Source: AGHT+IHiJmMishS1JlRphNJ1dh63va8CNcqSMl2t6OQ3Cn0fUOgu4FZP9pQmC92BBIpVMpMDJ9Wqug==
X-Received: by 2002:a17:907:3d89:b0:ae9:c494:1ade with SMTP id a640c23a62f3a-ae9c9bd76d6mr47022266b.53.1752604113403;
        Tue, 15 Jul 2025 11:28:33 -0700 (PDT)
Received: from tumbleweed ([95.90.185.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df2fbsm1039562766b.158.2025.07.15.11.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 11:28:33 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 06/11] staging: rtl8723bs: remove function pointer fill_h2c_cmd
Date: Tue, 15 Jul 2025 20:28:09 +0200
Message-ID: <20250715182814.212708-7-straube.linux@gmail.com>
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

Remove function pointer fill_h2c_cmd and use FillH2CCmd8723B directly
to reduce code complexity.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c          | 7 +------
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 --
 drivers/staging/rtl8723bs/include/hal_intf.h      | 2 --
 3 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index beb4272a0992..d9791027a2f5 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -346,10 +346,5 @@ s32 rtw_hal_macid_wakeup(struct adapter *padapter, u32 macid)
 
 s32 rtw_hal_fill_h2c_cmd(struct adapter *padapter, u8 ElementID, u32 CmdLen, u8 *pCmdBuffer)
 {
-	s32 ret = _FAIL;
-
-	if (padapter->HalFunc.fill_h2c_cmd)
-		ret = padapter->HalFunc.fill_h2c_cmd(padapter, ElementID, CmdLen, pCmdBuffer);
-
-	return ret;
+	return FillH2CCmd8723B(padapter, ElementID, CmdLen, pCmdBuffer);
 }
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 10224d096886..c6fda239d020 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1318,8 +1318,6 @@ void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 	pHalFunc->xmit_thread_handler = &hal_xmit_handler;
 
 	pHalFunc->c2h_id_filter_ccx = c2h_id_filter_ccx_8723b;
-
-	pHalFunc->fill_h2c_cmd = &FillH2CCmd8723B;
 }
 
 void rtl8723b_InitAntenna_Selection(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 64f5d7b58258..7b634180c6c0 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -164,8 +164,6 @@ struct hal_ops {
 	s32 (*xmit_thread_handler)(struct adapter *padapter);
 	void (*hal_reset_security_engine)(struct adapter *adapter);
 	c2h_id_filter c2h_id_filter_ccx;
-
-	s32 (*fill_h2c_cmd)(struct adapter *, u8 ElementID, u32 CmdLen, u8 *pCmdBuffer);
 };
 
 #define RF_CHANGE_BY_INIT	0
-- 
2.50.1

