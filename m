Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE0570
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 09:09:59 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id d8-20020a1c1d080000b029010f15546281so4497020wmd.4
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 02:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dvn70d7ZVR8XY9R5o5JpAomHZOvZdMCNh+kZfGyarKQ=;
        b=PNBvGfdgN33huUF+/83LrlKOWwvHGSImBAKLAH37Ti8wSDUhHrkUUtwSp8MgnA9SEf
         FZacgtSlII1BklZCpuDEW6/RiW2JdMBMoIGa3qbNAghAdBxFgn8Zb1qFI35WMuXESyhv
         k87YY4B5zHauLxUE5+VnB/fQSe1MK/+Qy6NPGQSbd8NzH2fj2jZJpHOqr4CO45tWKBWD
         TJa3vkQlMfo9LKiAYX4oUivZyRSetTqn2CKAmDVVE6lN2Tbj6hAqappuAp+0traEZe+b
         2wWQubE3jJg6u8+TIRmUrIE0ZDC8m46Ex+nzF9ZFPEbzMqRZRqHAU4UZFzU6xUdx+NBu
         Pf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dvn70d7ZVR8XY9R5o5JpAomHZOvZdMCNh+kZfGyarKQ=;
        b=GuxHhP7jUrS1U6rEWF0l6Bh8ZTCYHgY8I3fqdoeYCKm95ipWfkxPYacsDXCcJMlTgt
         u2+ESFkBmMjkaekmVDNWClE0nEfP4LxR40RShpu0+ceS1Oe6XMJGFA1y+STQBjlol1Ex
         005xuhFnkJC2MGebiai2M80zmPD3PpqQiJN2RjNluHN8tqWHUZCeiil5kD1/Qpd1Cmq8
         rmAa/cLz1pry+GrfDE3DjqgSs4KA4K0grCo+YDswF+wXsjh29EsUSDKaH7ikGhbBWuC/
         jaLBcDHAGbd/3n2vqt0FwrCC9skfTySbYVBeWt3JoVVYiUGmhC3/98I3Bmj4yPQLZzme
         NBjw==
X-Gm-Message-State: AOAM530bpL8et6RXg5q4fcG+xCJPHIJBmgC42BJ9RTe96S5daQZweEMn
	7iOZdtqIQ4V2bPXJSf0dI5I=
X-Google-Smtp-Source: ABdhPJwql02n0mzlCutgORDc5N4gBV7SJ79caZIcgxCSRZbItA/vgM3x52XK63E+Y2bxyv0iEA4Vxg==
X-Received: by 2002:a05:600c:2946:: with SMTP id n6mr12002150wmd.52.1616749798339;
        Fri, 26 Mar 2021 02:09:58 -0700 (PDT)
Received: from agape ([5.171.81.75])
        by smtp.gmail.com with ESMTPSA id j30sm12255611wrj.62.2021.03.26.02.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:09:58 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 11/15] staging: rtl8723bs: put parentheses on macros with complex values in include/rtw_debug.h
Date: Fri, 26 Mar 2021 10:09:18 +0100
Message-Id: <0634873fdf3b0ff61e61fa8cd9a74c5959a50efa.1616748885.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616748885.git.fabioaiuto83@gmail.com>
References: <cover.1616748885.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following checkpatch warning:

ERROR: Macros starting with if should be enclosed by a
do - while loop to avoid possible if/else logic defects
+	#define RT_PRINT_DATA(_Comp, _Level,
	_TitleString, _HexData, _HexDataLen)			\

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 28 ++++++++++---------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index d1c557818305..b00f8a6c4312 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -236,19 +236,21 @@
 #if	defined(_dbgdump)
 	#undef RT_PRINT_DATA
 	#define RT_PRINT_DATA(_Comp, _Level, _TitleString, _HexData, _HexDataLen)			\
-		if (((_Comp) & GlobalDebugComponents) && (_Level <= GlobalDebugLevel))	\
-		{									\
-			int __i;								\
-			u8 *ptr = (u8 *)_HexData;				\
-			_dbgdump("%s", DRIVER_PREFIX);						\
-			_dbgdump(_TitleString);						\
-			for (__i = 0; __i < (int)_HexDataLen; __i++)				\
-			{								\
-				_dbgdump("%02X%s", ptr[__i], (((__i + 1) % 4) == 0)?"  ":" ");	\
-				if (((__i + 1) % 16) == 0)	_dbgdump("\n");			\
-			}								\
-			_dbgdump("\n");							\
-		}
+		do { \
+			if (((_Comp) & GlobalDebugComponents) && (_Level <= GlobalDebugLevel))	\
+			{									\
+				int __i;								\
+				u8 *ptr = (u8 *)_HexData;				\
+				_dbgdump("%s", DRIVER_PREFIX);						\
+				_dbgdump(_TitleString);						\
+				for (__i = 0; __i < (int)_HexDataLen; __i++)				\
+				{								\
+					_dbgdump("%02X%s", ptr[__i], (((__i + 1) % 4) == 0)?"  ":" ");	\
+					if (((__i + 1) % 16) == 0)	_dbgdump("\n");			\
+				}								\
+				_dbgdump("\n");							\
+			} \
+		} while (0)
 #endif /* defined(_dbgdump) */
 #endif /* DEBUG_RTL871X */
 
-- 
2.20.1

