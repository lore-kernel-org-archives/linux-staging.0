Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404D832B98C
	for <linux-staging@lists.linux.dev>; Sun, 18 Jan 2026 11:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768737298; cv=none; b=mBbKMujtGxxnKEXfeuLfC/FEy2UwgoynbqTNjy9KgO37W/3ZdGRF96RU1DxpjHXSbegjoV3J1jydbNs/abVRIqLCJ2shI4mcybNBUAN9kAOdKOb1nJw8gLVUoPd12GlKY8XBQNF5hFL6b6ZcPt6XjUe8man3WDG7r5WChyzT5Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768737298; c=relaxed/simple;
	bh=wCqqJW9yqZTqkPcWDYieDhGak/A0Y9MCOsZS2RTp3Dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QJRMVQ0HOZj6vDtVF0QGh0YJkKN9RRurlTg243svA45ew8TQTZVhxuAfeP6+us+ornLWGCh5v9zxnFfWYtMIuHTX9RGyzb/hByzg7EOM3apx6hRr4+vHSBynT2mCt6vasMmGWYiLVFYEJa1I8xN5YC8727hehr9LAjVecg6yXiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJ7u/jgy; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJ7u/jgy"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-432d2670932so2771241f8f.2
        for <linux-staging@lists.linux.dev>; Sun, 18 Jan 2026 03:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768737296; x=1769342096; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDsl97eyhGgs7e29xFcEZkQyca9QXk31LXleDWSYZLU=;
        b=jJ7u/jgyAICNiGZzt+cydcvDvpP3B7wnYKtK6XSoRqbUfIMXy7PV8bXhsVEh9QwG4J
         jTWg5HrhISZ2JcEIbySFxr/riTitSbdPJzKavr/CQ499xAfFazAefuGulSl8DHbMJROv
         Eh3tOndtlNDSqGxSOZYW+pSHrrq4jsiR/oaJ+ZxFLbRdK7lLn11Menj32p2lKarSsTqD
         5YTVzE5Vd6DRGQgzP4cgI45S/EOu/9MDWntK5c1gmtd6YyxDuI5D/mDe3b6TYS4ch+oQ
         Tco1XaM4P95HoPFPpg3PgVPn5kGtd42G1Hp9eW30wVJ24MePkvNxvNgpH6ERqIOgP9um
         Aiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768737296; x=1769342096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jDsl97eyhGgs7e29xFcEZkQyca9QXk31LXleDWSYZLU=;
        b=ollaQZy92UPL5BimMVd/dny7hogRDtU4OC7rryBlIa9fgD6Rh8qoGt55ERsxHbUQmQ
         IhICunjTa6R0SONtgdhbEM3UhyuT15g+1EZpbmIECIdudQxB3hFJE880D5pbxzn1tY7p
         2BdMOpRY5CR21BtMBxJ1mbxkJov8haa5pJr+QS2YHtmeGELldHvo7liO9hw/1MXwpm/I
         001VjA+Kux2Qz3yisIbRLeN0Za3oX9tqmN1LqEWVGYBRe5YlnkOmiV9Ohv28n4wbiJtN
         NxPCdFUg98kULDh4kRNdCSZqM0Vb4fiFRhiEKvVakXz03gIsTkzjQFcIGb4ccs0aSNH8
         aPIg==
X-Gm-Message-State: AOJu0YwYipBczlzIyfUOKgut5sUtDYXGKp10yUrhWMCebhabi61whuXX
	WWJP93kG5wAyqYD718miqXM+dWgBCZH4JM2utxNiyBJlEJxyVE91SkDS
X-Gm-Gg: AY/fxX4/JbDFOi3y97UbBS19xUXh8clAuIrxxBRcJ82ha0ZLe1Tlt83EViLfH0hF/6u
	M8e5yW13WZa5nVnff6lEr4F1pgeciBraYFMrIEXy32WuH8EbREiGYqB5gCBz4W041SVOYEY9L/8
	9HMJ38snvAQcFqxJXVt4CcZzDcPsyJ0uY66CX9g319IFpaJBiz/y/hu6dCJoIZhSWNBfvSTAsk9
	phjbTswL82qqKgPi9FgwCXE8ouyd2+Y5m67fIhmxOUTNVmvG3pBgfDAk5E4Ru7uLk5yOkSY3NPq
	zavbQ88vHp3TBpNIkorx7qapkV3Qn5qANX8hy3dlodSJ+hBSOQu1r0g2kbR8GsWwdTcOmccPR6J
	WB2+Wnys8eWeVRQl/7x1nOImBR2auBVbzfDGGEHaKHwpWmoelb+aQ1ABX8cVb+hgOBysP323/L7
	pu20JJv2NhFYdVXq3zhguH6NJhcobbP++9wTMRSVyI6fSgYZqA/A==
X-Received: by 2002:a05:6000:1a87:b0:431:c73:48a8 with SMTP id ffacd0b85a97d-43569bc4a06mr11913626f8f.29.1768737295481;
        Sun, 18 Jan 2026 03:54:55 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996dad0sm16368686f8f.27.2026.01.18.03.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 03:54:55 -0800 (PST)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Subject: [PATCH v2 4/4] staging: rtl8723bs: fix line length check
Date: Sun, 18 Jan 2026 16:54:45 +0500
Message-ID: <ff17af4290ee04d9a6c57777c7387c782bb779e7.1768736361.git.mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768736361.git.mahad.ibrahim.dev@gmail.com>
References: <cover.1768736361.git.mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl check regarding:
- Line length of X exceeds 100 columns

Redistribute comments to multiple lines to adhere to kernel coding
standards.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
index b7176a992518..fb108492efac 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
@@ -60,7 +60,8 @@ static bool CheckPositive(struct dm_odm_t *pDM_Odm, const u32 Condition1, const
 		if ((cond1 & BIT3) != 0) /* APA */
 			bitMask |= 0xFF000000;
 
-		if ((cond2 & bitMask) == (driver2 & bitMask)) /*  BoardType of each RF path is matched */
+		/*  BoardType of each RF path is matched */
+		if ((cond2 & bitMask) == (driver2 & bitMask))
 			return true;
 	}
 	return false;
@@ -210,7 +211,10 @@ void ODM_ReadAndConfig_MP_8723B_MAC_REG(struct dm_odm_t *pDM_Odm)
 			}
 
 			if (!bMatched) {
-				/*  Condition isn't matched. Discard the following (offset, data) pairs. */
+				/*
+				 * Condition isn't matched.
+				 * Discard the following (offset, data) pairs.
+				 */
 				while (v1 < 0x40000000 && i < ArrayLen - 2)
 					READ_NEXT_PAIR(v1, v2, i);
 
-- 
2.47.3

