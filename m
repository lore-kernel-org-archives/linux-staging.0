Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9931DF258
	for <linux-staging@lists.linux.dev>; Sat,  1 Nov 2025 18:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762022518; cv=none; b=FIWQT6H9EnSO0oRHTWxBxDXWuntDIcMefaEkUrveB55HtCUGWcgoFa14GaS56JApkyG+giOPh6yt0P24YVNZcdbhHRt6ajXFXFohz08wK/fwvsR27PfLE7bFn2RyZbh6c84+jsjcjo6Dv7Q3PgmMIjWwVHI0A42gSE/Z/HN5TuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762022518; c=relaxed/simple;
	bh=z5QjcNAmNZUH15a5FlytI+rueW1AFD5wVSr8sthRZSg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VP+f8ftGidE8++qzeky75Sb8b53z89215rYnjMsFH7GfuufqyBmU6jgbq7fgh+kJXppePzaw0s1hxTYGBjhMdCnuKWWWeXjh6opVF9pW7kPcjji06o8vDhsQHEEucEn5CiiiuKzE8MMm8FV7KI1nbOWXNe+QZ5SrZCeNWohKGRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aR6HZESv; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aR6HZESv"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-640aaa89697so297339a12.3
        for <linux-staging@lists.linux.dev>; Sat, 01 Nov 2025 11:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762022515; x=1762627315; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UTok7KegtE+hWqafiACIx4A81nkydx+cdCDUtcavMV0=;
        b=aR6HZESvKFNTXwOQYtJpaBnzHL28eiTv2mMTIyoQ9gXb1AQ1V79dvWheFhtRXFi+RL
         fBCaSzCW8tCJW7uW91TX3XdsPx4nh9Xx9hud9WsM8UpVb7JUPCwrgpc/gbYOY7ZHjBx+
         CNl2uCSAItLgJ4g+GpMuuHIgnIuX5wF410TFPPaCl0Iq80oy6fNoeMrE2N5lFJrPo1vr
         LzagQeROQ3pHtRm/+5hzQeBVXYb8TGyC8Nc4TKsM4XbO30Jk5AlJHx+z4nzB438fObRw
         7oVUik5tKAW9c8Sqtap7zddBeRLmJuY0S0hq3cK4N+Dxs9hSA5mpmabwhCR4I0I/QSzP
         IoBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762022515; x=1762627315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UTok7KegtE+hWqafiACIx4A81nkydx+cdCDUtcavMV0=;
        b=ri+geW4fDtqbWAQTki00azA0vDdvWmwXYgP8O2jni49+4TRi3BHbAPPXcIaNHmx6AX
         9miX+T2FwskwIGvgvudKHQeycbbhCcn1/DhknM5V+iAZ9DDldyBvCMWJu3GoImv0ZksH
         wJhvPF6nWlKaWyUJzv2DFTyLCjdu6rHHoAPQ0vKFICrL/GPPMSqOMamqsCcZx1Td57BI
         g+XGn1IluqJrS7t4uM/OsGdw0fl0ihQK0557cUB41iJy6s2AkhcPbslmelBvQ3kMIJEu
         fPyRM6V/KuUmxktjtPpVMxfhHxKy+s4y0aEFJnDOuaVETR/5WxDXJ1LdEy09Kx7y5ByT
         46Mg==
X-Gm-Message-State: AOJu0YwrM0e6M1KhhdW8dsqt42iwef2xeRwemqsmX60zdTSw/eWtmmvu
	eCnpB06RoWUp4GjMtDBzie5c1w+dhsRbFF/SbsaMZsYaTzO+V1srXkJs5yDqSnE+
X-Gm-Gg: ASbGncsmUZSQ1xgV25xtGquQSyBaT5oKOlqbeSDYFAEGOtEMYpkAhV8sRnqYKb7+MET
	x6vKpveQwrCoK6GtEFBGZcciN3fdk+0EipLzYe9bmBF+vXP2zMlwLwQvCMBWR34FUpj9alKlAXk
	ZUq3393r71Uj49QrrhWGDeVFbL9KBAcFmjkoGnEudwbTjkWlvgKYQHrmKZP/BzInxUCJ0h6rFU9
	6QEauBhblq5T9IVzMKYL5kX9p+0Cn4Wed60/fSJgyR6q1XjWvRXG0lLGZPEg5MBxBIenY6E4zpp
	tKyH1QH0LgfI5PiF0e5FIOj9WgzrQ6plFgb+7Ke/uQrQfvLU2B5dsOb0f1pkTByeiloFB5xzclZ
	4At5a0+SEJblWruhkp0Zl+Rbufl62eLu/Azrm5yZ+wip+Gz1Tahc5lSZ0iL0YCsCB8q0sKUZt0o
	GPz1izIr3X0OUAesKnogMGmhdEyHjziSqkvc4aH3ygGn4x
X-Google-Smtp-Source: AGHT+IGt8N95GW0W00oKvQbSaZr9nH2wv4QAAFXiKHTKikfyi6vCLd+p6Q1l4SMgD9O94aWqHNvJfg==
X-Received: by 2002:a05:6402:2682:b0:640:8eed:562a with SMTP id 4fb4d7f45d1cf-6408eed58b6mr3935799a12.16.1762022514578;
        Sat, 01 Nov 2025 11:41:54 -0700 (PDT)
Received: from localhost ([2a02:810d:bb0b:f200:c13a:3288:7fab:6ade])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6407aa50e3asm4777045a12.0.2025.11.01.11.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 11:41:54 -0700 (PDT)
From: rafiqul713 <rafiqul713@gmail.com>
To: linux-staging@lists.linux.dev
Cc: rafiqul713@gmail.com
Subject: [PATCH] staging: rtl8723bs: remove unused rtw_sprintf macro
Date: Sat,  1 Nov 2025 19:41:49 +0100
Message-Id: <20251101184149.51077-1-rafiqul713@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rafiqul Islam <rafiqul713@gmail.com>

The rtw_sprintf macro is defined in osdep_service.h but has no callers
in the driver. Remove the dead code.

Signed-off-by: Rafiqul Islam <rafiqul713@gmail.com>
---
 drivers/staging/rtl8723bs/include/osdep_service.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index 8b1634f4091e..12369ee2ce1d 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -115,10 +115,4 @@ bool rtw_cbuf_push(struct rtw_cbuf *cbuf, void *buf);
 void *rtw_cbuf_pop(struct rtw_cbuf *cbuf);
 struct rtw_cbuf *rtw_cbuf_alloc(u32 size);
 
-/*  String handler */
-/*
- * Write formatted output to sized buffer
- */
-#define rtw_sprintf(buf, size, format, arg...)	snprintf(buf, size, format, ##arg)
-
 #endif
-- 
2.34.1

