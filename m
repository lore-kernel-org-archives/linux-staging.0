Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58090184E
	for <linux-staging@lists.linux.dev>; Mon, 27 May 2024 04:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716785961; cv=none; b=OmdIzGFi+xCg965HVL82OpxAWl2V1rA9dxaBbleS8ef+1NjgfK3nvyT4r18UZd1qHzzyJPAbDSYVU36Jy4AJvr6malUaYOhvx3Eb6LxxuwdwmerGKqfCYx6Yen7R5f0vGGGooBFcvYC29RPvOvmCKN4+Rp7S3e0HO0g+Qz631L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716785961; c=relaxed/simple;
	bh=qdQ520WYRB6dXPFOnS961CjC3BWpc8ad5xZiBOfFKIY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WqE14nfOq9P6PLctrD0d/VRQdIeyLRGwyN4YDjs7egcH3PosEWY6lwCXaAMhINYU6oWRsFe7XHiHjP624NoIeFyEdWugPrnUyEMN3FS5EmMeEH9LtePcvdoZlYey9asZiGSNKa0b88A7+aBrl2/i97PskvpF7hxzRTGxTbsu/zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AG0DcDsX; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AG0DcDsX"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f44b5d0c50so17998145ad.2
        for <linux-staging@lists.linux.dev>; Sun, 26 May 2024 21:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716785960; x=1717390760; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A6KvdvQaSGvfhx7HMn7VzdtxXHAGgtD6sRHh0aCS+qE=;
        b=AG0DcDsXLFExOjGowYghYq1x5YwkHiOxrhXexaTUuEpXJay8V+cRKa5PmyXF5/ps8u
         RrV+NG3AHGnya3lktXUKmX5LGQJTWYV+/6u/fPkv9T5AerBhQRo9dxJsxJnMncIHLz9Y
         88/M6EffssQyShJ8abbaovRZzCnW4l0kSco0uLu4wYzd4cXjHgMNlfT+mFYSlJd+2vgi
         uApaDs9FH4i7CAYL+hYuG2sFVNwSaw2oU/mLvWsIsIn3x/rqZWXA61+eI3VRF+cO4/gT
         JNIIAqH9zfwfw9U17go7mdPD+xX/e3Hg/XbEu8gPOj6DOzUFwe45U2qGbnqkV+UN93KC
         2cPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716785960; x=1717390760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A6KvdvQaSGvfhx7HMn7VzdtxXHAGgtD6sRHh0aCS+qE=;
        b=HrfrgR764N4vWX1o1Q4fvlkOOfVCKgq8aKQIoi0SypLILRQ4GurM+gTCO0UzX7IsAs
         rheW18Ce31AZTMJf27G4aLCykyQriXqgyB6eaLwg/DlE0xaiW0OkG0wjTjZnUAr94CPO
         GZ3kBPFpx2fSttuOjby3Mh+h6toXDswhZlhd9KAUERQo82vPWn/oU2aZq7Kyfr6eXU95
         bN5HKm0AKFrbnqSGg+cY25lzKnYc1HJxN8/zNqeaFqChUHXnUbV6mz1FdxIGib/hFIs4
         Y7cr1CgQ5D1tF1qZxZkosNryUn25EF20I925dh6NGW6bj31Kx/EgWyqwLs+kV/Na4kP0
         On9w==
X-Forwarded-Encrypted: i=1; AJvYcCVapboZhOEbte+1MRzNaDuwv+yAdBVEd5X+94zETOjQHHA3I/+HUOdrpVli9+iG3xeXMco1mAOlRWj7CK7nuUVcb1v/EImMmPdeWMsO5w==
X-Gm-Message-State: AOJu0YzvUiiTMb4+EDHqAgHjvBvoSc+IO2tbW2FLlHfBxLNBhgvwf/Dc
	QvIwHbwllIlxQsZRIFPwqJXNiCGBkKexQXknx5z7+O1chz2RKCJ7
X-Google-Smtp-Source: AGHT+IFNa0PpZQzqfaYhweaVAzKkOHkpJwdzLdGBNQGpG9i83v5TmzpdBOcqCxEVzJ8DWt+I0GljcA==
X-Received: by 2002:a17:902:cecd:b0:1f3:266b:ea23 with SMTP id d9443c01a7336-1f4486d1f6amr96091525ad.13.1716785959565;
        Sun, 26 May 2024 21:59:19 -0700 (PDT)
Received: from ubuntukernelserver.. ([110.44.116.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f489e1a2e3sm17549435ad.184.2024.05.26.21.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 May 2024 21:59:19 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: gregkh@linuxfoundation.org,
	colin.i.king@gmail.com,
	ruanjinjie@huawei.com,
	hi@atinb.me,
	bragathemanick0908@gmail.com
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: hal: Fix spelling mistakes in rtl8723b_cmd.c
Date: Mon, 27 May 2024 10:43:56 +0545
Message-Id: <20240527045856.72996-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes misspelled words to increase code readability and
searching.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index a59ae622f05e..d1ac2f44939c 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -700,7 +700,7 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 		rtw_write8(padapter, REG_BCN_CTRL, val8);
 
 		/*  To make sure that if there exists an adapter which would like to send beacon. */
-		/*  If exists, the origianl value of 0x422[6] will be 1, we should check this to */
+		/*  If exists, the original value of 0x422[6] will be 1, we should check this to */
 		/*  prevent from setting 0x422[6] to 0 after download reserved page, or it will cause */
 		/*  the beacon cannot be sent by HW. */
 		/*  2010.06.23. Added by tynli. */
@@ -964,7 +964,7 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 	rtw_write8(padapter, REG_BCN_CTRL, val8);
 
 	/*  To make sure that if there exists an adapter which would like to send beacon. */
-	/*  If exists, the origianl value of 0x422[6] will be 1, we should check this to */
+	/*  If exists, the original value of 0x422[6] will be 1, we should check this to */
 	/*  prevent from setting 0x422[6] to 0 after download reserved page, or it will cause */
 	/*  the beacon cannot be sent by HW. */
 	/*  2010.06.23. Added by tynli. */
-- 
2.34.1

