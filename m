Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED9F22EF8
	for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 23:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714345275; cv=none; b=tBUHs2J02zGsgGKRFni7HERcO5RfZNf7RgOpjSLbRIX8gi8vRbr6Qa4aUj4YE3yMYSLnMNWBTAqQBwkBl+jZvJwc020wHjRQ1mVUdt1CnB8hpVWFeQWFZ/dm838xB9/r9h82+A13KdMtvuNHneucibh0pb1up+jdnzobm1VDn4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714345275; c=relaxed/simple;
	bh=YfrGStHbweVnCvMwn8UTPUZKQBrHkwiqrt1nr0sCsZM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uRLaX7u4Qf0+4RRwMqDawbX8NFRi7rLwQ/TC8l9rJ6sMe5xbZ4xmRioWcw827PLW6hRrNXPfw8kJLNa17nUB5/o6p2NTlF2w9BVz55b6r4UKh9o+bxKiDld7LuwxlKBb+S3W7Q11MghmxzUcMH7hfWJtsFSRgeRGc5e4SBlJcTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=C0xnsFoc; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="C0xnsFoc"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso2779489a12.3
        for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 16:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1714345273; x=1714950073; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJeJ+1XziadzZSEMqMnXKNKhDjbxY+G/WMn03aFRDbU=;
        b=C0xnsFocB688ql0bGO8CjxM0bL4av6xnPXsX4AHLaJ2Hb4G2qG8m23dAWtqvSXExyw
         s7JLaYSTfp6jaB+j3xFtuMevUK88ix82aIKRWB+fDHX1tHbY0P0YfIXjYpkzjsqBl89p
         g3HWlxtoGdjddqsNpUclm4XJytwE+VfDjF+LhjpXITXFuwj7l4E1/TbkZjVW8FPfJuRi
         WIuDB0UX9vuXJaIsba4a01W7y+MISzALuCTX8yy5KvErmnZqY+DukgdLWu20tHxS9bX7
         sP2UcE3sNg/lawx6yTIfJPTprDw8wA2dd4pkLoDDr0pBxxpjwKLof7x9YriQhKTLXyg4
         ePhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714345273; x=1714950073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJeJ+1XziadzZSEMqMnXKNKhDjbxY+G/WMn03aFRDbU=;
        b=h9gPnHoxznJAbR4pFqclOUG/EVEQdrwOQ7eoC9QmJmkv4wpGvuziAeLGYngEJ1ErOs
         n+z1sYuw3givbqTpixLy48hkIc4A6wJt61YODDfd+ASnIcANUb+3oJWFhWlLl0FSMWVq
         TSfsZTkTSyLVH4fyYjCa2Oo5GzB/JMvvqbNIR94EdLQ7n3+IqWrn+xZABxGDrING2bOo
         I5NOpM9GUuGjxunFfMWxkZhV+MJzJbwwreNed0pqPoCWdQxgAELiNhVOh8ie2/9zP+Iq
         TkUv6LMjqtAD+FAAaLQ8KyWr+OAcaMkxgUOpCFRYzsQrYIwwm0sPXm54i7EcW4VBtFeI
         oDQQ==
X-Gm-Message-State: AOJu0YyyPrezQI+GkXacNtxrwE0wbuYmwjmPUJKSCDaARh+Ntbf8ily0
	0qvlHgQXcwIFMPgVRrLVxgKDY33cY1y81RHTv+XfHyvJuwdm5+UleAfbFPWrbeFI+janO2U9yzZ
	v
X-Google-Smtp-Source: AGHT+IGzPKnCf7hYz9wQBgtMqODuyuk28Mz5LJu+AKr4QFas/DZKtfxcDciH5KdVfrMJAS5KGLyrOQ==
X-Received: by 2002:a17:90a:eb03:b0:2a2:ba9:ba61 with SMTP id j3-20020a17090aeb0300b002a20ba9ba61mr9252623pjz.34.1714345273454;
        Sun, 28 Apr 2024 16:01:13 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id o16-20020a17090aac1000b002a27132ac02sm17860864pjq.2.2024.04.28.16.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 16:01:13 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 06/18] Staging: rtl8192e: Rename variable AdvCoding
Date: Sun, 28 Apr 2024 16:00:54 -0700
Message-Id: <20240428230106.6548-7-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240428230106.6548-1-tdavies@darkphysics.net>
References: <20240428230106.6548-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable AdvCoding to adv_coding
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 938be9c27e0b..fb3c0dba9d16 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -24,7 +24,7 @@ enum ht_extchnl_offset {
 };
 
 struct ht_capab_ele {
-	u8	AdvCoding:1;
+	u8	adv_coding:1;
 	u8	chl_width:1;
 	u8	MimoPwrSave:2;
 	u8	GreenField:1;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index b79ea0b42e44..6eb708ba80ae 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -251,7 +251,7 @@ void ht_construct_capability_element(struct rtllib_device *ieee, u8 *pos_ht_cap,
 		*len = 26 + 2;
 	}
 
-	cap_ele->AdvCoding		= 0;
+	cap_ele->adv_coding		= 0;
 	if (ieee->get_half_nmode_support_by_aps_handler(ieee->dev))
 		cap_ele->chl_width = 0;
 	else
-- 
2.30.2

