Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E4E37881F
	for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 21:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783892478; cv=none; b=SFY5AO2cP3QTxe4sKnRTPR3UuPh4zIW6ortrsOvAd7q0dHuTugqqBfNOeFxwQ25hVqrvK8LCBgOO/AMXEH7rqWlaEoggOnwROXDaUYQtR61w5FYIpBDoJDr6dA221RGxW2hsma+EWdYJztBcEiIA3wN7vIkveMCgahQSFnKGeqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783892478; c=relaxed/simple;
	bh=ZYT1Akyi+z5M8uKGTFNLtonPGUrFVWvYHvRbZaCD3WM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ir5LynlsDxZ5YRVvpi+N3fgjVebYkmFje1sxNdV9LN07hTGsu5PLpTXHX4rkZfrhFJfUtcXfphosBZRxPYpv633enSSVj5ZSkaokswpyLuGLMJMOMwNyob12cNkDCSKtYRGokNJc+Po2aAoikrN2Qyn5hxgNuIGseUK1hvDoe6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iMmZaHSf; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iMmZaHSf"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so39915175ad.2
        for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 14:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783892477; x=1784497277; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3G/niZzPZPpf6j5luO/tpOHod+JIZIaSI+0T1B/3jYk=;
        b=iMmZaHSfFKWIEriVl1C76cRpChOSyhQnxDA65ByEFjX7etLd74pxL9v4rOosZcaASa
         5gutfsD8/NZn2HeDwC/Vqk8NA7UFAG78vh9TiCubo2zYHn7f3sik4SxPJQYJ+duauSer
         0+zibwW7LpCJhqpist5lVDeqPdRC/9I0yBcDGHI4ABFX1AVD1wkrsdJeoL4ab49/v/p5
         3KCH320om2DLBG2XvTsA0VxpSNrppYxfEJG+Ls66hBNyfp/kWXjL28JpEtewKtTBKyvB
         SGQ8CMDjaYFG6UGaHn/Il4JZHbRqqQGOx24hVAMu+6TcAgRfmf3OeqbxlJPGLjbDZDe0
         JTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783892477; x=1784497277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3G/niZzPZPpf6j5luO/tpOHod+JIZIaSI+0T1B/3jYk=;
        b=Vd7asi80M2VUmtWBMdHGeAPuosl2xAz4oHpjbz9e9zIU8ToA6ddLu8OclLmuseGULq
         Wf4Y15MPX+ciC8b3pjLbU8xO7+Ff870t7tB+G0NWmiWLi0538CIBgApCeJ5hQkuc7rEq
         Y7sHg9IjaokkJorhhESUTaU2HWQYYOxRtiW90HYKBQ/uuGa6PduXq7W/PnUVEfAl2DrZ
         ihRz30jxHGTdYiKrqAX8XEgY8aFEkeM0+qRSD12lYBRB+6/nak/UAMo3q29Mp2DNHXp4
         HkNT/uZWjZP0qZROaDAcmeugnntQWN2FFJnUKe/zdK8Bpa5K0b4bSI+KFxNFTwzpNMPn
         JnFA==
X-Forwarded-Encrypted: i=1; AHgh+RqJfPM6Baj9+C7sUnF8yfJ//aOo94V+r5eNN4lY9Oz5d3T7nwNHacfjmDBVSerKWXdCW7K9gEbDJHVGaYh/@lists.linux.dev
X-Gm-Message-State: AOJu0YytYSLYPmp761YNBABoSBdM11MkTrVZIMcUHgmJWVP6tLVod3fl
	N24qU8ZB+LOjcjon7bY4s5McP7qi6p4GY+KVTYHRTF108axhW7e5RDgY
X-Gm-Gg: AfdE7clznZqebp6SCDyV5iN/1tF4yOChY6V7grA81fLCNwOtOHLFEdm9ADSvUdHSo3S
	rUJE9yenzUbJSwfRfWuZqRbWZiIi8uMUlKewfk+iH8ZpdZz08dywmZX9P7I6TPImAEG8oFbOH9B
	6jmzdrU0YjGfSFQUnRfs9pkx+XhIDKdzniuZgFbVLS7GzSy73eKfJUqPGk8goOs8s6SGmiwD2Ce
	QsC0qXcvESKhuAAXIM8Q54/rP4lZmCQWSh+o1YthbOjdaQS48XqHU5KqV43zqh7/QGmEfpbCIsd
	TykY6Eaw3rWZIa4nX7nwVKGf0OluwW04Urjmi0a7vh2x67e9fwKkZ4x9PO9ZIJnt2hn66yjAkeA
	VNwNQ/INoZpvOydTk+3EKjg2wx3IMfLC7yBfx7SrYT/mwjL6wv8/2/UiX3ElfY+QLECqIMFCCAz
	2qHKzGL+PGXWiW
X-Received: by 2002:a17:903:1b6b:b0:2ca:9d5a:8b6c with SMTP id d9443c01a7336-2ce9e79f42bmr69833865ad.5.1783892476716;
        Sun, 12 Jul 2026 14:41:16 -0700 (PDT)
Received: from kdev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf74cbsm88459565ad.18.2026.07.12.14.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 14:41:16 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH] staging: axis-fifo: Fix kernel-doc return value warnings
Date: Sun, 12 Jul 2026 21:41:15 +0000
Message-ID: <20260712214115.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc comments for axis_fifo_read() and axis_fifo_write()
describe their return values as free text, which kernel-doc does not
recognize as a return section:

  $ scripts/kernel-doc -Wall -none drivers/staging/axis-fifo/axis-fifo.c
  Warning: drivers/staging/axis-fifo/axis-fifo.c:121 No description
  found for return value of 'axis_fifo_read'
  Warning: drivers/staging/axis-fifo/axis-fifo.c:214 No description
  found for return value of 'axis_fifo_write'

These warnings only show up in a direct kernel-doc invocation or a
W=2 build (-Wall is added to kernel-doc only when KBUILD_EXTRA_WARN
contains 2), which is why W=1 builds appear clean.

Convert the trailing "Returns ..." sentences into Return: sections so
kernel-doc recognizes the existing return value documentation. No
functional change.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 3aa2aa870ea9..7311e06312b0 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -114,7 +114,7 @@ static void reset_ip_core(struct axis_fifo *fifo)
  * operations must be executed atomically, in order and one after the other
  * without missing any.
  *
- * Returns the number of bytes read from the device or negative error code
+ * Return: The number of bytes read from the device or negative error code
  *	on failure.
  */
 static ssize_t axis_fifo_read(struct file *f, char __user *buf,
@@ -207,7 +207,7 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
  * we need to lock before checking if the device has available space to avoid
  * any concurrency issue.
  *
- * Returns the number of bytes written to the device or negative error code
+ * Return: The number of bytes written to the device or negative error code
  *	on failure.
  */
 static ssize_t axis_fifo_write(struct file *f, const char __user *buf,

base-commit: f4fb100039e96211609dfc44fb24b9e4a8a0f2f9
-- 
2.43.0

