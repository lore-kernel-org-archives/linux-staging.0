Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E0070
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 13:59:12 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id kk2-20020a17090b4a02b02900c777aa746fso4625158pjb.3
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 06:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=rfTe7qVwJ3j0wr2RCsj+TUrasTd+AoVaaUkJcF+TL78=;
        b=h5Ou9+OiaESvdUnOFknMWzm5BZvQjhhLDihQC+Fczy8srhBlFsRJZsXov9/5n+vfUK
         SZN1d3T7LbiSBKZbnhqF3vhZyafvp3qJy0jlpz9/JcqkkPoE3dInG5uX+ippegOzaWyl
         Cn3fqkxA/V9lcmPBqWAr4hsCP3Z/iXWDlWpZ1dEhnKagnLFLW5fQlVZBZL8jqlP1CK+A
         vkiMUxCAXM5UeFq7MMtptKcccmJrXyzD/N9xOqc+S02GF8s0j0zviIaCmXpo01l0S/GG
         uLhbMqJm1jKz9YFx3bvKbQZYAj94FXISxhEXZ5FTSn0rbBbCRVzAXSqCxXPe4kTFMGOv
         aIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=rfTe7qVwJ3j0wr2RCsj+TUrasTd+AoVaaUkJcF+TL78=;
        b=bW+O5Hx1/cJucjMK0X0a5Qeepdh+KFXGCPsBgG+bY3I8Na1U05U03aDs85pbksgWB1
         FJAsKuSVZLyXDBdQUxNIYzRhZZF3zXSJpTs8czwuhNKWbmRFJ1R22U0Gz0K3X5jXnJqu
         hipTQQeoAUM6po6h5LCUpZM8270uNde/QtivNc3V3HmpIMT0+VJQb336X+Hb6zlwhDru
         TmkK+6DzeECBDb0Xu+ovIGvVzjzaz/t+WCSHz4cU7f+8NND/ye2OiXZqnAj2tmVlGVAl
         D3w8PvzEtDrlF4paDs4MJiazPhdPDKXlaogYTTOMftEi0oKJA0D0wqYCNn+dpbROESUP
         RDyg==
X-Gm-Message-State: AOAM533CGBqryixDEgvmBIdqr0xQe1ryC1qJnyXtRbmSDZrEZfXl1fyx
	K1jdnoleRfn17dmi6lQFUbs=
X-Google-Smtp-Source: ABdhPJxeehylySE2bL479tNyW69Q0UAX9z+Ki1FawSLvDa4Wh/+z6Nskm8LDqPK2pytH+5VNfgzzAA==
X-Received: by 2002:a17:90a:7348:: with SMTP id j8mr8072477pjs.155.1618063152360;
        Sat, 10 Apr 2021 06:59:12 -0700 (PDT)
Received: from kali ([106.195.15.71])
        by smtp.gmail.com with ESMTPSA id q66sm5519824pja.27.2021.04.10.06.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 06:59:11 -0700 (PDT)
Date: Sat, 10 Apr 2021 19:29:03 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v3] staging: rtl8192e: fixed pointer error by adding '*'
Message-ID: <YHGvJxMhQ8nzHf6I@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed pointer error by adding '*' to the function.
Reported by Julia.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
Changes from v2:- modified patch body but writing commit message
clearly.
Changes from v1:- added pointer to the function.

 drivers/staging/rtl8192e/rtl819x_TSProc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 4457c1acfbf6..78b5b4eaec5f 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -327,7 +327,7 @@ bool GetTs(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 	}
 
 	*ppTS = SearchAdmitTRStream(ieee, Addr, UP, TxRxSelect);
-	if (ppTS)
+	if (*ppTS)
 		return true;
 
 	if (!bAddNewTs) {
-- 
2.30.2

