Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0C172
	for <linux-staging@lists.linux.dev>; Sat, 17 Jul 2021 14:57:02 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id g16so15538885wrw.5
        for <linux-staging@lists.linux.dev>; Sat, 17 Jul 2021 07:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fT5Y9stI377JiGQTrPWu01El/WyM/6HS75JSxSKNB0s=;
        b=QxJ/luhbkkJygBIo4suCYX/OfevpiVIrNvQwIaddzSDpndy+f9gK2DG2+0G1N4/hio
         NJVcky+wtSazDDo3nz6RoSnmBQjxlhRB69w3TgQqlJb+aQGLJ1HeYWF7hshgQp6BkfhF
         W5R1T4qVPkxdbzOgEUAhoT10hhASFS1JuHJDrI1M9Vc0PaY6iuCbP7ZyN3ueQwkhV8yz
         C7auy9EN6ctbJu9MRJ3UrSaCI5R64GZ5QPpPmXoCApyiH+D0d4WgZasgKLxGTZDWAY7b
         prsTXeUdfAz+rSsGLXSpYfOswC6lRV7sdXcQd7nYhZfdmh52cKr5bc2sXZ53+BQgngWY
         Hiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fT5Y9stI377JiGQTrPWu01El/WyM/6HS75JSxSKNB0s=;
        b=FybXT11a5ETdp45BL7N3rbQ1YY1H1Hjrs1StDe0KOVODIxLSj5Jnhc9p8ADrxACSyx
         URBtPcCAgWJfdbt/G4N4iLIp7Bm24f80jUJZjQj6KfPrV2JvITKYhwWf6bJvrrCLvXgk
         COj1js74+OybkklSYosH2WQtYZCbyB06CRkJ2lGW75Ipq/tWuoszriRb5EqRLvKXkpFV
         A1xa41N1C1pLQti6o/Q3YKUcTebcKIOL5Em5jrD2CHI+Un9iVVCPqdmRH4Rqq1kyxbt6
         D839qhDdcpkK+zvF7LELgCjOZhVpZJ7UQ4KtxM3hLbajvAkf6iRlKhvpyvnrjhvomr/i
         xXKA==
X-Gm-Message-State: AOAM530U+PimmtLJiMAX5qgI3j5uWpP2hmYS6LO/zSg6qyjSzZC5b4Pd
	A0rWVm7KNeSakrRLExneeKQ=
X-Google-Smtp-Source: ABdhPJxAHSCWSfio4IHuKDEegmCGxQ4QZmgoEHwQnI4iJxFtMW9N6Xi3kF6ZbeklpQLTEH9BGyt0DA==
X-Received: by 2002:a5d:46d1:: with SMTP id g17mr19618815wrs.2.1626533820546;
        Sat, 17 Jul 2021 07:57:00 -0700 (PDT)
Received: from agape ([5.171.72.101])
        by smtp.gmail.com with ESMTPSA id e11sm17189340wrt.0.2021.07.17.07.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 07:57:00 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/10] staging: rtl8723bs: fix camel case in argument of macro is_legacy_only
Date: Sat, 17 Jul 2021 16:56:46 +0200
Message-Id: <404028e00ca4a32bfaed753d5927d9b673e6058d.1626533647.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1626533647.git.fabioaiuto83@gmail.com>
References: <cover.1626533647.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix camel case in argument of macro is_legacy_only

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/ieee80211.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index ea1800de3ef8..343d077d9c76 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -154,7 +154,7 @@ enum network_type {
 
 #define SUPPORTED_24G_NETTYPE_MSK (WIRELESS_11B | WIRELESS_11G | WIRELESS_11_24N)
 
-#define is_legacy_only(NetType)  ((NetType) == ((NetType) & (WIRELESS_11BG)))
+#define is_legacy_only(net_type)  ((net_type) == ((net_type) & (WIRELESS_11BG)))
 
 #define IsSupported24G(NetType) ((NetType) & SUPPORTED_24G_NETTYPE_MSK ? true : false)
 
-- 
2.20.1

