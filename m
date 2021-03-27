Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E7771
	for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 14:25:10 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id v4so8345848wrp.13
        for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 07:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VT4u0yWArkExpu+HD8Gp/ujdm3PNXa++2YFnDEEI1cU=;
        b=VfMDfLKtxTYe8yFatS8Ezh1xcxNj3IerF1Vva1EW7brCXiCk8nB0WyYpjb3CKeO5Pd
         +90BMwsJdvCnTdOzPVfwfqRi6TwbzIy1OI/H3UPelCpaNNUA6V0WSgtovlqhBWFraYm7
         +isrOo7HMmxT/seuuLGwNq2Q8yvGhiBRVQYU1CDr0HqKIe9OdXIQJFLts2RzjRqmUPLJ
         uXIr5R/j5ca93nfGXbqjB8hqJcFhP2KkDy4zsA+ch6xb2HUUeVXxwzj7K5V/H6l6vRXX
         YF5Cdg2HMifGZpaIKzFnrZVQUGy8bJRr04QgydckqADm5I670jhSx0Y5S2otHDgt/dQJ
         arfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VT4u0yWArkExpu+HD8Gp/ujdm3PNXa++2YFnDEEI1cU=;
        b=f5osRGrGR8KY6zyhjXdBmql9vzX6WZ3oIkTjnrA/l/YAg9zt+8ps14E3r6rF+At1ah
         wuapWVZj8E/LNzkIuf5k5/m2DlWqMOhwhWFe1acuaIbuDINVRg5YWBZkPXhcAwjpafJk
         VyJukIS1VZQ///5XGfteQ9wQsei4ZZkPbyjjo0uOVGjKE03Xi06eezN3Gz3TpOs98oMz
         S5WZIbeDS6grVdNE175uweWwtYRC3bGiZgOLNaayHYf3wGGkITP+/HkXCXZDS7PPX8H7
         boKYtpSZ73F2ObLdfLoad4B0TsQWR0hVkJVjTSKcKSUSObFvLVzo8+jd+wMuFqNE3C9/
         OC4w==
X-Gm-Message-State: AOAM532VvvbPjSDH7KTmEIBi14u0pDl/panaRDdM4pf8mD2zq0Lo7wUM
	LX1Z804DXywtle5Tl8P8gCk=
X-Google-Smtp-Source: ABdhPJwIiTTZkmheIaR9EVTNesJLkMk5Swe/7AcwDRcpDXcpHkKbPJx40cFpKutaHejCg7DhEcUc5w==
X-Received: by 2002:adf:84e6:: with SMTP id 93mr18847439wrg.376.1616855109014;
        Sat, 27 Mar 2021 07:25:09 -0700 (PDT)
Received: from agape ([151.46.211.242])
        by smtp.gmail.com with ESMTPSA id s83sm17566509wms.16.2021.03.27.07.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 07:25:08 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	david.laight@aculab.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 13/20] staging: rtl8723bs: put parentheses on macros with complex values in include/rtw_pwrctrl.h
Date: Sat, 27 Mar 2021 15:24:12 +0100
Message-Id: <b3b7cf5ae7b0c1c07a629b618fd86a7b89331b33.1616854134.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616854134.git.fabioaiuto83@gmail.com>
References: <cover.1616854134.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following checkpatch warnings:

ERROR: Macros with complex values should be enclosed in parentheses
92: FILE: drivers/staging/rtl8723bs/include/rtw_pwrctrl.h:92:
+#define LPS_DELAY_TIME	1*HZ /*  1 sec */
--
ERROR: Macros with complex values should be enclosed in parentheses
244: FILE: drivers/staging/rtl8723bs/include/rtw_pwrctrl.h:244:
+#define rtw_ips_mode_req(pwrctl, ips_mode) \

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_pwrctrl.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index 36d9ec82a7dc..6b2be97c2c07 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -89,7 +89,7 @@ struct reportpwrstate_parm {
 	unsigned short rsvd;
 };
 
-#define LPS_DELAY_TIME	1*HZ /*  1 sec */
+#define LPS_DELAY_TIME	(1*HZ) /*  1 sec */
 
 #define EXE_PWR_NONE	0x01
 #define EXE_PWR_IPS		0x02
@@ -238,7 +238,7 @@ struct pwrctrl_priv {
 };
 
 #define rtw_ips_mode_req(pwrctl, ips_mode) \
-	(pwrctl)->ips_mode_req = (ips_mode)
+	((pwrctl)->ips_mode_req = (ips_mode))
 
 #define RTW_PWR_STATE_CHK_INTERVAL 2000
 
-- 
2.20.1

