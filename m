Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538DA70
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 09:10:37 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id gs8so15522193ejc.13
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 02:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PIj0/g+PL56KzxYDwNR9OxXc3IsrpR6H0nAgIpjaVHw=;
        b=f23GaMoyeTU1FKwAcni5rNwzCYWM+R87wB7qPDqk6jkzoObdIGtM07AIweE0AZo9gl
         3uFBaQm2YZHSsoXhGB1BlNkkgMLFUXMnMQiK6s0EgEfIEnVB3HWc63+RouiE1VpmYisU
         M6NAQKHvlzBi11NzNY3bKPtD1X88BO+B0LM8FRQqirWxPRQnXx8TTSfnhu6z1UwE6UEE
         zN3TeDTyGBsUXbgVvDifEGXo0123tWTT4QvXtxXwb64ktKUJInNWKuUfy5eDbGB3WC20
         VP1fkgKZXXyv9g9cT9I6cprUw4T5m5JjvjDB+47vlZsKyMpOEIVhrD/RlJoQjLA5O6YH
         LOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PIj0/g+PL56KzxYDwNR9OxXc3IsrpR6H0nAgIpjaVHw=;
        b=qqh0KnlhGzLh9wRm52jGO5er2yW8ZJ+z05a+zihJBY9bCAe8fhKRy/w/QQ/VF+ixRg
         AJQUJV1/DUdLqv1Ll7jCRW+MpPVcZSdyqVuqF6R0OU2sRncy4zlws8fg/PoT9JfRnMIc
         lRS7P5ut3+YraUhyXQCikjBJxIgerrp5xs3QB/dm1mJZAOoZQmfQZlZZBPqabPi+IO+T
         OrXTvgwBvE7pe9W9tbQkxeBGQgGp/9d7xp8Q3G7TnhplIi305iGg1MhSEfsAta9CjJJg
         bKhkuCoaOLpYgmN2RpwFHkwCrkRnhgvd+DNoi8LQpfk4EGmKasYhhVgv2nnMHQum2B/+
         s14g==
X-Gm-Message-State: AOAM531SoBdusjNIVg+c/ZfXVGc06OYEW+72wphTrfHf7IzPfufHHrt9
	uf14ce3e9tmvh/5jguBGr4M=
X-Google-Smtp-Source: ABdhPJxzMNyxmdRD8Q+STTzSEzp0gv42ziBMGvx6ZeiZ9RU4PLZszaIcMtWfWylVi1A2UQNA3p+w2Q==
X-Received: by 2002:a17:906:94cd:: with SMTP id d13mr1680170ejy.158.1627636235722;
        Fri, 30 Jul 2021 02:10:35 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4bf9])
        by smtp.gmail.com with ESMTPSA id da23sm417665edb.34.2021.07.30.02.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 02:10:35 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/3] staging: r8188eu: simplify odm_evm_db_to_percentage()
Date: Fri, 30 Jul 2021 11:09:48 +0200
Message-Id: <20210730090948.32759-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210730090948.32759-1-straube.linux@gmail.com>
References: <20210730090948.32759-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use clamp() to simplify odm_evm_db_to_percentage().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
When this driver will be moved to drivers/net/wireless/realtek/rtlwifi
(if that's the plan?) the odm_evm_db_to_percentage() function could be
replaced by the generic version rtl_evm_db_to_percentage() from
drivers/net/wireless/realtek/rtlwifi/stats.c

 drivers/staging/r8188eu/hal/odm_HWConfig.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_HWConfig.c b/drivers/staging/r8188eu/hal/odm_HWConfig.c
index 51ae02805149..19222c0eddf7 100644
--- a/drivers/staging/r8188eu/hal/odm_HWConfig.c
+++ b/drivers/staging/r8188eu/hal/odm_HWConfig.c
@@ -80,20 +80,11 @@ static u8 odm_SQ_process_patch_RT_CID_819x_Lenovo(struct odm_dm_struct *dm_odm,
 static u8 odm_evm_db_to_percentage(s8 value)
 {
 	/*  -33dB~0dB to 0%~99% */
-	s8 ret_val;
-
-	ret_val = value;
-
-	if (ret_val >= 0)
-		ret_val = 0;
-	if (ret_val <= -33)
-		ret_val = -33;
-
-	ret_val = 0 - ret_val;
-	ret_val *= 3;
+	s8 ret_val = clamp(-value, 0, 33) * 3;
 
 	if (ret_val == 99)
 		ret_val = 100;
+
 	return ret_val;
 }
 
-- 
2.32.0

