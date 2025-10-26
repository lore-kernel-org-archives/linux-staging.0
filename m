Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A84423D288
	for <linux-staging@lists.linux.dev>; Sun, 26 Oct 2025 09:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761469515; cv=none; b=CQwLM+C0ImbVJzVDpyPk91sspJxqXUKz0Mm6QvHKr6c7FqeTQR1GWykMsiGH/fbUS6azwvXmZ0P+J1kkd9jJdIv0JIryXspJ2tZX5EITUy5UrnpGVv+6H3Rid5gBza/yKoYPYmZ6BWklZup3cVldmDs906S7eORkGydw3if0ll4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761469515; c=relaxed/simple;
	bh=XQk6PccgslfRJlE8Agx4FT1oMONWyUDZjfgjM4jutic=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UIdrB5hrVZQT752zqc2KB2SiPTZd529uI4chDES7f3W6HKZDPFM95ITDy4CuASMEOLHE5ZT9HDEe9W7ohNbgWO59cQrKCn9Ylb3EgMHiHQ5c6jstQzrOkgC+tTLfHMgG6r/pjtRgTOjSUws1Rp90DRRxBZbmrcnPAKYYHaGc4JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFa5PDqC; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFa5PDqC"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b50206773adso575735666b.0
        for <linux-staging@lists.linux.dev>; Sun, 26 Oct 2025 02:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761469511; x=1762074311; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nvVO97v4ezndh/4suStj95dwiUVrIax17huTHxAWW/o=;
        b=LFa5PDqCc9MTzzrAiOuZ+fOlk06/KG0m+HPFJDu4KXnUka0TL+6d9zLu31dK73mXeJ
         5CGGdOzR6frncHAVgecyPCcxGQ4nxN0hP5d/gHnJNV//uwzp1XuXV3tarr28r9kIgwLo
         1FedWGYVWaijemLZzpURxg/+FTUqctgRBtETJcdADuyRsdSlV+HfsPVxkKicyyMJHPsm
         YyA/dBLL5CG4htxUi3qNLk8yuKlWZr7gEFj4DiLF4XzL5/V9T80K2KYYL76cDx4ZPJuM
         mdfUDdi3O3BAyGphp3Swub1vB97BT238aFaeTs7LfORGIhbRQZ93TrniWbF6LT+br5db
         rx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761469511; x=1762074311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nvVO97v4ezndh/4suStj95dwiUVrIax17huTHxAWW/o=;
        b=YU8BIPAPokW3qKbwhP2inhPXiuHbkAh0QZad04l7pw+nhUPmtFBrT4zb7Qgpgd3jTq
         mREwH0DGWc1yxH47hzQ2AwmMXXJkF2zh543LgcA+46Ew7kuDpviCv4DVT/lkWfP/atwc
         8k58FlNfs2eMBK9xCsaU+M/BGd7pYhV18Q9XKKRLT64jR7HcSz4tOeLTtsctcC0mLFxi
         P16QWB5nkVwmedJu8WbypLp1LDlMWtdaYcyDHtUXvJMe5AeL8PV++xELNkCDnnHOsKnt
         rnd+UTrEXZM97p2se1l9nWV7XAUGsvmOS2rQ2bNv5zreCjEEVCncsG6vI4KNiBlp7RZr
         P1wA==
X-Gm-Message-State: AOJu0Yw69xeTK1wy7JBbP9ErGpLQNOPbxZigXDlcPTprAeyq+VvVR5+J
	HD4PjTWbWUKwftxyHyYzMuVaJoiq2hrDTL3bKaD5dEDaGfHnoPN+hQ0yPYAjcQ==
X-Gm-Gg: ASbGnctVIWRXUPIxbU6SnzoKDSznKUUoZ+KnZqaoY+Tf3Go9Y/+Zq/64fOhF+A4XC+r
	roMCEVfFcNkK/fC79w60IYGEV/yfQ6zRRC7PffIsDZno9UDjrwFlALJXFIP8kc1E0a4Sv/0L1fO
	rc+uJQQH/FMa7dzRovh8WdZNqRJiUkdg+aAAO0EDoEvkTg6SloTiYt8QUs4WpXzRJGafxqtVc9C
	cGY03ZzI0qDURTehxHgx21QqEur5OJhZ0516bpLVFnEkIk45E/5Dq5RZB6MthOhEMO1jOegtmhB
	zT34xOscgVK1vnAc1YGQUErKCJ72/s1pvuClJdyeuxakUqBkttQ/1RfPrRQ+p+xqHjCGglZOpO9
	kFM29HaYIT8C60XHc4P34tIRDrRE32aVvw1v0LsI6KOFWj7Vw3teigRl6YGB+bXD9X7zyYwg33F
	Af4N/IKmYUwmJnXEgogGAy4OreRUtNQD5cyo7Yz1+AXXgfan2xXzUefOyJx5hRvRTeCpLeCww5F
	txs
X-Google-Smtp-Source: AGHT+IFc8uWUaysS4KSE1AO86FXocgFgOapclbWr3/Bi9ABSBZAi2UU1bM1URvX866kKwdtdDQ359w==
X-Received: by 2002:a17:907:6e8e:b0:b6d:5d00:c03e with SMTP id a640c23a62f3a-b6d6bafc7e1mr969877266b.11.1761469511033;
        Sun, 26 Oct 2025 02:05:11 -0700 (PDT)
Received: from rafiqul-GF75-Thin-10SER.. ([2a02:810d:bb0b:f200:7726:b432:b66f:d982])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85445e75sm406783166b.66.2025.10.26.02.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 02:05:10 -0700 (PDT)
From: rafiqul713 <rafiqul713@gmail.com>
To: linux-staging@lists.linux.dev
Cc: rafiqul713@gmail.com
Subject: [PATCH] staging: rtl8723bs: replace rtw_sprintf with scnprintf
Date: Sun, 26 Oct 2025 10:04:38 +0100
Message-Id: <20251026090438.116509-1-rafiqul713@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rafiqul Islam <rafiqul713@gmail.com>

The rtw_sprintf macro used an old-style varargs macro. Replace it with scnprintf()
to ensure buffer bounds are honoured and to align with kernel conventions.
This change is a safe refactor (no functional change) and improves robustness
against potential buffer overruns.

Tested: built driver tree (module build) and no runtime changes expected.

Signed-off-by: Rafiqul Islam <rafiqul713@gmail.com>
---
 drivers/staging/rtl8723bs/include/osdep_service.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index 8b1634f4091e..019792d0595a 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -119,6 +119,6 @@ struct rtw_cbuf *rtw_cbuf_alloc(u32 size);
 /*
  * Write formatted output to sized buffer
  */
-#define rtw_sprintf(buf, size, format, arg...)	snprintf(buf, size, format, ##arg)
+#define rtw_sprintf(buf, size, fmt, ...) scnprintf(buf, size, fmt, ##__VA_ARGS__)
 
 #endif
-- 
2.34.1

