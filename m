Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EEF346E43
	for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778925079; cv=none; b=rbiB1K5Acl4xug93ZxWdUFOigoQun5NRXUV17ZaoQWFCbNxJLZZBtVgux1gCLORlhuP5UU9SppUNctM2RuZn8bvrpOY7UVgeshjq5sL5nrpZ8tSqhfnlS+KEXVPeO0eQLEyAOqbNapRvQaukJx3NLtyOXYSymlh2E3VFxGJJNgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778925079; c=relaxed/simple;
	bh=xAHSBYDP6W/ya7H979vVgrYm6+UeSkQpAh7OsBt7vMA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IrEVsz5CaY+YGl5GumGDbI5eYkZLx/hLRqWTwZXraHZAitrxSqqh0oBzgt/cxhvj8gLeSdP5PRtF14FM2WerJEhvn/0dORJyLwpt4Zcy8yED+5UhfaHxenKTNLm9NCrAKak3ivapoqa9r7yp6gkC413e6UHAeDQDjjC6Zj07n2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQ35BZ2r; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQ35BZ2r"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8383fb7143aso279156b3a.3
        for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 02:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778925077; x=1779529877; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtY5k0xj/sy9dlt1g7TjEF5z8G1f2ZoXWHAismVTxFw=;
        b=QQ35BZ2rgz6nNXJXmU2RB7SN9M4o6sI+8y2d2clCec7+MyJ8ivaD13LVeipKoVxAvc
         04/QCiiQnMO+GgHjrA1chtR0rO2flCd2qJ5ey15n3DbiLOfeQuLgt2X9aSHDWQ3g8+Cx
         p3z4epukfq0nbNykaNRWKHhhA7v8vFCCOPEkMgd+iugtNmmsp1TZTOGVn3Ywuf8BcEgk
         4xxV06hnnwpLRUacY/eUXuZFoCyLXI260YngswxsCXLEOlSSo+MJ/lwbsl0p2EY6d4Cm
         zbQYUwJJAiI814FFyviPhOK56GvZNRaRvwJg9KB+5Wt1hNVumLUIUQ3hFrhBcHsm9Eme
         k0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778925077; x=1779529877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TtY5k0xj/sy9dlt1g7TjEF5z8G1f2ZoXWHAismVTxFw=;
        b=obp3Rt8ZyPUNeQHXj6aLe7bdItWfYGuv4V/IoQNBg7LFl3z9VzBZEvWTX0jOQ4lgKp
         ZAMknhsygROeNTPlvrgbN20YEW6slu8mMXPbfUqnYdQi5NWBULzYMpTHatAL+QQIvPxX
         UtH4LJjUbHoB2EN6pzcGxpsPqDjb45kDDLvXJaqW25Gv4QbES3t8+dZA2H64TazpecIz
         m0co5RIuuy+y3RSTZagG4X9p7rS5g0dKUyf/uiSrEkNfHS/ro8EDMeCCXkCvlWx1IRoz
         K6FzENcAgJk2ij22KoevawxZq1zFf35A6jMj7QVN48u0q3otqKKRTaMTVLi/VISOeCKw
         jRJA==
X-Gm-Message-State: AOJu0YzmiMXyWS1ph0EvEHprcdcK0ZcnUp23DBCN6+6yyIQfDLJrjosw
	EcuBbxkMKv20su8cRmL91WYQeW2BzoqGcTtEX3Iz07DK1O5vrVVj39Pl12FCbcmw
X-Gm-Gg: Acq92OEaKCXdnJABkL5OGaN/+ilI6Vz51rXmXp87HU+MURyA03yZLsh0gzYvFwkdrog
	n998uaCdr0IPlkScE5ZGQThSK0tdAmXDNw2ZBOBtLVx/1++p4AXfb06xPH/MtnCeHLVUUuaJdsq
	+oAAFRnMz02wOqbXJ7LUb3T8r+Kv3hSb8N8h4LGOTJ/qCdbw3GsjmVvw1o1NWYUhbSsk2Nbu2z9
	Gl0kBLkj4IXzLPKppPqkXzusSemdZIv+DF91Nvv4NIc+Jt1Gnhv+LQzLzaw9QeDhRizCMSaMSQx
	kXwOonpGn8ak86RkoloJ1xHtx1rldyv4nplrAi5We/gFBIJhNe3IxYXduDP1o2ljcr+yEb22Gs6
	DvucO8D2Km3UzDWg4l7uv2vRvG3cFwk14llp/vqbF8ZZjXW/v1lktAI7SGkPkmzkk33endjKzGs
	1YLwbmUMFQg9E/VoQBNVufOFGbJV6Pg+KOEdEt4LBpu3F7wTtdic4JmPhVrH8+qiIf6QOynBZM7
	vB1SA==
X-Received: by 2002:a05:6a00:2c95:b0:82c:e816:4135 with SMTP id d2e1a72fcca58-83f33de9724mr7756276b3a.47.1778925076635;
        Sat, 16 May 2026 02:51:16 -0700 (PDT)
Received: from localhost.localdomain ([2407:4840:a002:5ef4:d022:240f:d06b:67d5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f8b8b3sm8111593b3a.59.2026.05.16.02.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 02:51:16 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH 2/4] staging: rtl8723bs: add braces to else clause in rtw_efuse.c
Date: Sat, 16 May 2026 09:51:02 +0000
Message-Id: <20260516095103.12727-2-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260516095103.12727-1-mokshpanicker.7@gmail.com>
References: <20260516095103.12727-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing braces to the else clause to satisfy the coding style
requirement that both arms of an if/else statement use braces.

Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 987d05816c5c..2be74f2d4ac8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -73,7 +73,7 @@ u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u16 Address)
 				break;
 		}
 		return rtw_read8(Adapter, EFUSE_CTRL);
-	} else
+	} else {
 		return 0xFF;
 
 } /* rtw_efuse_read_1_byte */
-- 
2.34.1

