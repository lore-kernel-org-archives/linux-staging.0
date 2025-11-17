Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C232335541
	for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 14:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763390436; cv=none; b=eDNudrHnOQ9UuVSyiKsE2pnnTWiuVLsdU55n1Ma6d9mQZah3ybji4mx0dThSAQQNqAroaImc0H/xWbF8t7ULWmO6NBWWGKLIFU+s2+CqxhjqojLLFzpDokarjIjiXyvFdbfGr7+lmq1L8ZZH0OAb6fUwCbSxDkyiQ4c2CQqg4Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763390436; c=relaxed/simple;
	bh=8lQxcKvouaei16FqYGY0RR8AerBRZPOQndfjxzjaGZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UauXa0+TEF0KC75oXPN1EIZMkgU62BUMqhAoj1KpbvowUMJ6wEMuuC8VZ/7njKjFhLkY+S5LzzaMM3tKkIBSo/g1DRc8DQ8yhJaZ6YQ9vLQ5zcACT4IpPjeJbwFW65aeYtmFQsEAnCce5muOobymZlpng0iEtFuEAAQcEsbhg0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUX54sth; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUX54sth"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b2e9ac45aso2785332f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 06:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763390433; x=1763995233; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1iqFxV3svYobU0TK9f8Y5DAj+U7MQujkDDouJLinQ98=;
        b=fUX54sthN5DzJAja0sxuBabwPv9slFN6GXMWGYVyBCuiARs75JVsprC3Fdd/IEPrFM
         I3iL3w902UykSjQW0nkkrF29Ul7FvXdDHTddU3Bwty14Y/J4etZHsCtE9BKsLuQqodDO
         n3lePpoC8Y/W/lzlvbSbeAIeIr/AH3tj2H4XmXvDCMD5mgGOgHeYYjxRlbA5sPCICZdR
         1fr4AlqQn2aK944OyJ1SM95MNSDsdqJ0wm5+WOJajfa1VYed7fCz1c08xuFnvoMLZzhy
         5jal7JSL0p815uYPjBGuJP2moNkUlt837cs1lwaOuFyHL7jF0GTYcEPB/stqwgHheoDF
         mClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763390433; x=1763995233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1iqFxV3svYobU0TK9f8Y5DAj+U7MQujkDDouJLinQ98=;
        b=EvnnrDg8CMk9eh97Qq0hqotKkD16+PcrT/FaiLnci8hG1xZ4QeAuTBCGo19zuffjjd
         SN/u2VwUYIeqAxtxPszCDrI7WwbtoerMBzw1v2krG9+QjvQ16U1HQC9G7ttfjQdDU44A
         cmvxvuMsFDPKrwiFl7z9OPObsnUijpG0hMHF3fXIw2Z2UdDF/jemrcrr11w6D2XRPyBO
         9hDdIp4AihiNlTJqX67Hcale82B2uBxx0+u9zPGKA+kptUFXyZBXFeGJJjzUsINa1rW6
         9nOhsjycYFM3aCZFkf6T9ZSzpaCqaZn0oT6MaAnYRfQdgoBvFYoqtKR0JC683h/ZFkTV
         kWPg==
X-Forwarded-Encrypted: i=1; AJvYcCXfhSd3ZFshMDOpskVvU++CTKFKlnknBex561fnCGPu2HnAXWTe1Qh0vFL7wzGMyZcwfocEzqpRqMg6th5w@lists.linux.dev
X-Gm-Message-State: AOJu0YyONlSPtcCkdvRjiV8Afk/VyvLILAVHyHMevzFtLgmnf/4uZ8I5
	UKew+KuS0EneP75TgN/zxBEZw/dnIptOkWTHR0kAsGLOlLWUxUqQg/Pl
X-Gm-Gg: ASbGncs3RzLqSk2AevIKRtmM1AQVX7JPYK79IatAHw66yPsVUpHQho69WKZPY0cXvAU
	RfVQyBd/ofdlFCtMCL3T0UWRnPpetjRvmk1WlJxVAzBR10a5o0CV8brV97nlMw0i/lVTyhjMlE2
	xo8AxFIsHpR3LzYJmhwr4jbUF+vVisKQprrj5nkySJA8KExd+j3APxlxOxyIz8azUpYKmjM2sgQ
	FfpUwsw8h2EnIdHlA/bqRENcqlEC0fkZ9UOw/QHxnDXHSOx0+AUaJsoy/Mfc7fepw8aSpCXk7zM
	5ksQCZHJo1bDnp8K+LCq4Db+AXfJ0mKwg/I5eexdPX3OJ5t/bYy81j0lrBePwmUtx60acKnNVwc
	yiAqwIrk31UXLPbXAdZl25Q7vN1m5a+Px7Le0IulgWpZJLzWDbNcVvitXDdZTznWzVsOAJCjpge
	bGYafQx8GU9aGdry+YQhSuKGCmT5hXzuckmlJ1Tg==
X-Google-Smtp-Source: AGHT+IGYOrLag2thTn3SYWZDnMpEs52Wd+QcpLBwLxTLhLinzGRFJnryAdhIXXD6W20N7XuPmJkL+Q==
X-Received: by 2002:a05:6000:26d2:b0:427:167:c2c3 with SMTP id ffacd0b85a97d-42b59398a6fmr12059621f8f.48.1763390432673;
        Mon, 17 Nov 2025 06:40:32 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f206e2sm26788218f8f.41.2025.11.17.06.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 06:40:32 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: johan@kernel.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH V4 2/4] staging: gpib: Update TODO file
Date: Mon, 17 Nov 2025 15:40:19 +0100
Message-ID: <20251117144021.23569-3-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251117144021.23569-1-dpenkler@gmail.com>
References: <20251117144021.23569-1-dpenkler@gmail.com>
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

