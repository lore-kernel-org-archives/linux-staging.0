Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1241CEADD
	for <linux-staging@lists.linux.dev>; Fri,  1 Nov 2024 17:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730483276; cv=none; b=I5i/+bqcwdGjtDVcb1tLJMyPXRVS7BrAjpzJBzvEE0dEKbvlQcecBR70DzSSJC9vMM2kb4L0xI2l36/ELv8jZscVvPRpXNuTfBNbApi5gvs0MND7XM6tP4KlSHjRujEY7qPaqKRwGJjPfDwMGx3Fe+SRpQvRnlphjqs2Z9EnsiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730483276; c=relaxed/simple;
	bh=vp9brIm82+sri2wgQZ8jwsv51grmgrK+Q9ybRLWbnu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jLqRGBRlzMFRBd6fuJQdRuGeb3E4TimHHP3ikqWdsAKA+hBVoM8vg551rqOmouVaa5uRetJ7Hq98cGDP5XGzI5tmWkZPvm+DVLcz20PaWCpOHAdnYx9pGysyCa5Uak4FR9zsf3vq4lV8pztwpShg4wBMN8+bcZYLeau9vZu8NpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a9qyuhqy; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a9qyuhqy"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43152b79d25so19594545e9.1
        for <linux-staging@lists.linux.dev>; Fri, 01 Nov 2024 10:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730483272; x=1731088072; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PxfRaBd2Z4IAnFtE1pVDi1Drl+tQCB1zhAZtdVbCCqk=;
        b=a9qyuhqyQxbVsbf4b4mMNf43H7G2jqv1GWUmV1LQvHTH+yO57h8CXzJpZtcGmF8dCU
         sFnLYrbaAJvPXB6x/P78r5sODGGmVlQ2/33XMLlFPzJn5tJaYxu/SojSE5JEOcHRVmZj
         GSRY2JEdVEXQi8tMzh7QKvk+cOvLLjqOoWLJRNj6M8JBiy7QB7JM6sBz82wsH7m+VzAU
         2xsJb1/3aRlO7ifIVt5XF48qN02U3zwFtFk/SKW5EIO4kCIjlD1lhNWe0P1Q5IN95k4u
         dg4DeSXiNA0hPggCQ/B0NQpsTl6HCid4hOoC0p9cYOxCv8OANkOJf6ncClGwMH5J9Ik3
         UQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730483272; x=1731088072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PxfRaBd2Z4IAnFtE1pVDi1Drl+tQCB1zhAZtdVbCCqk=;
        b=Zb9eCjOvkVhk6yYsB8iKkcWHLF2UTMNdv4fEVTEm3EBlIRzQgXcVu8Xjclu6RZNvsU
         FW1zB3h5AzsqnJc9J4xH2grtMdcRB86Cxj0pCnBnfveZlow26n/bK2ZiE/eO38o9gbGM
         GW+jzHmZZ1PCTWVLl/vef/QaiJaXE4L/tQpwYPdG+Z3hysV7kBSipm4T9QOaDZbKkxXV
         stS6Frk1PRynuoevyhQ7qr+ZbGP/eA/NPJN9+ko0PdLjPXJcItmnS2JWjSv26QnPJeWS
         ue2clFMbj9xoWbBZAxUirB4MoFO7wvsRxirAZWwDWYqewtHStRYlKUwESe8cUFOhqTsX
         PtPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz+hPGzSXkIuTBSC0+2tvo3xSEVJKShGKrUzZWNaIrQhN7VVvnDUzzHBHe9rTRdeZ7YpFzLDjmvtVwZor9@lists.linux.dev
X-Gm-Message-State: AOJu0YwwdlX4F1LWYshdYdjeRFK5vD4P+d3q8mASyK1u3KY+3LSS3TQ9
	9kYx3WNcnUG46SnWR6ClQ21zMR7LbuiColu4wstPO35qdcD/tgCf
X-Google-Smtp-Source: AGHT+IGLOQm2Hs7TEtonoWfGm48x/Hh2jXZbzg/FowWQbD3IP/YZNteRD9TAQtsjxuFjEOkgSWVguA==
X-Received: by 2002:a5d:6da8:0:b0:37d:4e03:ff8e with SMTP id ffacd0b85a97d-381be7bae0emr6837279f8f.28.1730483271730;
        Fri, 01 Nov 2024 10:47:51 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c1185b4bsm5732933f8f.112.2024.11.01.10.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 10:47:50 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	arnd@arndb.de,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 9/9] Correct check for max secondary address
Date: Fri,  1 Nov 2024 18:47:05 +0100
Message-ID: <20241101174705.12682-10-dpenkler@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241101174705.12682-1-dpenkler@gmail.com>
References: <20241101174705.12682-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

  GPIB secondary addresses can be between 0 and 31 inclusive
  unlike primary addresses where address 31 is used for UNT and UNL

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/common/gpib_os.c | 3 +--
 drivers/staging/gpib/common/iblib.c   | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index c0b774a831a6..65ab190ac68e 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -525,7 +525,6 @@ int serial_poll_all(gpib_board_t *board, unsigned int usec_timeout)
  * SPD and UNT are sent at the completion of the poll.
  */
 
-static const int gpib_addr_max = 30;	/* max address for primary/secondary gpib addresses */
 
 int dvrsp(gpib_board_t *board, unsigned int pad, int sad,
 	  unsigned int usec_timeout, uint8_t *result)
@@ -538,7 +537,7 @@ int dvrsp(gpib_board_t *board, unsigned int pad, int sad,
 		return -1;
 	}
 
-	if (pad > gpib_addr_max || sad > gpib_addr_max) {
+	if (pad > 30 || sad > 31) {
 		pr_err("gpib: bad address for serial poll");
 		return -1;
 	}
diff --git a/drivers/staging/gpib/common/iblib.c b/drivers/staging/gpib/common/iblib.c
index fc57e760c144..5678e8bd709b 100644
--- a/drivers/staging/gpib/common/iblib.c
+++ b/drivers/staging/gpib/common/iblib.c
@@ -498,8 +498,8 @@ int ibpad(gpib_board_t *board, unsigned int addr)
  */
 int ibsad(gpib_board_t *board, int addr)
 {
-	if (addr > 30) {
-		pr_err("gpib: invalid secondary address %i, must be 0-30\n", addr);
+	if (addr > 31) {
+		pr_err("gpib: invalid secondary address %i, must be 0-31\n", addr);
 		return -1;
 	}
 	board->sad = addr;
-- 
2.46.2

