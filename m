Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7BD1384B3
	for <linux-staging@lists.linux.dev>; Tue, 17 Sep 2024 05:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726551122; cv=none; b=koPFxOxmgqWb4NuSNpcI8XrZc+oEpGzOuPgaT6taM3FnXDarnCJBRlSjExwCg3I85MuTQV+5aGbn3dpRDoyUxzZV+rWbwj71Yn6TKW8CJcC30wdpaXDtyll+HBVRxgOXPUxH47Tegqbzu3YqLKK9ZCRXYfbStwQxaAYCNIapbcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726551122; c=relaxed/simple;
	bh=kHUjYYobMsHP0b0GyDeuUfksbTh7OEkDLcKNPpUk88E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f+KNwo7XhQAT3NnglOGr9WXEbjgBxg0CXLApC0C0iKBvI5bYwyGYH8i0Ld+M5NcmWRS/H+xGNSSmQF+ZK3MASa4bH9+eOemivZQOAYheN7ya1TjB5jM+wgoXOg2fwqWz82Tap+lscPWYgeDBH5jzD2v/Jn7LQsRMeiKwxeUPPL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=Mwq+ORpS; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="Mwq+ORpS"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7db233cef22so2894619a12.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Sep 2024 22:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1726551120; x=1727155920; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Brl9Ndwral947QcNfp3rLAEaFYQe+FUYAGB0RsF6Q94=;
        b=Mwq+ORpSs/XiuX+J2OPOlQZCynoUNFLOFkaURPfRsgxdV6Wmy9TjF/Z3dgrWMg9iU8
         JMduShkOMcDoFgUJI7/dEOm8nQVbgq8ylNH1mRhLXKuUzAqUZg4hTonAC7oiYJqVYlj8
         4vV8bQ0VHnMsQjYHdU3v9McChx5C681r7uda92Gnrd4RdV8VllQrB5vuTv+SVPwVBi7W
         DHX/xwuWAXcc29vfEiftG3B+/9WgZHc+5q5MPOarpj/L3BTh/CJSGxNpLxUVnqTEccSi
         d/JOuZQJKVUc1+2zVo3iyDsU1ggVR+InA33UYSFrtjGSUKvENJiXZOyhgXEkuOOVXnjC
         3pFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726551120; x=1727155920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Brl9Ndwral947QcNfp3rLAEaFYQe+FUYAGB0RsF6Q94=;
        b=DseG6gweFGCc1FF+GqQi3A29sl8lb0eYDw7d7CuvXTsi4hDLeHN9YSIV071EDMSxFK
         eBnt0ZUWeY4eE3AJ0rDnEF6YUHOKs11OZYWvaWftR4gvQtx2DLgaqAMHLjvjMLqUKLmC
         K1Z0M5NYejL+dJi6a6RQ5aWwBFtFf4d30mt6QHNXg4YFE1ltKRVQ15nJnO6/qfDIJjSi
         HaV7i8Iz3O0ve/hnnkaGxgCNR+xTXi1zqYUj2QJZcQKbwDf9dXFQ1DUE9XoKigchCqX4
         mGlrAuHZGFALQ+VEoSRBNCYo3se4jvnGX7hjODPZIa4M2pM5fLHdhtiuiVRGcjj8d9Uu
         jNtg==
X-Gm-Message-State: AOJu0Yw4SA/tjWy/WA9Bjr2g1nIWYslDMR0VyJ9urRC3AFFqaGakCovi
	zt0zCkSwS9Vc0fL5TQhCVtjMbjTYIhdeDzfsbXBjmyognGtftQJwvZeKpffPbmk=
X-Google-Smtp-Source: AGHT+IHonY/648LNu86O9zY6FRO2AqJejtMXZEGGZJ5dbGQi8MT6JF7/KxB/7Zo8xmjyO4LGKDxclQ==
X-Received: by 2002:a05:6a20:948c:b0:1d2:ba7c:e180 with SMTP id adf61e73a8af0-1d2ba7ce296mr11125404637.6.1726551119917;
        Mon, 16 Sep 2024 22:31:59 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db498e0607sm4392328a12.8.2024.09.16.22.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 22:31:59 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 06/18] Staging: rtl8192e: Rename variable PostCommonCmd
Date: Mon, 16 Sep 2024 22:31:40 -0700
Message-Id: <20240917053152.575553-7-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240917053152.575553-1-tdavies@darkphysics.net>
References: <20240917053152.575553-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable PostCommonCmd to postcommon_cmd
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 4 ++--
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index ac9aea228276..b583ed0d7e92 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -562,7 +562,7 @@ static u8 _rtl92e_phy_switch_channel_step(struct net_device *dev, u8 channel,
 
 		PostCommonCmdCnt = 0;
 
-		_rtl92e_phy_set_sw_chnl_cmd_array(dev, ieee->PostCommonCmd,
+		_rtl92e_phy_set_sw_chnl_cmd_array(dev, ieee->postcommon_cmd,
 						  PostCommonCmdCnt++,
 						  MAX_POSTCMD_CNT, cmd_id_end,
 						  0, 0, 0);
@@ -597,7 +597,7 @@ static u8 _rtl92e_phy_switch_channel_step(struct net_device *dev, u8 channel,
 				CurrentCmd = &ieee->RfDependCmd[*step];
 				break;
 			case 2:
-				CurrentCmd = &ieee->PostCommonCmd[*step];
+				CurrentCmd = &ieee->postcommon_cmd[*step];
 				break;
 			}
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index ce36f0979294..352b79c2df2f 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1401,7 +1401,7 @@ struct rtllib_device {
 		struct rtllib_rxb *prxb_indicate_array[REORDER_WIN_SIZE];
 		struct {
 			struct sw_chnl_cmd precommon_cmd[MAX_PRECMD_CNT];
-			struct sw_chnl_cmd PostCommonCmd[MAX_POSTCMD_CNT];
+			struct sw_chnl_cmd postcommon_cmd[MAX_POSTCMD_CNT];
 			struct sw_chnl_cmd RfDependCmd[MAX_RFDEPENDCMD_CNT];
 		};
 	};
-- 
2.30.2

