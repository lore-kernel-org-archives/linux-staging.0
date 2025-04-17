Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9778A1FECB4
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849986; cv=none; b=LehL4JKpFS/67pSPBTNDPBtQTT0QXK33K9BBjPSAwrrBR7kgq2m6ByA1zA4JnoRIbhPHbFG82u1lX5VrTifCR5Lc/NI0TcRM5dBdFyUyxl0G8w7olOgsaFcAg0Yr+CfgvplSNTRoNN73MF+qnM3tq5+SNQX+ijZz0KSjrIjt0NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849986; c=relaxed/simple;
	bh=daIUt5m30GbThrgpN2UiMbj827gJGKnXfrI3FUsQ42Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ee8fcTjSYtAJtYsayqu/b+c7hxp0AzVaNWMihaKv/6th7DdAM49jqK6YwDCzW7OoQcQ+nY6iC9rJeuk/l87hHruqIiWInX2bEdE5W4I0nhkAxRuFQCQIjJHrU71GnzLWat1ZhN0JPx9ozCYVnjJV7+lD5LYtpZSjwpp1C1M2+9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=jTxQCct7; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="jTxQCct7"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2241053582dso3308745ad.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849984; x=1745454784; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHxSFc8bv3pUp3i2Yf563NFMSxUhbD3DiyJ7WfN7PZ8=;
        b=jTxQCct7bPP9L6Xx6vY6URsF4WO56xCy0CuZ0+Hmpc2D5rD4hhDe/GewcMrl651FXW
         Hx8vTlC+fuuJHoVBbnCIeLmX4sRYxy4DAkZUyf8s1uMQniVePLul7xdpH2/pFhv/ePms
         U6hJlg8jVbAmH+YGOjDZbnPE8ZaJhgQT/9lFnjbexQGpuOLiOs9HN1LmVgjw2snmwY5Y
         7sjclqyXU6H4qEyftlgcnNeQ+xrxXzsCylYgzmhPGSZXq41ji9+Hll1OLz3ldiU4Tc9z
         uETofWRwEA4caArtSQb/8Hl4AiFk5UoaKEe5AatNXrSjA5aFH+3YZFKmIm0EBH9LJCo5
         AfFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849984; x=1745454784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FHxSFc8bv3pUp3i2Yf563NFMSxUhbD3DiyJ7WfN7PZ8=;
        b=UiTjfgRMj13Q0N8Nn1uKuKZWhhFZCT2OCJkWXLN0Fj+1kcOyuWxU9xA7AvKcTGk07x
         DLK+d0zzXp5HDmhQ1xspbrZh6ZiyhrCYwNJ56CbmHTlXc3T9xug5Y/AXyQI6j/IA0+fp
         5b+ZWk6dCYXT4uchKdCr+0N5n1+518JwetbF/c6Q4W7ZyN7aJvgHVaQzX6kT48dE96i3
         ctXIod5lVR4AmS6CGeHRh4dp64hv8XoK0+W8xaByELNl7VYbMI1hbfSfvttSyxpFFiIZ
         SQh/WfBr40KigRklyRS6eloffseqADniWMtP3VfoWum6q7LCdBMpzVbkr6Z6Vx7fKwwW
         CPlA==
X-Gm-Message-State: AOJu0Yxwa98hjnBzgkQjPP8eh//ctWlVOtnorbUby4A0Z8r5deB2Kci3
	NC3o+NDRdu5wQ50mIn3SavdIu0SpJuT+kdkCTL8LJk3j4X2ZYcQTJU92VOJ/wg==
X-Gm-Gg: ASbGnctIw+9Y/8If8xlb2oNPETnX/rw7xMJeXVJL7STUf4jLA5f+s51d1/t8+rHPPl0
	IVtXR/viogDPEe8AHfEhV6Aq/ZdezWGzKm6glIGoAQOirL71Mh59VuCqYbpjy0aJy/mYtb3kbnm
	LrWKwVjqhNbLdxajcHQlk1BxwBJsIkIiCeBInOL+kR2HwCFVPAYpopjrvgYuDdJ5cwGpobM23g4
	bZy5aMsKMnVYl14J8TqQcjeyrTMaZN/TS0wZjHv3X6Aa5MHpdHTK2TM1xuB1mKmM6fzHyAdxuGb
	ESAm46Clml4WnuCXnP2I2esx21zEacbDZq/xk5hGECUI0k3kvxaYpbidCY2l1G/TqABvWmCGp3S
	7J9KdW2T3r+owuZpz
X-Google-Smtp-Source: AGHT+IE5J2dfQGuH+x3zeXEOqnTUrZZd8qUQtq7cXkVwrM2vWCpStLEsoHCoYf6uJID2hYkfseB/4A==
X-Received: by 2002:a17:903:2411:b0:21f:7a8b:d675 with SMTP id d9443c01a7336-22c358c5597mr64753925ad.4.1744849983910;
        Wed, 16 Apr 2025 17:33:03 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef11b1sm20910345ad.18.2025.04.16.17.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:33:03 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 13/18] staging: gpib: ines: struct gpib_interface
Date: Thu, 17 Apr 2025 00:32:41 +0000
Message-ID: <20250417003246.84445-14-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417003246.84445-1-matchstick@neverthere.org>
References: <20250417003246.84445-1-matchstick@neverthere.org>
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
 drivers/staging/gpib/ines/ines_gpib.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 17a14cb66e63..6cac26a3ae0b 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -539,7 +539,7 @@ void ines_return_to_local(struct gpib_board *board)
 	nec7210_return_to_local(board, &priv->nec7210_priv);
 }
 
-static gpib_interface_t ines_pci_unaccel_interface = {
+static struct gpib_interface ines_pci_unaccel_interface = {
 	.name = "ines_pci_unaccel",
 	.attach = ines_pci_attach,
 	.detach = ines_pci_detach,
@@ -567,7 +567,7 @@ static gpib_interface_t ines_pci_unaccel_interface = {
 	.return_to_local = ines_return_to_local,
 };
 
-static gpib_interface_t ines_pci_interface = {
+static struct gpib_interface ines_pci_interface = {
 	.name = "ines_pci",
 	.attach = ines_pci_accel_attach,
 	.detach = ines_pci_detach,
@@ -595,7 +595,7 @@ static gpib_interface_t ines_pci_interface = {
 	.return_to_local = ines_return_to_local,
 };
 
-static gpib_interface_t ines_pci_accel_interface = {
+static struct gpib_interface ines_pci_accel_interface = {
 	.name = "ines_pci_accel",
 	.attach = ines_pci_accel_attach,
 	.detach = ines_pci_detach,
@@ -623,7 +623,7 @@ static gpib_interface_t ines_pci_accel_interface = {
 	.return_to_local = ines_return_to_local,
 };
 
-static gpib_interface_t ines_isa_interface = {
+static struct gpib_interface ines_isa_interface = {
 	.name = "ines_isa",
 	.attach = ines_isa_attach,
 	.detach = ines_isa_detach,
@@ -1218,7 +1218,7 @@ void ines_pcmcia_cleanup_module(void)
 	pcmcia_unregister_driver(&ines_gpib_cs_driver);
 }
 
-static gpib_interface_t ines_pcmcia_unaccel_interface = {
+static struct gpib_interface ines_pcmcia_unaccel_interface = {
 	.name = "ines_pcmcia_unaccel",
 	.attach = ines_pcmcia_attach,
 	.detach = ines_pcmcia_detach,
@@ -1246,7 +1246,7 @@ static gpib_interface_t ines_pcmcia_unaccel_interface = {
 	.return_to_local = ines_return_to_local,
 };
 
-static gpib_interface_t ines_pcmcia_accel_interface = {
+static struct gpib_interface ines_pcmcia_accel_interface = {
 	.name = "ines_pcmcia_accel",
 	.attach = ines_pcmcia_accel_attach,
 	.detach = ines_pcmcia_detach,
@@ -1274,7 +1274,7 @@ static gpib_interface_t ines_pcmcia_accel_interface = {
 	.return_to_local = ines_return_to_local,
 };
 
-static gpib_interface_t ines_pcmcia_interface = {
+static struct gpib_interface ines_pcmcia_interface = {
 	.name = "ines_pcmcia",
 	.attach = ines_pcmcia_accel_attach,
 	.detach = ines_pcmcia_detach,
-- 
2.43.0

