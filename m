Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EFE25D215
	for <linux-staging@lists.linux.dev>; Tue,  4 Mar 2025 19:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741116395; cv=none; b=rJf4KjmF3QwV2SBTz7XXkNPL/MttNNciwbnPkg3lLxpbvzA34lrSYfOB6gkKaPBYP7zssmMBuKVNquL5C3a21KMT+A9pab6VYE42SBWW/iKCeKmS1AsZN0300ucYPH5tRSfOqadQFdqyR95/YOYxoW0udwqU0qEW7hfO89ZD4Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741116395; c=relaxed/simple;
	bh=NEykYa6nBJlJKdA+LxhOzDhIzGTSaWYAg1h4SZwvuT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O4ezf0PGHQxrbUrjKPiYHh3fmQTJBdcXNCJAaQ+5UYNr+AioGha0qY5c+Mr7ZKoAByvPb3hp9WEAAAG4rJzdWAhGU+/SApQhV+vA7ao8PLjIBS0NNLhBgwMpAgDDeHj5q5n3NA85Ng61txORTldjN4NlLMtEdKCINR40LxMEgX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BX3uyr8p; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BX3uyr8p"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22378b3a465so12403635ad.3
        for <linux-staging@lists.linux.dev>; Tue, 04 Mar 2025 11:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741116393; x=1741721193; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umdvFfee2QDZToWwgiz0AxJQsONRmaXngrebXX30i3U=;
        b=BX3uyr8pbsZ262NHABb4+N11TP1JBezI1x5nvbFe9trb/F8KkelMFmLQ0eczRQ4BO9
         s8egwImivJHxE9YXZurW0yW4n3DARztPG5/xyTuBuJL54y+x/ay2EK7Yu4hOvRhe3+3R
         voRlyKhrRN9XDVHwxn9+zjl7AIsm4KI8D3TdZRBkm5qJe7FxPOaZt54Ivc0K6ddJR3M+
         J0wbBtLlc64Yl9MUkjc9CeKxkPh22STfpS2EMzDs2h5oP95lPQgtPxUuFbS7gsxlJGsb
         oJJ795P7WE6pqcmieeYcS9+dUHxvI+4ZLraHgr5ExNm0tKKKv1Laf4wwpaloOQXMRJQB
         duPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741116393; x=1741721193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=umdvFfee2QDZToWwgiz0AxJQsONRmaXngrebXX30i3U=;
        b=Zk8SICKLslsxTXz6AeIa3biTV6RkPFTH758VGDwMHauYTkgf3SWolsjnSk8F9VDoZC
         ZHPveHpDTiUlwLS2douY0FmTBaZxF+jSdZGXHPMCEBp3Or5q4IU3rxSX5sL2jPs+snoo
         aUxMoPIL6buQJVFyfd3Ss056dA7ZR9EqwNjEqwGK/FDT5VHtOBtwfJExMPpdEEaVk57w
         kTCX2+0qQ7JIJGyJgZGeUOYs/4MUIcuJyeThj5JJiRATiNMVvv88uZ5g9gpCTGttlBzg
         NPFijeaEv3YkTXV5y8TBgnyzgqp9QKke83XlgdBuLwJkZot+xvMKNBxfR02X61v9+9HH
         mzMw==
X-Gm-Message-State: AOJu0YxBxgmN6tTnG7Q4xv/8h8jfmt+5n3qpbB0LoDYH6LZowULzeBL9
	Ls5BeBOpFMOT5tqFZsWhYB3tlcndDZR6tuVUoQ5HnmCLtYGOXBLTOC6feg==
X-Gm-Gg: ASbGncvP6IgLLP7aBv6IaeTjfg54xiHdOVWAiqj6ozlYsuAIPVPAJKZdkOBJNLDWljM
	Dmoo4hETTYGggFKs0bVfahdgN4HjQFu5lGzSH0gJxM/ZdI91poz+ihiLqIQveSthC32qx6BOzIc
	nDNpaQ1NR3r7VFLC3gelU+3CtDUPlHAipPYwpVV3/vLTvH+jTZkYI3/zOc5S1QNY4avaLsQ1J6J
	jvBBuM+OfZPqBni6lQTMEz2cdjx3fxoawe1TAj1AlQxR5xLuoSDqMjjmp/FPaI1rPWEskMGgkK4
	LoseLp3KqjETPVwJKOQ2JTALiUboVDbm2ILkTvPA1LdeAfstlCrB/yT7+A==
X-Google-Smtp-Source: AGHT+IEqlNsMhgysH3ZLbRHN5sn24UmXlsfGwKRCgpcjb42zOsTM+0OVba8x8VgswqlxUdO5C6PZJg==
X-Received: by 2002:a05:6a00:21cc:b0:730:915c:b77 with SMTP id d2e1a72fcca58-73682b5b913mr54352b3a.1.1741116392829;
        Tue, 04 Mar 2025 11:26:32 -0800 (PST)
Received: from localhost.localdomain ([2802:8012:1f:3200:f1d1:c186:ba5b:8f06])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734d444a9fasm9341920b3a.60.2025.03.04.11.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 11:26:32 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	arnd@arndb.de,
	niharchaithanya@gmail.com,
	jiapeng.chong@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	Gaston Gonzalez <gascoar@gmail.com>
Subject: [PATCH 1/4] staging: gpib: fix kernel-doc section for write_loop() function
Date: Tue,  4 Mar 2025 16:25:37 -0300
Message-ID: <20250304192603.40565-3-gascoar@gmail.com>
X-Mailer: git-send-email 2.49.0.rc0
In-Reply-To: <20250304192603.40565-1-gascoar@gmail.com>
References: <20250304192603.40565-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a colon character in the kernel-doc section of write_loop() in order
'leng' to be picked as argument by the kernel-doc compiler.

This change fix the following warning:

warning: Function parameter or struct member 'leng' not described in
'send_command'

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 50faa0c17617..eeabbdb39057 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -232,7 +232,7 @@ static int write_loop(void *dev, char *msg, int leng)
  *
  * @board:    the gpib_board_struct data area for this gpib interface
  * @msg:      the byte sequence.
- * @leng      the byte sequence length; can be given as zero and is
+ * @leng:     the byte sequence length; can be given as zero and is
  *	      computed automatically, but if 'msg' contains a zero byte,
  *	      it has to be given explicitly.
  */
-- 
2.49.0.rc0

