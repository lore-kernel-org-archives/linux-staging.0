Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB774202F98
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 11:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729077338; cv=none; b=ePtcZWINLG5qQtVURBeeQ9vavx/5D+rRX2RR4mEdfzWF3ocuRIrdyUxJ6UfjQaULwkeUGfwUhgcCBkg+EFdFu48NEa+1syZ6nGOwbSqUpXSWPpQPekhYatDluEFu/L7s7aOGs7wgPlYEby8S+PI9PF0Ac5AHM1F6Pi1SiVn2e74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729077338; c=relaxed/simple;
	bh=GkfErWwWH6mCLA50JvCIKjwZ0W4m25z84LI8WRMMsDo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Io3QrBl5cLdPhvus1M00GT0lde+MxfTvaAzN7ZhcL5uePrUef0OPvE8KLS9rCy1AwwI7kvIn8MWkSD/72ZT3Lm5H251ojY0ERMfuuzY+4XHLR84MCm0ExLa0B8PIGVceA3pOrfKuKcjO3t1RLpqvDfqrpc+8Z3BvvGqGVFqy4xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lzynwnAg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lzynwnAg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A905C4CECD;
	Wed, 16 Oct 2024 11:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729077338;
	bh=GkfErWwWH6mCLA50JvCIKjwZ0W4m25z84LI8WRMMsDo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lzynwnAgT1DcqRfQfuxwgg8vDzc8yTduEyHjczmAuQYpHmRdIgOUnvEpM2cn+KzZ8
	 ANbkkagbRaamS/Wccf3qX3NlpzJiNbnCt5ODu6/upqLIIFor5dStGh8biAOolXzJ2q
	 sBUUFNpEodV+T21HwIVsP/4/0oH1a9mrpipd3yQy/PnFLWu9Rf02ovVNN0NtesNUGa
	 wMxZj625hsx4o+lU9dvW6Umh7I5qQkIAGps8pclrjNbdc9+lSQTJtq6dZrYvnaZksw
	 5jJ/I+FlaxyM5pqj8t48MXpqBrJ5mBGA7s4VJ0OLYD+Ame6nRzSNx310oUhWZJtoF4
	 MAu6D+C0Xcnlw==
From: Arnd Bergmann <arnd@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Penkler <dpenkler@gmail.com>
Cc: linux-staging@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 6/7] staging: gpib: use proper format string in request_module
Date: Wed, 16 Oct 2024 11:15:20 +0000
Message-Id: <20241016111521.1143191-7-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241016111521.1143191-1-arnd@kernel.org>
References: <20241016111521.1143191-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Using a string variable as a format causes a -Wformat-security
warning. Since the only use of the temporary module_string[] is to hold
the sprintf() output, just pass the format string and argument directly
to request_module().

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/gpib/common/gpib_os.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index e93a45132a40..6b12404efe7d 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -599,11 +599,9 @@ int ibopen(struct inode *inode, struct file *filep)
 	GPIB_DPRINTK("pid %i, gpib: opening minor %d\n", current->pid, minor);
 
 	if (board->use_count == 0) {
-		char module_string[32];
 		int retval;
 
-		snprintf(module_string, sizeof(module_string), "gpib%i", minor);
-		retval = request_module(module_string);
+		retval = request_module("gpib%i", minor);
 		if (retval) {
 			GPIB_DPRINTK("pid %i, gpib: request module returned %i\n",
 				     current->pid, retval);
-- 
2.39.5

