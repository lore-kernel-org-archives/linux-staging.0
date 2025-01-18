Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E28190497
	for <linux-staging@lists.linux.dev>; Sat, 18 Jan 2025 14:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737211865; cv=none; b=EIThQ9m+/Pb4Phst9Z1u/WWo9RIlHoi//PLSoaTWhvCupgwyIYdyjWeE0Lwlxwc8O/Y2W7Qd0DEEl1zQZfnP2y3L7zbRlow9kK/nvRnLMaHzbHeO2ETXAshR+3cXHE3Sel84kfYS12vPgn8SSaos4398vHP7ctCP5qpib0gN8do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737211865; c=relaxed/simple;
	bh=CEBNE5aqF58645wo8cHthYPuUfVRK/7AczWCqYZ6Flc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t98X1F1ockcECapk9EoPvXtjtXCHSC6YZCGQIAsc7jXD5qRPOdUSP5p7VkwpgefJyNBXtCU04TmPvTxHO2E1d6rIFtQ66DYrsUiYIvJloH4OkBIefvxQfCRBGTtrzUYkHNYVfqQKCQ7S41lfi7mSCfmKPDEIrxnqXfvh41Olp+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KjMuHH/7; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KjMuHH/7"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso3350059f8f.2
        for <linux-staging@lists.linux.dev>; Sat, 18 Jan 2025 06:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737211862; x=1737816662; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1UV4T0AyhTiydD8vQiYizGE0EyIbVgUsUfJj0/tNcZk=;
        b=KjMuHH/7s3ygzXzmSKp0hQUGdH+8ybZg93DdOD0FkW8rhR1IIsVwEoNLU12JSrQ/aG
         dVUmiwIbZdODNaIsarOZsNzLmw2aVpoWK49G3lvAoK0rwVzW9lec50uUmY0ejKNyGU/2
         965yabcEMWuCZ/z3nPVKE5a6arMnNDAjID3wtIC6ewG2d2Qsz+oW4x9Xew5dX1oFid2V
         eXW+beToJbw0jbTGFx5Fae8QaLNOwqSAGXG7s/bXlHgI8DxMUTPqsPVPrd8AKkSjyeYO
         Ge7lbytARQ83jt/qlIIVWmODQu4v1tnNyu7gx+kD1ebARROw4FFXfM+tt1EBrjAycfST
         RvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737211862; x=1737816662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1UV4T0AyhTiydD8vQiYizGE0EyIbVgUsUfJj0/tNcZk=;
        b=kPfAQkE3Z86055Kvf6J+WULsIPrErQHOa4imKH1k14A2LPzWtYw9NeU4JPPnq0Y1Zm
         lG/mLLjYgWxM2WPSdjoKWQFptre+TX+t+VP5vTP8pwJ1lhRm1QYo6zzN7tnL+kE25fq8
         t5OGZlY+zzpkGwT//g6I7Dms7TLNkP8YJuErMGlg0jpVsk6fyvqsRXpsdrLVXFz1/3TW
         q4uHJ1SG3KU2WwAVlA0N9948SGrqTFywQjnHkrgATfc0MO9t0Ns92ghDJvnajyGX9iii
         TpJyjmbS8+FooXMqJ4VstzSb7aM6/ElEAzzYJb8po/oQ9Aj3eCJaFWDAYdN+UuW3lqyn
         itpw==
X-Forwarded-Encrypted: i=1; AJvYcCWqKyOLsLGNSQsb8OTAnA/vTM02ZEZgJSIMDfVYsapjvaLGfjORSObLsGpD1KCYMu2b8yrJqQSGn41nB8B+@lists.linux.dev
X-Gm-Message-State: AOJu0Yxh1Va6G8oXnTaSUxMMNDzfE25besb1nyDlS5nLJyK5iTLxnjbA
	GXnsuBqFncBxW2lSVrjL8b/0APdbelSCK6lDLMLz58lwwlXrrZiB
X-Gm-Gg: ASbGnct8C6mZc7uRk8Uro1WYTyFxuIZKs41QjHM2uhtHRlFmXXVKbtl0kMA8A9UUbNB
	IbFGZsmcUSQinMRBJN7RXwoMwiUBEughpayq6BmO4bA9KkFFv56XenA5MB9STek2dwSpwTxPmAK
	Of5xpyL7gzmvZFWZku4f8YgLl1TK9SpTx5ViCj7f2bIeZ1q80T0JG7MCY6Aqz2efMYrgDWPLjNS
	6xvlvNOGWMXSFmXqPbx7k/JACElXxOhhVAwk7YwYo52WCD8KjmrAYBy1kj4LSIol9arh4fXBIYN
	Pbz5vfygg0p+LK1DipskJbEyZF3mIg==
X-Google-Smtp-Source: AGHT+IFprDQmQq1Ux5LjJhPX1ZQwUvRsHWEBK4lQQbtL259/eEmbL6vlcbnz4lL3fKQuoQIm5IErEA==
X-Received: by 2002:a05:6000:1a85:b0:38a:88f8:aac6 with SMTP id ffacd0b85a97d-38bf57a77c7mr6364687f8f.41.1737211860466;
        Sat, 18 Jan 2025 06:51:00 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c103f0afsm74701735e9.2.2025.01.18.06.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 06:50:59 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 1/2] staging: gpib: Fix NULL pointer dereference in detach
Date: Sat, 18 Jan 2025 15:50:45 +0100
Message-ID: <20250118145046.12181-2-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250118145046.12181-1-dpenkler@gmail.com>
References: <20250118145046.12181-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the detach function is called after a failed attach
the usb_dev initialization can cause a NULL pointer
dereference. This happens when the usb device is not found
in the attach procedure.

Remove the usb_dev variable and initialization and change the dev
in the dev_info message from the usb_dev to the gpib_dev.

Fixes: fbae7090f30c ("staging: gpib: Update messaging and usb_device refs in agilent_usb")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index 34d85a1bdb37..2aaccebc3c7b 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -1442,12 +1442,10 @@ static int agilent_82357a_go_idle(gpib_board_t *board)
 static void agilent_82357a_detach(gpib_board_t *board)
 {
 	struct agilent_82357a_priv *a_priv;
-	struct usb_device *usb_dev;
 
 	mutex_lock(&agilent_82357a_hotplug_lock);
 
 	a_priv = board->private_data;
-	usb_dev = interface_to_usbdev(a_priv->bus_interface);
 	if (a_priv) {
 		if (a_priv->bus_interface) {
 			agilent_82357a_go_idle(board);
@@ -1459,7 +1457,7 @@ static void agilent_82357a_detach(gpib_board_t *board)
 		agilent_82357a_cleanup_urbs(a_priv);
 		agilent_82357a_free_private(a_priv);
 	}
-	dev_info(&usb_dev->dev, "%s: detached\n", __func__);
+	dev_info(board->gpib_dev, "%s: detached\n", __func__);
 	mutex_unlock(&agilent_82357a_hotplug_lock);
 }
 
-- 
2.47.1

