Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D48E1B969
	for <linux-staging@lists.linux.dev>; Sun, 15 Sep 2024 06:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726382465; cv=none; b=uTDhcsvcO1sr2ibqMGX10UiWzz69vWHNvXJKHWhKzOD4ZeKdcII2npi/nUpmpYlgENQmJAdA/b4onMkMSNUukHbjMsWUC8DemJo2iVKERtqY7zL1H3Zhw/0HhJLDp5pY5cDXBxtjmGGTdIeohyAEvrlGE9Sfey2H8jhqvg5x/Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726382465; c=relaxed/simple;
	bh=98wEUhIQg0oe7cqCfXtb9PvhfHYoR+LzgTdsHvJWDYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZGwSoEYtcknM3A3ShVLpc3Thj8QpEJs11M5Hrvvh+12vHDL/GYZwpr6t7rzjW8AAxb5U6rHEYyDxYY3XUmLzWTL8xn/Mpt8jjPr68KGE3tk83boXzUNsPWhK5fFLkCCUkeluWu18MbT4WUzqD0eyPvcNHs6i/iJY/cb9wQOi8NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMJXRWG3; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMJXRWG3"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c26a52cf82so1266758a12.2
        for <linux-staging@lists.linux.dev>; Sat, 14 Sep 2024 23:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726382460; x=1726987260; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mytdCWz4Iuztl7wUallrWXgXAVacZn2drTPgnY2iPjQ=;
        b=QMJXRWG3rijURjqxCrG+1OctkKLiNiQk+1/Lq0A6C84zc8fYJAzUj4wLGzXWlJMg8H
         DJBnVcakeE40tRsEp+tX5tZcJQc2onNh8DliPNzy1WVPx5TBYBOAav5r/OXHF88JQhXa
         msaYZLjm8kEZmIG9jksfUTRn40VbTHnsBVWCTdZntUh2gzNUAl3vrZhXqOX4vCBWkW/7
         5tnK7bchF5MexKeS0Yh1cmjFbae7fmOC74+vX5UqvoIQ18LhJVuOROqaxfyekM4/awee
         K66PB8TIgOFMp+Nj6CdZ+oyEUt5JEC67VQExZdWnQYLt8NAAuWkyRSqqYBVU+kyNTK3r
         R8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726382460; x=1726987260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mytdCWz4Iuztl7wUallrWXgXAVacZn2drTPgnY2iPjQ=;
        b=SuXuUzVL0pmF/qEHbSfDTRojZHWO5xHXyOIAPXDXSknlM+aNGWDhqaANhxULnLbiZ3
         nGnWAL2nIuaFnd38e81ELQb7pLTYSe5p1cd+TjOL5iyfNX9T7LdZHeHKJYhyyeahyJRi
         +u+iiK8CRC58TRKpsEpxq/yOEex0seKGkhidNFpu41nJiJD8LoQQtPLh/vSrxPwXEWU6
         PLikpOZYjSqjFZz+nlcz8dmBSsC3aluLPbwSZBqv9qN/sAPeBRAEuhaEDqp3yYYQSVOo
         0riS6x5WiTqq0727/ZD7aTmXKF1Q3++YCfUFUVAjSimjIkCcPY/o1lnCPFMJUTsUiIzn
         uLCw==
X-Forwarded-Encrypted: i=1; AJvYcCVnluTy68O9o8uK/y7EeEtr9yTczuH5mliqcYWtrI1mVBWYMOdA4THcWq5iMDp+/DzshJQSyTOf0GUGdCS7@lists.linux.dev
X-Gm-Message-State: AOJu0YwGwkq592kE4gxrNTIWY+6XEsw8FuoAgeL20gtgIqq7PCWGaHk6
	6RShMy+b79zt2tFOrw4/KTB53WN5S4BJIRlwOTMhFC4SvGGhBQIm
X-Google-Smtp-Source: AGHT+IHo9z81VjnaVgB+Goew5pVeM34br4ujYIIrCTB5Q4Wqd/Wut7NSV6Wcd+sQfylyH8FwfQX9LA==
X-Received: by 2002:a05:6402:2687:b0:5c4:2448:87e9 with SMTP id 4fb4d7f45d1cf-5c424488a68mr12228752a12.0.1726382460360;
        Sat, 14 Sep 2024 23:41:00 -0700 (PDT)
Received: from kernel-710.speedport.ip (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610967bbsm160201066b.8.2024.09.14.23.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 23:41:00 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 05/17] staging: rtl8723bs: Remove unused function rtw_get_oper_bw
Date: Sun, 15 Sep 2024 08:38:19 +0200
Message-ID: <5918320008abc9a14c00fd61f00b40f35f1a5bef.1726339782.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
References: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused function rtw_get_oper_bw.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c   | 5 -----
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 1 -
 2 files changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index a4cc48989445..4eee324385a3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -290,11 +290,6 @@ inline void rtw_set_oper_ch(struct adapter *adapter, u8 ch)
 	dvobj->oper_channel = ch;
 }
 
-inline u8 rtw_get_oper_bw(struct adapter *adapter)
-{
-	return adapter_to_dvobj(adapter)->oper_bwmode;
-}
-
 inline void rtw_set_oper_bw(struct adapter *adapter, u8 bw)
 {
 	adapter_to_dvobj(adapter)->oper_bwmode = bw;
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 479e90ff336c..2080408743ef 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -447,7 +447,6 @@ void Set_MSR(struct adapter *padapter, u8 type);
 
 u8 rtw_get_oper_ch(struct adapter *adapter);
 void rtw_set_oper_ch(struct adapter *adapter, u8 ch);
-u8 rtw_get_oper_bw(struct adapter *adapter);
 void rtw_set_oper_bw(struct adapter *adapter, u8 bw);
 void rtw_set_oper_choffset(struct adapter *adapter, u8 offset);
 u8 rtw_get_center_ch(u8 channel, u8 chnl_bw, u8 chnl_offset);
-- 
2.43.0

