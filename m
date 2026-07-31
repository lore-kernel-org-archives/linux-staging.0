Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2B33B388A
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 19:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785524697; cv=none; b=ARe1jCqMjtU/LWIWWGcqGx5ca3xXMQ8ol1B6RdnQbM1+f3SL1im83OOO464CF6KHrhl1dGqCiakzkpJuGFJldZ3SZDoOOp/EoQee037I7LhuV4ZKEGuMKYfFekEEWiItHvYEVMjqtowvKCH01h/tngA068jf7PnsBnhPHYU4vRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785524697; c=relaxed/simple;
	bh=Pub46kgkCfxnWDMrg74Jhd9YwOvXrEH/ZQC389chyjw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rqKP1J/zmv3FM7tR2NjjqOs1El+bvw6LXJb7pYz6aAuVt3yLSdjTgjTvW12qMEZrxn3+L95DNhNfvAyl1wtvC2iGKTZM0CyHOgtmn3MkqGOQmQTMUr/4Ije/YoP9FcAFYY4XPiNPsQXUj/YfN8CFKrR5Y00S6RnIPgIE6lfYNLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiO/i+wK; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiO/i+wK"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so1016127a91.0
        for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 12:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785524695; x=1786129495; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=42rb+aSyo3dAla+zqU29A1oNZ1TSHZvIKJ9LHyMaKtg=;
        b=eiO/i+wK0h0sLPbynGROAi54e4i31vV8IsWcoux9dOxuxOwtECoxwpVyBRikkiS+oa
         4RtinCl07NGYU9jSBjIjbP0zm/TKi+thwcI6vdlhNKr286rQns5kYgkrrjejk4+21u0o
         R/sdMbV15IcOCGvxWq2ogLbRoDvU18G3yJsrR6UOkDEf/UCnzfI10/89RM/h//mN/ZBZ
         Ysl98sCsrPxHNqjFysVVym76l2Vnv7TC0GJ+0rkZ9zZiVMd0BwLlg2ViCq+LXctMkAXh
         uMwSqOUfEkOFq1SfBx3cSVuTABS/YgzFyOkeTAgFjJTMMR279NUct4R52VJFxCmn6GZW
         vCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785524695; x=1786129495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=42rb+aSyo3dAla+zqU29A1oNZ1TSHZvIKJ9LHyMaKtg=;
        b=c9sMWkObWyutl9LI1Z9jtY2J5g44LZza8UMx4B53FkkK7HaS4Ax9f/UIoK6gqrO2j0
         ztPLF7sTI2zb5wnWCA5t87uBHpPX0l2duwBd2TLm5X9HKUaZS3HoFk1qutkmvBHmLgPN
         4c7+OAQdMqnqB5LR+bCDz2nlh1Ekl2IJZuOXHEWg/Yn7VYld4A3pbk2TuRLt/3BzNc3a
         2xHYOuNe5cwsg0n9iJH6ShwhqNnmER3Apok2ASUJkuhyRYfl43ajWO8cH0Wedyig0MKk
         Ae4DIyezOps33xgICaeneyu02FXN36W5LelNQxXE1qgltbBCvE2gmAXzFa5acbZFmwu5
         MR+g==
X-Forwarded-Encrypted: i=1; AHgh+RqjgbbXouK3AFAM3WTBJGPUwzgd4Mg4LS+8hbOD5R0FBIQ9Uo+ARJ30WN1MAUyszR4g6xQdgFhzvxrAwVsB@lists.linux.dev
X-Gm-Message-State: AOJu0YzmlpIRdJ6z3RjoM8dUNyCaXst1PCwadqAenwWtBtRer79gnqOL
	TZMd/0xJQXqQUzc3Yel7dC6j0kLRMqEv245zL+v1kfy9vAX4d5Ei7IwX
X-Gm-Gg: AR+sD120l4R3BS3fUkCjIHxoHnF7j6mgZog5FTMJLjuoTQgIjhGA65oL9/onTN8w0hU
	Fas5Op0/AhNcI+OQ6/uKIjvwTnkiwekeUqXLEgQsiUJ+OhBgyJoqrEUUFwNhmo49FxUim9eB+fd
	iRc3zybXehueWSMkDS5hHOkR4i3NNlqnukgvTdoBMmStiEQtkr6nka4fuBx63PK4cBHdG4xI+B7
	AysUNsz4ko7/nVotL6Dbm4hRmH6f7p+1c1D9bjhDAhERRckhinkVJtoPkFRQW6+ldo73cylPfvb
	Kds55vtPztX/xXb0rpdFhPWbegiGZUh55gD/GTEbPQC7gIgsD+5MV9sNsxX+iEtbh1Nv8KVh44I
	xc7zrKQnNBXeYXltE5/KN1JX/b6uqJr/S1zIFd17inlWhzLkR0Tvl5OtX47LX3xNu+Zr8Gaqekl
	iZpnx3o6sK6qMbGvgkeLbtP9ISUNaJGdAY28sRNrSPhUQB48T5qhkHBdN+9IRSJ0iSMChqE1oVh
	8yg2TQgj+169+fWGWIaXpwJIOaRY0O0NApe
X-Received: by 2002:a17:90b:17c5:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-38fbc424a3dmr790107a91.10.1785524695321;
        Fri, 31 Jul 2026 12:04:55 -0700 (PDT)
Received: from Debian.tail44843d.ts.net ([183.82.161.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06fe9fsm7404570eec.25.2026.07.31.12.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 12:04:54 -0700 (PDT)
From: Mirza Ishan Beg <seedandsyntax@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	seedandsyntax@gmail.com
Subject: [PATCH] staging: greybus: raw: add comment for list_lock mutex
Date: Sat,  1 Aug 2026 00:27:20 +0530
Message-ID: <20260731185720.30187-1-seedandsyntax@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a comment for list_lock mutex to document what it protects,
fixing the following checkpatch warning:

CHECK: struct mutex definition without comment

Signed-off-by: Mirza Ishan Beg <seedandsyntax@gmail.com>
---
 drivers/staging/greybus/raw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
index 459aed0f1240..17c88778c30c 100644
--- a/drivers/staging/greybus/raw.c
+++ b/drivers/staging/greybus/raw.c
@@ -20,7 +20,7 @@ struct gb_raw {
 
 	struct list_head list;
 	int list_data;
-	struct mutex list_lock;
+	struct mutex list_lock; /* protect list and list_data */
 	struct rw_semaphore disconnect_lock;
 	bool disconnected;
 	struct cdev cdev;
-- 
2.47.3

