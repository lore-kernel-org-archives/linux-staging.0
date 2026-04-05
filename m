Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958803385B9
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 11:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775389491; cv=none; b=Y1pCZjJqJ41qK5SzDaAM+4ZWVOlXpGx2coe/V7hNsww2jcVyLYBPy3tP3iJf6xDTOGjDS8z9P13tZqDEgSvrcl5sxLPldBqqxrxZ/q/X4DLU+Vgiqnjj9jNNmyzJN0CJwB08FVVhzZpxkMNgRTT9mQPu7ibPqbfQHY60WeFxr4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775389491; c=relaxed/simple;
	bh=1m7QPUYyyVMa0S0thNYyhEYXYa7ZhsPM8QCoJd/VMAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lhiX6RhdTXfxhgmnj3OZjKIpDt1Ml0uTgDj4/EoPch8IrMyw0QjVB7EWCTSZ252Up4ZLw/02FK4fvJFKiw4Mjjxnr2sIMHxdmlfqLSTRYnZEqf9H/Y+gnFZcKY5pPPbNF77o3m3VXGZty1JSv/27kZNxL0mIZI8JaI33zv3nJtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxZK+ic0; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxZK+ic0"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82a7ebc729dso1270259b3a.3
        for <linux-staging@lists.linux.dev>; Sun, 05 Apr 2026 04:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775389490; x=1775994290; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxgKFMZZZoL6ZZqn5H0A6fG5fvPlDWbVb7/SYgGKcGI=;
        b=gxZK+ic0VsGsav0Epn10W8nn5tUiaIdlHFYaGyR7jenlHpjkzAjkHgzak93W7YGbqk
         eIrKykXUatiZu2zchW5BcLf9/jNGTSgi2KL3LQt7qeOVPCentz8dsEWurzID65ItLQg7
         mFKRP3YwM+KWf7fZhbEKGqEI0xCCwpQ3tVWBh61/jVpVElUhU0ts92e+9r9SYzffW4m/
         OuR63DcVB4ZAVUvlI6VAcIOqBG9cjHzoz7mmVExEZwN8d7l7nUuwFssexwqX1JMzH8hB
         pzJcHfp9lGTxPYxIut3lHJM8vfnOZ/ttyzmVrtxKtKDvIaLVE9Su25x3eotFfJTLK8h5
         rtPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775389490; x=1775994290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wxgKFMZZZoL6ZZqn5H0A6fG5fvPlDWbVb7/SYgGKcGI=;
        b=r7qvlD+j5cAZvkTD4J8MGS+U5m5BwExLYcR7iHNamw8HULYUhilnUyTFpTsjhpMQyt
         YBk1IKW9smvgh8/yFjq2ZxA5GYsW+7tFU8Jbo20gM0OuhOaC8FgTitHltyGDL1L4evQZ
         ID0Oof/EyMM34uakIFOvhPY7FF/2CoxHs+JS3Y8+dMby+JR3WdtJJBp1pLZGRphEU7L+
         JeUlHXNfjl+Pn7bUcj+9TnQCvQDZTS0bhVf8WUlLUdP4lvOWu5nqHkUSi6akvW528xLl
         Y/bJ4yuB0bqYxIHvPe9xp49hIJe0f1k0z1ZOe4+eRIvkrKEFOkWHIy3/SwVBQMbuRIoa
         gtIQ==
X-Gm-Message-State: AOJu0YyXxhoOvzvgin8+G6OJwuR1BgF6LBMo4ea8CijBqFhGaBLl51Wr
	FZK9W4ec9rYPcDth/l91xxRFfip3mKp4I/uwYKNZda8oka6RwId2IjgB
X-Gm-Gg: AeBDietao39ln1VJqCn5O4AU1Qdq7fXV3QYbc+5bcT4ZcGOHcn9xwgzH5BlGEJdIQrW
	qGEL0pzH9nCCrkpm1oId8ZvHgEhh0Ol6bfNytJ6svUwMbnd42mVRJeHY6s/wBvpKzBnJsFc5wRp
	vacXS7b05DqEiiWxkbK9MEfd6Z5sxwP6fZCYN9+VyeoFtt+CE1Wo6JEwniFTqHle50D9DxYUTLa
	l6ovqWcrSw/jSyGTcDRfpmWBpmVJn6RXyOQwJKV8XKvtyFtfXFbnow3yMnglcZiUTO56upa1Vqk
	5vGqflzy4RMFxKaoW50wcP1q0I9r/7XHDS4IKLpGXx1d7TQ2K3obatR1LeKfdQkdZ5tTkuwfv+C
	ZfoTW8LUe1HFlfal/WAhSG1XMLa370zQsebrqTikKpW8nMIoqMwTtMGXV0aRBcRP/SlW4yeGrOz
	TAhBT+fEu0Q3tXsXkvoU8Dbxnwto43aImN1gweNtk=
X-Received: by 2002:a05:6a00:3902:b0:82c:8c6a:682b with SMTP id d2e1a72fcca58-82d0da6a4efmr8181303b3a.19.1775389489937;
        Sun, 05 Apr 2026 04:44:49 -0700 (PDT)
Received: from localhost.localdomain ([111.125.237.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3ccc8sm13938205b3a.19.2026.04.05.04.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 04:44:48 -0700 (PDT)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: gregkh@linuxfoundation.org,
	abrahamadekunle50@gmail.com,
	b9788213@gmail.com,
	straube.linux@gmail.com,
	ethantidmore06@gmail.com,
	andriy.shevchenko@linux.intel.com,
	dan.carpenter@linaro.org,
	weibu@redadmin.org,
	knavaneeth786@gmail.com,
	ignacio.pena87@gmail.com,
	dharanitharan725@gmail.com,
	samasth.norway.ananda@oracle.com,
	lukagejak5@gmail.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	suunj1331@gmail.com,
	ysinghcin@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Prithvi Tambewagh <activprithvi@gmail.com>
Subject: [RFT PATCH v3 5/5] staging: rtl8723bs: remove duplicate rate checks in PHY_GetTxPowerIndexBase()
Date: Sun,  5 Apr 2026 17:11:32 +0530
Message-Id: <20260405114132.310774-6-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260405114132.310774-1-activprithvi@gmail.com>
References: <20260405114132.310774-1-activprithvi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code previously checked (Rate >= MGN_MCS0 && Rate <= MGN_MCS7)
condition twice - once for the (BandWidth == CHANNEL_WIDTH_20) check and
once for the (BandWidth == CHANNEL_WIDTH_40) check. Fix if statement
formatting to move that if check as an outer if check to improve code
formatting.

Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index 9e523491a008..efd1c76f2953 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -469,11 +469,10 @@ u8 PHY_GetTxPowerIndexBase(
 	if ((Rate >= MGN_6M && Rate <= MGN_54M) && !IS_CCK_RATE(Rate))
 		txPower += pHalData->OFDM_24G_Diff[RFPath][TX_1S];
 
-	if (BandWidth == CHANNEL_WIDTH_20) { /*  BW20-1S, BW20-2S */
-		if (MGN_MCS0 <= Rate && Rate <= MGN_MCS7)
+	if (Rate >= MGN_MCS0 && Rate <= MGN_MCS7) {
+		if (BandWidth == CHANNEL_WIDTH_20) /*  BW20-1S, BW20-2S */
 			txPower += pHalData->BW20_24G_Diff[RFPath][TX_1S];
-	} else if (BandWidth == CHANNEL_WIDTH_40) { /*  BW40-1S, BW40-2S */
-		if (MGN_MCS0 <= Rate && Rate <= MGN_MCS7)
+		else if (BandWidth == CHANNEL_WIDTH_40) /*  BW40-1S, BW40-2S */
 			txPower += pHalData->BW40_24G_Diff[RFPath][TX_1S];
 	}
 
-- 
2.34.1

