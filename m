Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3840B25B68A
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151132; cv=none; b=ZkJLyUDBvyfPNMvS3DAjkiV2YGhxEns/Dorb8vtOXkyjADnuRy5nhj5ZBQ9E0plkpDCFmGZbxlJQitqoq3oC3MbrSmZNX6687FoDTtjWl3t5RhX+dVx5cbsqKb72+Dn2VqqfN2dyU/IFnnH+XLKa1yApdOGS6gIt+e9HWovrfDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151132; c=relaxed/simple;
	bh=IV33bcMgVBe5I6EM7iwIC0bbwdNio1NkiOrIO9AbCT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ClyjgM7zB58glliJd/NqkaossL2B6ooT0JBEwdvy2Jyj4NlnwB2Z27wtd0OgYLcrfXCyh71jCtmuD4F4EJhaudIGP5WZdiUEipYN3j3yhwVOFfGx5yRlM06g7J9z76ThvKCa+1xUZqTxQzbIZa/FI9ihBrnHc708ckIhsk5FNSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Bw4b+o7X; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Bw4b+o7X"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso124261a91.0
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151130; x=1744755930; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9abTSO9nZ3GBHkjnW8Fgqsuv8V0aGDcD6sa8F+6ju9w=;
        b=Bw4b+o7Xfxicr/7kfTbJDp8pXCwt9Kq0EwWY0PdvN2WdgFICJfABdMWaLjTUPJ4vum
         Tp3mH4U45DFsnOKf6EbSIiV8RrlL+6IeTP3MnpRUM0Qcauv7cGCighq+Psw75YkgH2J+
         dtIo8XCVEAEfLN8cEzRwJ1BkgAk+EOOTr9jTcrhEmQn0KJccZ98TUOrXWJuxqYMp4cFb
         8CWAUU12/vUEDzSjG9DTkKJ1cJkX/2TA/e0ciu8LBqH43rf0Qa0prfOAOONk0U3rhaBB
         jJ7UAgE2zomn/vHTblGjMCMdBIE+BGWkQOYVSpA2RUmKz0/T5n42uZ3Fld2+uAfzXXKJ
         gS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151130; x=1744755930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9abTSO9nZ3GBHkjnW8Fgqsuv8V0aGDcD6sa8F+6ju9w=;
        b=nAdjwtslFynvTkJkwJgbr3ccC/HmEdlZkjTyHUAiOufU/OeomigsQvEkR28/NHwLc6
         jjsC7txWFJIt+Obvc7D8TdeazuqvBhhtC/GPBIdFfr95benbKNNoBau9SklAb7M8FBnO
         Ern/ckp0Bo7NbzuczTw1wIvIMN2cVt96lqyFt5xkgUOTH3HDShpvBzk5HJOUDUezibdS
         67zK2jIq4O24H/s9RfX3uiqLnDJCqUtzFo9YVkJm0Mixuw24M+0iBRN8f7JsP9N0+H7E
         9Hgny/MzbWJyxCwDOK7rBdQp10nCcdfoYh8iY5ypEiGpbXUvDWjGxfCb5CAmndqKFN9/
         lemw==
X-Forwarded-Encrypted: i=1; AJvYcCViNQQOXAB/Rs8EwddzCV+IEwT4v1Adap3hfGWzZ2Zq9YUwvfQXth7KppiD7XkA6bV4c4WtJPyDMtcf4C7e@lists.linux.dev
X-Gm-Message-State: AOJu0YzFZCGpWrmdtTiI3avQ2Y5a38B+vES3f3PwoVL0jjYU3OCljQls
	/yAPGcEUCBHkQkbpnIGRpOL2njilg95mAElx7ARaepYJzI0d9RxM1S9XuGVotQ==
X-Gm-Gg: ASbGncvGClRc1VHyJFtEnGmtiaKY3bfDlkyUsE25on5UmD2wkBeSlu+uxteVI8NrW3P
	WSgjKkSgaKsZiyaBRcrSmIX7X1Z4jlO+x/afrR+P8OLxZ14Fru2q5of9zThYxpe5cr/n6pZOLZw
	BuCUsDOe6xC4k/Y234+pICgBsTkBMRyMqlrF5RJj81KxHrzf63CwW1bc2jR9BZn4h9Z4p97CIRk
	IZaoJT9LbmTKJ1vB0ZBBZGrCRWSbQf78u2niPm+Fs4oWStK0lzhzDqlJ9S3ND6hv0RWaCJmks5R
	5euUvOUxSnd98LIM4DLqpFP34SxPzp1372MDxD4lFz+1/AgQgptlhXOSMXT3oBv+tDsEcueszGR
	OtTrqrk3Hmg==
X-Google-Smtp-Source: AGHT+IHMn1TPpOHHBZRpWsG38siKEoVe+9cV6YunkxSqefSZsDaEv+3mbT22wiTe0ySfjGWQ7y8VSw==
X-Received: by 2002:a17:90b:2d88:b0:2e2:c2b0:d03e with SMTP id 98e67ed59e1d1-306dc0452dfmr964780a91.5.1744151130434;
        Tue, 08 Apr 2025 15:25:30 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305983b9924sm11542551a91.39.2025.04.08.15.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:30 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 18/18] staging: gpib: Removing typedef gpib_interface_t
Date: Tue,  8 Apr 2025 22:25:04 +0000
Message-ID: <20250408222504.186992-19-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222504.186992-1-matchstick@neverthere.org>
References: <20250408222504.186992-1-matchstick@neverthere.org>
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
index 10d8776ef425..a5c21ac6affc 100644
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
 typedef struct gpib_interface_list_struct {
 	struct list_head list;
-	gpib_interface_t *interface;
+	struct gpib_interface *interface;
 	struct module *module;
 } gpib_interface_list_t;
 
@@ -222,7 +221,7 @@ typedef struct gpib_interface_list_struct {
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

