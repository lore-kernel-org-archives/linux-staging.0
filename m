Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A1524E005
	for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 20:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836148; cv=none; b=Nm6QWTPmw25mBtAVIXL0lzjWNC6VyZq3CFwJJO15fP/+JJDKiGq8Xdu/6tgmVQAc+ek9c36qqWQfFNocuH2xWptPbF7nsPXT4nui5Mf4m3HjzmPlW1qDuWmPKKDweyVnWo6pqpOfkjbIDYu4oJJhatTmqXZxj5aNn49NvYC1dP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836148; c=relaxed/simple;
	bh=r9FE5GpaFdBdPdJ/Zrxc1eYMAW56Ux07mT3KRwmjw48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SU5YF8tNE0ylmlH/Z9ORdYFqlNz6TcIlKC7zXNcKtjlMI6tQVkSZ+7Uicx2kZ5dSrkQJHNF85wgei11CYFvkO10O33P/GgdimtKSinmiSpKk0NKLTCpFNtUPPFo9BF8PM4sLTso+TflRPcXLOm99M4lM4parUegbbO9T1hpqS2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=O0y3hntv; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="O0y3hntv"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2279915e06eso1196045ad.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 13:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836146; x=1745440946; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8yDc+KkTQrj/aA1tqJ3BKYXbav1Fvp+NFLeH1to/I8=;
        b=O0y3hntvPqQYxDLImjJRJCSD1nkSkJZt2YSC8TwjNPTChgr/JVFuPwFDENCtO/5ZMt
         V6mJtL7AzwG6sD2K1VEODFn3TgrkWIOZtQbiAtNQ/GDIWB2qFx5H3v1g5oOq5cSf8dfw
         H2oKbR9sLNkVArr6tktDJbczfD34a8zlaVH5c7L3dHoOUTdUqsWoleNvheIW6ogLNh+0
         l3sy+lYVzGZdK0JhwL//ahnTW2/d1Zss9XQg6z2ZQ4N0mL3FDPNIWc11VcFToX5W2nK0
         sLy+ndNmq6GRMUvSWpImQoPs651CMyF+pNDzzKD3MABi6y/7we3lAEsNUri/iw9pVef9
         mSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836146; x=1745440946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8yDc+KkTQrj/aA1tqJ3BKYXbav1Fvp+NFLeH1to/I8=;
        b=MIFcNT2tgH6rGJ7IqsTkyFhTGEwRQwlurGZ2vM4AU0vzxeRi7Z3YYP/y8mN9g8vSHM
         mVefduDkX+YkazzouF0xir6VGR+JgXcsRFqVjrwkZYGIzjjIJMbIZks1Y2E3xKd+pnDQ
         Fnj0IEPksuJEgW+vDYZaGHA2pJ5tOM72LFlxqGsqKhGWME1kCXm7gBPBQRD256tRfbuC
         4XH7KP3yGzS3OJgrfkcTq/7qxorIE3Z+Zq8lOPh/nfj5KmYtSGrTe21G59bzlxLEuAH2
         lkVSAG1yi1EdWkeHWFmibF1Ox589JNZN++k3ogcZygrs8huh52bpdUBg9z6cwp/gK2yM
         K4lQ==
X-Gm-Message-State: AOJu0Ywa35NkH6h135cDJfsv75yz5fKCJWewoHT1ibRvKZnKcD04FaUb
	6T0Kg+KqEyDOteCZqWK+hXDy8Y8qo1imCraOfrTn+JdIR+oWN77hRnUabLJh+A==
X-Gm-Gg: ASbGnct7yM5e/CYCkhIFCzrZIeseozWWOTq7Evl9caeVBEoPmkoY/d/L+iC6Xn16xlB
	xCyfQs3xvzgEMIFS3IssdhClnlxDNqic1Ls2XxYDnFxa0yBqb5Pwo/pQS+3SFHz3nNn8Y8B47/Q
	7QqR6toVumVPMDjkfwQobnIf9dC3kbBpymmsS9gt1x01X1nihBdXzR8DEiUk2RmUtY7ukHkhtl7
	+ppB+wmp4tfK3BgC5+xDy3VOT50XBnc2OXEIYHnpjb7gVxhymQ9jGQUzctdyvqWJn0qGfW/3SfN
	XQMmSapChwAms21mVx9l7FfsvGJjdIN3nwL3X1faypHgzkGMinuhZpJEAqoOyFMtoR8nT2vIwXP
	R8korGg==
X-Google-Smtp-Source: AGHT+IHaYCE1yo3wywCZz1WcKGDv4E5arxZTfISVirWVGIKPHGaGjoxMurBeZllSADoTUT314yzFZw==
X-Received: by 2002:a17:902:e544:b0:224:1eab:97b2 with SMTP id d9443c01a7336-22c359844b4mr53603915ad.53.1744836146538;
        Wed, 16 Apr 2025 13:42:26 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fc47e0sm18808655ad.167.2025.04.16.13.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:26 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 16/18] staging: gpib: pc2: struct gpib_interface
Date: Wed, 16 Apr 2025 20:42:02 +0000
Message-ID: <20250416204204.8009-17-matchstick@neverthere.org>
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

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/pc2/pc2_gpib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/staging/gpib/pc2/pc2_gpib.c
index ee4ea1f32dfc..ae265e2eb46a 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -519,7 +519,7 @@ static void pc2_2a_detach(struct gpib_board *board)
 	pc2a_common_detach(board, pc2_2a_iosize);
 }
 
-static gpib_interface_t pc2_interface = {
+static struct gpib_interface pc2_interface = {
 	.name =	"pcII",
 	.attach =	pc2_attach,
 	.detach =	pc2_detach,
@@ -547,7 +547,7 @@ static gpib_interface_t pc2_interface = {
 	.return_to_local = pc2_return_to_local,
 };
 
-static gpib_interface_t pc2a_interface = {
+static struct gpib_interface pc2a_interface = {
 	.name =	"pcIIa",
 	.attach =	pc2a_attach,
 	.detach =	pc2a_detach,
@@ -575,7 +575,7 @@ static gpib_interface_t pc2a_interface = {
 	.return_to_local = pc2_return_to_local,
 };
 
-static gpib_interface_t pc2a_cb7210_interface = {
+static struct gpib_interface pc2a_cb7210_interface = {
 	.name =	"pcIIa_cb7210",
 	.attach =	pc2a_cb7210_attach,
 	.detach =	pc2a_detach,
@@ -603,7 +603,7 @@ static gpib_interface_t pc2a_cb7210_interface = {
 	.return_to_local = pc2_return_to_local,
 };
 
-static gpib_interface_t pc2_2a_interface = {
+static struct gpib_interface pc2_2a_interface = {
 	.name =	"pcII_IIa",
 	.attach =	pc2_2a_attach,
 	.detach =	pc2_2a_detach,
-- 
2.43.0

