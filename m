Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8271D90DD
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 17:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752688279; cv=none; b=ZtWyMQSNUFb57LK42UUmP4IzLquHTRlL3ywcfFIjr1KKknEn9sGBYNVzXAlqb9quFxhK0hb6YRl6RW0mYcrDW9S8Uuws72iw0+YHZOP7bre6yGKOHwO1kuGngNXCi6QTJ4fTaqjSyUfwGAkDdToH9GZfucfCiE8weRAa3edCt7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752688279; c=relaxed/simple;
	bh=/HKUnYDcewcSkFqUEoypvDIQw7JRL7yKlwvBOiSVDGw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=On6PQoVfbfnt1n7JIiiScjpZRnsdttm0FdnBELoLZoswetBuiB+N3YltdYPKiSw2xuFITGVmYZoYCh1KBbVfwKMH/tYU1BTsvp27qzwjnynreuchUHH/8qHR21OLwSqEjyVeIj6sYMhlcxWNCPyMTw0NYPm0r6BBUN+f/z+aOJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+NDXsdk; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+NDXsdk"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-73e57de73b8so100525a34.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 10:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752688276; x=1753293076; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5SYia6TS6HcwITf7jUbxggn1LL2EqgcxN3Xc7nE+fqI=;
        b=Z+NDXsdkene4MVvuDpBWCuXGyyxJq2tSUO/9m+mDU5fzBWFIVToJOUVA/xIRYi6f8D
         bFPXyDRSw7ocORSif7Kc61Va/tx8ScjVSUF/liFOyOPMdzLEwTRTzokpyPG8nBDa8mMU
         W63gdeRb+otMavjZMcGJQWFE1BJX7q+tNuiOYESsEtiSD7keyWvJdA6zRKAIJBTgS/P7
         TwwmmrNNe+67ARpqJNWofbSWIdCLkJ9t09fb5N5+8yL5rt2rjQLCkbzIuE8Fu/aL874S
         NqgFdCLP1ckiIUSKIAj0DfSA/fX3X8EdBR91nr+tXd6ASnU23Fyzo+yk0cRCiKcXXAjN
         9IFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752688276; x=1753293076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5SYia6TS6HcwITf7jUbxggn1LL2EqgcxN3Xc7nE+fqI=;
        b=FTq/j/GRRcaRmRB9SxRLB9csISGBu5yQw97WHrcTOJN0dfC+oKKBZzObQFcseuT+of
         ldvyT8elTimeDAOYW7sbbLPeAXJ2za2iqiJnAya/hlt82WoSQtMSVZfs5H7vXMfI4fJw
         xy1EzC7ZX2JNjqc1mGOC4nfwBKPjZtBjmQ9cM+h4cxoCAKepFgjMWnosGlkpUMltoeSz
         WasRewhoCKsA7SQcfPjfnZ6f8H5CPX+1Ie5U4d4JkWd1oB19vKbvB3duMz5FqiLzDSqI
         FqwNgari65mbQ7LAeQF/4nRiTR4rwUts5kF08O/tL/bFH6uo+xiMirwSF2quHTNiH/3o
         Yaqg==
X-Forwarded-Encrypted: i=1; AJvYcCVBGMt8SuExgwtdKBSB4zquvQlmBW4s4o7V29fH2jH+IuTU+BM/1ARA66KYRloNUlrjJuOm+e49+eAW7J1M@lists.linux.dev
X-Gm-Message-State: AOJu0YwJZI2sPbaOwOZVA8pyxi9IuVc5mxDIPD5EJA/3RbX0yeUHNxn1
	al7S1mhho8nCr3RTCA04lL8JNg9wL8hjUZp1v/l2TdJjn8l/zT0cVJkD
X-Gm-Gg: ASbGncvvqn5UaCDUSrLFinOR9gQpEXWweCk6grMDUDMM0i7Eyhn6dqKqQb9gRG80J/p
	XD3jXzdR0ZlkktiHHVlbd3mMXGT7QFrGo/72PaGwDNx8slD0Ck/5bwEAcBqAKFZU2dTNnfGgLic
	L7Uxq+FtQxiVpOIn9eExq9EDDGgbn/L1zQ2Pd+GwcvYiviMdO7fDD3Cavxj7t24Cmvhu3+/me/1
	q1WpSHdC8YbwiZw+H90ZIM10PnKTVQ+mAjPBJiWr0v4+ZuRCwjBWV77SfCiScmhCCwnpioW3nEN
	LVlT139z0RK5U6B+9Mp9ZGFeiQs6tOdc6EsqganoyExBIOM3h5GtmGFMT3lgYEay/La/pYavb0r
	gvkKdQ0m3bNJ8CJq31KlAs3C9XgLQrGPRaz3oUJyAeIXOaQgS7h3G
X-Google-Smtp-Source: AGHT+IE/Lal0FULVtCovCcS93SI3j4F5Mpbk8OwU4tcZMmdK1uPmEQGmYNz0MhXmhvbC+lItaxMIyA==
X-Received: by 2002:a05:6830:4d86:b0:73a:dfae:3202 with SMTP id 46e09a7af769-73e7344a983mr210266a34.5.1752688276262;
        Wed, 16 Jul 2025 10:51:16 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73cf10648ccsm3127622a34.13.2025.07.16.10.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 10:51:15 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: Ignacio Pena <ignacio.pena87@gmail.com>
Subject: [PATCH v2 1/2] staging: rtl8723bs: remove unnecessary braces in rtl8723b_cmd
Date: Wed, 16 Jul 2025 13:51:12 -0400
Message-Id: <20250716175113.81519-1-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ignacio Pena <ignacio.pena87@gmail.com>

Remove braces that are not necessary for single statement blocks
to fix checkpatch warnings.

Signed-off-by: Ignacio Pena <ignacio.pena87@gmail.com>
---
Changes in v2:
- Dropped the yoda condition fix as Dan Carpenter suggested the
  function needs deeper cleanup
- Split patches to address one type of issue at a time

 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 56526056d..abc123def 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -57,13 +57,11 @@ s32 FillH2CCmd8723B(struct adapter *padapter, u8 ElementID, u32 CmdLen, u8 *pCmd
 	if (mutex_lock_interruptible(&(adapter_to_dvobj(padapter)->h2c_fwcmd_mutex)))
 		return ret;
 
-	if (!pCmdBuffer) {
+	if (!pCmdBuffer)
 		goto exit;
-	}
 
-	if (CmdLen > RTL8723B_MAX_CMD_LEN) {
+	if (CmdLen > RTL8723B_MAX_CMD_LEN)
 		goto exit;
-	}
 
 	if (padapter->bSurpriseRemoved)
 		goto exit;
-- 
2.39.5
