Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8751C23236F
	for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 20:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836131; cv=none; b=R8htheChZu7g3z9GuMMbqURQgiU+0dxPDO/YCuHz49oV9HrlSi2XwNkeOD/tbFRdoUONb7BvD3zD8JKenfQ2wl5RHiGfwPsjq2Gh5ZxUb3Yhv/9Qm7oI3aDUfIKuRMUvDFzJMTHz2i0bOf5krhw36Qem+DxDLVaFXEDkBOR9I0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836131; c=relaxed/simple;
	bh=jG1VelJdYtxDypcUuL37BKnVeljiwv8UHZSTxXIdltA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cqZWJaPFRDoCPZtdRgVERXMewq2v8DtqV6KCbFGGwZ3HDnvVjivnSHaDYRFLNTWt66NxLPyh5M426Supat+xgEdkCLET+a9CuG/Bqzyj1P70WWWJU+W7slQc+KyJ60rUQeduMDRl6ptpAyRTrAL/TDX3qQZLRyS3TI2YmRQLdKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=GCDSfSGv; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="GCDSfSGv"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-736dd9c4b40so1111674b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 13:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836129; x=1745440929; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TcFNiziR7pgxmZ4Nao78oOa5IfNUpz+8UeC5Li23vnw=;
        b=GCDSfSGvv29ThpO4m47Qjflb9RKlKFWiknFKu0pva/B1w+6eDS5693J7jdM0nuXuVX
         Cj2lfT2icjL4W3wmtucmCZTmDu4+XsRZElL7olZIoMiaQPPsfa6F0D+gqYTH5uJBPlJf
         kGaEDKxkNJJSrfbwx1MsJSPMWXlAYlDsT6HcHO4F6nmdoqZ9725Fb/4KzVXfRqlamDK0
         NffYib78UR4MoEM+H5yAZy04CpY6RX5I+f8v07mA+jY7eWuXvAfaswwlozWa+/Ka8BOZ
         8c8DzYUj5b6Cglrp2GFKeFAoCCpnXpVhqtxHyCN0dFVOdf26j/KzolltTq0aAULSk25G
         9bng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836129; x=1745440929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TcFNiziR7pgxmZ4Nao78oOa5IfNUpz+8UeC5Li23vnw=;
        b=KbxVEiAZGU12iR/cxaDQi1rTGKrs2JwNChSTNAPSwOM8Z+fNoAhB8M5ennp6pPE49A
         hl5LpcWGRNf2ZUEubPwjkg24oQpI1lK5sFy08Vpol3nlLzjQANtk8j+T2qeZmF2Azk1H
         61Cobe9pZE92S5o8WtZUR3H33KSI7OAwTPBJPLXrYsB9MUvjDrV2IN66CimzHIvhib3f
         M+tTn9aNJOJD1n6nQ4rzUxjSlkZvQjcyPfCQFoO8aoxE8GfwcN7vM8bdYJkPfsmFEGVz
         mNL1RMTAXal6X0IerSoszDwCSeXAWi3MMVbwHdB64nblJ2PtDDd90C1SL29ii+Rcp+U8
         lRLQ==
X-Gm-Message-State: AOJu0YxsXjF3UeTg4yvkWExgbsqF800GOHxvGa5wCw6c+n4eIE0fGTMr
	xDPUr9Cb2riamdBFHwx/s2pyJqmkFDQM+Er/NaRQSsZMxyoXicdAuUGkhrYV9nz4RyKrNbhUvqQ
	=
X-Gm-Gg: ASbGncsluKWzwN8fCBCM8sJwbl3e9NlXoyV+wiWuXsc5GAPY39rd61BhrK77NeQkQk4
	X4DBV043KJHzxEWfFlA231jWN5lRFhwg2RSwTp/YGaEz+uDYiut0IOUfC7i2P12DGNYUbsFwVkU
	8Xw0ovnnpCHzA9/wlCnTkm7TjLZ2i6/+zvwvQKe09IGMf6kXvw53rbWvMewtmFWFAZpix/fZTI4
	m09PPXvotfNWNK+mtXewNatB3U+xW1/27h5YCZQCiRMGR4HHbfrsUeMyvIAf1HEqp/2xSj+DT9P
	hcVLIvWkdGyFav6VkWb+5QRxMIX5MSGfLHxhUvZYla19rWoyh28l5tPUwwmxgXYbWjOi4VtYbTD
	/7JHG1A==
X-Google-Smtp-Source: AGHT+IGEAC+9Fx62N9LnXooYFVA84nS16E6az2pmB1QBovtDSpEiRCS3qzu8aY6+MCPzNSZttazrsg==
X-Received: by 2002:a62:b405:0:b0:725:4a1b:38ec with SMTP id d2e1a72fcca58-73cdbef5484mr445038b3a.3.1744836128662;
        Wed, 16 Apr 2025 13:42:08 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230da87sm10880120b3a.127.2025.04.16.13.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:08 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 01/18] staging: gpib: struct typing for gpib_interface
Date: Wed, 16 Apr 2025 20:41:47 +0000
Message-ID: <20250416204204.8009-2-matchstick@neverthere.org>
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

"Having the word "_struct" in the name of the struct doesn't add any
information so rename "struct gpib_interface_struct" to
"struct gpib_interface".

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_types.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 71af9e808a76..16aaade310fd 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -22,7 +22,7 @@
 #include <linux/timer.h>
 #include <linux/interrupt.h>
 
-typedef struct gpib_interface_struct gpib_interface_t;
+typedef struct gpib_interface gpib_interface_t;
 struct gpib_board;
 
 /* config parameters that are only used by driver attach functions */
@@ -51,7 +51,7 @@ struct gpib_board_config {
 	char *serial_number;
 };
 
-struct gpib_interface_struct {
+struct gpib_interface {
 	/* name of board */
 	char *name;
 	/* attach() initializes board and allocates resources */
-- 
2.43.0

