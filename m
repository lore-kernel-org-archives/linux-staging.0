Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445177;
	b=qfzv0qTJjpeW2FdePDijPUcAp5Ef1IBWnWuHshxcko2CONLWecX8GrkNaAjh2b5Krg8L
	 c3icDNXiLPdoZoKkwin7Nlgu1NLHHg3IE/f1krPe2rCLueC0a1utI9Ug9a5F90dGJWr87
	 4Vuz+gMUAwY3gPRCSY7xuWIaKK6auJkY/7Eu41O2QmLaaWCXgtxnNtBb00+/5nLCaoVOK
	 OVnAZdWPwXQLtI+JKCeiPJvvF4cy8SWBvLvJYnPWntzy34hRH3NJgXwsh+lpK5pzcxbrO
	 jwDScIRpPKYTjwZICWLRDjiG3CkRApoDbngx/Qxr+oL6PoMqLx1BIcO97sHz3od1UPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445177;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=A/Rw6c+v2xkYoeB0pzZ3YgrcWuL+BxFAVTdnLu9enUE=;
	b=XaDqGNsYI9TM+sa6DAcilL5wcOmNWChSwBbIz6V/dAkbsBxzAMtiFN0GXcyFkwUOf2fM
	 uJRQcoeUstr0I0IRrsoCxdzMUIdi+2MTi36XKjwJRmb8wzHe1WYr+ooqAPirZqJnM2xSi
	 Njl8doFh/IEJhjvdUagv4pNV3q8EKkeiQ+xOhW4WhdZmreqlmCY2xs1IlMrJu6p/gqD2C
	 JIcbGYg38oqxIZoz/YO7F2AgoVSO4mcPxUo/E/qwxYc9rcaW0tmcIeXqirv5NpQdCz81U
	 cHH24r71iDj9OChe69TzqOleOXkH4eTt/dTJyTVBdreXOj4F3xxl4mT2v/CW5LclNWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QzAtMliV;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A5F606A31E
	for <linux-staging@lists.linux.dev>; Mon, 23 Nov 2026 14:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34A5F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QzAtMliV
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so29683305e9.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Nov 2026 06:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795445174; x=1796049974; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A/Rw6c+v2xkYoeB0pzZ3YgrcWuL+BxFAVTdnLu9enUE=;
        b=QzAtMliVL5J55fh0j4e+j4OuCbvzp4nUf68UIsxV+Cl4zP3N04tIdMJtaTtK0eWmEf
         Iwrs4bgCj1iIgBk5kXcapfXkWicxh++UDHEZyI4wdyihpecqgX4LEzt/W5ND7yiOYsWC
         kjTmiHAScjOjvQciikDIEG/N4A/aGgPk80fkbSBFBtjnZqqIBUHH1WEpAofGxOevSZrv
         0d+dQA9LbsFDp9f2MpBCIW1gEHsCt1TKYXvpzUprvwuC+ZlzWEqGH1UkFl9FmYnyKjqd
         D4F1iT3ayAyB7PcvwBVkBDHT3uTEGQs+gxqvpkyRVNUpJ2GOsZnI7GiySc6b0PvwtWn/
         KPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445174; x=1796049974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A/Rw6c+v2xkYoeB0pzZ3YgrcWuL+BxFAVTdnLu9enUE=;
        b=XUdFZLZ0J8v62gmVJfo2xgcsDqrpr9m/02ayd2QKwOghOfsVDTeIJh4iiUNv5sy+JR
         kAkGWba68bJRWPeO8Medc3iJN/27ggZcpk+Tpgu5eokyI77Uql0V3rcphN7z25QyWmIO
         b77+fm9Fm4S23+77InkDiVC8KpEjzBCSCC0Lu73Bp0XQhuvdOgj5goCt3vKXq4yfzj8+
         SmNu6W0nP/iHIlU5ONEq/y+DkcFkq8tefLEVRyDJp7QvAqnaSnkxiht2Ko9Os+5bCxip
         2G7UKPXLrj76gQ3dD2Ws8X7AsS5cY4cBxUwF5Dw9FPOXHFfpDaxxeBoEmZFkRBgqBoIc
         yq1A==
X-Forwarded-Encrypted: i=1; AL+hErFXlZbHNiDtqJyCwnst4mGVYgXtpkJNXcdohVZbRUneGEMG6nvI1KBCptT0M7CqOg/fSUFqqPcc+LVoFyOC@lists.linux.dev
X-Gm-Message-State: APuU4Z9V3TreMQs7x3zRUlzSuatAUmTITbwezVI0EJBCqNB0rkafQmOm
	l4xOlbaKc97Wk51GKwtmDUw6Qj4WrzaWSdORlV9zVrds1ruzS1vu6Qri
X-Gm-Gg: AZFdTZdpY7pPn/1lSJ5yB2r/CrcsBRXd6M5kkio102P64ciFfE449TvFq0QUS/Zhn2B
	7awGMkSdLiIll1hVei0OEhd+Mi3Bq5ewLbKh7gIuIj1edNKckSWIGgCcUbDBAgP3RRKLsff1Y2S
	r/J1bSqW53iz3eEddxKkPu1WjX49ZwZYzdX3wKZlkMbVJk7GvhmHj3USWZbbzw53h5D/lhagn5G
	VchWafo7THM0vDMFOaAIpL4Ruf7ML+kF7sGgT56kGXWTitVhssFifPXGFjJ5twTKOC/8IFFyped
	p8VD0alT8c9r/PiHtzL0ouxe7xyY7S1WPaEEFcFUB7sf/Wb78LfwKwJWuSsyivbpETh4MXz5D3u
	6gydVaV91MNDlAr78zMnVaFXtaJ+ey9t0vYRHGub3AzhF4I1ZFU0sk4u9WmkByQ7J4a4JTQnpHQ
	mIG19Qe0QT7wSoDQS5T33EIKAzVClsmabl5LakWbd09yws6tf0GydAbfSaI8fSIV72T4xLRfo1k
	2q05J/Ne8s7YfBxHzpZY/k6dc4+d+bc/QCPy7IwRlRbpn2XwfOTL8DdL+wbYPVX0NoY00NZCbKh
	Agx5ENjpKUhF7AkuM3mjCU2BnEXaRc5Dk3MfQYCFIlpR2iar4K2tXwpG7enjB5L+w+4LxnPBpWC
	22rQV7ekXNHmUI1FyPXF2WCMYOszPcaU=
X-Received: by 2002:a05:600d:82d0:b0:4bb:818d:8d8f with SMTP id 5b1f17b1804b1-4bb88818955mr282302765e9.23.1795445174301;
        Mon, 23 Nov 2026 06:46:14 -0800 (PST)
Received: from Alone ([2407:1400:aa0f:8050:aae2:91ff:fe57:5e15])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm24104820f8f.33.2026.11.23.06.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:46:14 -0800 (PST)
From: Chhabilal Dangal <yogeshdangal66@gmail.com>
To: David Lin <dtwlin@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chhabilal Dangal <yogeshdangal66@gmail.com>
Subject: [PATCH] staging: greybus: uart: replace IDR with XArray
Date: Mon, 23 Nov 2026 20:30:56 +0545
Message-ID: <20261123144556.72471-1-yogeshdangal66@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IDR API is deprecated.  Use an XArray to track tty minors.  The
XA_LIMIT range covers the same 0..GB_NUM_MINORS-1 minors as the old
idr_alloc() call, and -EBUSY from a full array is mapped back to the
-ENOSPC that callers used to get.

No change to the tty interface or to which minors are assigned.

Signed-off-by: Chhabilal Dangal <yogeshdangal66@gmail.com>
---
 drivers/staging/greybus/uart.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index e1b73db6a..d7a136fcd 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -22,7 +22,7 @@
 #include <linux/serial.h>
 #include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
-#include <linux/idr.h>
+#include <linux/xarray.h>
 #include <linux/fs.h>
 #include <linux/kdev_t.h>
 #include <linux/kfifo.h>
@@ -66,7 +66,7 @@ struct gb_tty {
 };
 
 static struct tty_driver *gb_tty_driver;
-static DEFINE_IDR(tty_minors);
+static DEFINE_XARRAY_ALLOC(tty_minors);
 static DEFINE_MUTEX(table_lock);
 
 static int gb_uart_receive_data_handler(struct gb_operation *op)
@@ -341,7 +341,7 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 	struct gb_tty *gb_tty;
 
 	mutex_lock(&table_lock);
-	gb_tty = idr_find(&tty_minors, minor);
+	gb_tty = xa_load(&tty_minors, minor);
 	if (gb_tty) {
 		mutex_lock(&gb_tty->mutex);
 		if (gb_tty->disconnected) {
@@ -358,13 +358,19 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 
 static int alloc_minor(struct gb_tty *gb_tty)
 {
-	int minor;
+	u32 minor;
+	int ret;
 
 	mutex_lock(&table_lock);
-	minor = idr_alloc(&tty_minors, gb_tty, 0, GB_NUM_MINORS, GFP_KERNEL);
+	ret = xa_alloc(&tty_minors, &minor, gb_tty,
+		       XA_LIMIT(0, GB_NUM_MINORS - 1), GFP_KERNEL);
 	mutex_unlock(&table_lock);
-	if (minor >= 0)
-		gb_tty->minor = minor;
+	if (ret == -EBUSY)
+		ret = -ENOSPC;
+	if (ret)
+		return ret;
+
+	gb_tty->minor = minor;
 	return minor;
 }
 
@@ -374,7 +380,7 @@ static void release_minor(struct gb_tty *gb_tty)
 
 	gb_tty->minor = 0;	/* Maybe should use an invalid value instead */
 	mutex_lock(&table_lock);
-	idr_remove(&tty_minors, minor);
+	xa_erase(&tty_minors, minor);
 	mutex_unlock(&table_lock);
 }
 
@@ -991,7 +997,7 @@ static void gb_tty_exit(void)
 {
 	tty_unregister_driver(gb_tty_driver);
 	tty_driver_kref_put(gb_tty_driver);
-	idr_destroy(&tty_minors);
+	xa_destroy(&tty_minors);
 }
 
 static const struct gbphy_device_id gb_uart_id_table[] = {
-- 
2.56.1

