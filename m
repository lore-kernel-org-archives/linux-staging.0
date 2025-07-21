Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B2B2E03E0
	for <linux-staging@lists.linux.dev>; Mon, 21 Jul 2025 16:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753116287; cv=none; b=HP6gnN4geoJC+ZiPTGQ8jzZMejZG7nBjNKiy9MvVRU6vQuCtPPy1Gx7ey0Rm1os4RbVR1KJZOyVPGlOyc5KT0qYiaW7Qq29TGKIJVzu/cspiBQezV256k97vb3l5B5m3HPM3XUCc7DEGx2LJVfj8NIlVNC+uAQuDkhuZ5gPSPzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753116287; c=relaxed/simple;
	bh=1J2UIt1/++cEIeXiIaXaU5l3rUWWsg9IBhLXYwqa42E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=golBFArQVdYwCq+TQVFAWHaBPPKohQzI05h6Lu0UooR4AE+3spKPXD9lOWxKO6cfzfT1wI5nn3efhwRisp65Ook+u0RejWVVfdihE65045vYYUZ635wkc6E1cDOnmy3CSzNNGsIEW2gnQYNtzyeL263TzSBvXqOgzvj5kJCMXuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wt7PWBXs; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wt7PWBXs"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6088d856c6eso7860533a12.0
        for <linux-staging@lists.linux.dev>; Mon, 21 Jul 2025 09:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753116284; x=1753721084; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGcYfMvKQ/FUSKqjitpjkfo3TUjrMEXu5wiAHdK8B9U=;
        b=Wt7PWBXsSMNslVlewwbVeLH3rKVoccqJI/Xji4B6d0PVImSvCzG9jo9vfUtFnvohwl
         jmEEctNBv0xtTCp0slCqw//ooF8NapGGVjOL/i9oopmzkuGLEoi3mT2ZlMptArdJpzEb
         4uz0iKi3tPMYAABwJszKLAxZCilOHT1VeLfL/Kj77SgM5HnIenQoP7D3qOC6kgp/uovu
         aM1w/kgU/QmtnfPsWqkBmC0MLTJ5/zLpsv7vdjHGB5UdqUTX5WeeoMur3+66ANLj35iL
         LUhGZXjd2Qx648ArGmzB0j1tlZFb8knIfNRSRvgwqOaunMAWznpO9Xx8ee6g8J31YCVq
         9oMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753116284; x=1753721084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGcYfMvKQ/FUSKqjitpjkfo3TUjrMEXu5wiAHdK8B9U=;
        b=bFLGdue5T9xp7ej2orOyMjNntdtTRTJoyw2pkm05Kj/r4rp6xTrb36qGcpI4cb3xFR
         rgM5xUo+0eYyV41pa+rbjUM12gVMoIaz5FUpGxWG/eX0ZtBMROQEI0/VKYHNm76lKaN/
         qIivrzGYRQPe3/I2m1vKL3K485eRwr6x0PSGa727PE6HaVACMGadbXCDdghOxsTnHuRT
         wQHYF2Gqr87TZxuTNnkX/LsvGyG+2L57F2dtUXHTELXQL3jsRCFqoUUoCP3LKkjvCfFL
         cURqT8lvKTQdXTqvrCDcb/kezGlfBxm1GjaW+f36jAcxXNiU+JtDJbRIItztr6fVCgjg
         N8mQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1tefn55MGdI4q7agAWLgfofP2y7wR7Kduw3FlG1HuThvKHOz5X9OsllBZnKKvvEmOKsfN1deGnqoM1JxE@lists.linux.dev
X-Gm-Message-State: AOJu0YzJwviTjp8WTjtJQi7iT+3jN76+E8fDmpBOJpFTUqQoHP52/MNI
	oKnOYjf53kWz0kyEOoE18P60VoKnpHzi82KxjQWL1ShWf0VmGoeGknRo
X-Gm-Gg: ASbGncuc5Alin2TABHs+URfTB7Xc6wCpt0mO4rIMzwCh+mDcAGhK0jbe0c/aSAHuplm
	SV+BGm6stHBJva8JgqjibdRTT1+xn+WxhNSKwLtRSsrYRBc0Fi0BYLL+1sH2InWeHeJ9fsgHfze
	VmtA/su0Dinzy6S6b8hmalbTQ/tqwxmVvg8+XHTJ3i9N+aCAWuvZJ+oQL8cZNeeKaZF3hg3QN+m
	/dl7yQTv3Pp4IMEfsw9tQRaD3KdgKOrGRdmoEPisyKnb33q/8rKBL6GQ7kt8mMLJE3oXXoglg2v
	j9nmyYxGyC+PP76sw3wWP1K9NWz/x3S5mQamJGbnqMEclc3A4M9bwUABRbG8wnVKEoHu/6cVmOL
	mY+m9KrLcAreyQNX//k8=
X-Google-Smtp-Source: AGHT+IHWoTcxNymJShB1UbPuaN9MrUzPk8urCiRbLaQM2bKMOLhHbI/7xBsOFKjPmx/IIazECz07cA==
X-Received: by 2002:a05:6402:268d:b0:604:a19a:d84b with SMTP id 4fb4d7f45d1cf-61281f1d19amr17229801a12.5.1753116283936;
        Mon, 21 Jul 2025 09:44:43 -0700 (PDT)
Received: from zephyr ([77.237.184.54])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-612c907a5b1sm5662655a12.53.2025.07.21.09.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 09:44:43 -0700 (PDT)
From: Ali Nasrolahi <a.nasrolahi01@gmail.com>
X-Google-Original-From: Ali Nasrolahi <A.Nasrolahi01@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Ali Nasrolahi <A.Nasrolahi01@gmail.com>
Subject: [PATCH v3 2/2] staging: rtl8723bs: fix comment style and formatting in osdep_service.c
Date: Mon, 21 Jul 2025 20:13:43 +0330
Message-ID: <20250721164343.8395-3-A.Nasrolahi01@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250721164343.8395-1-A.Nasrolahi01@gmail.com>
References: <20250721164343.8395-1-A.Nasrolahi01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ali Nasrolahi <A.Nasrolahi01@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index a00f9f0c85c..60c3da009a5 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -7,9 +7,9 @@
 #include <drv_types.h>
 
 /*
-* Translate the OS dependent @param error_code to OS independent RTW_STATUS_CODE
-* @return: one of RTW_STATUS_CODE
-*/
+ * Translate the OS dependent @param error_code to OS independent RTW_STATUS_CODE
+ * @return: one of RTW_STATUS_CODE
+ */
 inline int RTW_STATUS_CODE(int error_code)
 {
 	if (error_code >= 0)
@@ -152,7 +152,6 @@ void rtw_buf_update(u8 **buf, u32 *buf_len, u8 *src, u32 src_len)
 		kfree(ori);
 }
 
-
 /**
  * rtw_cbuf_full - test if cbuf is full
  * @cbuf: pointer of struct rtw_cbuf
@@ -204,6 +203,7 @@ bool rtw_cbuf_push(struct rtw_cbuf *cbuf, void *buf)
 void *rtw_cbuf_pop(struct rtw_cbuf *cbuf)
 {
 	void *buf;
+
 	if (rtw_cbuf_empty(cbuf))
 		return NULL;
 
@@ -226,7 +226,8 @@ struct rtw_cbuf *rtw_cbuf_alloc(u32 size)
 	cbuf = rtw_malloc(struct_size(cbuf, bufs, size));
 
 	if (cbuf) {
-		cbuf->write = cbuf->read = 0;
+		cbuf->read = 0;
+		cbuf->write = 0;
 		cbuf->size = size;
 	}
 
-- 
2.50.1

