Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C731F4282;
	Wed,  2 Apr 2025 23:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743636602; cv=none; b=e4l+EBSdQxg2iWKtcdqHkZKAortVW/jV4rH1Pw0YXjES9/nyv3ZlBtQsfD3Aa6+onQVF7G1IrZaBGzcuPK91CPCx1So6Cw2QbVIDT6qBzHHRoegUSmcSbpDOK4sWBGPET2uCG3JDx8kOX8wbhFfQTjeYD+PgnXb9PyuObQ3UsOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743636602; c=relaxed/simple;
	bh=/p3GIfjBtSs6Jt5ZSdOfm26UGztzabxyhdkdEPZeYz0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h+k/x/XLKnhUcYgKhgcF/UfSwL7JKh2pfj5gZZfKe3LOMzW5007CXGtHKPwQceZmg/Tn7QHFE+Ktfcf0uxVAp9IH1HX2a+KamdivYbu01yvfb234dE9K2a/K8MWmQV8qLg1pivDAnyGbStylpaZhzJaiF7ZVSVBVGryb9WT/KsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WnHmc1Bz; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WnHmc1Bz"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so564058a12.1;
        Wed, 02 Apr 2025 16:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743636599; x=1744241399; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqNFWX1UH0kH8sSrQRW2FqXiCXFNIsTAW5BBc5AbyOA=;
        b=WnHmc1BzJFY/8M1Qs9cxuN05ik6uV/HIlWOPGO2h448FO9uEl+yEdoVqJT5fumd6LU
         xe9hm7AmXy/oe9yL3UAimnFWZtLESeYTSH96kj+RP109bTcNYVL86RCRcqLmlJJzRT3P
         QKZwF6jmqsYsMmFZjOqj/nW9sH1WRaJ0D6RRggHRd1Yug72UhceqUsQxr1BH/8pFgBb5
         7zffYwW82Wv2w1La0TttQjS0oO3m0hYLz9Hq9HcApt4qOnRMOzPTkqxrlTzCC5oJcOm8
         Fueg//09J0DBFUYGZhrxzRHczauQm5sVC5V/QEqhIsQO0wrTGgJyZspo1A2+V/n2ZsoI
         xIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743636599; x=1744241399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IqNFWX1UH0kH8sSrQRW2FqXiCXFNIsTAW5BBc5AbyOA=;
        b=YiU0/XLgcMiZxYvktnBqTM6q04hGR+KWYmw3Bx5CLY8FUKKQoL/Y/v3J7OFLIqHuLX
         Fz+Ygony4A67o/nXa+Nw1cuv7/40U9MbwILlm/A5aXW98LZrGc9+2lqLAQv/SrEuIs3T
         i5SfWkIDmWUKmhp8gTkjBtE6wsA48bkm02FZgipBT8Rbk+Li43Gx8zqN64UkR0b0X4Aw
         7truhl5adCieK5zBOsnXotI3nP6N1unjiUB5QwLRlHub9eCNGH5fWFuv1WrIXjMPDwfJ
         oLNx1CpepIbdGni4asCGaneST4ymr75khdkZX7uC/XXrfDO5LmQoqe23tsxbetUP79BU
         mHlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXM1uql6QlNtT5ER5as3keUk93Qw5Qnj+l3lCs1Gkm7IZT1uFTNeDWZcKl+rgWjW+VHoH2+ozqiwGw1sukF@lists.linux.dev
X-Gm-Message-State: AOJu0YwIs1lkYoVC7ihNTg97Io4lukmi4wk1C9ZBB4sLFBVvmqWD5ELX
	8NcQPxjEx5lbdr/WlOkuAO9drX2MVFXFAmIzYuZvb5JyLSeF5NV+
X-Gm-Gg: ASbGncutVs5wqP36n+nakRbR4TzFYiR2/y9fI2LSLJEptznuolr5CuT7gwvD6rYgjTd
	1GNW9veAN8E6wIAWhEI8rCGFoezT0B1wvsECfK2wAXIhs3womLCfD591xMSPzIChBhS44DDtN4A
	OWcFbc+/MFSHmRoq5l0eyfSO4ngumRcHPXCLmn5ltvSZe9zfysMDbYHjsch+KKvXnpE6POOzOoG
	XFHB7R0GUw1GOifLWlZbENlmK9K9zXxNg1bmSdDEK71kWYtIyY7aw45dik0iBTFk7ID4UhgL2Q1
	xLWVQ/vcnRN+hTknxwrpTTb5Rx+neodyXtTE6jznlYdjJP4Uvg==
X-Google-Smtp-Source: AGHT+IGnGiWfIliwaSi1pT4yLiMseYWcPqwybsOXNa3OlZgExmwoffsmlGWGrfS88T8BpXHktrYihw==
X-Received: by 2002:a05:6402:4404:b0:5df:6a:54ea with SMTP id 4fb4d7f45d1cf-5f08716b758mr317234a12.11.1743636598971;
        Wed, 02 Apr 2025 16:29:58 -0700 (PDT)
Received: from HP-650 ([105.112.231.107])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a5204sm109593a12.66.2025.04.02.16.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 16:29:58 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH 1/2] staging: media: Remove NULL test on an already tested value
Date: Thu,  3 Apr 2025 00:29:00 +0100
Message-Id: <9ce32e62672197f63448e98a41902fdf6b40a79e.1743635480.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1743635480.git.abrahamadekunle50@gmail.com>
References: <cover.1743635480.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a value has been tested for NULL in an expression, a
second NULL test on the same value in another expression
is unnecessary when the value has not been assigned NULL.

Remove unnecessary duplicate NULL tests on the same value that
has previously been NULL tested.

Found by Coccinelle

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
 drivers/staging/media/av7110/sp8870.c                     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index e176483df301..0abac820299a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -1292,7 +1292,7 @@ static int gmin_get_config_dsm_var(struct device *dev,
 	 * if it founds something different than string, letting it
 	 * to fall back to the old code.
 	 */
-	if (cur && cur->type != ACPI_TYPE_STRING) {
+	if (cur->type != ACPI_TYPE_STRING) {
 		dev_info(dev, "found non-string _DSM entry for '%s'\n", var);
 		ACPI_FREE(obj);
 		return -EINVAL;
diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/media/av7110/sp8870.c
index 0c813860f5b2..8c5fa5ed5340 100644
--- a/drivers/staging/media/av7110/sp8870.c
+++ b/drivers/staging/media/av7110/sp8870.c
@@ -508,7 +508,7 @@ static int sp8870_set_frontend(struct dvb_frontend *fe)
 	}
 
 	if (debug) {
-		if (valid) {
+		{
 			if (trials > 1) {
 				pr_info("%s(): firmware lockup!!!\n", __func__);
 				pr_info("%s(): recovered after %i trial(s))\n",  __func__, trials - 1);
-- 
2.34.1

