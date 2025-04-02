Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABB523718F
	for <linux-staging@lists.linux.dev>; Wed,  2 Apr 2025 11:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593547; cv=none; b=t5b/WI39M14kkO55oOlgcfQ350K79ecxqLTOlOVNTV3EkXaynwf4QMls2upfQXr8yT/hjWATa06g2Mf00QZe8ShIM4l54wC4TOImldoL/zwq74m3EwhPfUSnKJ1W69HIYD7bjyt1blz6rWhuQnOfN9zetFA1uzNfhlm01RZTGhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593547; c=relaxed/simple;
	bh=BQLUAOp8hcz96+CVPWzJUqpppAiY0RYSuWrm0lq7OXU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tQkfHGtNJos+moWSX45JGwrF/vKXTuo4QkNZvuMNzzvDBxrCz3iIufEqaNEgOdOZgiRv+bTSdejAbp1VyYjtnpVdqomb9oAFET4nRyEujHSCLASwGfegZhCycP5bZo8iPttZaukAO938oRQRm7nHv6+EgU1bgsryRLqdGD8pvXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqCveQcG; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqCveQcG"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c08fc20194so1252626785a.2
        for <linux-staging@lists.linux.dev>; Wed, 02 Apr 2025 04:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743593544; x=1744198344; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DCEThd8C9jqT4F27805omvPg19dzW3dBb7AMvXXeLjo=;
        b=EqCveQcG0Y4WLW+EY7DQiQISrLZEG4wn4kZurhBO7XnJg3jxvPVV77+xSPi7Ope7z0
         ESEQVgfbugCwwbYhAjqjE70+/DUQrcn/c43V6q8/LgIYEOkPg9qU6FhVhX4nlh0LlI5u
         faSxG8iUuuXfFIVzYZNZiwnk0WP95WYoQVf88xukVNVyXhf/hLS96piIE5Z6WWW8KEDS
         YGa7gE4/D+STdRBIhF/U3RSGEEpjj3+zBp0yIYM+Uwo8UuNjf0OFQU4YHRWqQhbJ8Ooz
         tWTLbyd8U59asMu4PIN1YHgBFRtm9kNFVoHoIN5NnHQEhsN5tj72B+tWDz6TqhYKsZY5
         FEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743593544; x=1744198344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCEThd8C9jqT4F27805omvPg19dzW3dBb7AMvXXeLjo=;
        b=HEBdYT2pp/IAV9914v2Nyml2n1EC+VQuxpJjsp1i1wZrbb8YaeZxuJ3CfCz9uxUl85
         yjgug/qTz0CHFfrOWoy95Dbjl2zN8bd1XJz0qoEqRvFXIVk0BMYZFFrs8+acbJRpeJCm
         MrkdzdPB7rJX4eRSQdu2be8CW5DflAXXmthBZ3dW9dAqy7RIOMaUBA+k3IzxYC4Tf3U0
         6zaEXHEK/rk41IJzwLIevOE1dy3Jl0XC6IB5c+TbwM3E6wWVUZCX9PHqgsWxfVAEI8kL
         y74XeHpVMQmaeFZcvUr368rSFXjG9sckxkPH1Dzox+sGmXtzZfQ+MPxHAwNjy0Cb8h+Q
         jHlg==
X-Gm-Message-State: AOJu0YzZ1HGAiLHBHeTYeHxnvi5bbvJKTxKaG4vPhEzWwfg6Esc5FUHa
	U5QfzertXTW1usD6W4dOnuF2E4PEAKlt/4s3Lw7CFB0r3rJ+L+CD3pIeZ4HXw9o=
X-Gm-Gg: ASbGncu8wDs2XbXpAN6KaoqZvSJ8OcRm6WWsWlghKX6v2o1HQm3wuXbDXz/4XudLxk9
	e0WRZGMKo3nH3LzPaKzOqMlOi4+22edFPD+iV6tdDUYEJG6Z7Vk6deFWHgxiROcKV00FC3Y/+at
	huZbJnJLDcCSb1XQnFW7hXYNq2RmFIzyhvL4nQpBe7Igucg6CzlyCyb5S0JSBrxpgMXA/VOW1s0
	k0jfruaKUE9UFLElv3glpIymyEtry5C5cj6AsiWGN71Z1IIJslex7s4id8WEdjDNZp42a2t79AQ
	UWG/PiEu20luXRsZ2hF+HIzVDnJAMBL5pu4jLqyu7vBjzAxnTOq+ItUzI78=
X-Google-Smtp-Source: AGHT+IHXQUOQ4MUkeVIP8CSDJIrsR3b+i6sounU51uvTk7vk1bAa+2aCEmd5MUwLwXE94lWa1jKKDg==
X-Received: by 2002:a05:620a:2a0b:b0:7c5:43c2:a907 with SMTP id af79cd13be357-7c69072edbcmr2178988285a.26.1743593543771;
        Wed, 02 Apr 2025 04:32:23 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f777dea3sm779839985a.102.2025.04.02.04.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 04:32:23 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: linux-staging@lists.linux.dev
Cc: philipp.g.hortmann@gmail.com,
	eamanu@riseup.net,
	linux-kernel@vger.kernel.org,
	kernelmentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Gabriel Shahrouzi <gshahrouzi@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Remove trailing whitespace
Date: Wed,  2 Apr 2025 07:31:58 -0400
Message-ID: <20250402113158.45760-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove trailing whitespace to comply with kernel coding style.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_pwr_seq.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
index b93d74a5b9a5..48bf7f66a06e 100644
--- a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
+++ b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
@@ -209,7 +209,7 @@
 #define RTL8723B_TRANS_END															\
 	/* format */																\
 	/* { offset, cut_msk, fab_msk|interface_msk, base|cmd, msk, value }, comments here*/								\
-	{0xFFFF, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, 0, PWR_CMD_END, 0, 0}, 
+	{0xFFFF, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, 0, PWR_CMD_END, 0, 0},
 
 
 extern struct wlan_pwr_cfg rtl8723B_power_on_flow[RTL8723B_TRANS_CARDEMU_TO_ACT_STEPS+RTL8723B_TRANS_END_STEPS];
-- 
2.43.0

