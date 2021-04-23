Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882BE70
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 15:00:05 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id d200-20020a1c1dd10000b02901384767d4a5so1398740wmd.3
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 08:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ck3YsdNSVP0rZ1FtHCUQWW2VZt87Mqq7djATO4TUkHY=;
        b=K1qYfSKbFKzLKwOhZocXaIMZGX25TTmnWPkjp2V63mjSrE6u8r+Hea9puG7453dsOr
         Zvtqb5BSFfAYGe2cTW2T9kczdOShsIj354QoTQyzxCJH4pBDSAaClpm6XydB7tA8zdw+
         qa3YbmXpFYPvR3/MLCoZFQDOPOFSJbNFU920OHVvfS2VsifXq8l8RbjQcX4zpfnv72kE
         UWph23+zmnSOxANksvkTFWrtrXEzi6f+TuSsfD03vBCWQET6gsy2RYwWKjJ2Iy76GNcX
         ApVaf3RtiW1on4Dz+ULcJ8a1fYAbKt6u0vd/TNYjl72UL/GzFgvsKUPtP55BfYr8x1o8
         v/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ck3YsdNSVP0rZ1FtHCUQWW2VZt87Mqq7djATO4TUkHY=;
        b=B5e1OqyxscT3vnUjDZ0OYftyX4PYTuUxqgRLE4rEzJCeHiX1PwyaEUSt1CyRfG7e0f
         9IhYTFMj+Zxq8vEFtQkDclM2mA1agYq3Ne9ITb0B/QzyZ20/AG/VHDih7MpABb4dAdsv
         smrbqSVaJSkSHPsKAzfr/Zb3zgU3/ayNbbvaZkDCutHPZ4kU/76xBhegfSd35ONBGPTg
         7k2ruxZqu2wQIwJNBfOQwq6IJljZpdah2UxF2kxYP3EWpoXnB71iLhUro1WQlTNf+sXD
         4th5tnNv3fyylagGVBPlNrl1IFnaesUk8hKzXukf+Ea0JXytREcDxLjjgERKbH0kZCqn
         tIhw==
X-Gm-Message-State: AOAM531GwnAGaLDdp00y0gQqwlvaYC147g5GQRbLhLTurt4KkzPRMWrZ
	hEudWB0Qk8QVu0QtHspgZxw=
X-Google-Smtp-Source: ABdhPJzG2BYuuphqrqCyCTP5ACW+0ED1Xeg1kgv59UWtZ4nNL6N2F5/SAg/pPp6CbRFz0R4H47URBg==
X-Received: by 2002:a05:600c:350f:: with SMTP id h15mr4832362wmq.181.1619190004217;
        Fri, 23 Apr 2021 08:00:04 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id h2sm8731913wmc.24.2021.04.23.08.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 08:00:03 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 49/49] staging: rtl8723bs: macro DRIVER_PREFIX expands to lowercase driver name
Date: Fri, 23 Apr 2021 16:58:40 +0200
Message-Id: <612c1e599b15404c76463d642102985b3ca1470a.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

macro DRIVER_PREFIX expands to lowercase driver name.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 189f02a8300a..3a5b083e95a1 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,7 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define DRIVER_PREFIX "RTL8723BS: "
+#define DRIVER_PREFIX "rtl8723bs: "
 
 void mac_reg_dump(struct adapter *adapter);
 void bb_reg_dump(struct adapter *adapter);
-- 
2.20.1

