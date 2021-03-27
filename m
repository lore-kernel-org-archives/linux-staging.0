Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB4F70
	for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 14:25:12 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id f22-20020a7bc8d60000b029010c024a1407so6324671wml.2
        for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 07:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=885GSipY1kCFpE3eLNTvvoQV/RnDLTkm99NiTmTY1Go=;
        b=H8Rx4t6EE3uuA+lfZIYcpJUU3hbjYYt+8LTKPq2FG/YMBb307Fg5lhx18esCxrte6B
         5eTkQOjvHmLKe74M0o66K3i2X5YfxsCe11v8H+zyQHenvNbZe4oMV1HVlbqbFHU89blb
         vwJioT/b472uyNc8BT7HjO05PEPIVtA8E2iC3t5eehhEupPEBx0C+Ic1CST166xDKriJ
         riBggXj2FHTClnB1mxlguA2BGOZrmjGYy8HWKvXvrtWC6ps61sZOVz8kkval3p2+tVdb
         RAzzlLEY9s+/nZfpOMOkRlROan118b42wlPj+4HWdgzsImmruOmeHxR46R4UFZh60+DE
         /IZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=885GSipY1kCFpE3eLNTvvoQV/RnDLTkm99NiTmTY1Go=;
        b=p2wbJBlGqbIsWIelM+59vQGnhqT/kkGx6fZZbpJw5cKmk+mm9fdV1CNYtd2SYLTVyI
         qMfdBlMD0EQPiMB4tYu4w3oISDCBjHHEeAJDu9R7nl3BUbqcmZ4H412nk6CFtxdsCB3l
         n9yVbEEt67yt/igBpHU2btrRHQ+NQEvNqBurd9k1xl/w8DvDTKOyLLMhnl8lpkmkzEwB
         l2f9onusyQiWG99eXDwfiAZ+quyPdDFmZSFK3+p++vVpVxJNpMfbqh5AowFHC8FDW/U/
         dFO2+iPBtS5sWq7e9+TwTf8ILCiI1PsTfZ33lnmi7u5I1Pf4eTVct+R4vWHInEfK+vqK
         kaJQ==
X-Gm-Message-State: AOAM532tS8z5PSPUzcChRhLpELjq6kpPY7qMTyrXUo5sqOOR9YQE2OCS
	aDaszM2sB0FVEJI1Kzh0eSCuF7JLtyHOMA==
X-Google-Smtp-Source: ABdhPJw2nZxF2zM8bs17NCy5BvC6PXFVxHgKbRrK93V1nn8cVmr+1sqSor43c195LSpbHr0vPuJAZw==
X-Received: by 2002:a05:600c:19cf:: with SMTP id u15mr17243310wmq.7.1616855111596;
        Sat, 27 Mar 2021 07:25:11 -0700 (PDT)
Received: from agape ([151.46.211.242])
        by smtp.gmail.com with ESMTPSA id w22sm16400905wmi.22.2021.03.27.07.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 07:25:11 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	david.laight@aculab.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 14/20] staging: rtl8723bs: add spaces around operator in include/rtw_pwrctrl.h
Date: Sat, 27 Mar 2021 15:24:13 +0100
Message-Id: <d0695bf94766ee68aba70daaa1cdefff64c38b62.1616854134.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616854134.git.fabioaiuto83@gmail.com>
References: <cover.1616854134.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix post-commit hook checkpatch warning:

add a space around that '*'

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_pwrctrl.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index 6b2be97c2c07..b052b86944c4 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -89,7 +89,7 @@ struct reportpwrstate_parm {
 	unsigned short rsvd;
 };
 
-#define LPS_DELAY_TIME	(1*HZ) /*  1 sec */
+#define LPS_DELAY_TIME	(1 * HZ) /*  1 sec */
 
 #define EXE_PWR_NONE	0x01
 #define EXE_PWR_IPS		0x02
-- 
2.20.1

