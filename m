Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19B930BB91
	for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 10:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762770327; cv=none; b=KK+R4XQxm5ut5Pd+kmmQBiXT9agUo5wl9r/WbIsMh87sn7OUAF3TSKXUoahKBRB36OMR2/Tn474iWf9UWS4d6LhfJxo2JiMcXUgfDbLrfgXvjfzJ3SheFOivCGgMoS0TrZSsgCkj2grE/CEkbInemSE6lgWQGvTHOEA3zySJs7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762770327; c=relaxed/simple;
	bh=8lQxcKvouaei16FqYGY0RR8AerBRZPOQndfjxzjaGZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e9Rym69dxfQtSbAAQtCtUedMIfoJ6EGlzLt8nxG/5FLBlcvDpocbck7KXosT5dZiCDD4bLcW4RKXDqOuNIMcdHFjcDCqUrsa48/lsD+6oiSAQ/2cynXDMdK2e/Kg4o1ary0boQAsvtIAzYan5rPaMjFgAKk/Pmtqh9IoxFFcjRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JA/YIkCk; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JA/YIkCk"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477770019e4so17698825e9.3
        for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 02:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762770324; x=1763375124; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1iqFxV3svYobU0TK9f8Y5DAj+U7MQujkDDouJLinQ98=;
        b=JA/YIkCkd58NZiS/cW6kaji3D0JgvMos9nGPM3P7qz09MF1RitgfGqEU0sYdhvfdJe
         LUbtq5pqVpZ4C8YpUoWLkcZ+w8tdiPnETgRVrVHnrK3w0T7bIB/oslW/tn/EGhkhkSIg
         2tjGF9hmXTURxhWEJagt3wt1AK9lQBcK/CZUYN6wp/qr2m8ZS/VC+0p14ZrBKAzeA2jx
         FbHGsxi6I7ERPV5Y1/51e0/5HTh21ngoiRkhK4nJ4I4N4HoCgbC+r/2T+wCcDFvVytpm
         jon/zy/VuBR212tLXDmwCQ2EOaLNldHSyHDqPzK2hDCie38klIX1jysjek0OzMdIdSG+
         rA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770324; x=1763375124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1iqFxV3svYobU0TK9f8Y5DAj+U7MQujkDDouJLinQ98=;
        b=MuAwDqDrTZfr8o5K8OYRyz2abun+RXfVGPP8b9oTqOae6Ax2Oxbzd4NKSIt7biS9Dh
         cDedRZgt/Ol9sRPxQMFV69uB2TUa0ozF4FnvkBev5uEDNJ6eqYVpWQAwbEiEZTi/cT3N
         wMs9ZH2LOi4qAGkJRP0NUvZKDW+R1h2vOtjC92mwUaItBj0OVlI8zQ8KdemN4oXEHjEd
         J9wYbPVIpLkxuD+Q9HXUtJutGCRvUHfzaQ360/dsDcP8pmJySAUMq800QIT77pVFzAtW
         k3GZxKAri9Ja64xfACjztA4y/1BpfeexeEkJhRYyuczY2mKtc8WHnGbrJ7ZbvtkoW5+V
         VQWw==
X-Forwarded-Encrypted: i=1; AJvYcCWRvIi3Q80fsFcDoHLQ5CUQUBxhoKg61we9P+mpfckMvzHWf2avw4mwelsC7HMIAosgAiLdQJYoR3tQdl+G@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6+gE8riiZk5WO84RufI4vNgzwuRS7wKom4Nb0au+qCJadDJYt
	+pwsOEeVALhnjCy8O5KxrbgJVhWvjOLSUD4X7WlJ0Fox4Rf1MOtH6FCDpfcMfday
X-Gm-Gg: ASbGncvBj+V7syvgOw4FQEQUzdHVUFE3LZEkNiAV/+0YHnlO8jJ0Dboja61ZD/SM1IL
	GvT4a5bQ89ER7H0SjF7wFYABjPgtcSAs7u46gxsLb15eDK0NIwAXH/TBrtdZQqgbW3KxmSeGzFq
	kGPgOY+3TTWyWS0UtaJXuax9Rd7HZITib81aJq94x+K2VehdSlo17d0tLO4s+SoEO5VmLRb2eUO
	oXsm46NO/9CpavGv2V38ACjJ9UP/cYL8yKd84IQlyu8XoKvEWLeN7IGvVjuNE2otb6slDP7vDAZ
	I6ziQbY7xwrZ5uoWZyApK7sCCKtU5VHWdlQrSvo32OhVs7F6EuMcVksVbospqPyP1vepPcmZZnQ
	0OOCRlEyyey6OsTuhlU0ONO6Ni/zkTMBF6Ffkv1pNyRG4PgTYQG/CyMQzcT0J1LfIW6/FOwahrz
	37kARhe0zeuaD0lsDgacjb8zquKls=
X-Google-Smtp-Source: AGHT+IEovL52sPcrk0L/fm9pL8qE9L2wC+LWVPWdlPGj2ws0AjCVdIuLEVdInh8JsskX8jb99cc9NA==
X-Received: by 2002:a05:600c:c4b7:b0:475:e09c:960e with SMTP id 5b1f17b1804b1-4777327b254mr82401535e9.32.1762770322510;
        Mon, 10 Nov 2025 02:25:22 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4777a96e7f8sm67326715e9.13.2025.11.10.02.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:25:22 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 05/11] staging: gpib: Update TODO file
Date: Mon, 10 Nov 2025 11:25:01 +0100
Message-ID: <20251110102507.1445-6-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251110102507.1445-1-dpenkler@gmail.com>
References: <20251110102507.1445-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comments have now been fixed so remove the item about
comments from the TODO file.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/TODO | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/staging/gpib/TODO b/drivers/staging/gpib/TODO
index ab41a7f9ca5b..ac07dd90b4ef 100644
--- a/drivers/staging/gpib/TODO
+++ b/drivers/staging/gpib/TODO
@@ -4,20 +4,6 @@ TODO:
     CHECK:ALLOC_SIZEOF_STRUCT: Prefer kmalloc(sizeof(*board->private_data)...) over kmalloc(sizeof(struct xxx_priv)...)
     ./gpio/gpib_bitbang.c:50: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parenthese
   This warning will be addressed later:  WARNING:UNDOCUMENTED_DT_STRING: DT compatible string
-- tidy-up comments:
-  - there are some "//comments" and "// comments" scattered around
-  - sometimes they are misaligned
-  - sometimes "// comments" are interleaved with "/* comments */"
-  - multiline comments should start with initial almost-blank line:
-    /*
-     * Good
-     * multiline
-     * comment
-     */
-    /* Bad
-     * multiline
-     * comment
-     */
 - resolve XXX notes where possible
 - fix FIXME notes
 - clean-up commented-out code
-- 
2.51.2

