Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A841E5B9A
	for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 02:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773540618; cv=none; b=Vf/n0nFmK9PZRnUbM4wHYJBuOeVW+ecUzFa4DclP30kqRtJe433SRtk/THc5F36QWtNlLit0rhEHoP08lZTt2j2f2f7aNlNwIuS4k5pRaGZp3prmuNAxD1775b7b6koxLvLkoqwdIi6gu71Ebopob3AtFT4LAU2FRdGRDqcQOwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773540618; c=relaxed/simple;
	bh=a2JfFdLwTrfLb3pYWXyHPr0Naa4mLe2JXUh117ZEuEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vEGSCX2ZTb7xRINVDao96AbSICtK1E19zdmvOmMVmnXmvpD70g1EGQ6rTzJeuTJStnHIUyuQ9815sWRxlhpRXHk0eCattmHsCva9skAOZXHTRjy5UYDybYsYpY8KryY8QHJHjt3U/z756ZLjg0C+7R+G6zWdx80NnXpnCKJzix4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TSMpFyuj; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TSMpFyuj"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1279eced0b9so4433615c88.0
        for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 19:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773540616; x=1774145416; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmLskCsNdhXYan7TnrtJgOcXL0bPSgrclhLnVJw41D8=;
        b=TSMpFyuj3Ugert9OQCGdxxKRTLZ9kLJhS7xXom9QvLFpjzciZW7UXx/JQV9UQKhOB6
         4uuItLVQy/xx3FROPfk9Y5dTs35AqWk8BK0l6n4h/9vTpEr9/aYkSoYxyMbB3j4rbAJH
         GY/2Gij86wd9lKpsgaAYtgEuCOXjk9mAHTkcdr1XHVtT9smS9lld/pko/o4WEAEcRGxh
         Houh3fSWWk4tTw9+jqc2TKggZ2enIQrOc6tohgYL1txYo8C10EL/G1675ZwehXRs31eX
         QEsB10Uyc++5e6BOX63onKquNuqq+0AZZOKy1mtFLoYEXYosKwMMEZMGLb7H2+pJ7nbl
         6I1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773540616; x=1774145416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UmLskCsNdhXYan7TnrtJgOcXL0bPSgrclhLnVJw41D8=;
        b=J1sI8Vfh1udIa1QlGk2vcFYdnZuxOeTRiiCwBsVZtxQ3CptCT56AKFNooFibxEx4Sn
         J5wvJMq3CQyUMUMF2LG59kY9H70Ij3AM/t1gf1tohb/jjtdU6/VPSiMq3vCveLXS4N3N
         +g+I9AavSJo5YUxM9ZvvQTsCiLyGVsddsGAY6O4431D/oCVMEbz42poJimNN+onIaE5h
         WhvuJEqapYbGnzh+EVwaWZK1fptCWURM8nTA7nZA8eAXIw7UMh/iLAbsDalNZ0Pox4Qd
         Q1Y7pnpKzsQ3WmS7G1jdqLO8o8WKg8lcYF1so2+sgp1ZuJzbZ/Ojzahb/dm8my/kBY/a
         VNuw==
X-Gm-Message-State: AOJu0YyMs69hl/riTTkNQfZMkz2pOZ67MwxKmkp/bM9VlS8GdIkkvyuF
	/vZmfpUjzO6DZA3txdrV0J+aVUeiV8UH61qymrEllXGDt889xc60YkCt
X-Gm-Gg: ATEYQzwhUTtWEi4ievhvrTj3/Q/wZ+H41HE7GN5FS/XR/YfHc6YkRT9Ex5WWxwVnKJN
	o+34zEimlc4pxMTjLj+sYhV0O3Fi5BGR9fEwXzW5imptk0Getc0xlDumAZNRSWoLrdCWJNnCUJp
	Fs3Ft0OVhIyM18tpY1AVUcmOL1MwbuYJv0m+rilj6pqKV9XSyHI3UGjALTQ62hUev7dM6KiHA9O
	L7KfIZGI0GSFZg6Rx3Xxxg8y0EaWmwAUqWbuW0Qg/SmiANjQtNXUzXdhb1M9da2ldhGKanzZ1Mm
	gMvVjqNGVv/Fv2nxbvvTVSkBYP/C5oZQMX7ypubHNBT0D6lPgpd6T1LpMiLrf4BlKjTD80i2eOS
	/wspUZiehNw76sp1F4E8waBt7KIAyuBQNVTrEpqAcnj0PwxyWlqlHMnHFVvGFf4jSwZ1Dgfduug
	U7/EXzzmJeKEkCO/dsBClUHpgkVQzgYgKokH1asRb5I31XyQE=
X-Received: by 2002:a05:7300:7c15:b0:2be:85d4:4a2a with SMTP id 5a478bee46e88-2bea5398545mr3378054eec.1.1773540616374;
        Sat, 14 Mar 2026 19:10:16 -0700 (PDT)
Received: from mjmachine.localdomain ([131.255.96.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab526f9asm11012192eec.19.2026.03.14.19.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 19:10:16 -0700 (PDT)
From: Marcos Andrade <marcosandrade95963@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ethantidmore06@gmail.com,
	Marcos Andrade <marcosandrade95963@gmail.com>
Subject: [PATCH v3 2/2] staging: rtl8723bs: Replace msleep() with fsleep()
Date: Sat, 14 Mar 2026 23:09:49 -0300
Message-ID: <20260315020949.50149-3-marcosandrade95963@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260315020949.50149-1-marcosandrade95963@gmail.com>
References: <20260315020949.50149-1-marcosandrade95963@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace msleep(10) with fsleep(10 * USEC_PER_MSEC) in _rtw_init_xmit_priv().
fsleep() is the new standard API for delays, as it automatically chooses
the best sleep method based on the duration.

Suggested-by: Ethan Tidmore <ethantidmore06@gmail.com>
Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
---
Changes in v3:
 - New patch added to the series based on reviewer feedback.

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 4062fe0c1..dab16851f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -5,6 +5,7 @@
  *
  ******************************************************************************/
 #include <drv_types.h>
+#include <linux/delay.h>
 #include <linux/if_ether.h>
 
 static u8 P802_1H_OUI[P80211_OUI_LEN] = { 0x00, 0x00, 0xf8 };
@@ -129,7 +130,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		/* Tx buf allocation may fail sometimes, so sleep and retry. */
 		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
 		if (res == _FAIL) {
-			msleep(10);
+			fsleep(10 * USEC_PER_MSEC);
 			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
 			if (res == _FAIL)
 				goto exit;
-- 
2.53.0

