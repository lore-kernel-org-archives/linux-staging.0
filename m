Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF1E17C9F8
	for <linux-staging@lists.linux.dev>; Sun,  8 Sep 2024 19:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725823607; cv=none; b=oYx9Im4hc3b2KvIQEOZLVEOVdcCcV1BSUIoBn4pdE0n6QvGkcpsQm462Mj1FvsJLkufoMBDzp8SKQvvNNttPCrWQfiZbtp5OtqqpmkbUhRvvF/1QbONdH0q4dzxIu8clQMZFwKoUaylcHapDDWaCVdsfGEo+E15bH6UOaPT4UKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725823607; c=relaxed/simple;
	bh=L02lVgIrPVpyX1TYuHNwcoDskfqxKULdXO2b/ru4OiI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Le2V82/0BOk7Ao864SDU9IcsnPn1z994ePXs+1znxwF+47qgfM6eesEEUFUcTe50FS1FDiNPD8LM3z0P3Q0S8XO7TG97JSS+fKNOaQfWb65cwEzk7L9yKKx4xkiZDy94M3M179oL+Ta78pRVespyoWtkp4Y7QwtNck7ULIGtfu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=KDvVhIw0; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="KDvVhIw0"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2057c6c57b5so19390995ad.1
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 12:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1725823604; x=1726428404; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6pmwMlirClkh1arNo035bBhvK2xtwOFwf4bLdJcZv0=;
        b=KDvVhIw0kfXvVFeOVfZl5W0PN5muaHtuWtmNEh/LXPO4S9d8n0X1/MpEvCBaAnFEOM
         uEeOXqdVP0Mg9JOeO9dIWLL6lhBnE1Pmbtv3SCEErDFZtAjk2rXNZSPNd4opzqc7pPdl
         XurqJFTE4+0UAOdAPDYRjGIMtJrlLDxkjMVpusSeSr617gmddi+qxazroYniJrIXFdVg
         mUqDnmpRlvbuZzUV1H6A3U8hm/FXHSrgx8j/TfWD99ml1pp+ME+HxlMgN+7faJjxlaru
         fIVGGaQgOYn1JsSvvIdqGjjYyp8Y6DSjMRaWOG920inzbrTGShX/ayHM5LlHv9xRLFba
         uU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725823604; x=1726428404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O6pmwMlirClkh1arNo035bBhvK2xtwOFwf4bLdJcZv0=;
        b=jOpVcWf0f4qnJAPP/5FHjnc6hxeGcGY/iEsBc/3s4BhMVLecsBEvb7AgGq+ccCJ+sa
         DyTjLI0UIMY31yul0N572N9i4b20zLEFYraeI9X58dxMKux4pAgjMu8SV4Na1A2YyUhb
         CZQC/zZwWGMVM9SJViA0ooYOHhpFwpIqUN/bazGtYwdZ/YfczD3XdfBFrVIjXXbbqhx4
         4q4cXsZebh3fFesLY4q+oq85vJ/maNRi3IRDXHzo+0m1bWRZrOHAr6+AWbyzSxCKzg8M
         wgrLhF9uPjT6UCWzkqaNvPWcVtraLdWIElgVmp3JFxw92EM5Xnc03DNJuaqip4cwPLuJ
         uSLw==
X-Gm-Message-State: AOJu0YyQXQa85AptHJEm94JiEjtRkBJ6NNZtP07e1N6PAOJWO7RvcpXt
	wXpA0FhBsvidrf5WHJFNaPcR6Ht6qmY2svRkUTOkrIlhTydSiDS34jLhAIvgSg0=
X-Google-Smtp-Source: AGHT+IE/8ODkzgxNwDLCGK+TWiTrZJsd1x1ngShkhBybZ/34KWM3l3AWoD1iX3aQ2MbOa2GOwmQb4Q==
X-Received: by 2002:a17:902:e545:b0:206:892c:b758 with SMTP id d9443c01a7336-206b833e57amr266089905ad.13.1725823604553;
        Sun, 08 Sep 2024 12:26:44 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e1b085sm22703305ad.36.2024.09.08.12.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 12:26:44 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 10/16] Staging: rtl8192e: Rename variable bAssoc
Date: Sun,  8 Sep 2024 12:26:27 -0700
Message-Id: <20240908192633.94144-11-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240908192633.94144-1-tdavies@darkphysics.net>
References: <20240908192633.94144-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bAssoc to assoc
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 3621f27b083b..b599309b70ff 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1726,7 +1726,7 @@ void ht_set_connect_bw_mode(struct rtllib_device *ieee,
 void ht_update_default_setting(struct rtllib_device *ieee);
 void ht_construct_capability_element(struct rtllib_device *ieee,
 				  u8 *pos_ht_cap, u8 *len,
-				  u8 isEncrypt, bool bAssoc);
+				  u8 isEncrypt, bool assoc);
 void ht_construct_rt2rt_agg_element(struct rtllib_device *ieee,
 				u8 *posRT2RTAgg, u8 *len);
 void ht_on_assoc_rsp(struct rtllib_device *ieee);
-- 
2.30.2

