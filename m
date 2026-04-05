Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681F2221277
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 11:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775389458; cv=none; b=shaKjEh2b5ow8g3HLEpFOm5JJ1EDOBCzt7ONmCyJUWXy/2K98XIUwVNY2PfdvegDmWWdsfdcrjAA601ZhtRjw0nqYTCEOl2adtsv+/y/oGokeCP0QXZZpfyMoWvngKI60ZoeKgE/E6BrSLRbRnsLzeh+LrqSOceAj8R42yXoa/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775389458; c=relaxed/simple;
	bh=JtxwjPqn8JLZOGXm/M/fdpuwr/fQAvDGx+mEfDoJkqQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nRK9LVp45xmTDGKVl1d6aCB8YFxLfkRpQy60MigaDy0Rb77S+pajcan5TSEc0bZFtZ0x6H6vOi7MK2wcg/falJGKW7afBmhk5vKXzbiv8ZmEnhLa8L5TCbRwB+p+lq08DjBKEQmi3ugLh39iANXQ77NF9Pe0zUBF63OvLUfua8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4s54798; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4s54798"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c76bde70ec9so1127859a12.2
        for <linux-staging@lists.linux.dev>; Sun, 05 Apr 2026 04:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775389457; x=1775994257; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKPclppo4/mMEFl/e4aPEOGLfhd1Dt+5N7P36rPzZQw=;
        b=W4s54798VyVBe5/Tnk0cRcWMITXmGp7o12HPylu+s7RUwhLGBsHhalDIFuU39jQ2bZ
         OMJV2intOWt6A4Ad3wDXuCK2QUdoi+ObcDr2Bv333r35Un2/NZTEVjOsZzCwZj7YmCv4
         LaIGBmWdFlMnb6hwFSfkeYQJnD3hNj+4R5GbbBpCVB0/9U03CSr2YEZUhRlAvjfgewld
         tMpjW0DPbuR+2HHGuwqfvgTBWCszZREUAxd03Gd4ByQWXLD24JR07qnnvetvStbkgf5p
         DJ9x3qcQDNYCbTMRXPhLXnXqeuwbhOjQl/qfKVvES80lJfz1q8DTW0UFj5h4DEtQ5Fru
         oBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775389457; x=1775994257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IKPclppo4/mMEFl/e4aPEOGLfhd1Dt+5N7P36rPzZQw=;
        b=izJiWfxyY6HPFUo01LaRGj3tdDMXl87CdzrCYze8T0TqTmX9TBRRN2A52gY0Ep0RlA
         EoaWzODYvr2e3GYP/BC4O1pYjvpyokOAmy/CZz7ZH81FRftoAQ24lkocoLsNUvd7tERK
         U1rjhn3Zp0CqupTaSrLsYxlZUvFN01psngXYESnlLY+uoyn1tuMQ4QmHGMgNc7UAR1Sc
         opuZ7XIan8X5jWMzIl1oxtG8xa8Jo2ckPus5SmArF6sj47xGsxny+RbPbRXjJqWKqIqq
         ESNAHIfpe9xZItRVOu1fUsLOTSxTmhnkf6B4MQ/hdRjqOfigmi1s0F2wIbLLmxnQXPDl
         73+w==
X-Gm-Message-State: AOJu0YyNWzfZOI2xVGpu/KxEYJNOX+TIRB3RFZuTMnreNwIR5zYPwh7X
	iKaBTQhsl6oTWgEa0AaLM7XIrVmKey97ml/aYjJhI6p7/W1E9vrt0BG0
X-Gm-Gg: AeBDietcNWHyq816S/WlniHA5v8BFGvkPcnqrV0f6idEDXDlBnyx7CniT+A83Rwrm3F
	A4AsZ0MnRYHnyQ0I5ErLCzaZaJSeDYvnv6rpy+zAZAKq3BeABHhxjUKK6DwCoSJC1aQ+8kCfXQx
	tc8QtyX/mXTGqjPTOJu0IZuXfmJnFBT+17MsJ9FBTDwGWHgHxBECwhBL/n3TLlOh0cKv8RS+0O+
	Bi87obkxn8etuo224DlL5RsqXKOqfIttp4ah1lwnt/RCwbxanekfjTJJRgF2Waan/5o5Pyg6OOz
	9cyYAwZBiyJJdjpHtRxqsLvLjnx2drsEmzkjDIY2VoojxRS+Yt1/SyICZXfdafigOLWiEioL6uw
	9IZs7/mbgTFwx+TANg8l74Czrszd7tw7qnmpBP2HwlJcxJs4T74smQtSWXECOUDq3BMfDPeLxUo
	17IbQiYiunXuyJ5rnneKK/luxY4kFb7Emmb2scV4fvBOHgDM5KVg==
X-Received: by 2002:a05:6a20:9195:b0:398:7357:bb91 with SMTP id adf61e73a8af0-39f2f2b25b2mr8790452637.33.1775389456825;
        Sun, 05 Apr 2026 04:44:16 -0700 (PDT)
Received: from localhost.localdomain ([111.125.237.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3ccc8sm13938205b3a.19.2026.04.05.04.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 04:44:16 -0700 (PDT)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: gregkh@linuxfoundation.org,
	abrahamadekunle50@gmail.com,
	b9788213@gmail.com,
	straube.linux@gmail.com,
	ethantidmore06@gmail.com,
	andriy.shevchenko@linux.intel.com,
	dan.carpenter@linaro.org,
	weibu@redadmin.org,
	knavaneeth786@gmail.com,
	ignacio.pena87@gmail.com,
	dharanitharan725@gmail.com,
	samasth.norway.ananda@oracle.com,
	lukagejak5@gmail.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	suunj1331@gmail.com,
	ysinghcin@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Prithvi Tambewagh <activprithvi@gmail.com>
Subject: [RFT PATCH v3 2/5] staging: rtl8723bs: remove empty if statement block
Date: Sun,  5 Apr 2026 17:11:29 +0530
Message-Id: <20260405114132.310774-3-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260405114132.310774-1-activprithvi@gmail.com>
References: <20260405114132.310774-1-activprithvi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove empty if statement block for cleaning up code.

Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 9e7eebfc02a9..61b35173aa4f 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -1425,9 +1425,6 @@ static void phy_IQCalibrate_8723B(
 		}
 	}
 
-	if (0x00 == PathAOK) {
-	}
-
 /* path B IQK */
 	if (is2T) {
 
-- 
2.34.1

