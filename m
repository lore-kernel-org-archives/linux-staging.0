Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00A923D291
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 17:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778435566; cv=none; b=grjQphNQXQsz4ZmRUc8wV6V3hob/su/QEUKu+TOuYK2QKbe3pOMPyx6kc9GMPvjXBlptazxcDOCSboMHxbEBKFUnmQPnZU+1nkpJACqxlceM1k62sbGr04YKiAhQxZeWUZCm24bSmhAc9XbLHgPUGAKZXLhfJh4jQJNzeCqottA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778435566; c=relaxed/simple;
	bh=TEmFqdFz7mOPGRowlf767z+jPiDJBcFJMcuO3YOu26k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=liYPhFr/cN1qxc5HgN1xggfWlHlUf07+XFHogAjoYZchh28Nf74d1xp884daQ4W3Ep5/4hMmz+vL207fSNI7glNviObzR5TVUNewJEe1vMi4ZOXUlDOwNCNY6UaFuOvkdijy1JjUmIIOx+tdeOUJR4fkpl+HFRo0pGdbzV8iBtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CQjzlvH9; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CQjzlvH9"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ba1e9d3687so22477035ad.3
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 10:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778435564; x=1779040364; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ln1IOvizuABrSOOBL/FBsK4w/tVniLBdUK73NGotIdg=;
        b=CQjzlvH9XS3+a7TXnVl+5W3d9D4/vZTGEmrlu/F2moZIOKZBL6VvrbQXrsLZ4GB5EZ
         KV2GkRl6WD1c9DoB1AOsXBC5UVmlYEl0zESUfgP8ZJILS/SGF2U0ydkzJ3NGDAIHESCk
         p9ZrFA6HCI6RbDmmsbBQeO0JByuWV1H8Pc/H90/fYmZZ7MmiHJwp3jN9cQNPKIHLn1sb
         2ea/OqloEGsOGAoyuahcI8Jltvn4zu/Lz/sfS29BHwXYz5mK5Gkbytpsy1cgHCeNksEJ
         VlKtbOW2Xg1toHJMOJTeTv5jIADK0I6rrC+ZA77mvYZdicTGTqkfj0nQZB/1z1UB1gdZ
         OWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778435564; x=1779040364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ln1IOvizuABrSOOBL/FBsK4w/tVniLBdUK73NGotIdg=;
        b=O02P2HsmVjXY4LONRRV40nltYAG48bylZRqBrlEsW4AqqSrKLYps5vNj5sicW2UV0I
         INOCGxct1lJzJfCbYgvddrkppYqPIaL0+p/9jWaD7teh0kzzS9wXE/6ap7ZWYNuSxPNQ
         SxZZrGVLsMLOL553ShM6RRvhlu4VoYsU8TRFnC/8o6Ppv3LxnB9MmF25LoHgrk3kGRBb
         No8/Ng4y+C18l4+zToo21crLejSe+emkL5e62tMai0SsN6aU3GOTgPC8miAJ6EF8SFtv
         FtXr+jM6jQIgsXvsy2x5T4NoCRk2hLuMZ9UfgnYaJwdrV/Bjw1vUZErBZpY8HAFDQs69
         Uuxg==
X-Gm-Message-State: AOJu0YyySovcrkLEK64IJqSCwR5Yzhw1vSwaOHQWgwMn1H24xB7UWTjf
	pUEpyayDZOhF25xhpp0XiEUtSok66hjdFLAXs6i9UDE16UTqHdr9B819
X-Gm-Gg: Acq92OEeZk2Lul/9xGV/UU67QTkOZ6jsqt5N/ay9IYdwD9Zwbe6HKaKvorchuc9gIh+
	RAvnsT1vkUWC0J8zYrl6+1gpbsGCfca8pv7gqXsxzcxXVfjsPm40ouL22XfGzFApmTJvs5RRMZZ
	QjUffyV6Mt+ki7KZryhUHP4IqBIKUV++bnVQKMtEPky6vTwzUkDOfx6vYG4MCuzS87ORZ/4cXyw
	WKgHH8nkgt0mdD785T82I1bf2uLQxyfDQX933ygQf2CsdxAMsEzxDDCoRS0bGOz8354gVH7KcmB
	H9sUEUE/KxetOj9kpcYWHEMSfpGbh2YCL/yYwe14w7LP4LC1FW9XS/afd9/VNTDHQI2KwjFXcka
	D1vI5i5a3VCX1qQUaXTKtEOdV2gnwzDjlmfsd0AqoA+vWdFX13AzyQyQfbBRmb8a2cDSNPtlc79
	L29xSpgxRYCJPvDfTyBbI8NEqgtrZ8EzMeA/dB5bGpVflelWHpED0=
X-Received: by 2002:a17:903:145:b0:2bc:7eee:200a with SMTP id d9443c01a7336-2bc7eee20a0mr50146965ad.22.1778435564478;
        Sun, 10 May 2026 10:52:44 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d008:80b:a00:27ff:feb6:42dd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e374besm83169715ad.47.2026.05.10.10.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 10:52:44 -0700 (PDT)
From: Pramod Maurya <pramod.nexgen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nikolayof23@gmail.com,
	Pramod Maurya <pramod.nexgen@gmail.com>
Subject: [PATCH v2 4/4] staging: rtl8723bs: Enclose CHAN_ARG macro body in parentheses
Date: Sun, 10 May 2026 13:52:07 -0400
Message-ID: <20260510175207.563378-5-pramod.nexgen@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260510175207.563378-1-pramod.nexgen@gmail.com>
References: <20260510175207.563378-1-pramod.nexgen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wrap the macro expansion in outer parentheses to prevent operator
precedence issues when the macro is used in expressions.

Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
---
 drivers/staging/rtl8723bs/include/ieee80211.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index beee37041eeb..d1167d9ea846 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -639,7 +639,7 @@ struct rtw_ieee80211_channel {
 	/*"orig_mpwr:%d\n"*/
 
 #define CHAN_ARG(channel) \
-	/*(channel)->band*/ \
+	(/*(channel)->band*/ \
 	/*, (channel)->center_freq*/ \
 	(channel)->hw_value \
 	, (channel)->flags \
@@ -649,7 +649,7 @@ struct rtw_ieee80211_channel {
 	/*, (channel)->beacon_found*/ \
 	/*, (channel)->orig_flags*/ \
 	/*, (channel)->orig_mag*/ \
-	/*, (channel)->orig_mpwr*/ \
+	/*, (channel)->orig_mpwr*/)
 
 /* Parsed Information Elements */
 struct rtw_ieee802_11_elems {
-- 
2.52.0

