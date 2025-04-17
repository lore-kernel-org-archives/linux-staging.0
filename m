Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D1B1DC9AC
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849980; cv=none; b=O5gI6ppcFTtTWgQvpY1wjLhcuJAMeFWoiteSyRTWilA06cZnZVCoetHX+aohEQYATCbsbskSfhlvrokT5VA+dPFcMYTlLm3JIR/NfBTd5TG38L9/4B5WNsJxdMqkHhItTpdA3LiU+Hla48V6Y5d/qXAxN7YrprvXGSoJg04OVKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849980; c=relaxed/simple;
	bh=mCsspTE3UaGQ8nT6EDevPiUOVoXq56LZJPwAiRcCzV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZhaM+nHG/iJ1/03kQCTpshsGHvqKEnGgMsAOhHi91PwZ+AosK8bYm0GrYf60/xH+zleHbqxQBdeFYDtrCdzSkWuUf3U9YzmLaCzL633sb8LDMMiu08n+BK23jrWiFRbQQRCbvsugztpxVBJV7ZhgWa8QW6uGnIwbeHigiwRiEDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=c803sG+6; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="c803sG+6"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736bfa487c3so142526b3a.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849978; x=1745454778; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Em25zRDyXTzVtfIF//c+VGrQ1J4twC/n9eclwcMlRg=;
        b=c803sG+6rmk51s5PRNj9g5uyp4G0lJVjlJHFB769OiDgRkoyL2SobuBTxgLbyNrmAs
         L6xzsV0LZAuEmxan+PxfD2Sbxt2PM2wqsUPQMLW6ITyUSn9Lvh/YmkwrlJ9D8r1YatzE
         UNpWu5u8XSy3nm8HCITRcaXo87MI5I/cuCyaaxkbRBI8S4vxbe0UiQORLq02bE3omXXY
         wIl7vZfGu4LlkF3MP2W/d+aBpheT+3OkLrMHimU7naTEltzc6EM6UkEmQEIWeDbCQbFu
         WpSh6fg4ZJm2uEImBGcFi+cKdswkm6XaXpHEJ2MaiWe+86lDI2GfIbLkcmsb2lD0ytiW
         W+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849978; x=1745454778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Em25zRDyXTzVtfIF//c+VGrQ1J4twC/n9eclwcMlRg=;
        b=mDcEXCWlqzBUtfT3REHdRSGTfPOOhXGuJbUTwLRyrpbuhms9gPSbV28IKhCPLopTs1
         o4xiiE5Y6IIynPuGSZmwo8AQdWT7s4YujWAB1nIPwPcop9NhejIW+Ky7rJUpe0Lg9oZz
         6PV0Tu3YclBVh9EOUKx78yFXVkiGuHfEvNjIY1ftXD6951xSMXephtR5skpPsaDFM+pR
         58i9sp9h33vYgwqJlrwsyMfhqB99OYhggNv0VI5aSLS6zIl/QElD5qi0AQLFVh/ZUUzM
         colxQ4jCAi+0rtn+QNLtnp0qQNn1MwzRX4+6tZ9r0x67kcrWUoyC+x/yod1N6eb0n1zh
         6bhw==
X-Gm-Message-State: AOJu0Yy5oWCBgCw/yE8t+/xOab3yWTOZh0GQ0TOLBVD+LiE+ZM2YPV4h
	ZLdn772wbDu2gb0ZFM9sgtBflqeBmt3U56J+xkxoiiGU8CxCGx8HxzpXnLun7w==
X-Gm-Gg: ASbGncuZ562azxyo5+3pedNIDqFfd4UpfLaoNeh3QIqLNDKns9mNI8/451SvZQ2aioB
	/roPWUXPxB0gNbenIMqWmiLS+5uooy+M0RYoNebEJip092dDjFrjhTp4wKBpGv5BCStEsIhES6L
	zjhndVP9GBHvdHSMtoNxvI6CxbEQvN/ywES+sxSjBoCQUCp4Py6nOTAdSGTB2MXFWh6EafcZSFV
	p0ObEVX81FSPcxdY4jxcRdLmk2aDpnaOs+JffzjNYaliCZ7QbJbKTIbw5TVoAOQ2MEleIyV8J+J
	qpf10GYB+aRfC77EzocSBeursRBxlYz6OekliL1rYjEQqBFja78PLue4yo1u0bGaBeo2p9sByrN
	pE2Oxdw==
X-Google-Smtp-Source: AGHT+IG6v8HH85HUkI2gNJcFwtsUXGFErr/79Ygu9DBV38QGm0Q0z030T8jpk4t+wzZOOcp1rgp8mw==
X-Received: by 2002:a17:90b:4ed0:b0:305:2d27:7cb0 with SMTP id 98e67ed59e1d1-3086402814cmr5665354a91.21.1744849978064;
        Wed, 16 Apr 2025 17:32:58 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3086104a0ffsm2314150a91.0.2025.04.16.17.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:32:57 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 08/18] staging: gpib: fmh: struct gpib_interface
Date: Thu, 17 Apr 2025 00:32:36 +0000
Message-ID: <20250417003246.84445-9-matchstick@neverthere.org>
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
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
index f86d3f90bbff..992e6f7c035c 100644
--- a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
+++ b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
@@ -1031,7 +1031,7 @@ static int fmh_gpib_fifo_read(struct gpib_board *board, uint8_t *buffer, size_t
 	return retval;
 }
 
-static gpib_interface_t fmh_gpib_unaccel_interface = {
+static struct gpib_interface fmh_gpib_unaccel_interface = {
 	.name = "fmh_gpib_unaccel",
 	.attach = fmh_gpib_attach_holdoff_all,
 	.detach = fmh_gpib_detach,
@@ -1059,7 +1059,7 @@ static gpib_interface_t fmh_gpib_unaccel_interface = {
 	.return_to_local = fmh_gpib_return_to_local,
 };
 
-static gpib_interface_t fmh_gpib_interface = {
+static struct gpib_interface fmh_gpib_interface = {
 	.name = "fmh_gpib",
 	.attach = fmh_gpib_attach_holdoff_end,
 	.detach = fmh_gpib_detach,
@@ -1087,7 +1087,7 @@ static gpib_interface_t fmh_gpib_interface = {
 	.return_to_local = fmh_gpib_return_to_local,
 };
 
-static gpib_interface_t fmh_gpib_pci_interface = {
+static struct gpib_interface fmh_gpib_pci_interface = {
 	.name = "fmh_gpib_pci",
 	.attach = fmh_gpib_pci_attach_holdoff_end,
 	.detach = fmh_gpib_pci_detach,
@@ -1115,7 +1115,7 @@ static gpib_interface_t fmh_gpib_pci_interface = {
 	.return_to_local = fmh_gpib_return_to_local,
 };
 
-static gpib_interface_t fmh_gpib_pci_unaccel_interface = {
+static struct gpib_interface fmh_gpib_pci_unaccel_interface = {
 	.name = "fmh_gpib_pci_unaccel",
 	.attach = fmh_gpib_pci_attach_holdoff_all,
 	.detach = fmh_gpib_pci_detach,
-- 
2.43.0

