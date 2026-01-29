Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED4E339857
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 16:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769702682; cv=none; b=rYqqtwdtG/R52wIeVdLSN3uCETzbfgGk/6kL/8YWAHgPeAm7HTGb50mgQAGOm97ftI0XmNY6ybNuGR/YcFbJIbW6qG+YXJa6nblz+Tph+u1v3II0P6Ox6K33TKP0BCPkbGAtJ7qGkuPjUICmWPDynPDDNP8cwkUN9ESL00LvOog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769702682; c=relaxed/simple;
	bh=LAzDWmRKCQl0iOLrB4RZCL2nKgyhi1poYaM7CKdIhEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gWc0LYsl5K8cZA+N26mhv0EvDheP9z0IfZE0To/vERpBdXKIolXmcruiMlmPCw+Hk30gzHHHSXoVfscaL2Pu2JtUEzdLmKPLktvJ0o4k2bwvQB4Wlp3gfw/YrKxvZTrq9AwF0jmM64+edPCycSBxC53gzJzsKwCfJhXdEqzOj2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DidLyjQs; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DidLyjQs"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4806f80cac9so7405925e9.1
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 08:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769702679; x=1770307479; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqhoMwRyN/VLfos/9gInZzs4gm7fqrfrC6kaLcS4hXQ=;
        b=DidLyjQsAPCr/WEfZKbArW1F6Ef9Zca6HxgX7E+falevT/T4iICXemtRuxIcVrCq2A
         TCK1ODT43NtfT7ZhcAVysbJd0zGGEJTSexS7YEKuIs3jonWRUXE0eyRDZmdfW579qq9U
         SpSvTIQYtpNvHmMImot0m3GcGwXI3LfEI72HaGGcp8ZMRBtt4bD8v1OQp7TcE0nwJJpR
         hO6iAWh/9BEQTRH5eac1L12IZkI1tn/al+t0G77oiUuKjFT5M4ljm576plXGe0eUmDly
         59vFYXkI0DqdFptZFqwZGcKPJW854VpgSOpDEp5HK1dOkX5CojOit6S78HZJLERZ2+H3
         Bw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769702679; x=1770307479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NqhoMwRyN/VLfos/9gInZzs4gm7fqrfrC6kaLcS4hXQ=;
        b=DX1r+HjpUAdKNixnRrl7R/rfFzbh0MS4uL8PZEnDbeaHzNJj5rH2g2QqBue2qTqv15
         kCM7x3cIyHV4EySHmC5dNyKbbA+LSVrUNn5JzzD7bVWRufu/R7UeBNHsqaqJtBu9nuHQ
         LfOq19xkAuyPzpJZAJN1cUtBjCLO7TLtFhLBCII5SSuzppZfCE65dUPMoc4JBo4AqV/r
         rc6XigLStQ7RmHnT0uOGJ2EUwBgDXa5FZfo7uPk/ir39Fc2NJXryhpBLalkPBrhQvP0v
         s5ewAWMTvHn/oGYkEDYcEVDmr9hd+rZx0lkYhp3HRaDlNUvJebYLdam7ruZRThdy6/k0
         dabA==
X-Gm-Message-State: AOJu0YwwvRC1Sk7xnSPpIR9DY35e/lsndMX2eG5/fKG+UHGWKwkbfQ5e
	CfC/S2t/xODIg0Vr0TEI+HIpAM/RF3eVHjTQJ3nGNFKbhcLUrIGu/cPf
X-Gm-Gg: AZuq6aKWajWdKDrRTBoPdUEpZW79I/zJfi6qjRpxoogOutLVKLgRZ9qUZ1YLqJ5YGgv
	kQPg9XSa9+zuhZJ90q6RTNDcVLSFRMHYAi+XT1kNZG7+LKiP3bLBoKszn5+PozeIJZgbwEw+Qjd
	ZYUT4wbrrm/lLEOA2wooIvXHf3CN5hsx3CoIs9NGKaD37lyQ1fCTNAHYlw9wVWyXld2nJbdyOuw
	z8J+Fo6DoNMQTeE/2Hk1gDtoktWmL1U19HRofwMxvppoXSpyqQCiRcYI0xwCdSNn7mTJxNjmzy3
	k/z5Z4MVDdHttVK8mpzjkmmb0aCc3cexEEcMBeq/TMLS7SLwTKOs7nOtKmW78xgWRoLyriV7/X3
	bQ756ZammEUwOz4Z3elLHaMREcrzhkwX7eCsYrBSS02xuXouk8vUp7tQ3ZOSwEDwaWhQw48SuC1
	w3on4AhhK0uaT1l1ABDbUfaBxRGUBF8yW5/Ie9Zu8=
X-Received: by 2002:a05:600c:608f:b0:480:68ed:1e73 with SMTP id 5b1f17b1804b1-48069cbf2bdmr94914665e9.36.1769702679126;
        Thu, 29 Jan 2026 08:04:39 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce4c515sm135883175e9.11.2026.01.29.08.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 08:04:38 -0800 (PST)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mahad.ibrahim.dev@gmail.com
Subject: [PATCH v3 4/5] staging: rtl8723bs: fix line length check
Date: Thu, 29 Jan 2026 21:04:25 +0500
Message-ID: <20260129160426.13737-5-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260129160426.13737-1-mahad.ibrahim.dev@gmail.com>
References: <20260129160426.13737-1-mahad.ibrahim.dev@gmail.com>
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
index b7176a992518..e428884335a8 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
@@ -60,7 +60,8 @@ static bool CheckPositive(struct dm_odm_t *pDM_Odm, const u32 Condition1, const
 		if ((cond1 & BIT3) != 0) /* APA */
 			bitMask |= 0xFF000000;
 
-		if ((cond2 & bitMask) == (driver2 & bitMask)) /*  BoardType of each RF path is matched */
+		/* BoardType of each RF path is matched */
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

