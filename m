Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11686D00
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 14:21:02 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id r12so13058079ejr.5
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 07:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AtU46/1LCpoDHI5+ceEvS4Nt7VdlaOxxUtk2UGBgKm8=;
        b=eI0Lj7Aqibnkew9+QOBTwHGS3KGqUE6jZrKJ7KbdmTFwoGno79KJdlV+kB8ZgyaceB
         UUKOtauoBD/EsvOYdHSXK4eq4M3+WsiYxGuHMEuoE1gNYVmBMbVS66bZ+TNB5D1l/a9A
         bnPkoWeQjP6IATAH/521Sm4L8GMoi1JMz+LWIT+10e3uDRijFiuDm9OQ0qOWbyWh8zwp
         MBaWHRcIoT9vWRgVpuVmLEvaYQXpvMoGxJVHu5c14d+DPIUlpsXrVvF6RKy9NxOW1dEz
         XjYZvZTPBxZTGzHE8u4DLXv6NrvQIDSCk0DcNXLqe7GT9DpPm6yanIcRNKzIIiTVH/qV
         psxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AtU46/1LCpoDHI5+ceEvS4Nt7VdlaOxxUtk2UGBgKm8=;
        b=UKyUAkj6ApCeeTR0hy6UbTAaCAEBA+QyCf8XGDhJa/bpL9390E8e4/xTiGQ590y+NF
         +InAlpdpRiNy7PAA/2kaYzjXycK1I2Gt2A1j1yKU1chBAKSu2T8RVO0a75skWucjNOY4
         yyavFwGIInrDyEI5u14xJEr6HlTmXhNL4isMObQl70Ffjk8GunJ4th4R5OmET07MNgcy
         zLxHctQFrou8u1Dptofe//HmpuXu76q4GSOupl1VHQJIA3ddod45wf0PiRPP0CCarmGY
         E2YT95r77kMYrpLl+kP6JZemEHpCxMWcqcJx0XOoG//Bj7KITHHlzrgGMOS4zBhy+7Cy
         6Jlg==
X-Gm-Message-State: AOAM5311ne8j4t2L2E3rAOE38HwBkH0JgbNF7d/BC0dr/9OUeCTTl35O
	1ESnz2ONxFS56Euw4vKlW8c=
X-Google-Smtp-Source: ABdhPJz1xEAw3u2IcZGxZu4qXL/uaIyhynwx+/3kkB1S03ho323Ps6dBy+y9GOfURyAOKExEw+egGg==
X-Received: by 2002:a17:906:1e0b:: with SMTP id g11mr16659564ejj.291.1618064461246;
        Sat, 10 Apr 2021 07:21:01 -0700 (PDT)
Received: from agape ([5.171.81.28])
        by smtp.gmail.com with ESMTPSA id f19sm3194711edu.12.2021.04.10.07.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 07:21:01 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/25] staging: rtl8723bs: remove commented out DEBUG_CFG80211 symbol definition
Date: Sat, 10 Apr 2021 16:20:26 +0200
Message-Id: <b884ecb5c83c222f0b48839f89e53c45f4489e06.1618064274.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618064274.git.fabioaiuto83@gmail.com>
References: <cover.1618064274.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove commented out DEBUG_CFG80211 symbol definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/autoconf.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/autoconf.h b/drivers/staging/rtl8723bs/include/autoconf.h
index 074fee2052c9..944a7d2a1e53 100644
--- a/drivers/staging/rtl8723bs/include/autoconf.h
+++ b/drivers/staging/rtl8723bs/include/autoconf.h
@@ -12,7 +12,6 @@
 /*
  * Functions Config
  */
-/* define DEBUG_CFG80211 */
 
 #ifndef CONFIG_WIRELESS_EXT
 #error CONFIG_WIRELESS_EXT needs to be enabled for this driver to work
-- 
2.20.1

