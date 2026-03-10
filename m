Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE0E2FD68B
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 15:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773155812; cv=none; b=qGbbw0Yh0HKTuD9GlsVNNlSWirQF7rCCaZIER/XiO5cg7xtNGFblzMkDkrzPT0MrN8tDVg2XQROBZetCdKlqVsgpMfvejpXZZmE9mkZcHSJyFf9zZwteATt+3KuBcuFJFi6aqtwBscBtFjHjBemMfcf4dbMWWH9eq5nK33gS8kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773155812; c=relaxed/simple;
	bh=JY4siVVVZNw6dLN+yhSjmXaYBYaIqrpsP0bqJxBhQlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NbtoQK7DpHNRj6GS3IZG6MAk/o76YzABUFXhyvvoi5l7bigjvTCY6m9CGZFzodC0vwgnq8s1iOtUtY/MDXDotM6Ai/Zt7iAZUO4C3aFeb3GW/sufmXmB+ZCjjVP/REiEZgkXQZM6s1mOJKJ3648IRwUFrAvSgX1Rb/WGcTqnybw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KZrwqwFa; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZrwqwFa"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a140efd2d5so4751470e87.2
        for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 08:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773155809; x=1773760609; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgFBQGsuaCat101Xr/8EJ/BXTvPaV1AbFX/4sWHX6pE=;
        b=KZrwqwFas3UXF/bP87tvwgFpqpBAeJPf1J2591/Lpx73LQ71Fjj+7/YTd2yD2yyFuX
         EWaIB4uhyXJE1y7o7yrgW0u2hWRJWBzWp52KnIunYmaJu5ei2qDoLGrZ8qJbd5g56fkH
         4soP3elZz4lv/Us/ENDU65HaC+gKM1oxPFrAo5k7I1z8Wa9Fihr0r0wdos04dzJCjvGw
         QNLN1b0SdsicbTTmfiWvm/7Zf58oputhtM2B6XrqH7bk3+Zy4duxSf/aMs7Ljm9geubT
         DA9wK2kfLzUntvq974caIUHU0zwcMaIzExmMiCTmXp/7boyOlc2biXayw7YvGaYsxuG3
         VGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773155809; x=1773760609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HgFBQGsuaCat101Xr/8EJ/BXTvPaV1AbFX/4sWHX6pE=;
        b=HcflYlinBewL0sFN/ET3RU9yjJ0kjoOTBajEkz7Mds1nU1mgEuYmpp5G25UHeqSjD9
         KSOkQ8NXh+2+XswC4xHS/KwOw+1pO6UvgBCADLHRO8qSNpBH9r+vCoONyAoVC3ljNkBn
         kfCbZefDuPa4xFVXxghi0RgKEh/O+0GMRUMkIQqYivxwr5Y8GBd0deStOllNXsjfTP2v
         AIWY1aCqY2rTIMeMsxM2NDwfkx7Lug/gxWY2TuFer0Y2iz9aUDt5i/jj6az+rMlBhhsn
         XOdPnxcbMqKoOztDQKQkPRh1aTZjeTHrBLDv6zJRfQynLtdhIJSllL5a6FE9kWCWYY0F
         6WEA==
X-Forwarded-Encrypted: i=1; AJvYcCUxnEAmrpjRzhd3txcvLP1itoTSHXEB7k5hctIgmrERXpId1O9HDQtMfhMSkFvFnzqE/L+Nerqi6hpFbJ4l@lists.linux.dev
X-Gm-Message-State: AOJu0YzBoeUEbB/nmY89eR8iq7s4dS092x9QiY1wSwWt5EtViBsaj74A
	HE/skH9ScetBzQiMfmvjh6tBxSrRdbq0MYN8q0EEYTKls/OFLM1L3kt7
X-Gm-Gg: ATEYQzw/8DQFuFXkBte0k7dTEtD+DvSlNX3rbrGqyRj3VDgBue90mSVW1Ryqnnr7fWZ
	B+wXWGmwcsWdfmewV60O/Py9DSDwBOjm3FAhuRW0RWKi9wvqRZGXbR5EAqD1T0AVgscRY4ftdVi
	nx1NnTErgT7K7NjfdirL7eTim8TXOZHMVv8pYSaom9FcugVzS/dbYyJZmYKhDR19qqB9N9qJhbW
	djMEPcp8Z7SFCIOrKURfJi2lBlo43A+sdGyoBUQ3eLNZ5xiV6MXnaAmLBQC3tu7IT29AaR1rIKi
	VN9wfQH1f1sz0uIpXiZuR/UoZRel5j2J7sqVfrmxSwPiYGTN4uT88qQ8a53SPxfB3vccAIIMIDG
	/4GdR+xZyRjLFZTNiA2XRWrz68l8CiqMfgjgFQ+yvoa8HnoTx/NKqY8HH7/Aka5MVlQCNatXk1p
	RLj2BTpRQF6O2xHZXkajMLbxH54lDdf4IKbmiOqnj/TYGc3B/i6JdOjFgDNnQE2PF6
X-Received: by 2002:ac2:4c4c:0:b0:5a1:3eed:9a3b with SMTP id 2adb3069b0e04-5a13eed9c10mr4105426e87.23.1773155808415;
        Tue, 10 Mar 2026 08:16:48 -0700 (PDT)
Received: from T6NXCV08J99224A.admin.jenseneducation.se ([185.154.228.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d01cd2dsm2812165e87.10.2026.03.10.08.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:16:47 -0700 (PDT)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: fix block comment style in circbuf.c
Date: Tue, 10 Mar 2026 16:16:20 +0100
Message-ID: <20260310151620.905-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309213024.5733-1-rayfraytech@gmail.com>
References: <20260309213024.5733-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix block comment formatting to comply with kernel coding style:
- Add leading '*' on continuation lines
- Move trailing '*/' to a separate line

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 .../media/atomisp/pci/base/circbuf/src/circbuf.c  | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
index cb34d0b5abb5..db0b76ea4a29 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
@@ -192,9 +192,9 @@ uint32_t ia_css_circbuf_peek_from_start(ia_css_circbuf_t *cb, int offset)
  * Please refer to "ia_css_circbuf.h" for details.
  */
 bool ia_css_circbuf_increase_size(
-    ia_css_circbuf_t *cb,
-    unsigned int sz_delta,
-    ia_css_circbuf_elem_t *elems)
+	ia_css_circbuf_t *cb,
+	unsigned int sz_delta,
+	ia_css_circbuf_elem_t *elems)
 {
 	u8 curr_size;
 	u8 curr_end;
@@ -206,7 +206,8 @@ bool ia_css_circbuf_increase_size(
 	curr_size = cb->desc->size;
 	curr_end = cb->desc->end;
 	/* We assume cb was pre defined as global to allow
-	 * increase in size */
+	 * increase in size
+	 */
 	/* FM: are we sure this cannot cause size to become too big? */
 	if (((uint8_t)(cb->desc->size + (uint8_t)sz_delta) > cb->desc->size) &&
 	    ((uint8_t)sz_delta == sz_delta))
@@ -215,12 +216,14 @@ bool ia_css_circbuf_increase_size(
 		return false; /* overflow in size */
 
 	/* If elems are passed update them else we assume its been taken
-	 * care before calling this function */
+	 * care before calling this function
+	 */
 	if (elems) {
 		/* cb element array size will not be increased dynamically,
 		 * but pointers to new elements can be added at the end
 		 * of existing pre defined cb element array of
-		 * size >= new size if not already added */
+		 * size >= new size if not already added
+		 */
 		for (i = curr_size; i <  cb->desc->size; i++)
 			cb->elems[i] = elems[i - curr_size];
 	}
-- 
2.43.0

