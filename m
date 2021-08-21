Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4EA3FC1
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 00:05:11 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id z4so797600wrr.6
        for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 17:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CPPKZTwnH+W0mWx2lzjsDYZFP7mzeq1SizrimQ09eEQ=;
        b=LaPIB1U0uB3MYYiCnj4wHaK+WqyPja6yHp6fdwrbWxBi99AFiZCHUuU/URcCI4P98i
         GFmz5qbyduaRVCX2qdt2vLZtHE+rGf53gr5sD/xnQio4xVHfVq4ZSzzdAgq0hLvQJxeU
         X4C1o0B8JchjWct/rtAhFil+DMALf7h8+gjw+x42n/X3eBhk125NtqmZ+E2ksJP0LtmL
         ZI62Dk7Ym1AV4PU4kOguVGoAMXCz78v3DV6dQjeGFcD2gI1cVwpg90e1nQcLxYFYyhRJ
         9Xk4jaKnNMPshhAHyeYCjidGPR67y6NfRntykQnyiqiPCDLCJsGfKG1i1JWLhjaIHaAe
         CxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CPPKZTwnH+W0mWx2lzjsDYZFP7mzeq1SizrimQ09eEQ=;
        b=UOAopecgzo87JykPdqefnd72u9RcM+0KriNfJtR156NJOSR+owo6WC2BAsrY5OdQ/C
         XSTuTgNrt2xJIvW1nwIzi1LsttrhvHZUF7CGqWbwYGFxQr2cxXuOB9konAofuiJ8ymYt
         5ohMwnUgvnLAqU539ZXSxEVAEqmB09touJwy9eXVw3t7B8fPygqJH0B0rmwECi+JHiNP
         BX8gjVzm7vFcD1hBa91GohVHkLZ6hE16pC9EbWeuWFa/irBmSJxrHhF42yXunJILO92C
         HeX0LQxcvZUud1E+OLSMwVr2C6J8UJqFicP48MfJ/FpKNDhvZfPBshqkCTgJqKjKjxZA
         v+7w==
X-Gm-Message-State: AOAM532oxre+ZT3C1ruyFQVZCRI7t6pNxmngPRwhW8VLaVKzxRSyVeuv
	2NDBoZZGeGvmZnF+l77WBpfyMg==
X-Google-Smtp-Source: ABdhPJye52P8cdV2I3vBEArHJV9VVKWoUAzIZGe5rSHkbvepwySVadWk1l6lQxgq7O25ZT9eOqUmJw==
X-Received: by 2002:a05:6000:1043:: with SMTP id c3mr1277776wrx.144.1629504310131;
        Fri, 20 Aug 2021 17:05:10 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id l2sm6404010wme.28.2021.08.20.17.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 17:05:09 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	martin@kaiser.cx,
	straube.linux@gmail.com,
	Larry.Finger@lwfinger.net
Subject: [PATCH] staging: r8188eu: remove forward declaration of Efuse_Read1ByteFromFakeContent
Date: Sat, 21 Aug 2021 01:05:08 +0100
Message-Id: <20210821000508.79422-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove forward declaration of Efuse_Read1ByteFromFakeContent function
from core/rtw_efuse.c, as the function is defined in full directly
after this and therefore this forward declaration is redundant.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_efuse.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_efuse.c b/drivers/staging/r8188eu/core/rtw_efuse.c
index decccf7622f0..45b757ab64e1 100644
--- a/drivers/staging/r8188eu/core/rtw_efuse.c
+++ b/drivers/staging/r8188eu/core/rtw_efuse.c
@@ -29,12 +29,6 @@ u8 fakeBTEfuseModifiedMap[EFUSE_BT_MAX_MAP_LEN] = {0};
 #define REG_EFUSE_CTRL		0x0030
 #define EFUSE_CTRL			REG_EFUSE_CTRL		/*  E-Fuse Control. */
 /*  */
-
-bool
-Efuse_Read1ByteFromFakeContent(
-			struct adapter *pAdapter,
-			u16 Offset,
-		u8 *Value);
 bool
 Efuse_Read1ByteFromFakeContent(
 			struct adapter *pAdapter,
-- 
2.31.1

