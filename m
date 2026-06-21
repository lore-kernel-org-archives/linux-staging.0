Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5803321DC
	for <linux-staging@lists.linux.dev>; Sun, 21 Jun 2026 10:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782038551; cv=none; b=edPycbx9Rus5y1iwAq+9ZLg7QF7kJz7gjZSeXUzPzrblupddyp1F+9bswXvNPYO+TXQZXVYQd+lCxFFkX92nrlhpklxF/28Doo4Dlko1Ne1x/JBcFocmuSGL11TXHxxLcEvIgpPStd9HTmRkD6/abG5umxVeuG+NCcYwpZiuOZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782038551; c=relaxed/simple;
	bh=sT2px8esSOSGA+jEd+qgCIJ9qrowKYcUuzm2YN1TtYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eCSGzPR8mHmeJYGi2zfJGy0HrHPfXOWVAe1TlXqPbqcqye4j3aqEM5KQCBtUQCUGbFnu6rFsMFj/2UIH1+gHxEaSibK9TpVTJnOPI2Ajp0w7+SFfA2FiaLUOCRHOPfSiJ5h2dN0NDvNISWoZeHJHALMLkBFxH5IhmheJswxya5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LrPLfk3G; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LrPLfk3G"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-45ef56d9b67so2771899f8f.2
        for <linux-staging@lists.linux.dev>; Sun, 21 Jun 2026 03:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782038547; x=1782643347; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xObx135kKkg3/QxtO4NLs0nngmunWv9NpAIe2j5724=;
        b=LrPLfk3GK5pThfydQuI9/BLZShY0mfuX2xqhFWLFVtSXmzkOPB8k+WZt+7OG4LmEAz
         ZrYWwrc4gZIDD8KPsRDHJicXD9TfkXX0zDKPZvoAEM1LMDqS2bfBsWVAHAybZ/qbqNSA
         qNM/XKl3xH6rgfJw5AXTQa92iA2TPaukmjx5qRf5ueODUmHGTS6Y1+D4a5R5mzuhHkbb
         x8k5NbyYKNgZKaoGmznOALmI0WBxmRXWrd8bsamYvnq0hbigXLd/QFeRCYGtk4/f3116
         9HhNlbinNqxNRl7dgpYoVYujy66a1M7pLa2lYmBiqdA6QN1fK/a9/i5w5Eo7UFldnRpu
         3xiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782038547; x=1782643347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2xObx135kKkg3/QxtO4NLs0nngmunWv9NpAIe2j5724=;
        b=CSHaQkzpdIsJS8DBuv7HDktJcxtYcJkLsEtLUgUrNnudHOxVmUAVA74gYUvGXfYieB
         QYS9K5j9S1+U6pl/VtRfW1PUQGB7CHIb7Mef0E54v1o+1tg48CKdUB6/9AJt0824jkpQ
         W17DoCZMorjZOjzWB/4kE/kA2CcjewbLCNNbAU0+RZqEE0ed2jgPFIaOSuLF+MhhYL8L
         zqqLTK/UaXQ3WnFjcDUAhzZ9l8VTs+1iCrIs/CvbuRH/c0fp665vlxDYNLbwUFlEQ3ph
         9xOR8A5dJhhHZR6ACJTOQwIe7pKAXT3tZCaMCmJb9Daeyn66jOKl7UgYJuXt2hBLIOZA
         4nGA==
X-Gm-Message-State: AOJu0YzNyAWmJMzX6YpJU1P0zL+LNKGoGqiWn91Ip4gsDYs5GOqeFGH3
	LGnUFzpykTfSt9DrBC8oje+teW/B/yXES/aDRE9El/6iNWH0UuDjtV2l
X-Gm-Gg: AfdE7cks41Pmr/bz7WWJehZ0Xk+exjbbsreGPVwksByRUWrNAjXz5jOVmsp1ohUZp7J
	pXY0F+xD3T4DqhynVMT4yU/R89UG7wP3P1YWx7sdiakW/raOsVt8wo2vcnG8jD1LBtW62YzLPjk
	gSR/f6HGDoEI8a7IX0BppsMyZvJr/mA0pqaTTmmOElgDphoWruxw8aiqgvxf3jgFeYGHrltLpDZ
	1VBGZR3txKTzDvJmUX3obbe8ifBSwF2AnUP9/JoK/m50n9wjC+jp8qaMcmGrnZosEQZWoBnI4hU
	FzXuQyEFch/R3aU+HAIpmRqUy4DERRflkpl6cmAUPNDHtFs6RVHJHyAQslQyvO4hzTeOJ7flOUJ
	Iqz8DDw7BXsrlhAbDuw91qoDkGuVsNOg1FSdbuHkHPOQMXv2SiPx3nK2nTpgyZuQ0HKDqOoI=
X-Received: by 2002:a05:600c:a315:b0:490:b629:286c with SMTP id 5b1f17b1804b1-4923f33cb1emr146160495e9.12.1782038547446;
        Sun, 21 Jun 2026 03:42:27 -0700 (PDT)
Received: from fedora ([212.253.214.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fc47720sm340690915e9.0.2026.06.21.03.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 03:42:27 -0700 (PDT)
From: Serhat Kumral <serhatkumral1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Serhat Kumral <serhatkumral1@gmail.com>
Subject: [PATCH 2/3] staging: rtl8723bs: put logical continuation on previous line
Date: Sun, 21 Jun 2026 13:40:57 +0300
Message-ID: <20260621104058.7408-2-serhatkumral1@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260621104058.7408-1-serhatkumral1@gmail.com>
References: <20260621104058.7408-1-serhatkumral1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the logical operator '&&' to the previous line in os_intfs.c
to conform to the Linux kernel coding style guidelines.
This fixes the checkpatch.pl warning:
CHECK: Logical continuations should be on the previous line

Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index a545c3338..89e41c26e 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -1018,8 +1018,8 @@ static int rtw_suspend_free_assoc_resource(struct adapter *padapter)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	if (rtw_chk_roam_flags(padapter, RTW_ROAM_ON_RESUME)) {
-		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)
-			&& check_fwstate(pmlmepriv, _FW_LINKED)) {
+		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) &&
+		    check_fwstate(pmlmepriv, _FW_LINKED)) {
 			rtw_set_to_roam(padapter, 1);
 		}
 	}
-- 
2.54.0

