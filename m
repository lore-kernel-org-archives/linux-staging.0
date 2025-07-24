Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983C920126A
	for <linux-staging@lists.linux.dev>; Thu, 24 Jul 2025 19:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753385139; cv=none; b=o9DKH3r/YsiFOPU4qx/POc8tpbw0lR6H8c7FKrg7BBWiFTD35c7FAe0+gqV7db4mIuQuumUM8bXCFSmk6GJHTZom/0bUWcYG7UaXz3zLWIZ/z80oSP83Qg1eNtB/Du7uKAZRaSz1hEylfo3Lbi/esb8iChCCQe7zncOM5/zgp7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753385139; c=relaxed/simple;
	bh=Wl/MVrfadxWCvbcWuLboGbrjuXmRyvy0BBIFUzsNgX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aQC2jz8cBoONUGzN3WsyNUORdwXVgUHERNTlzjUqi8QMvDlRV9wTm7qMRNYz9jRx6b90EAuJWyBxHHCnURA6MpfnEyGpM40rr/l2Qg15Fdi3mTjQnZP7Fitvi4FGm6YkCYAcdB8fOow/85uzC1RegpkJmKE+X3WEzLs+7dwOQwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHakeY6t; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHakeY6t"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-606b58241c9so2213636a12.3
        for <linux-staging@lists.linux.dev>; Thu, 24 Jul 2025 12:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753385136; x=1753989936; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjrrUXAL6KpzkIM6/6atzGF3H/f1YResH0MiZx9rdi0=;
        b=IHakeY6ts9BYiSktjU8mkBmCa18CVLpDVzzwXt5EdA+CU4JoxW+D6UbZZ/rduqnvjS
         w3tm4ARSDQh8xa5oW9bf86aSTFc2l+c3yBDYPJC3FMct8IzD3a1+BwQan/vSgrQLuUdf
         BQCMQJp5kAUhqg4FA0+NwOWwaiIw24pm2Igp7+IgWumFybfyTEDzaMyJB5Q4npl1ijmu
         LkRv0CYQsVq4WNNIzBX2qhLLszDgAcZ32OZS4Vh9/R2xoTxXb222s5jXUetRFu60Xksi
         EDBqtz7n7diwpGOoLwvyYIa5TVcMnLFuyMofvYCkB+KjLfG0E0mkwPw66G37LgFT1Q39
         JBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753385136; x=1753989936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjrrUXAL6KpzkIM6/6atzGF3H/f1YResH0MiZx9rdi0=;
        b=fb4mXEWV6Mk7cVzf6T/5GXa3FAA6IWXq8meHk8EKwTZgsdfL0yW1QMuOu15HHCWgdC
         KMoM2bjekm21JCYqhRIKexTGpGhbgZxiC2FNHtK2MZuFY8AijNe108CxyC4DgO+ZZzyA
         2OCTv9eBwM2VEM3NSbPQh6TpS93DIbLuSFAwlm5Y+4UAyAc4vxmSlintg1JdKBm0vvRk
         mSD7N7hU4VHhSd1mizWqHQzCAQUH5e5FQN8lmxafwyZgnZ4E7c1N7aERd1d0LJxSKZ4K
         EJT5MvQfpS6R8u0lzKLg7IuNdqjzaDoEONulZfvOJJo3DfUZmygP/VhNj3QyuXKNQ5ZT
         XrGA==
X-Gm-Message-State: AOJu0YwvjZWCgY8fM44kYnRO0cyObd/YIKdwx+TEQaGbbbOhZRlJXvhA
	SpxASDyApQDiV39DWNSGnq0T2gH6kC3LpN5xMYhWpACTztM695UxrNfa
X-Gm-Gg: ASbGncvFPaaFEZWmzJmbLNZA00nvLjoF6ihOq45XSOxULMYOz3b7+ta0fGNyph2Hn60
	g3QNMZ0cNZ+Cls61zf8UzZa4RUB7SsTioaFPK0ch18XBUtwALDsodMxj9Pold8C/7S9SN2NoBQv
	UfV7LRZrZUMsQ27P6HE3vmrIVDS9vqTVXoS+26eDJoRcVqqSskPznnOuU4QPvmkzR8qx5Yelijt
	VndsGZ4f3czKN6C2Ho4HoBvfa1cwXvXv19D48GMNDVUHk9odX0Fxa7EqrpqNDqbxrfB0PeM0rwP
	LGoZFAOCKXQn9A0QyU4w3XEKIJhu9xcvNCuEySfGBpj1Fc4Wjv1gThqlJsiRwgIOb2H4H+iU1fA
	Vd2RDV4RBM6K52emXc7gK/MyRMU2qzZU/P9NK7L5KNaVao/GK6+bf2KbW8a4Ah370NbCfIGc=
X-Google-Smtp-Source: AGHT+IGpDpA0dhJqXY/Tehkc7V+fIch+YiSFQkfTHsR0tFK0ny2Wg+uQEfflS7ZcZmimB33UjNYdWg==
X-Received: by 2002:a05:6402:5208:b0:601:ad95:ca6d with SMTP id 4fb4d7f45d1cf-6149b42e234mr7715676a12.8.1753385135711;
        Thu, 24 Jul 2025 12:25:35 -0700 (PDT)
Received: from PC01.localdomain (094190205166.static.ipv4.heldenvannu.net. [94.190.205.166])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-614cd0d335csm1199556a12.10.2025.07.24.12.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 12:25:35 -0700 (PDT)
From: Bruce Qin <bqn9090@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bqn9090@gmail.com
Subject: [PATCH v2] staging: rtl8723bs: fix if-statement alignment and line continuation in rtw_ap.c
Date: Thu, 24 Jul 2025 21:25:33 +0200
Message-ID: <20250724192533.21141-1-bqn9090@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2025072409-promoter-shame-8105@gregkh>
References: <2025072409-promoter-shame-8105@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes several style issues in a multiline if-statement:

- Moved '&&' to the end of the previous line to follow logical continuation style
- Fixed indentation to align with the opening parenthesis of the expression
- Avoided ending a line with an open parenthesis '('
- Moved closing ')' to the end of the last expression line (as suggested by the maintainer)

These changes improve readability and conform to Linux kernel coding conventions.
No functional changes.

Signed-off-by: Bruce Qin <bqn9090@gmail.com>
---
Changes in v2:
- Moved closing ')' to the previous line as suggested by Greg Kroah-Hartman.
- Thanks for the review and feedback!

 drivers/staging/rtl8723bs/core/rtw_ap.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 383a6f7c06f4..c652e0cd35f3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -258,11 +258,9 @@ void expire_timeout_chk(struct adapter *padapter)
 		} else {
 			/* TODO: Aging mechanism to digest frames in sleep_q to */
 			/* avoid running out of xmitframe */
-			if (psta->sleepq_len > (NR_XMITFRAME / pstapriv->asoc_list_cnt)
-				&& padapter->xmitpriv.free_xmitframe_cnt < ((
-					NR_XMITFRAME / pstapriv->asoc_list_cnt
-				) / 2)
-			)
+			if (psta->sleepq_len > (NR_XMITFRAME / pstapriv->asoc_list_cnt) &&
+			    padapter->xmitpriv.free_xmitframe_cnt <
+					((NR_XMITFRAME / pstapriv->asoc_list_cnt) / 2))
 				wakeup_sta_to_xmit(padapter, psta);
 		}
 	}
-- 
2.43.0

