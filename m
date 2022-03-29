Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657867C
	for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 10:38:09 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id r13so34185657ejd.5
        for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 03:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9rdVFsRva52GcMtl178td/PU4MqSDMZsE8jDt+0zP9I=;
        b=UVJtGaPxt8BpoHJbuk1xXngqHQZsl7Uf5d2uNeQRlI4atTKdtaP2hzE54PZ8ATZ/al
         XTg31u4URUThaXpbxGQGUt9TNFM120i4GjKGljxmYB10vakEECv6huo30obtck3pB78N
         JDYEhAuCnncHfkBxtOZVQ1vX8P8LQLE6BJXiSXBg3aDSZLiuZ8E+vJ7kRtUu1h6LYwlV
         ukvlOzxQtAM8HaEWSRXyWMeGQ0Q5npGLIC274y3iuQkv4UbyDu9NVQo/qfXLqsOfXy64
         5A4XyMgsNq9byNU8JEHc+WEPJA+j1UK/1UWHpyR4NddKSJ35jQgtt68yhLHM53CaDSYm
         xALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9rdVFsRva52GcMtl178td/PU4MqSDMZsE8jDt+0zP9I=;
        b=1kLT9+0bOHWKJuomothsg17QQJt85Hjb3Qi2U7e5Da5Hoh+YP8DIGIN3dcnsszzYoC
         mbHBbNxj6+ahJvYhvNtN1PqIwBGo225L49A+32ebVOTRNd5JtQFJEzTsLqlNcEjDiShs
         y/D6dPLpN0HGZT8Fv4X5E5vhfwG/HXUenlouRq2IDSgcH7Bkq4fOVsFqO6nyZ+kmB1IW
         oPsV5Mr2vhvvxz9yp5DAtSHoZuAbkiIUDIZjZDl5T75bwjcH6ikN7XklMbMnUgdxEiNO
         1pwS4E4ONUm8SHxt7ErasCQZuv1XPJZpGyxBupCzTl8yPqlg1MrddYDbtjVIEJEtuaS4
         mslQ==
X-Gm-Message-State: AOAM530i1Bhqopwy7U/0QTiU7eA81FsG5jjSzFGTxnBcEnuBThMV6TcZ
	fkAz8xYtzJ+Br3nFdWFJ9fY=
X-Google-Smtp-Source: ABdhPJzBrJIN6iNc35BhKt3rDrOUXzyyI1OqD8DooHxlSo8WlTK2A+JWyzxTwcLCtIaZVO3gK6Atdw==
X-Received: by 2002:a17:907:6d0b:b0:6df:e54c:ad1d with SMTP id sa11-20020a1709076d0b00b006dfe54cad1dmr34438013ejc.734.1648550287768;
        Tue, 29 Mar 2022 03:38:07 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id qw39-20020a1709066a2700b006e03017d60csm7058151ejc.54.2022.03.29.03.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 03:38:07 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/4] staging: r8188eu: refactor rtw_inc_and_chk_continual_urb_error()
Date: Tue, 29 Mar 2022 12:37:54 +0200
Message-Id: <20220329103756.6740-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329103756.6740-1-straube.linux@gmail.com>
References: <20220329103756.6740-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor rtw_inc_and_chk_continual_urb_error(). Return directly
instead of using a return variable and initialize the variable 'value'
at declaration. This shortens the code and improves readability.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/usb_ops.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/include/usb_ops.h b/drivers/staging/r8188eu/include/usb_ops.h
index 3416c8baceb6..cfcf6f84d2cf 100644
--- a/drivers/staging/r8188eu/include/usb_ops.h
+++ b/drivers/staging/r8188eu/include/usb_ops.h
@@ -27,13 +27,12 @@
  */
 static inline int rtw_inc_and_chk_continual_urb_error(struct dvobj_priv *dvobj)
 {
-	int ret = false;
-	int value;
-	value = atomic_inc_return(&dvobj->continual_urb_error);
+	int value = atomic_inc_return(&dvobj->continual_urb_error);
+
 	if (value > MAX_CONTINUAL_URB_ERR)
-		ret = true;
+		return true;
 
-	return ret;
+	return false;
 }
 
 /*
-- 
2.35.1

