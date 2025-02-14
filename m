Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C6A1C84D6
	for <linux-staging@lists.linux.dev>; Fri, 14 Feb 2025 19:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739562986; cv=none; b=at7MM6/32Oa5qzgH+6y8bXfbH3rBblfSOihdLqSY4+T68xNVHsPVUshHvQGCrG6R7VUx29rVPLqxRUjfpqOByygskTj2nvdmtK3I4R6WYwuOk1NZRwvZfxzHpbyyX1e9UNv+cAB94FZbvCn0I/DjFzas4HDO0sNRTLGHo5QCS6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739562986; c=relaxed/simple;
	bh=9hUHviB8Tx9k55ubfDviMQfJ+a+JJ2cdWX2BuAb8QO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BUYONLmxJxwDv5XWfcZqli2nRvWNOaXzZXA9w6hKqOi6tsZZRCChBQ2gHweCZZWVCVMbtNKSWc8Z6/PptdM66MwgkV4CqJG9KBo36YxVSLV65B2MW+9I1xw4o+Sk5kSsEpiqdhBY8zBnE0wk3Aka3Pgxle9rW/LW7OOrCWQ2Tmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mS+DHzE+; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mS+DHzE+"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2fc3035e947so209676a91.1
        for <linux-staging@lists.linux.dev>; Fri, 14 Feb 2025 11:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739562984; x=1740167784; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoVqtrul78ZmQYxag5zWjsZlqRvCUyfe2dogin21crY=;
        b=mS+DHzE+nqD0V3MinCr2fLYqX3UHOzD8xfh9zwbW6Ujm4aEQDSD9WWF9U0Y4GbluMJ
         Tm40+73/GYs5FVn8FNVpj/6N8lYrzUhImZAbH3qoid24zX432wN2JGIk84ZKI6203nIm
         EZthcLi2R6u5SiB5OXJnDwtZK4q3ybis3TcsH4C+1BPlVhG+qgZKCEvRU+U+inlnYCy/
         EYMAMTijb1mFtG6GymcprVEu2DEVIIzBPU8any29nMmflj+516NbM+tY4ITh/4phBVP/
         5QsN5e/2z/8KQv6jTG/E8wi8+3bigrQDeFBxinDvHm9kQgeic2Wn+ZWeolFUpU/sb03f
         CQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739562984; x=1740167784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XoVqtrul78ZmQYxag5zWjsZlqRvCUyfe2dogin21crY=;
        b=t/SbXN3yHCoFjIyPQRYT+Muwwi/Hze6ZHQhbMOYiMrYBzKZ0C56BcrLqZMKKb9rehs
         mR2FBIzdt9bzwuzInNv2JIL+hF8kRVFTWtfsqCeNCKsMlSH7YYRbVJSPpRxHazK9DAaS
         gw7uFAHf7I3tEt+0oWjVCg3Uz/2FtmkEoxPYDa1ZbTYTvHTfpV+vGVbbwLMEJ4hRQzej
         F8TvR1GM7G/O1Ji4iwHQfFsFZFumMNLYZ0MmxbHBQX114xeiGf+5yM9afnDrvv5uAowg
         upwfz3ZAQb5ggrxO7s9q16QmTebKD7RY4DRBTYmpB8kxgLlBZfU07rGm5d83hTXyetDJ
         89xw==
X-Gm-Message-State: AOJu0Yy/A6dCeLB1E47J4gyhnQ9kszWxHi1K0yZA1mnVTbiHuCD/vFo6
	9j5AnLRgFuC6C/8rmARyiu9rfVJeaxofTHPM9dx2DhliYqiTIwDUtNpqHiTp
X-Gm-Gg: ASbGncsfXMnQ+m4sApOjHgIvbY9buvlxZHNEzQD5t64LJE7n3Ito+8rrnLCNwCNNaBh
	hSyB3azWZZ42CBN81i/8/tLFgOkvey5Pt/Pxov0jhEE6D+ZY67+HxnoHVIVxbsm+29+aInu97V+
	1+a6GTlR9eYP0ed7RCcKEETSuGVl3rAZ87ZpWcRbNxLsJgorzjiCSOClK3bJo92Peu/pwdxjdwf
	tnDdOoriwNg36kSaJDiXqdxRTlTKiXzGuqACIVL6yLcE1UaUqa3dst3dx0vFrMpdTduBF+HtdOL
	QjLdKxemY/o5aPwKfBMqJxUE4ykB5qI=
X-Google-Smtp-Source: AGHT+IEh5vY6/1BBhZnY57v96vl0eVB/BJ6qr+oXL0vB6dOIqbGJ7ooNykzBiLgy4xhWAyC8zyTTRQ==
X-Received: by 2002:a05:6a00:1256:b0:730:8526:5db2 with SMTP id d2e1a72fcca58-73261914657mr366739b3a.5.1739562983856;
        Fri, 14 Feb 2025 11:56:23 -0800 (PST)
Received: from localhost.lp.veng.com.ar ([200.10.125.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73249fe96b4sm2670530b3a.75.2025.02.14.11.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 11:56:23 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@linaro.org,
	ajithpv.linux@gmail.com,
	roheetchavan@gmail.com,
	niharchaithanya@gmail.com,
	eleanor15x@gmail.com,
	everestkc@everestkc.com.np,
	kees@ijzerbout.nl,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH v2 3/5] staging: gpib: ni_usb: remove unused variable
Date: Fri, 14 Feb 2025 16:54:44 -0300
Message-ID: <20250214195456.104075-7-gascoar@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214195456.104075-1-gascoar@gmail.com>
References: <20250214195456.104075-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove unused variable 'adr1_bits' in function 'parse_board_ibrd_readback'

Since the value of the variable 'i' is increased when 'adr1_bits' is set, the
'i++' post-increment was added in order to keep the value of 'i' right.

This change removes the following warning:

warning: variable ‘adr1_bits’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
v2: added post-increment 'i++'.

 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index d0656dc520f5..41d9cccdaf10 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -427,7 +427,6 @@ static int parse_board_ibrd_readback(const u8 *raw_data, struct ni_usb_status_bl
 	int i = 0;
 	int j = 0;
 	int k;
-	unsigned int adr1_bits;
 	int num_data_blocks = 0;
 	struct ni_usb_status_block register_write_status;
 	int unexpected = 0;
@@ -460,7 +459,7 @@ static int parse_board_ibrd_readback(const u8 *raw_data, struct ni_usb_status_bl
 		pr_err("%s: bug: status->id=%i, != ibrd_status_id\n", __func__, status->id);
 		return -EIO;
 	}
-	adr1_bits = raw_data[i++];
+	i++;
 	if (num_data_blocks) {
 		*actual_bytes_read = (num_data_blocks - 1) * data_block_length + raw_data[i++];
 	} else {
-- 
2.48.1

