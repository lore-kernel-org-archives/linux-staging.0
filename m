Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC511FAF1B
	for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 21:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729028309; cv=none; b=a1CJKKFy+d74uM7FBPSy0f2ez7P7TLIBVtteUO0886k/0bbToYEBalmqFu0wnCAA9D0goyE4sdwRF41UkKv6rAQaUHDiFUzzQSSlq4MBSGAmAq63fhH9+4EBz5DNmpg1CtcQvc/fu/RCHJmXO/5zYrrS9USRtz213/au23LTRyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729028309; c=relaxed/simple;
	bh=HzjDQzMj04wkguHCoDjg6H7HxJYdJ2jX1/fBnJipXRE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j0LdUce0h/sovV1yQ090miAD/d7Tg1dFOLoH8mC1PBhz7RwYiDoZ3jFd6FRtJifoj3gcERLe7LsyS313Gjll2Arr8Ks+rufxMGzz6t/5Y0p992mkEJInOa5Diu0TShf8lvXG2XqwhZE1924gjiBfZO/sAHjezdzRLS0WFC24H8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PYe1n9vs; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PYe1n9vs"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20cbcd71012so33940545ad.3
        for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 14:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729028308; x=1729633108; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AhpjpBe61RNEZbJYjD51EaXDTChOz8XDZqFL5apPYE=;
        b=PYe1n9vskjDEdzS3GJDU1rRuNPZfo9ZguvFURQDkheP3YXcYMc5OzditPDkG2TJTLN
         FltAgpdDdHR+T7UMV4soQTAh7owFJo2/qRqnTQp4b5fYqfGsIgF9SPKgmCzWhCJXrFdP
         ixZXxqMJZymfta5tseGe2rN/Ew0qsWc0s9vBJ0rMkseiFnf0fvVhbPHuwd8l89Lz24cv
         a96nPj7K2SipVfDjbt3CFZ/B1HXPK6mYRT0GOu6OW4OGNy02rnchU+U4GLqhXLTMHmLM
         VsyJAlFFRNn1KoZKTZaq3uf0ZKidh9zHxlrRTVMXKLmUYM7HbX5/CIaBpS91KnZaTI+1
         4V5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729028308; x=1729633108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2AhpjpBe61RNEZbJYjD51EaXDTChOz8XDZqFL5apPYE=;
        b=X/0PvHRSkvUEfab3DPH/GzeR5MTLRCGPxdxkwo7ZcOPlHjkB1x/UGe6cVlB8Xjmsyd
         NLdvHEalP7uonPzWLx5oOrzkaQV7oFS41f8Wh6XZyRUCbZtl4wO3ZYXIgmGhINb0jF6y
         f51z3M94+kPNdSo7QtFpGmoTeNKfg3r4fMn9SQW2UmN6MUEFLsvNriy6lEqU6Sqv4xgf
         +/zG42tpNi2vBMypnUtn4hALk9UlPAH3cJswXeKLBOuGJZMHC+ZWX3OswmmGUMbbtHQS
         pnzOMScEo0MojgkMPZHaOq/i/Lnzma6YFT8YyskXFnWQV33JtxSLlhdHUPxBzRrwftps
         oS8g==
X-Forwarded-Encrypted: i=1; AJvYcCWl/gQEnJ6/UXvD5YGUxQ+oyX+jYPbpaDsOH40jgHpziVYtAlzSijxv1PPkQfu6F+d1cm7ulj5oNI46YsnH@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9OwwS4owYN4oLqxvoTYBOzWFMJVGMEYPXY/mhCVe8mhzEm7PZ
	whYBkrS0/yzb1GHJBxxHRfluLpDqpupCqDZQYd8ma5nfJQ9nAdvb
X-Google-Smtp-Source: AGHT+IEQs6xsl2HEoYJ2NqDLcqPih/PJJ526xSta+EqFTRGnPxi5jq4xSbKGnW3sYhPcJGUPnlU/mg==
X-Received: by 2002:a17:902:e5cd:b0:20c:8dff:b4ed with SMTP id d9443c01a7336-20cbb1bb3a4mr203705755ad.16.1729028307690;
        Tue, 15 Oct 2024 14:38:27 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:934d:dff7:4914:60fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d17f844d5sm16947325ad.31.2024.10.15.14.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 14:38:27 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: dan.carpenter@linaro.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	philipp.g.hortmann@gmail.com,
	rodrigo.gobbi.7@gmail.com,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH 1/2] staging: rtl8723bs: change remaining printk to proper api
Date: Tue, 15 Oct 2024 18:38:22 -0300
Message-Id: <20241015213822.8070-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d20087fc-586e-4a52-99e6-6a09b33ed00e@stanley.mountain>
References: <d20087fc-586e-4a52-99e6-6a09b33ed00e@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> No, this isn't right.  You'd need to use a mix of dev_dbg() and pr_cont().
> Basically in drivers it should always be dev_ printks except for pr_cont().

Tks, Dan, for the answer and suggestion. In this case, rather the dev_xxx(),
do you think we can go with netdev_dbg() since this is a network driver and around
the rtw_mlme_ext.c is already being used? (actually, I don't see a direct reference for struct device).
If yes, I would mix the netdev_dbg() and pr_cont().

About [2], it is acceptable to remove the statements like I'm proposing?
Tks and regards.

[2] https://lore.kernel.org/linux-staging/20241015014738.41685-1-rodrigo.gobbi.7@gmail.com/T/#m85d88af4dd8158a8e62ccb6c7257478b7de46d95
