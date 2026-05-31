Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7363390985
	for <linux-staging@lists.linux.dev>; Sun, 31 May 2026 17:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780246832; cv=none; b=pveyha1tJBP6/7hgjVPATZUFJAIQvQIBTl41f4eWzhCCCruU91/PR/b9I4rpPoGC1uhfEyWTMd/M0AODN05c2xcp/w31h/7AkF+0vOPaRfEzL4FvuvmVNqVvu4aNKrAPR7kaHdmqKrw8JbVoSIU8+pCER4u0PgswbIEjvTGyKaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780246832; c=relaxed/simple;
	bh=oUSjqYIqz4ZCKCFB4RLXelS4S6ieCvQb1UHOCrkH1Yc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m108in0bR35JtBPFbNlUPkZ684VnImv38HGQsDm+y8ryFz9ftNMYUwOCvqFbbah6U/PNtk7EAS45Y2fcYxAyhaB75LsG3sDqobAAbcqCe+gUtn5Li8ZkGF4Ut+aQ8tTGyn9KM0kub6dx00BqPXpO5fol4Yc7jgEWXnXOBuWV0BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rQ6SGHYj; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rQ6SGHYj"
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-68d2342c5e6so786056a12.3
        for <linux-staging@lists.linux.dev>; Sun, 31 May 2026 10:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780246828; x=1780851628; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AaUR8xPxX9aXoPVC74dTOS0oMyUl/Gcl3YKYFUqJhbg=;
        b=rQ6SGHYjNAc+EqU5U/64/Pp4jMhFduOmw8xjOZwORmDojK/3oCS1Woi5FgnlVydRHj
         d3FTV9ApMehdNhmrPajajCmNr1sqRgKTfDGrh8QlW8cdG+3+yQMUKzAdj/v7iX7aCbDS
         LLKvyIT4Z0DZhm5jgbt1B1cK01Eqe69PaXbsJ+gK/+vnBwOk9UlnDoxut7/0YYOx56wx
         p2GHXtspCYHS1Ij4YUGGzP3QIB9S1tiGPM4eyHsbBofH5Vw3o+GUiU2Q7S+flL28BumK
         wYy/R8hF3YY9twZelg2288EvX/LLauthMNuh4Vwpf3NzGhAc0y1ftGnAJzlvCbKtksB8
         Jwag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780246828; x=1780851628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AaUR8xPxX9aXoPVC74dTOS0oMyUl/Gcl3YKYFUqJhbg=;
        b=nRILAp4hHb1xhOw0Fqp3JrxNF4ZH7Q3EgJsw9lFxOtr4eMwB1mHvzKvBmRQXQ7d5G2
         8hDyLfkmrQAEGgLLgBF3y/7ZviIvSY/0ibcoWiRdf7VS4t0SSsFRMJOeReiow2BcPxcr
         aQh3agEZ9cEECH6kGgh1jWrD8vLxVGtNXyJXsRl5gE/1VlsqbzYOFMclUVmzKQ3K4NlV
         uv63f7u4DUFvBgdbxy+hWph8lpqRsSb54cowupf89wtF3M3Hq9fDzogGByOM2qqW69ud
         Ev2fOuEXUYXjl0qHI7IUyMsy7JKGoX/yzbC2A8GLlW25G9MhhgjDg5mfeAI9I4Grm6a6
         VBqw==
X-Gm-Message-State: AOJu0Yxd5KhQSjGns5Ri9V+G+2rrLamRIxdIE8xity1WiCNhvNEqBYsk
	RbdH7v7o0V/JulpzQWnkTHD1FUylYCATU3zBh2VLp+E+zG/GOuOGWkQvCRxwPhojcw==
X-Gm-Gg: Acq92OFo5T2ga7/cdvCEdVPEpK8BgGRKIrnj8YugOzAlOkBIxJXSW3zXn4ax4Xnpc2i
	ooF0Ud/0KQo2/aNe21LQCE7h+jjLcWk59U+/ht9cYVa9yMcn/5C3PBTJy5O7s9JNrfxFAhB+oel
	2bCg/M/WT9Av/hTCv7vkJ8u8iWuGGt/rG1kRlhPNpXTCXkW4lGfjyXhKF0tK+uynAsmBf+CewkI
	zwZYJ2gKFNaJj3VkxWIYYdPlUnB4BTpHK+EilH0z7JcsD9Lf3Awe2WljM0V/5H1ADh42+ls0G0S
	Pmy2kkibTmGSKmUXS4BO5XV1HA51p/fh131nkBUnMpQO44ankVKwvlqAD5F/dxkFReyFexf6ZQo
	bvA33ee0KP4QJUaUKfA7jEmSE/Rz369Aq9IZYiXToeoiomik/G5paXD1xQLs6Cpoti7ldtQmS2h
	BDvZijwMK81lTEn8dLnZbgJQ+pu0e4MfRTacBBcmzPILHTpLkcTs24U5CIeY4=
X-Received: by 2002:a05:6402:4595:b0:688:3188:f4a4 with SMTP id 4fb4d7f45d1cf-68c8b2e5fb8mr3645486a12.11.1780246828159;
        Sun, 31 May 2026 10:00:28 -0700 (PDT)
Received: from archlinux.itotolink.net ([217.196.163.117])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68ceb869dfdsm1184310a12.29.2026.05.31.10.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 10:00:27 -0700 (PDT)
From: Vitaliy Slivinskiy <phant0m.mail2023@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Vitaliy Slivinskiy <phant0m.mail2023@gmail.com>
Subject: [PATCH v3 2/3] staging: rtl8723bs: fix spacing around conditional operators
Date: Sun, 31 May 2026 19:58:48 +0300
Message-ID: <20260531165849.283264-3-phant0m.mail2023@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260531165849.283264-1-phant0m.mail2023@gmail.com>
References: <20260531165849.283264-1-phant0m.mail2023@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warning regarding missing spaces around the ternary operator.

Signed-off-by: Vitaliy Slivinskiy <phant0m.mail2023@gmail.com>
---
Changes in v3:
- Split changes into multiple patches.
- Fixed sentinel entry formatting.

 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index f0aa5bc8a38b..9d936b8349f0 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -78,7 +78,7 @@ static int sdio_alloc_irq(struct dvobj_priv *dvobj)
 
 	sdio_release_host(func);
 
-	return err?_FAIL:_SUCCESS;
+	return err ? _FAIL : _SUCCESS;
 }
 
 static void sdio_free_irq(struct dvobj_priv *dvobj)
-- 
2.53.0

