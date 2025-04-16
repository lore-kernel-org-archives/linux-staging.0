Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A7924E4D4
	for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 20:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836151; cv=none; b=h/Oj6uxMAFQjiFKem8yzWCZ2fk3b64UhACbLM3tejwmguPOfbNyXs8K8lERJbfiL4OK7sG1DXN/vPCPhGTk9DWV0AboObGA8X3cKORGEvEoMCp59KovMA4cyr3lsqG2v8BkyMk8vhiuqg01wB0YrPkE5+Y3fdnw/pbISgCKnxb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836151; c=relaxed/simple;
	bh=W7NKhnTpUeOCGlpiS2roAP2cc1f4BGRsQOUiHrDOA1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iroivun+4wMOTN0/tdyqLD8hQjKaaLtmXWM+6DiZXccn4bRwakSyLqIOAWOfwtZleT7OnVMhNfzc3AIHdTNdq+W8m4MaINfuvI4xnkzpfqo4xc/+91/GNbm5SrVstrsaqKOUiJmvgd37yx8fDKkh7CAbA9UM6HTF3deGvAbnpPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=VFkHQV1a; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="VFkHQV1a"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736b98acaadso24627b3a.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 13:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836149; x=1745440949; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUDIvKIBsD4gxpULDKxinqYIlQSnX87hM/ddYNKNziQ=;
        b=VFkHQV1aIVjq+dqdUyVzEOcvaGed4IivoSiAAsDaMA69XSWlnwuHbPkXBwlw1HBT2j
         0pAf8o1JtiuVkBTnvAyzAWkepyXYYy1cCwlAYKiwDVTrz9iR97Ni9YlewJch2v1F3hwZ
         Y9W5cMbbWQxdG4UyOWV4tkgQFw+9pmJT8e7FQb2hzNPp98Hz7JcA/Irsn6aOCDq+QDS9
         HAI39R7hpPTR3ohyFidtiZ3W4FZrlkJWBx87hGjtBYvmW6EOyrZU5InlXhhxv5GrDSBl
         wP92QE5vB0Zb4Q9VEt0n+MTApJnhxo2dEuX6ATUpOHK/tTbNBXbXsRIcyyH45RqDA9Hq
         NDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836149; x=1745440949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUDIvKIBsD4gxpULDKxinqYIlQSnX87hM/ddYNKNziQ=;
        b=MJQYV/bq6uz3ioH/j+neybkwlXCvFCv8XoVEfFqixJOSNEidhyI33ycUhPETp8v0hA
         t9NdBfOvA+Ngqf4cqdeGtDK6SELQByqYg2V9yCBpqcxznxmWQ/5lC1hKtPyO/jDH4184
         uVVj608yUu8oraPN+ba/3uy32LcfVz747JbHogDkzn3rKfZ62m06aO8nbHx3uRsuNLje
         LCS1UtQfDpDbApDfmYZpEKb8zfDpNomkbaSb9xRHpgQxF7uLnb99PY9rcWtU4LKzpd2+
         iM58Qr15Z5hYRRyJJYquo/jSlcbu4Xc8T7FL5EY1DnKwuBVr1gggeyqUhmBGhP9oUqjW
         nTqA==
X-Gm-Message-State: AOJu0YwASlGwB91r5DBU1eZeaLz3cqLh8WDvYOWOvkUHzzshDcKsYjrO
	t5Hv53bX7OybW+5MyyCGk5wGQfS2NTGKYcb5V62Dn6Zl+d2ANpNvxfrBIwiOTg==
X-Gm-Gg: ASbGncvjyEDOARtOJDoObBiFzbv+kqB6cSzmcRlUxnzQBP95H8KsJgt0yAixnOS4rI8
	yQJeZUYdRTlIFbB2Ehai6KDD95V9t7Dw7jFCHCCQCbN4A1TlD7Bnsbot9154oHp1Dl7ecg0dPi0
	NFBkUDnb+C8ZiN/1enPZ1GuLOiAtk/M5c+9anD42x2MneS1TkjAD+SL0BN9t4JX84B9Qr9JHL/q
	vN8iPUMgHpTIdg+amAK/+NX1yFuVQajXl/rb8zwbbqbvYfE4+LB7yT2gXAIHHSIhMljjbkmw/Hd
	lU1DR2QkJp8NAV0aDmy2ttozdwfVWvcQmrKm75R60OFgNCaYbqFKIbkgyM5om66LSsDMQDox5/J
	sLVwDTw==
X-Google-Smtp-Source: AGHT+IEX4eXsP44VjunXaWcttdOrgPWfZ/OAkwqbXiSZcKyF1PkjkyDAsrb9kEIF5F6lmw4jiz197Q==
X-Received: by 2002:aa7:888d:0:b0:736:476b:fcd3 with SMTP id d2e1a72fcca58-73c267f174dmr5267257b3a.24.1744836148828;
        Wed, 16 Apr 2025 13:42:28 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f0fc5sm11202994b3a.91.2025.04.16.13.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:28 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 18/18] staging: gpib: Removing typedef gpib_interface_t
Date: Wed, 16 Apr 2025 20:42:04 +0000
Message-ID: <20250416204204.8009-19-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416204204.8009-1-matchstick@neverthere.org>
References: <20250416204204.8009-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removing gpib_interface_t to adhere to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_types.h | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 16aaade310fd..62ce174add85 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -8,7 +8,7 @@
 #define _GPIB_TYPES_H
 
 #ifdef __KERNEL__
-/* gpib_interface_t defines the interface
+/* gpib_interface defines the interface
  * between the board-specific details dealt with in the drivers
  * and generic interface provided by gpib-common.
  * This really should be in a different header file.
@@ -22,7 +22,6 @@
 #include <linux/timer.h>
 #include <linux/interrupt.h>
 
-typedef struct gpib_interface gpib_interface_t;
 struct gpib_board;
 
 /* config parameters that are only used by driver attach functions */
@@ -212,7 +211,7 @@ static inline void init_gpib_pseudo_irq(struct gpib_pseudo_irq *pseudo_irq)
 /* list so we can make a linked list of drivers */
 struct gpib_interface_list {
 	struct list_head list;
-	gpib_interface_t *interface;
+	struct gpib_interface *interface;
 	struct module *module;
 };
 
@@ -222,7 +221,7 @@ struct gpib_interface_list {
  */
 struct gpib_board {
 	/* functions used by this board */
-	gpib_interface_t *interface;
+	struct gpib_interface *interface;
 	/* Pointer to module whose use count we should increment when
 	 * interface is in use
 	 */
-- 
2.43.0

