Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290191E7C27
	for <linux-staging@lists.linux.dev>; Wed, 30 Apr 2025 05:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745992630; cv=none; b=MN7abbO4gkbGQMNr3rYrqHSQdf5pWDOb30r0tnPvUs5VC9aaaof5lNIRkREfdSs/3XRTilG4yzywFYcDgfzaJ9miw42p0yprT5lvUPQpj/Nt0fOpouoIJGizoVzkxnGyxMJOhP44hCETfzYL0+QXUiOgEs9uKRIluSfGH2SjBq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745992630; c=relaxed/simple;
	bh=OPcdA7WzHL8qbupr9CeaRRLP0cf3U+p7fWUcEB+ist8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N7p22M9gf2TeDkGLC5iQ3Jwb9iW5Q2tewDgOpz4f9JV5q3fZFh3LZ/2gys4g3GaecVGBGaLSXzvy6v52miWL6XpTXXnRAYZGBwKbacJ8+AZRhre+IQFf55FXBV3eckLZk8JKNzAHpBvcUBTTOUoCy0z9rcZcWSGA7iK5rTmM1Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iktI2oQy; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iktI2oQy"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-22c50beb0d5so12136545ad.3
        for <linux-staging@lists.linux.dev>; Tue, 29 Apr 2025 22:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745992628; x=1746597428; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkxFjjdv6suYqQJlXMyq90HjSEeRgcZf4756/6SBQro=;
        b=iktI2oQyhLyozsD1B4JV8tG0DzWN3ZOVkuW4QoyxJkl6duD9Th1O53RIL2LCbLCnoP
         qcCwQ8So6m5z4+KGGIGp7ovoz/FN0+Eya5CdjGHP2uDcDymrlwnXKjvu6+t/TU1C9tdv
         adLKxTp264L+kgktWAlgvxYJ1bAKtD4vJgedst6kNiErs8nSUOZux/rWlI0CYJc32RzX
         948VBGmA3/Wr+FxvDQlgW8iGoUY6oQJRFon08JuzYKcm4qM45uYxGhh/hfoaBU9280/R
         85RiIjz6yUirtgRcmPv77Mln5FQ//3cQVplhfutF7Wv/bbjUkyqiOWNi3zOe0xfZNkS8
         Jb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745992628; x=1746597428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkxFjjdv6suYqQJlXMyq90HjSEeRgcZf4756/6SBQro=;
        b=fLhIAWwap8T0dGMqJsaQ9u6Hwe+2MoJSt6k0Ide7gBRj+8/veiVJJt4AiU9L7AzgIC
         cUcdLxArgs4BhoZQt5/oePm8l+Kce/ZHlEEZwBNRCy40UzMlsnINWy/vbo6AXhibazQf
         PmUbINh+sj3Mw0nkOrBhKlYJmlY/tdVXnA6UzuhsVLnMoBANU/UGYq8Os2qi8ucQO6lj
         HL5VB0mjor3O/LVJvqhywreN7nn32dgd9ytkEH6lsrwFvfdHi64e2ZY1dF853uTM7+In
         XfNLnRMxCxc67/EMpAceJOt0eze//k68lrd8Igd5Pri1PDdefaBmBanrPe61sKkU7bQT
         RWfw==
X-Forwarded-Encrypted: i=1; AJvYcCUvCfmaHKxw/724LZBErGC3cLNL9yEgAd54mGomgwz38Cpcs39mdwvS+O237UReUqPpLJqL76awdRt8O1Qa@lists.linux.dev
X-Gm-Message-State: AOJu0YwV966pBtRBB93z3j4RQLejvIBdtP/oLESE7sK8UwEOSfDhW58v
	ng6yAP6o0qQ00UBf0SIphd4fkvvipj2+36N+CdqX0GKviqX5Hapk
X-Gm-Gg: ASbGnctGt3wuihH5475fMTNia+x6DXQOkQ0rD+41dSMvOXy6yv84nzU46ZQ9UNPh9wA
	n3PKKd0oaCbvwI2VuTxGt2UZllLiD+fVwd7ZY59WAi6G37cFXxZrlhHkbh4IM/mXUPdZZn5GjpF
	MUq1kZFMbHWL+sbb9eadXLXk/jXBtZg3DUwQDIbUuREYOixUePZI5QIUXmpYo4fypUzSkKFi+Hw
	ARZ6Y4YGrdjUrS68ThZPdPl4jhXTPz8+Rfvsl4UzayIYJc9sYdtmyQF2EOgygdrQ1DW3DHMhnwS
	dfJj9iAofyZwaqrarOYFqKFoyuNRhszZpRfAUmq9I6zBgoKfuh1+XkhhsNHY5s4e4uaKuG53A1H
	eix8URz9/onO0XpfwArV5hce6gyRlnMrCTORyc2iK+LhxdoEZs8USwfM=
X-Google-Smtp-Source: AGHT+IHBJYloTgN8pwH+ee69VUknLa8QX3gHDwSiGfv0vAc8H9ceexmkgnOwBPKpCv3nT5A+ZkD2wQ==
X-Received: by 2002:a17:903:fb0:b0:223:28a8:610b with SMTP id d9443c01a7336-22df358f8f4mr11530585ad.14.1745992628441;
        Tue, 29 Apr 2025 22:57:08 -0700 (PDT)
Received: from kerneldev.localdomain (162-225-124-171.lightspeed.sntcca.sbcglobal.net. [162.225.124.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5221a82sm113383895ad.257.2025.04.29.22.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 22:57:08 -0700 (PDT)
From: Eric Florin <ericflorin.kernel@gmail.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Eric Florin <ericflorin.kernel@gmail.com>
Subject: [PATCH 5/5] staging: sm750fb: rename sm750_hw_cursor_setData2
Date: Tue, 29 Apr 2025 22:55:39 -0700
Message-Id: <af5080150498adf635be36e332a7ce7121692f93.1745982772.git.ericflorin.kernel@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1745982772.git.ericflorin.kernel@gmail.com>
References: <cover.1745982772.git.ericflorin.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename sm750_hw_cursor_setData2 to sm750_hw_cursor_set_data2 to conform
with kernel style guidelines as reported by checkpatch.pl

CHECK: Avoid CamelCase: <sm750_hw_cursor_setData2>

Signed-off-by: Eric Florin <ericflorin.kernel@gmail.com>
---
 drivers/staging/sm750fb/sm750_cursor.c | 4 ++--
 drivers/staging/sm750fb/sm750_cursor.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_cursor.c b/drivers/staging/sm750fb/sm750_cursor.c
index 3aa26ef00011..7ede144905c9 100644
--- a/drivers/staging/sm750fb/sm750_cursor.c
+++ b/drivers/staging/sm750fb/sm750_cursor.c
@@ -131,8 +131,8 @@ void sm750_hw_cursor_set_data(struct lynx_cursor *cursor, u16 rop,
 	}
 }
 
-void sm750_hw_cursor_setData2(struct lynx_cursor *cursor, u16 rop,
-			      const u8 *pcol, const u8 *pmsk)
+void sm750_hw_cursor_set_data2(struct lynx_cursor *cursor, u16 rop,
+			       const u8 *pcol, const u8 *pmsk)
 {
 	int i, j, count, pitch, offset;
 	u8 color, mask;
diff --git a/drivers/staging/sm750fb/sm750_cursor.h b/drivers/staging/sm750fb/sm750_cursor.h
index cbb896a35160..88fa02f6377a 100644
--- a/drivers/staging/sm750fb/sm750_cursor.h
+++ b/drivers/staging/sm750fb/sm750_cursor.h
@@ -10,6 +10,6 @@ void sm750_hw_cursor_set_pos(struct lynx_cursor *cursor, int x, int y);
 void sm750_hw_cursor_set_color(struct lynx_cursor *cursor, u32 fg, u32 bg);
 void sm750_hw_cursor_set_data(struct lynx_cursor *cursor, u16 rop,
 			      const u8 *data, const u8 *mask);
-void sm750_hw_cursor_setData2(struct lynx_cursor *cursor, u16 rop,
-			      const u8 *data, const u8 *mask);
+void sm750_hw_cursor_set_data2(struct lynx_cursor *cursor, u16 rop,
+			       const u8 *data, const u8 *mask);
 #endif
-- 
2.39.5

