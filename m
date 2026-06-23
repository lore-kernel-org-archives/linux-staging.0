Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E184E3D564B
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 12:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782216844; cv=none; b=rWN14wKzIgIHPcwwFP7B2HcfiQVkOX7bQIaE7uRD1WVZ81z0Xd2uvVgr8+2s/zo+8bVAlXq2ggV3NMX/u3g4TvmSmpwhlNefv40t5mjJld0sSVp9pS9Wstw4sUL+zIcOTOaUz23XLXm0zEvqERxFqlx5JvRVdLbtiTcWrR68xME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782216844; c=relaxed/simple;
	bh=vlSwt/GCtMyW7VfGX7ZEHKZ0l+9CYhk80t48aL8VK8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wfzu8xPajRHR7cz3z+4JTIR8FzXkObegEs2rbx/T5zSWbFaeEe61drRtWBgYK8wzkLae4duYiGg0Qdu498nGp6nuYe2M5y44UT1a4LBp3Oc8LNfx4cawce0543NG+xjY5BBvTDxlvCbgJd4JUwzQ7nTYjRhm49npHYNe/OmcH6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JbkVCuhC; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JbkVCuhC"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-37d70036426so1525819a91.3
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 05:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782216842; x=1782821642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvl1Ajpj1PEROVNmJxvUMRqb3WsGoSKhMFeCo8sY6cQ=;
        b=JbkVCuhCOjAtxzv0Mpxr75+fUd6VRTnmbVazljgi2qL0WIeep4ImBLkNg+9FtZrNDH
         uZSTyU5gD0yCpwHOE1l/zd1j1IXugX4YPcuX4V4XaEw83hWEwCYdNlryQ5y1X+c90ysu
         E17ce2CMUPCOOseFEmuX+sIlOMjxMzdlsXkkzbjxQEO3YqNHlHd1cYIka4KpfbnZih4K
         V1pHn0vO1gF9trWtQl7jpmcFhzoczgJaZekMUe19X/VRdRRfjzohimqenDykwAiXpWXN
         J5rZpk6cX0+G5zGG4AC5z+CPRR0RdWsNAqX8lrwER7DcgzBKNKo9rEXulVoM6YFZtA6t
         tVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782216842; x=1782821642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cvl1Ajpj1PEROVNmJxvUMRqb3WsGoSKhMFeCo8sY6cQ=;
        b=Bx/kN/PElrW1OiRXeo179jtTXRCHAVnDpt0xD4nepr6KqmViYrDmZItuuTl9i6NHO6
         thFE6u+mCGs1uRM/tUkPOeFyWWntHPBjcfoC+P4ZRW9rvZlq6jxQyy/5bGw2pM7se269
         ltMrwxdLmVPGjcaVBFoWRCnNdPPTs9cYSrvUF8ZM8Qsq2C6I9jtBrSe4dC/0JOb7gyFf
         HL9NtXB2mJrI6FDuC9slyJDMlgh3YzIOr32KRYhQKdCGysjIj08TpeU5x9VjQgfBjn9P
         wYb+RgjZ8V68hm+jW8YVH2ELILwh6eA5dqv+zJeLp01iFtPag8pTmCE7QaSxDbd/HmLa
         YV6Q==
X-Forwarded-Encrypted: i=1; AHgh+RoWF62diObYt7p0OasbUKM65223k/q0wvWr2t5/tLa9ryW5N+NaQarbp3UdJEmYhg63DkP1iE8h+L334gYR@lists.linux.dev
X-Gm-Message-State: AOJu0YyKcWwBr1RMmORcnaH0kmR4jSrTqcvODZKX0O0YDwsElBFwP23G
	FTrX5qVoYJLlkS5VtrJaQAXIyKdV7e78Gb19sr/RXV+n/OiJJn9A934MMAF0k/22dnw=
X-Gm-Gg: AfdE7cnumDBYyQAT9Rgkh9fz7LtNkCX9K23L5esYl0ZHxBqOwlNLXUpg1ezdyfwHUmp
	SkhxUopkQDDlUTf/PZbJXZgWFPxKFUSr7CixBCHz3kOlyWKRLzpqIIJso2tVYBa1ZB6QSrRbbQ/
	AjMiXkEE3HosbrTFzJuPfQfZN2r84nzJ0cCbwqI0zVfEKOfS1ciGBHPeYW468znMkpOAY7HeRzY
	9lo+aea0ktTpLn0kTi7akNwpRQjvL76PKs7QxnZBzUWlufk2HCSuUWaVrCyTQPA7Rg71+xSmhHJ
	LFLOspya10RTbjLP5c7gE2FvmEALh/SUlElgewB05y4JYwp2khXZYb44ImJ3yTn4QmMoY7PIjG+
	9v9i9CiZbZ1QLoo/23x0b+baJ1Xa8r8G1ghqaKECxIEF7ZmOBIluf4pkxuFqpBLZ/JGcrk9y3Dt
	8SRWRdP1bRXQ6JvoMk6Z6zzvhVp/Mzj1Rf7sQpKPAVRSyfgB7eQHSn64FXC5srV/g=
X-Received: by 2002:a17:90a:ec83:b0:36d:9ea4:d0b with SMTP id 98e67ed59e1d1-37d160f5dc0mr18952275a91.24.1782216842116;
        Tue, 23 Jun 2026 05:14:02 -0700 (PDT)
Received: from localhost.localdomain ([2408:8362:1ec6:4980:1a3c:b7ff:fef1:8b0f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4eede3f9sm9705032a91.3.2026.06.23.05.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:14:01 -0700 (PDT)
From: Bruce Ou <oubruce1234@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bruce Ou <oubruce1234@gmail.com>
Subject: [PATCH v2 1/3] staging: rtl8723bs: fix CamelCase warning for bResult
Date: Tue, 23 Jun 2026 20:08:13 +0800
Message-ID: <20260623120815.14737-2-oubruce1234@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623120815.14737-1-oubruce1234@gmail.com>
References: <20260623120815.14737-1-oubruce1234@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the coding style warning reported by checkpatch.pl regarding
the CamelCase local variable bResult by renaming it to result.

No functional changes are introduced.

Signed-off-by: Bruce Ou <oubruce1234@gmail.com>
---
Changes in v2:
  - Split from a single comprehensive patch into a standalone patch.

 drivers/staging/rtl8723bs/core/rtw_efuse.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index a40d6eab7249..4bf205e078e7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -89,7 +89,7 @@ u16	addr,
 u8	*data)
 {
 	u32 tmpidx = 0;
-	u8 bResult;
+	u8 result;
 	u8 readbyte;
 
 	/*  <20130121, Kordan> For SMIC EFUSE specificatoin. */
@@ -114,13 +114,13 @@ u8	*data)
 	}
 	if (tmpidx < 100) {
 		*data = rtw_read8(padapter, EFUSE_CTRL);
-		bResult = true;
+		result = true;
 	} else {
 		*data = 0xff;
-		bResult = false;
+		result = false;
 	}
 
-	return bResult;
+	return result;
 }
 
 /*-----------------------------------------------------------------------------
-- 
2.43.0

