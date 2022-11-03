Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E505632
	for <linux-staging@lists.linux.dev>; Thu,  3 Nov 2022 00:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC18C433C1;
	Thu,  3 Nov 2022 00:19:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Vh9ZF32y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1667434767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mcmok62mxA5yi48HwvEwfpI0V5bJwILrpr/mqSiiPZQ=;
	b=Vh9ZF32yJixV6nU6uXNrd6rjYV/nySWWMzADticRkyBsQ2yV7HgXZ/J+YlWPXXrVBP0qPz
	hOoVeeHZis1/9sfBsuTIZZqto5LH3qzrTL3VN0BWUH14o6UwQLSDvkt/3J6qf1HfkgMBbG
	RuOyzMS+gPPASpjRFqARSxUGdIs7zVo=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b57b712f (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 3 Nov 2022 00:19:27 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH] staging: media: atomisp: make hive_int8 explictly signed
Date: Thu,  3 Nov 2022 01:19:14 +0100
Message-Id: <20221103001914.81849-1-Jason@zx2c4.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current definition of hive_int8 is a naked char, without any sign
specifier. This is incorrect on platforms such as arm, where char is
unsigned. Fortunately nothing in the kernel actually uses a hive_int8
type, but in case it gets used later rather than removed, this makes it
explicitly signed.

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
Greg - if you're going to take this for 6.1, that's fine with me.
Otherwise, if it's for 6.2, I'll take this in my unsigned-char tree to
keep all of these fixups together. -Jason

 drivers/staging/media/atomisp/pci/hive_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_types.h b/drivers/staging/media/atomisp/pci/hive_types.h
index 4b8a679fb672..55d36931f079 100644
--- a/drivers/staging/media/atomisp/pci/hive_types.h
+++ b/drivers/staging/media/atomisp/pci/hive_types.h
@@ -42,7 +42,7 @@ typedef unsigned int hive_bool;
 #define hive_false 0
 #define hive_true  1
 
-typedef char                 hive_int8;
+typedef signed char          hive_int8;
 typedef short                hive_int16;
 typedef int                  hive_int32;
 typedef long long            hive_int64;
-- 
2.38.1

