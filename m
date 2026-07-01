Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE113603E8
	for <linux-staging@lists.linux.dev>; Wed,  1 Jul 2026 14:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782917963; cv=none; b=E8Pv+ToX++VpTG/9XhGu7EYmTvxYYn18Sj/6Vlk8chhMfS641Zej5aNWcxSjQnQvLIHNhaxVl53OBkJUQmeRiKzHYf+2iYuhKobadSOgLRHtrJLw2vpBOQ+gLNcft0QUMSWmG/kdhb1X+LU5d/un7gyDWEalr6xYvhuxOYwjlQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782917963; c=relaxed/simple;
	bh=PTHQsTM8MRuL434WLc46dhnKvnlnoQUZUYCKAliYlds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IlNSaNvu+fybWmDBqbbGIhPnfYtp4oGvnxjdsfcTSeqMXPAc9zKbeM1pb6ZFCTUCSjXXE7TPbEfKDC5TjCGzRsbwubmugeHBubUR68Y0zlOKcHicqgRTyDhVg7AZU9ybvKy4aFKWIhfkslWn+7HDtzD0cPnNq+CoX8+FKtk+plA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kO6Jy+Fw; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kO6Jy+Fw"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-92e663c828dso51581185a.0
        for <linux-staging@lists.linux.dev>; Wed, 01 Jul 2026 07:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782917961; x=1783522761; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2BQXSMHFztfH7T+z/2IRYZNwTDxo35iQXhFNQEIAqus=;
        b=kO6Jy+FwgSmqEuvIRedpRsEweIE0rDgIJfECaGvlnjpNhTS6SWCD3Y/JAqZXxiAVOm
         5O9hToNfaMI6g+ICaeRWF24VcmYjP/nc14i97Pm1wkMr6ZOt628SyUgbDJ4MauRkvx9O
         pivTP7HlFzhzz6BUSzT8IFh5uNHxHFmxwKJRHFgVdGb/cz2EZnkvCbipM9wMh3V6iZUb
         ueSBz6HFWm0LfitvOYt02Hte1LMXqHN7c1AC454FIPpDoTP5lpkK8vFthF/Fz01MuQh+
         gyVH0FgUl7xeOqrj+W4i1GB4PRhTDvGjbf8ZnjLxnkq2uZQeJlQyXf+xfi2XldRiRneG
         QIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782917961; x=1783522761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BQXSMHFztfH7T+z/2IRYZNwTDxo35iQXhFNQEIAqus=;
        b=A55FR5wLmSWqNcV8g0KSkDNaGWmg8aNVMcFor18DJZNbEAuMApKVnqkjZ45MQcBmdb
         sO9bdqUrzMuPayH0BSRjdSYH9LBservgG/qmVbvzmG/FqJgfmKKOuiuvsmSoo2vySK1y
         6jtC/q04HOEfdmNoloIA2cu339uLxQYeadMztUz7Xqy+EV09M2DYvfYEU5udNbwDuTul
         ThIdJfBq6/P7wJmLcCbOCumuyIRWg154tdWpFrZy9yv+SI4RBhzEx2b6BKc2YHFH/sAW
         esYYOoCpibh9U3yoZcrCsxnWNLHc3kN2rciTGp6jLIZTvQ3ua66/WUjwISQjo4N9Lt+g
         jKCw==
X-Forwarded-Encrypted: i=1; AFNElJ82EtoS0LBTY9HM0FkMxcOxYRpxonaEd1Zhv1fSPFg1ZP2pcJ8Zs0DRP5Ge5iisHjxZUiNHG+yyOCWAr+nO@lists.linux.dev
X-Gm-Message-State: AOJu0YyJmt3Fcjvei5tG+hPG6CNOVQjzqrZ60NK6sMYdXW1QSu15kX+v
	ExRvfxcJ6/9uVEUZwc+whKC3gdydIxhjtFN9g1DU/ob9WXwKsxWekf38
X-Gm-Gg: AfdE7cnCxwfMhe08papl8zotI0JeUYBO8fUivt/3eCArwvfqjWCz9vJmKZPbOz4JXho
	X6yJkdaMqXWoZcbDzPRO78PzRSP0EOr/wlseijJo3EIFkuxROyoaMMHz97qOscuVGhj3kT2vszG
	MeZTgiyiF/WP0YFFpoRXyN8lsvpyt6+YZm+13nTqdERi+76LT5IIOgjUyLzlKqlU78zmuwpXtez
	+1Cav7OVkz+AEb7i81sn0GqufACYiG5LN5KsL3JhOV4pIT5NDji2LYm+/ouIUezIMSNRxk2kTzA
	eG68IYtNxugEYrI9oso2/oIcYOKusxORilUHHYaOgIyYTj4HSdofLQj8wMkLPz0n03T1nz0JmC6
	cXdo+N0GvtUkOD09zNBV2XJ0DaxIlBBU3P86aHA9FvI0ut+mj+oCam25Y/e3eEI6Kp6z/DtW376
	zCH7IxE5LAK1ozOywJqcPXa+lK6i9qlMn5grDfHXYkSXI=
X-Received: by 2002:a05:620a:4728:b0:92e:5b63:224d with SMTP id af79cd13be357-92e697c13a3mr877511485a.26.1782917961164;
        Wed, 01 Jul 2026 07:59:21 -0700 (PDT)
Received: from fedora (c-69-141-67-19.hsd1.nj.comcast.net. [69.141.67.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f3619b66d5sm23831366d6.37.2026.07.01.07.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 07:59:20 -0700 (PDT)
From: Aditya Tipre <tipreaditya@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Aditya Tipre <tipreaditya@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces
Date: Wed,  1 Jul 2026 10:57:22 -0400
Message-ID: <20260701145722.122847-1-tipreaditya@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary braces around a single statement
if block to address a checkpatch warning.

Signed-off-by: Aditya Tipre <tipreaditya@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 1d37c2d5b10d..cc05decd4c76 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -256,9 +256,8 @@ inline void rtw_set_oper_ch(struct adapter *adapter, u8 ch)
 {
 	struct dvobj_priv *dvobj = adapter_to_dvobj(adapter);
 
-	if (dvobj->oper_channel != ch) {
+	if (dvobj->oper_channel != ch)
 		dvobj->on_oper_ch_time = jiffies;
-	}
 
 	dvobj->oper_channel = ch;
 }
-- 
2.54.0

