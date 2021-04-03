Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DB86D0A
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 09:14:21 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id v4so6512500wrp.13
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 02:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LOA+21vzY0bmS8hxfo90qK5+QTR3YadbSYJH3ev5WXU=;
        b=fvsoRqAeDr+V0AOQjQ2l1mhiYjkuTHAfUeVMqB5RJ3sPcztS8Z5SeCkgul2MUgSV+y
         PU8hl2N5Kkgkq9gNmUIHpoGJ//alfR4jdkxt7DL6R7r3BB3NA9irlYrRWekZP3spTT6N
         SE9cyhdHP0I5npU8h2Gnc53SdfQpSHJQm8GfpD6YxpA4QxhQNtpLR5VVLJpsIv7szZnK
         ZVv1sfcyCWmc+k7Znt2YwSXKnz0xaZFJfae23HICWBHIKwcWqgfyaaXDUjI/g3HCh8XI
         QPlfND6OOoTmYxGis6TbIKiN1V8Zm+NVrX/DaO4erutD7nz1i+ok2D7cCGUi+y5jlPXK
         7Gew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LOA+21vzY0bmS8hxfo90qK5+QTR3YadbSYJH3ev5WXU=;
        b=EvZXEzYu6NbsdgEil50ApC5FLGw0SBgRy4IP6SSuTSiVSdfQmgZsp4TUhJNdzkn36g
         hqKBQxUrz6/0NcX0izH/1t1cJ4XmI1s0k0sLPNVI7IVXyfKo6ZOV2J8nQaok439na94T
         PgwSPJWZsFKaf6FeDgRhRdEBanpmXH6EG4ubsgOkxKokI63Yy+HxYgeStLGtwpTOfXG6
         teuTeaBfOu36P2MDThjJj+DEziMBBgqQjguKXj5q3GLNutLiEusINQoBBbvLdVc0QTpb
         RAhg2QZg/aM2ObxYoBvQsZnajLDXeLoD9e6XYZwwfd7gGKCDw5b0+C2y3CCopOWcd4YZ
         QlbA==
X-Gm-Message-State: AOAM530mf3GkX4vrVw3yEFZxKht4JlxPwm6Om/1XEkHwemO8hVWBie9z
	4+uXeORJQYtTkVTIDOInKw4=
X-Google-Smtp-Source: ABdhPJz+aqppJ32GVh/FlTwmAlPFGOhsIpkPnNLoDx6zZOF5PLOFPQTuzfcUOVbBe822jMaOUwFT4Q==
X-Received: by 2002:adf:c64a:: with SMTP id u10mr19409584wrg.412.1617441260670;
        Sat, 03 Apr 2021 02:14:20 -0700 (PDT)
Received: from agape ([5.171.72.64])
        by smtp.gmail.com with ESMTPSA id d13sm18552065wro.23.2021.04.03.02.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 02:14:20 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v3 04/30] staging: rtl8723bs: fix line exceed warning in core/rtw_security.c
Date: Sat,  3 Apr 2021 11:13:26 +0200
Message-Id: <862862a3e309209e2508de0c9a1b5a02ce1312b2.1617440834.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617440833.git.fabioaiuto83@gmail.com>
References: <cover.1617440833.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following post-commit hook checkpatch issue:

WARNING: line length of 149 exceeds 100 columns
61: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:729:
+			if (crc[3] != payload[length-1] ||
	crc[2] != payload[length-2] || crc[1] != payload[length-3] ||
	crc[0] != payload[length-4])

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 689419a76d94..663a8ea199ee 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -726,7 +726,8 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 
 			*((u32 *)crc) = le32_to_cpu(getcrc32(payload, length-4));
 
-			if (crc[3] != payload[length-1] || crc[2] != payload[length-2] || crc[1] != payload[length-3] || crc[0] != payload[length-4])
+			if (crc[3] != payload[length-1] || crc[2] != payload[length-2] ||
+			    crc[1] != payload[length-3] || crc[0] != payload[length-4])
 				res = _FAIL;
 		} else {
 			res = _FAIL;
-- 
2.20.1

