Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7B21FECAB
	for <linux-staging@lists.linux.dev>; Fri, 25 Jul 2025 18:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753466541; cv=none; b=EKMjQPFiVNn3L/oPecJNzLIjWyflKNmJ2fyZSghyRbatlWT3DFHJ/KnTBhgVDKcEx+feCrl8JSNAXj3DStjanmpWLx8gD9dOZh8F4L2mxw4nMzCv4XkB246mTzl49Xy/ct2mFqe+MmzYG/yhKxL+jWg7bTSHL9ep35SfIB1B8lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753466541; c=relaxed/simple;
	bh=o/Nzc8UO01YPApylGg95i0cXOIKMhwQsnIS/Woiy50E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QE/dhETaR/h1cetI1CB/Li4siAncXp9RdR24U2DKVPFbzlA8EaliVTGcZxcNYQMsITlOehXtTwq0CwBgWE/tbRkrnKymqU1j926A69X5GFniPapDquz2WCuTAzzLhuxcmMaQ+H9LQ/v0VvvB6LEiM7rYVKLM1gkWb3F9CLQO/6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bWvlS9Bk; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWvlS9Bk"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6088d856c6eso4634413a12.0
        for <linux-staging@lists.linux.dev>; Fri, 25 Jul 2025 11:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753466538; x=1754071338; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96+16hPDVbzmYR7/3oDaCmxYXJsLYiyA9oBeZgPFSI4=;
        b=bWvlS9BkP4yMC9RBOYhT7OhHSmj2QLAU8k9+BUBeYjBbLLP5mCUPQ538QDwxZYfnSN
         Oli4MrcaJ/RzOS6ZnSbPecwRvNbvhzUnqaxuRpIH/YUOSgC/8HrissDnHxhItswH7NE5
         rUNqNHHePOUYs2SUjVFKWTb7sgKJdOIEDVDkuZCPJlqhw4CdJuSSIuirQs2egst/Svsg
         DPIpCo7pvhS8u85BGlux42nHqM8YJzUCrUN11OyTFXseJeC78WI8UvwW0FEgl6MgJK8+
         6Att5nzKOnkcSkU1fXelCK+qqD1lcY6o8H1BOh4cj+S7+f8a2Nmc5gS+N8sJ2uzMiEZw
         +b+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753466538; x=1754071338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=96+16hPDVbzmYR7/3oDaCmxYXJsLYiyA9oBeZgPFSI4=;
        b=a+zFbpxPQIms+ronmLKr5mt1KdhOYBFJdISJqslznyDF+8vAYXAe1n94Uri+LKd+PE
         /EeZrW5rn3WOzR6dC6sii0M2Xc46dzAXcLb5DgSt4wtryORNys3K/XZhMbvIS3/7j23q
         VuKDSekkv1jMhXGXJ8f1G4fGfclDua219XQFJCygQH1o7n1CN7Lau7nHJ4OcC+Kk9Viu
         AI6//c5Kv/aU3xVFKFw01bZlKJUuzroyDdPKYcc+o708v115QEkZcOKvGMfld7ZZbCkd
         d1a/gRUv4qA0Sfa0vedtk4VvZZr6CPLHDjPoKtavbCrdC15ws6ECA/YFu32q/wHXxgtE
         21ZA==
X-Forwarded-Encrypted: i=1; AJvYcCXeWknuSi9e8n9GGJ3ya9uQ3dAyrrhkXg/P4Dd1x+lLuVRK6lK41kSSuQ7k+ykqsrzoSyamIUzXWjg9Fu9g@lists.linux.dev
X-Gm-Message-State: AOJu0YwvXoxpNd5UUg67wVtPliH3Qj2w1nWGAS+fvfDMeD2ouUTk3nSe
	fE6alz8cMQrX9FYidWD8juUnhlY7hCl5H9W/9B+6CLrnbJkpUxw1ECUz
X-Gm-Gg: ASbGncu1qzLRkuH8Ug7ebVuDmLiRmwKQDo/K42xp7511u0YqHwCKsfR2PPmO8NK5wQx
	CRWG+L1X+9AuimNr4byk/HqNljsPdddSNdCRehwoG1HIeuNFyNAb9L/XgP3QQZFmC8XI4Q0dfqJ
	9ZE6NHpVRqbf5jcfeyEpYLP9YqsRBhkStVEogySlc2+J+ky5VSliywHjXooIYl/kf5uTRSMdB0T
	vFuAvdROPjV2MypuZmxRNqRga23RAu4Bm1a0hsBrOLK77PSf9ahYTq2vL8DOsQe7vve4zn5I4Qo
	0MNUOX1RCWa1F8S38cdmjHO3Yzu7pFBTD4UC3iNEUo3mzMRWlXhYWdU5oyyKXUtwJ+0XIR0vj0x
	GTSstt7G7q0UWTfOHKx6E+8/5UPyeQccORqB+0FTJfhG0vgEoSsyztrT8pT0TTYmJHTSZL2o=
X-Google-Smtp-Source: AGHT+IHNFWqx8VxQ9a3GwfF4+HeF0JVKfTYPLpwmOO78cGJuvfjawTQCiEd19m+N7BGgPHqREiX1yA==
X-Received: by 2002:a17:907:e2c5:b0:af2:4429:206b with SMTP id a640c23a62f3a-af6190f8b0amr330828466b.33.1753466538313;
        Fri, 25 Jul 2025 11:02:18 -0700 (PDT)
Received: from PC01.localdomain (094190205166.static.ipv4.heldenvannu.net. [94.190.205.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635a6685fsm24220866b.89.2025.07.25.11.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 11:02:17 -0700 (PDT)
From: Bruce Qin <bqn9090@gmail.com>
To: gregkh@linuxfoundation.org
Cc: bqn9090@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5] staging: rtl8723bs: fix if-statement alignment and line continuation in rtw_ap.c
Date: Fri, 25 Jul 2025 20:02:16 +0200
Message-ID: <20250725180216.19585-1-bqn9090@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725174504.15726-1-bqn9090@gmail.com>
References: <20250725174504.15726-1-bqn9090@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes several style issues in a multiline if-statement:

- Moved '&&' to the end of the previous line to follow logical
  continuation style
- Fixed indentation to align with the opening parenthesis
  of the expression
- Avoided ending a line with an open parenthesis '('
- Moved closing ')' to the end of the last expression line
  (as suggested by the maintainer)

These changes improve readability
  and conform to Linux kernel coding conventions.
No functional changes.

Signed-off-by: Bruce Qin <bqn9090@gmail.com>
---
Changes in v5:
- Fixed incorrect recipient address in v4 
  (sent to self instead of Greg KH).
- No code or commit message changes.

Changes in v4:
- Rewrapped several commit message lines to strictly follow the
  72-column limit.
- checkpatch.pl allows up to 75 columns, which led to the initial
  oversight in v3.
- Added back the missing v2 changelog that was accidentally
  omitted in v3.
- No code changes; only updated the commit message formatting for
  full compliance.

Changes in v3:
- Wrapped commit message lines at 72 columns (checkpatch warning
  resolved).
- Ensured only one copy is submitted (per Greg's feedback).
- Carried forward the fix from v2 (closing ')' adjustment as
  suggested by Greg).
- Thanks again to Greg Kroah-Hartman for the helpful review!

Changes in v2:
- Moved closing ')' to the previous line as suggested by Greg
  Kroah-Hartman.
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

