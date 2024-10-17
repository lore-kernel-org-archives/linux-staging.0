Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E3221BAE4
	for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 19:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.140.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729192486; cv=none; b=D/ysPOoLKtBtiwNB67L6TzWIj0WjIgVUqc7X+U49p/6mw+XymoFjafvK1A2er21KFccC8/zBxr/0C6oj5PriZVtp/FqGFJ/jrvN1pEKTR72s8ilsFu8g3SYw64BM/UMg9M0MAuoN2XzHi1tHnTTEA7GYwmsP7NbrijPUOx15DE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729192486; c=relaxed/simple;
	bh=ynAGmr00/7aH/+ZbJQhLVyaqCtQCmSH3m+i/i65Qki0=;
	h=From:Date:Subject:To:Cc:Message-Id; b=sBemNzXSn9OEDH0pq0taIguRJbCLuH2ec6NqZ7b5cxPLkzShRqWu5azLOuHx1bgqYT75lEToCyPszvcZHlp+HcGLT5NTb24UClBRXDKxxtxXqzPVUTB2NBee/Qs5Kc3hvBZGAYKaYoPjnZcFRnxjN4MUGDwtdO1BpMSuY+XSz9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=none smtp.mailfrom=bout3.ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=S3V+2U3g; arc=none smtp.client-ip=136.144.140.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bout3.ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="S3V+2U3g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1729192473; bh=ynAGmr00/7aH/+ZbJQhLVyaqCtQCmSH3m+i/i65Qki0=;
	h=From:Date:Subject:To:Cc:From;
	b=S3V+2U3gFkXU6dBnttNvJHFMWIvgkjSS0ifjpf+EUhUD73RKbYVzOeY+ffel8147q
	 VRM2XiRQnQuuWqWz1/J70XkdPtZLiUCe1N3HbMp0QlG7IU3yuiM1KeL/pvVt1sV+WN
	 IVeddy3u1SC7l1b7T7bICFtzeDLTZSXj8oHOMZahXY7bm0Eh5sklmUmO0TpR9/klxO
	 cyFTCv5oybU6zzzxiJ6LIg4RjYWBqNfNutumXkZflm81x3WFn50SOaDokYY0ikma0S
	 INjsn3e0JUQEXp7v7MQnVKILzydx1uvFTF5eTHV6NzM5CajmwELI5sy0/uY4/qUtab
	 DqVVfsG2uLCXlHFZ5fFuq93xagQeSVIfNpVvhcKLQDZMsvwu+vaJcMguuLQlTurbrk
	 HImBKayFVL6JOLCq08N0dYVLPfYa8D4Fwh3oNZQuJ1SwsyC4HgZkGtNFpBvdJ06Vo8
	 WidpqvSIUe4OU+uvNg5uNmuweyy1oHKOcpq10E5O85acO/y4DaXHmcn8HSWPqIoTic
	 althjJm1T4209aWusiPaPCm4ZBTYDOKjiaz5CohGUh4l/Q/mI/4zMquisyou5Y8wxR
	 9MbTn+X/o4RZAn7mcCQ/ZRnjYEURCmxYiD0B+hKZNLoZdsWdX4budGbBFqPZ1Yt2Rc
	 q2ZKWZV2FDnVPnMwGUgGl7gQ=
Received: by bout3.ijzerbout.nl (Postfix, from userid 1000)
	id 2E7BD18DAFE; Thu, 17 Oct 2024 21:14:33 +0200 (CEST)
From: Kees Bakker <kees@ijzerbout.nl>
Date: Thu, 17 Oct 2024 21:13:31 +0200
Subject: [PATCH] staging: gpib: replace dump function by print_hex_dump
To: Dave Penkler <dpenkler@gmail.com>
Cc: Linux Staging <linux-staging@lists.linux.dev>
Message-Id: <20241017191433.2E7BD18DAFE@bout3.ijzerbout.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

It is better to use a standard (proven in use) in-kernel function that does
the same. This also solves two buffer overflow problems.

Signed-off-by: Kees Bakker <kees@ijzerbout.nl>
---
 .../staging/gpib/agilent_82357a/agilent_82357a.c   | 14 +-------------
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c          | 14 +-------------
 2 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index bbc7e8866872..bb494eea0920 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -207,20 +207,8 @@ static int agilent_82357a_receive_control_msg(struct agilent_82357a_priv *a_priv
 
 static void agilent_82357a_dump_raw_block(const u8 *raw_data, int length)
 {
-#define RAW_BUF_SIZE 256
-	int i, pos = 0;
-	char print_buf[RAW_BUF_SIZE];
-
 	pr_info("hex block dump\n");
-	for (i = 0; i < length; ++i) {
-		if (i && (i % 8 == 0)) {
-			pr_info("%s\n", print_buf);
-			pos = 0;
-		}
-		pos += snprintf(&print_buf[pos], RAW_BUF_SIZE, " %02x", raw_data[i]);
-	}
-	if (pos)
-		pr_info("%s\n", print_buf);
+	print_hex_dump(KERN_INFO, "", DUMP_PREFIX_NONE, 8, 1, raw_data, length, true);
 }
 
 static int agilent_82357a_write_registers(struct agilent_82357a_priv *a_priv,
diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index 1da263676f2a..d5b6d0932cd9 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -354,20 +354,8 @@ static int ni_usb_parse_status_block(const u8 *buffer, struct ni_usb_status_bloc
 
 static void ni_usb_dump_raw_block(const u8 *raw_data, int length)
 {
-#define RAW_BUF_SIZE 256
-	int i, pos = 0;
-	char print_buf[RAW_BUF_SIZE];
-
 	pr_info("hex block dump\n");
-	for (i = 0; i < length; ++i) {
-		if (i && (i % 8 == 0)) {
-			pr_info("%s\n", print_buf);
-			pos = 0;
-		}
-		pos += snprintf(&print_buf[pos], RAW_BUF_SIZE, " %02x", raw_data[i]);
-	}
-	if (pos)
-		pr_info("%s\n", print_buf);
+	print_hex_dump(KERN_INFO, "", DUMP_PREFIX_NONE, 8, 1, raw_data, length, true);
 }
 
 static int ni_usb_parse_register_read_block(const u8 *raw_data, unsigned int *results,
-- 
2.47.0

