Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0F31F8189
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 12:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729083401; cv=none; b=nI9ZPPmRi66hlWEIM5rNUfrlyTxm97SGe6npHQ/p1SW47xCs7USA1ALqcxtHEnECvikjW2iVJ/xTwC/AWBPTsJU2K/eyh3XRk16IGAF9qgAvC+l8/Q1D4fYGc2qgvkII0qM2Be+gACzNz1uEb6eyT5ynS/dkuspfa4TCorV8ob8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729083401; c=relaxed/simple;
	bh=bJo1wR66LxZz66uBsx7b3YPGLki4nx/QMECYckCDz2k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uOA9p5PWU/S1pAeqFRCA0UHpg0MbehvcDWjENz3Zroy9oM2XgnitvHHwd24XpNAPi2hRsfmzNkZ9hqlHO7sZuUJ9p3eJD+hDGh6CbMuQGLC8Wk1JhTEqMJIOSMUCcYuuBPRtQKSu0C1yzrCu/NbzWIXDQpW5OSMIR49ab9iT0dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VxXXlZDL; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VxXXlZDL"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43155afca99so1091715e9.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 05:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729083398; x=1729688198; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQfsseZjnFfh9Gg9XTPNTmAU5/IvNZ9mOEFHN5IESnI=;
        b=VxXXlZDLMM9q+4J3tP/Do//sl3fWmwPk85vZbnVGFx/9QkiKSgjsyjAf2FwXVouQzb
         FW3Ps9Wcy/pUqPGsSKOUIQjTkm+RQqi6W0/bnvpDm6KU18YucP65KvQsu6bgC308/AgR
         9EfsMulK4VfJY93Fg7qKE/HQupr8lByWOAEuqNfZgAjtLh1qChlrdxQ83GCkPBPJfjEx
         FXv1TnNSYlHf7+hbWCZDPUTH6TDTzgF4VuFa53DMwTE0Avfj3VwrQNHVqQmV9pDuAd9+
         VXCWMn5dNfA5/jrrJON5KtSCX49rErR6Cm03Av0LbkWcrqlrhXTRvVcONet24jsxtaCn
         YSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729083398; x=1729688198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PQfsseZjnFfh9Gg9XTPNTmAU5/IvNZ9mOEFHN5IESnI=;
        b=jqKz2vc/8SQIU0z8W4tJXiCW8ObfvmzFkaW/2iqtxgX8OWv4TCm0tJRKh985GuiinU
         hn6SiL4Ys4M+Q9vsWof2WdY7ICz+hFkoLiobrHm0+yS8OScYW2XEdlPACRC9Mh7BQadM
         7V7hIJUa3+y/z0ku9pWWN5e9q79jhgMJVryQuAq1rpegiV1nrUFgnj98bTGybmo7cm6T
         hSXgyF4jOW3xxNIoNUc59DCkhRPW5XuW6rNnFL+JPtU8pRYjsJtWn89/GyMKD/9vnKRh
         3sJsaT0UrY8TMZvljfuuIqabMBj3PFYTchmD+mgKsN5eAitefNg4s5XjEZV4+NMK6wb1
         nNUw==
X-Gm-Message-State: AOJu0YxLhWd6Jvivnwp+ngrgsedpcA9O2hdeFsi3LodqJEvwfDn8r3BI
	Y+XYhR2+XSz6PPEU+wWxVls2MjJ31FoTogSRg2H76i+zoFfCQgu4lT4i64uzz/Q=
X-Google-Smtp-Source: AGHT+IE8AUhcQK6Iu51LUubsi1BGGR1ROOtMZhVx0Rhz1hEKpBcVSI2uO4xo44jAcDfeZD3/obvsxQ==
X-Received: by 2002:a5d:4c92:0:b0:374:c6b6:c656 with SMTP id ffacd0b85a97d-37d5529cb41mr14516692f8f.21.1729083398195;
        Wed, 16 Oct 2024 05:56:38 -0700 (PDT)
Received: from ARL1114-LINUX.. ([196.233.5.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa7a13bsm4249405f8f.13.2024.10.16.05.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 05:56:37 -0700 (PDT)
From: Aymen Khalfa <a.khalfa.1012@gmail.com>
To: gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Cc: linux-staging@lists.linux.dev,
	Aymen Khalfa <a.khalfa.1012@gmail.com>
Subject: [PATCH 1/4] drivers: staging: rtl8723bs: Fix braces coding style issue.
Date: Wed, 16 Oct 2024 14:56:27 +0200
Message-Id: <20241016125630.2479807-2-a.khalfa.1012@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016125630.2479807-1-a.khalfa.1012@gmail.com>
References: <20241016125630.2479807-1-a.khalfa.1012@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Remove unnecessary braces.

Signed-off-by: Aymen Khalfa <a.khalfa.1012@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index dbfcbac3d855..1ced6f7ac552 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -56,9 +56,9 @@ int _ips_leave(struct adapter *padapter)
 		pwrpriv->ips_leave_cnts++;
 
 		result = rtw_ips_pwr_up(padapter);
-		if (result == _SUCCESS) {
+		if (result == _SUCCESS)
 			pwrpriv->rf_pwrstate = rf_on;
-		}
+
 		pwrpriv->bips_processing = false;
 
 		pwrpriv->bkeepfwalive = false;
@@ -556,9 +556,9 @@ void LeaveAllPowerSaveMode(struct adapter *Adapter)
 
 		LPS_Leave_check(Adapter);
 	} else {
-		if (adapter_to_pwrctl(Adapter)->rf_pwrstate == rf_off) {
+		if (adapter_to_pwrctl(Adapter)->rf_pwrstate == rf_off)
 			ips_leave(Adapter);
-		}
+
 	}
 }
 
-- 
2.34.1

