Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DDB126C03
	for <linux-staging@lists.linux.dev>; Sat, 23 Nov 2024 21:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732395816; cv=none; b=lp45cu/NPOXPTy3pAAFJcgrgezY8AYha+PSTa66t1bIJkjYuMgyRKjs7kjfIdekKUrOQkGbPC3dpfNrzu1cwOrHcYmMF3wGsju3cxf0CrBmYsZ8NXM52+126tB/ECjyBscEsgfDiwmUUAOv4c4IZoWzYUCgcUPY7upNxgB9sWFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732395816; c=relaxed/simple;
	bh=oACSu+Avk7lZ57Pm+3Pz+8E6P4OpPAbWEMB/Piftqq4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=DodVz+9IWdasqUmQxDlSzY8RvG7wUi4XY3GsA8+HDAF72Ojfyzxb3Ez3tHlyFSVKqcxnYUKvXZn7gvmVoFdijdZ3Pobzw8RTCxkISGT2WywMwn0MIT4Qw5WoGeWoa40VvkPKlrxKNzar3AaablYFC0QSivm53uydlWpaFMbaIRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=In6CvKQj; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="In6CvKQj"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-724e7d5d5b2so1520283b3a.2
        for <linux-staging@lists.linux.dev>; Sat, 23 Nov 2024 13:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732395814; x=1733000614; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wdKm4FDkmDyRgfhgE0vARHSnx+cQUlzvSrH+ytyJhCY=;
        b=In6CvKQjnxc7DXvS6mSQ31v/hhFhRept6j9GkAHs9kwoV2ndVCxEae7/NnbaZInBM8
         LMYzBWzfhmi4lxe/fEUWMtx0mObJXIn9LR3ebjrrg12vLfNjY9yooR6U7JEYibgGm5Dc
         bb7w7JKp97zNLQLk9QA83ArMK2TpqvcZ379KUP32g6hr+6CS5qF3OZLLRIY+HB7SWd7O
         2KP9V6sy5XnAcvmLASjFdb82mfiqLAHkIVRyYv/hrB9X6B7TLmRNVoNEQpWL8jK2U5Lv
         i0CUQtH9Xdd5FnPqOgYqqcfpYUqyHLm9iMrgpBJeSs3ruk0PlyKXD0mqOYyZBx6x49+B
         kzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732395814; x=1733000614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wdKm4FDkmDyRgfhgE0vARHSnx+cQUlzvSrH+ytyJhCY=;
        b=fN6gMFMuGuUsg5Ci7mGWB7ZYz3zY/c2/v3S5LUmBq87EFLY9sK4qOnrWEpsA0+aGIN
         OncJnE6uVDL0QsF6b7klhuLw25uwwloSLqZVa2CD0JNmHDGnQ8eRE8+SI2MlJQ/GYASx
         Oo4mAjr3dTIm9KAszTWMQ4MWzIj3Sa5V+SiE7UsKOsw9sXZ1f2Zcb9wdmRG9ksgBMFk1
         cJ7Ql1OTQB9gJkVO+B+/OnhLDfVO48ZcU+aB35zDBA/okeJZyFQAlPl9h8V/gvVRYT0X
         0LIZ0p83AS9QCZZc6r3YiUYKgujyTD+HJSm24l8ABoAxFLj8NkPJVOGn4URDnYyzTf8m
         GrqA==
X-Gm-Message-State: AOJu0YzV8zfgnJ2OwB8SskuPVuDaaqrqXjsIAzG3561N+gzZ17F98j+O
	zc80ENgT3mP2EcbNoW0mdUtcZru31Nxi9hSNj7QXHfwqT8iWzKm1/Q8qeQ==
X-Gm-Gg: ASbGncsvdHmxPVh+ZwnbbuwcGIOxyibiKzxP7pQWdhHEu8GefYwrTgaXWyqFoB9/2+v
	flp7m4VOIZGJe8qMVI+EFK9ySyhXYzB7VyW8uv7V/CguiMlKaTU7mOTE/36QqKu9d1mHpGryhPB
	pNyIK6MX1FiQcnAPux23j7L860mMe/Hz0IaNQTD8PpACDdvEVoF6b9z8mNgSmZfDPYJ2sgVp3Ir
	rZNTnUHLe5NEmBjdStzk4W61O7H4DQtlMY2jBs=
X-Google-Smtp-Source: AGHT+IHl4Dy5JjSZdS+m0n3/mfZtwDuAs1ZSkxR9su8AVJvd1UfLe08K7D3vtdjCJraksqWrjjdgNA==
X-Received: by 2002:a17:902:ecd2:b0:210:fce4:11ec with SMTP id d9443c01a7336-2129f67adfcmr115873885ad.1.1732395813726;
        Sat, 23 Nov 2024 13:03:33 -0800 (PST)
Received: from fedora.. ([2804:14c:64:af90::1000])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dbf9d2asm35677565ad.126.2024.11.23.13.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 13:03:33 -0800 (PST)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] staging: rtl8723bs: fix pointer initialization
Date: Sat, 23 Nov 2024 18:03:06 -0300
Message-ID: <20241123210329.70906-1-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Separated pdata and ptail initialization for clarity and to avoid
potential issues.

Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 8f2c0c7a39bd..e161538e07cf 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1467,7 +1467,8 @@ struct xmit_buf *rtw_alloc_xmitbuf_ext(struct xmit_priv *pxmitpriv)
 		pxmitbuf->priv_data = NULL;
 
 		pxmitbuf->len = 0;
-		pxmitbuf->pdata = pxmitbuf->ptail = pxmitbuf->phead;
+		pxmitbuf->pdata = pxmitbuf->phead;
+		pxmitbuf->ptail = pxmitbuf->phead;
 		pxmitbuf->agg_num = 1;
 
 		if (pxmitbuf->sctx)
@@ -1526,7 +1527,8 @@ struct xmit_buf *rtw_alloc_xmitbuf(struct xmit_priv *pxmitpriv)
 		pxmitbuf->priv_data = NULL;
 
 		pxmitbuf->len = 0;
-		pxmitbuf->pdata = pxmitbuf->ptail = pxmitbuf->phead;
+		pxmitbuf->pdata = pxmitbuf->phead;
+		pxmitbuf->ptail = pxmitbuf->phead;
 		pxmitbuf->agg_num = 0;
 		pxmitbuf->pg_num = 0;
 
-- 
2.47.0

