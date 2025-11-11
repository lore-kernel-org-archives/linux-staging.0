Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C182F1FDE
	for <linux-staging@lists.linux.dev>; Tue, 11 Nov 2025 09:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762854337; cv=none; b=S0Snqb6WI6zfGMOyxO2mO0m3X7363Okr3Sqqp2Z2bS06GDdevhypXtVK/T6wW6aUXppqr/qe8oVhHBrICAOtuTMu8MHwlF9QI/VQWX0VCJTLRdWPhFjIxuZcGLAoLfuhLgFtFvcWXzZbsAlgg10CQTK9Igbe0FB68zLV/0AKMHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762854337; c=relaxed/simple;
	bh=8lQxcKvouaei16FqYGY0RR8AerBRZPOQndfjxzjaGZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sp5XyLXXHwE+3C/pH0OiSVB/R5/0khTcPZJE82ddIyXTcpDz88RnboCcv7L4jEyvl05CnVqBf5GTXn2OJva0w/D4Ogqv8Np/MWrz8I8JldAgALvZJf4ZVcBU8XPVI6V4AAZQyMcraFSxWuNyHg9JJROARAwlwWVHtIDd8846qsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dEuBp9Yq; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dEuBp9Yq"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-429c48e05aeso345870f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 11 Nov 2025 01:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762854334; x=1763459134; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1iqFxV3svYobU0TK9f8Y5DAj+U7MQujkDDouJLinQ98=;
        b=dEuBp9YqNu3e0/+5CFnxi1LSEJk2NXGRjg3IEdudmhEGK+zvi3iyRSMd1twNbHNeQd
         ikfs1agZFux6VFUGf5YAvy13thfxUQFsCYz4K/keBXU9DLqNhi1eaBaGS/2yaSgtIFE+
         4cAXn6tTTQua7kLiEeVggtbgNpqiXkAlYvRSannWFnsRQ20ekTibLwgRsTzwgURN0kxP
         VmEKC+aHHO8t9/l2xhJDWgm4DNLxc55xhdE3O0Rw63TXlu6KVGPF7OODO24tjwW1167Y
         2Nq4XG8j9PJAmPqtks96llpFTLmkLX8BCqFvc6+I3FSHPZI69svw5LWk2Tvz/Pl4s6MR
         HxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762854334; x=1763459134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1iqFxV3svYobU0TK9f8Y5DAj+U7MQujkDDouJLinQ98=;
        b=fw/3qOu1fJKBsnicG/pdiA39t4jXBUjoFk2oV3YxVedyx9nImhcUQoQjIrJciQXjaJ
         vgRMXZG889C5tkGWClKAUWkMYHMbqk+UBKA5wMxiTvRwMnlNsugFBQ13fH5tbLfDqRdZ
         NriY4AuPAXIsLV6rD6jr14PPmt3+JNych28ukrfdkWO0FS5liAGY+ffX2H9xTvf/l8oc
         pDwRanryGab1bYmN1qH68Wb0dFOcTD4oFXdNXvteBTLqiV8ks6nRZtJ1KimD234q0W3a
         mcaz4wVEGRZyTBFv0avnvg5XZy5oJFgeDNcQNM4uI5odjLPAiwzaImqi7JBPLvx1yOSc
         8WFA==
X-Forwarded-Encrypted: i=1; AJvYcCXXiTKr1S+Qrk4WcfDP/4kuOnh7mtZr6SF9lwdhn+n0zeuloKQ/Eawnq03Pn1vx+Kj5SDo36qWwPpFXJQ5n@lists.linux.dev
X-Gm-Message-State: AOJu0YwWeMRhSj2aEAjRRh0zhrXP7m9610DpPCwI20ldpmBUEKki7n+X
	33gfsfaN+JT0TJRne2tYW4IOJIi8fZ+d2bRoV3UMbU8BnPr9fI9Kdx4uIH68nQ==
X-Gm-Gg: ASbGncu7XCznPAa54G3N+yNkOlfPmv+gDjJzfAUSuSKBHKXWV/V9mao0G939btAnO7R
	W+Y3ObVE/4rs0TxG+Ffvyyv5M0F0Z3C7kKM1SQsjilPiJfBgypN3EcMVbmyAJllh5LiOfMbU6S3
	BTjNTwG6j7Q3wXdvgL0L1UuPSg7S1xl4SCw/VxrU6unKRmMoEf2oYt6lRebB0N1/J1q/WhGD4m7
	ZzsP8hv2QiTIwh9CXGKHOFLKlsjGKUM/DEb98pyGW7l0MwneOWCLfAfUZNSreqtb1uFCazDeckO
	GvLRUYp98UNwEh+yYALIdxmbKaQbIeU1JeKRVPDzz9qFL25EzYlY0+cM76SBCaFhiO8oYTYOfn4
	P9ZlrskHuTNCenYRW3GAsfa7Qbi39Pf6NOTB8cTUAyW4CluO10aVjUBCilnIYqHowIDYdOM04cR
	4jdD5/dml6TXfeRsepydf9NuvxKN8=
X-Google-Smtp-Source: AGHT+IGA/f0ZCKraAUBHqwQvDL4XINgS9hrAFsyHo2vjiQs9gnIry2mTkBGRV4IxBbXGTbM5/YiQpQ==
X-Received: by 2002:a05:6000:2284:b0:42b:2db2:159f with SMTP id ffacd0b85a97d-42b432b1f8cmr2257381f8f.12.1762854333756;
        Tue, 11 Nov 2025 01:45:33 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cd45466sm359537865e9.0.2025.11.11.01.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:45:33 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: johan@kernel.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH V2 04/10] staging: gpib: Update TODO file
Date: Tue, 11 Nov 2025 10:45:06 +0100
Message-ID: <20251111094512.6411-5-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111094512.6411-1-dpenkler@gmail.com>
References: <20251111094512.6411-1-dpenkler@gmail.com>
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

