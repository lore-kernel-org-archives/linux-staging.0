Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7935D477E42
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119837; cv=none; b=ekSHlwJJSYIlB9PbFtiThWp7kLn7x/SoaOY+GiyST78f08pwk6oiV+RIL7wluJOnqgCzXQ7HVkzstdNwl/SO2KQ4tDmolAvq8vQmpKf3slIuX/4MjYBugQB5eUzLI8bLLQHBE1J4MSQUl6xHwJpb00H2ZKgUmhiFKgfgw/sp8fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119837; c=relaxed/simple;
	bh=TwhfZ4JB7l42nuWDc+QaRaXnnleV2uCuNE5aMb6okK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pvjxni9WquLqRdNNDpGCvO6z7jjjzaNbnHxU0e+Uhmz+LAMO3XyxJTrR381QIsSF52om+AA7rO/fnAtQKjDX+5uX9PUFBQ+S0STffvSqKiEC/OsJ6jzP1lrMyqNmpTmYpei5tflE5/vf7zHWHgS79KqhsbWkUb+mIwfC9Eoa5Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBmWYIrt; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBmWYIrt"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aebd52488cso5790798e87.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119832; x=1784724632; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+xB4UeaffLISYYnOmZkuvvRpVXgpH0hBEJdxsuUwA8=;
        b=CBmWYIrtwklp8gZfd9XDiCMXTukrBYS7tL1nSwdkoll9YSXGMHvIpO4mAD6Gqf36BP
         zFdtKJLptWgaeQSwmgQxA5NQhvoDdrHQVSio99p/8/CX02Qc6Ak7R6OC75bPDYVW33d/
         JGbEa7nzBw3T15yZ1d7LD6mIkfm8YVX60GDneSrvryx3wXY5FkaZHeSUyX0kSDANihwV
         UyXvpyuEzAXV/jEFUpoFietc/rX6UKSux1mFfrXWWFF2QRK5gdZMoneKmyicgU9PhyLY
         eMZ/kl29x2axjFJZaTPO6gWXuEzHS2NpfTpIUsAW0DoCfK0nxsfsV9EwCrunuA47oT4C
         rZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119832; x=1784724632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L+xB4UeaffLISYYnOmZkuvvRpVXgpH0hBEJdxsuUwA8=;
        b=YsGnS9FejZEqSe1NK0nnC41niUhiAii7QxQ3AgBSfs8gRCiPL9vULmoXmuXxXchoxq
         CGYB9SJR4HtaNkm7sxrunf7vj3mJcpdffbzJbgzxlp7eKGyastB6Dvy9DsYImyD7qGGL
         k9XoKZyZdGDHJjBIvfhXV0Xj0g55kdR9gIyKQVJ/dHuaGlOkuRzsPcp08amS/Q3/49e2
         LEH0m2d2JSv7O5TjKeYMSrZJ/x+Y3I+43dof4zP98eVAZr7Bol5DzSYD5Ub5i0lCGmPN
         TrR2WgTtSIyRtWk8/w8Mb5TEQ2cPpnz1qu0phet7wtYG4cB7TbN+Knl2b8zFvs51S7sU
         z7kQ==
X-Gm-Message-State: AOJu0YzWLA2h9vgi5zXS51MaMfHApplg7ApgpwDjmmR4GePl9N2GbQyt
	5RjBu3G7QliAEKuhIeb7WiN3l7ooWmgx3dopU989Z0Bu9f8UAAAA7ej+
X-Gm-Gg: AfdE7cmR/nZ4KvsTDUkTdleUKFAQ+MQ2vl9zSk4Kfa4riughkwBJ2C/MN62sHPUkbK6
	fE1Wd4VO+MsOcGe/AvPEtu4WZC1sW1dEhOunqfSfuQcabPXVo3ZWRPvdrx/mCyZ7ynB1BpkWR4T
	LYseNhISeFJSJ7EPudf6Fs//U1LAcU6lOd4fcr8e358bte+z0FkKxZ8zq9TEI8fPZ5KMEreALIf
	sdSrvm/AUL87vFp7vULQyIP+0u2SkZMplEx+X8aX7F+sKkvQ40728D4Boz25rpRMixIclNuXLmm
	vMEyhzUqb43+JyMD/co237E5xRbllqeOntq/sPsfuc2KEiu8uVzkpbTnUbZLCgLCnXWl67+x0L+
	bCHxskZ/1PwQGuOcuTfAqKnb9rIv65CVMnKPjB/DuAPmzexo1bHOpUeTQWR6Bz8tn80KiJmmVVK
	Wj4lIbfmjayLfq67TtuU/7kmTrbiUcVn+hvxuzL9llvxj75w03xtAtSA/evyC06dBRZQ8xQrBrE
	wK0uhSU2/nzOCJy2hsd8pQb
X-Received: by 2002:a05:6512:3d8e:b0:5ae:b260:cf47 with SMTP id 2adb3069b0e04-5b15d76ff34mr608220e87.10.1784119831837;
        Wed, 15 Jul 2026 05:50:31 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:31 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 21/61] staging: rtl8723bs: replace rtw_reset_continual_io_error with atomic_set
Date: Wed, 15 Jul 2026 19:47:49 +0700
Message-ID: <20260715124829.90290-22-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the redundant rtw_reset_continual_io_error() wrapper function
from the driver and replace its call sites with direct atomic_set()
invocations.

The wrapper does nothing but call atomic_set() with a fixed constant
value of 0. Eliminating it simplifies the driver's error-handling
interface and avoids unnecessary call overhead.

Clean up the function definition, remove its prototype from the header
file, and update all invocations to use atomic_set() directly.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_io.c           | 6 ------
 drivers/staging/rtl8723bs/include/rtw_io.h        | 2 +-
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c      | 2 +-
 drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c | 4 ++--
 4 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index c793ae7ea..2692c9088 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -144,9 +144,3 @@ int rtw_inc_and_chk_continual_io_error(struct dvobj_priv *dvobj)
 
 	return false;
 }
-
-/* Set the continual_io_error of this @param dvobjprive to 0 */
-void rtw_reset_continual_io_error(struct dvobj_priv *dvobj)
-{
-	atomic_set(&dvobj->continual_io_error, 0);
-}
diff --git a/drivers/staging/rtl8723bs/include/rtw_io.h b/drivers/staging/rtl8723bs/include/rtw_io.h
index 3c99a2bc1..2c33d8053 100644
--- a/drivers/staging/rtl8723bs/include/rtw_io.h
+++ b/drivers/staging/rtl8723bs/include/rtw_io.h
@@ -33,7 +33,7 @@ struct	intf_hdl {
 #define MAX_CONTINUAL_IO_ERR SD_IO_TRY_CNT
 
 int rtw_inc_and_chk_continual_io_error(struct dvobj_priv *dvobj);
-void rtw_reset_continual_io_error(struct dvobj_priv *dvobj);
+
 
 struct io_priv {
 
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d2419c776..0adfc2766 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -170,7 +170,7 @@ static struct dvobj_priv *sdio_dvobj_init(struct sdio_func *func)
 	if (ret)
 		goto free_dvobj;
 
-	rtw_reset_continual_io_error(dvobj);
+	atomic_set(&dvobj->continual_io_error, 0);
 
 	return dvobj;
 
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
index e9a2f3f7e..f728594b0 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
@@ -217,7 +217,7 @@ u32 sd_read32(struct intf_hdl *pintfhdl, u32 addr, s32 *err)
 				sdio_release_host(func);
 
 			if (*err == 0) {
-				rtw_reset_continual_io_error(psdiodev);
+				atomic_set(&psdiodev->continual_io_error, 0);
 				break;
 			}
 
@@ -293,7 +293,7 @@ void sd_write32(struct intf_hdl *pintfhdl, u32 addr, u32 v, s32 *err)
 			if (claim_needed)
 				sdio_release_host(func);
 			if (*err == 0) {
-				rtw_reset_continual_io_error(psdiodev);
+				atomic_set(&psdiodev->continual_io_error, 0);
 				break;
 			}
 
-- 
2.55.0

