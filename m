Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF175221546
	for <linux-staging@lists.linux.dev>; Mon, 22 Dec 2025 15:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766417081; cv=none; b=DWvzN9ilGL+QeO9HHsDtTVuJfDfJ3nc844ukPfv4T4byt+J2IGhlag2nU9rBnPCFVsUx1h4AyOgHX2rs8etsV/AglhoY+uwGZDhAJ8mB3/NRJT8l+je4hQ8J3Og6Y/zTzxsIraeadnlquvT3lTH4sazqwVWNjTJ5W1Sg+luNkdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766417081; c=relaxed/simple;
	bh=5Dlr+DXmIhYkrj3YBKXs3vjTNnXgwVyETc9RB+3ijxc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mZlP7G7YdWV27M8h5kXtfjAFPF0BYUH8dadyaJHC51Vtjsrd8HYSLmxYsC39IPHbXiU8YLTJQ0wTOBkU0TwilwW2ROmymSUwTFNN9KmALFnGbh3qUsbzps5iX9f/5dp2LWFE4Rasmb6Diyu/87iVvlQc3Ule3+i7MJfqUDa2stk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NUxN/hjn; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NUxN/hjn"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso3105878b3a.3
        for <linux-staging@lists.linux.dev>; Mon, 22 Dec 2025 07:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766417079; x=1767021879; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qzk04aLLaDlmqW4e3hThuySgeikMdNPDZULzEWFbri4=;
        b=NUxN/hjnlnKLwk8YtXPtSs9rN4BXMisaR22pTndsnCdFe+hObPiIKQjq7Z/0PHicUD
         ekgmO8LvzJ1nNCURmV8IgrVLOY73hqkBeT5Cq8Bm4SWXPjun1RpV1GklCwQ/DobtEMnv
         9A3A3bCo0NKRk4flmLn13Sas9+rqFYEwXErrIrgmoq5efzZVixQ8fmAwC3IrIc1OSHV6
         xTDBAgYD40b+EgIAQn9j67W/MCxfAT0JYknW9b+K/A3/rHSgSDhsE+6lOLPdjBsS2Gxq
         XVKRrBOaozXqR1Wr9JfIdXNhPQHcNXWKEn6RSxgHqofVGD0uYBy1RVCJmzjCE0GvLbM6
         HddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766417079; x=1767021879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qzk04aLLaDlmqW4e3hThuySgeikMdNPDZULzEWFbri4=;
        b=WrwNHbCAvlJTLJc0BerbFvGFJqDuISkXjsf1kAM6uyb0P3UkZeow/5vhq+8DhpZ3Ic
         Wy+I+DPAE1Nd865utZyDk50IBUVJCwqBeG7YmKy+xZar0Zb2ZAg5IRTKThCDxotsSIfn
         ru4BTw+bjaglctOsnBMY4r2jk52zr+j688xElSPRRrSsSQyfVoRbKw/xp0YoyokbZBou
         qws/sPZI4g0xaJb8SeLoyLjhQkNjSy4Sg+AUJbvgnZ8BHHiHnntdE437+5vwTJ8vf/gr
         meA8pDe7DImCFYuQ0aoyX7Y8vTPjOmmgEe3CTq5MXWY8suZeuaFlLcqexXXqoH+RmIIA
         Lcbw==
X-Gm-Message-State: AOJu0YzVbgE7ZIFjEJT3pVtkoO/pHDebrjdgc/o/A7bp8LTbhikyfIoI
	jAnvxjp88hPmO6ei6FR1rn6RSyDzlMgPPxts0oq7FmEJjKiqMrALDpv1cXt1EA==
X-Gm-Gg: AY/fxX500LORx790FsOysOuA5rHsFZbjTSIrngjOwq7ejEWiD1FGmtxxKmApgCj5Ilj
	52O3or+DHK/5MJOqhcfIK4LP23PXbdfPCqIBl1hvAlWq7/9aJVoCF2mzhDPJgcgPmhXQtAjc7kb
	JyGcmKVxF9CSjcnIdYWDIQrwtAHUfH2Q7MoPzjoegw+hOmf27Wy+ODRsuncQ/B6kFQZjz3TRUTL
	k4J3moSs3gZGbJNzJFEWJIlgpRzpwN6Bp8v0rnu+PeMgy8+f+p/GoVjj5429aH/e/Y2iIV887wb
	zOUFt2yAp7WmsRCdwdyjeZLYUv2d3ggqT5pS6DZtjTpq4w0ZrmmqWI9XsydsW1wOkv9xGNTsZne
	iAoDZqqQ2ax+9BsPHOkQ1j1iOp/zte39ON8EB5Rd2jGNW1I3Eb24O5tCYeg9goXdmQVmZ07jOAo
	hFC834DvkEYvt9C35mf+T4lv0fBPWpqGU4U4klX17DDwlmQg==
X-Google-Smtp-Source: AGHT+IEgsPYDv+H+SeJ77HStEZw4X6YRqGWtpUpMV0RT3RoefFbhdOba5eCugnXmFUwYfBgJUeAIng==
X-Received: by 2002:a05:6a20:914a:b0:334:97dd:c5b4 with SMTP id adf61e73a8af0-376a7aed514mr9344789637.27.1766417078680;
        Mon, 22 Dec 2025 07:24:38 -0800 (PST)
Received: from DESKTOP-MOQC9AF.mioffice.cn ([43.224.245.233])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7961e039sm9620925a12.7.2025.12.22.07.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 07:24:37 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH v2 0/2] staging: greybus: gb-camera: use BIT() macro for flags
Date: Mon, 22 Dec 2025 23:24:29 +0800
Message-ID: <20251222152432.68555-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace (1 << 0) with the BIT(0) macro for input/output flags
to follow Linux kernel coding style.

This patch series is a split of the original patch per review feedback
from Greg Kroah-Hartman.

No functional changes beyond what was previously proposed.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
-- 
2.43.0

