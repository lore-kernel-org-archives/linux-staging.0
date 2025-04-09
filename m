Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA941EB18C
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 05:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178366; cv=none; b=It/ZBRU0SFte0DonT84KZruHc1qeCK5qaaIwtk7usrWhApmCCa8KEF2euLA6Gd8gNhCc2m4TC7CS0nmg/WNccdlKqvN9RDXtT6akb4dCr1rHejQGiEcI/lPR10wXRk8by4bWRZYqtqJ+SKQEH4ms6E7tXQGnbEDBVjnGk/WXXlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178366; c=relaxed/simple;
	bh=ZmzFQ/xDAYCtwqpaLt+46DJGxSnTDxWoxUjN5RavIDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HjJPxWqoeexoJ155Ls52e6LjthxmAxFyPqCBxRj3OUMZ4M9w3/PqUCtgSrj2XbVBNG+YdnIlObEvmNXbClANIkn0eL2dmqF21E+pBFpJl70tnyqHcjQozilDd0EqwFiuPQrjVU+B7mltUpSzne2bNP2pGpVgWgbvZhugjfqVz9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=WggaApTB; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="WggaApTB"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-224100e9a5cso67875155ad.2
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 22:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178363; x=1744783163; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5h5ovOyfAn7yPEFX4yOHA/j00T0uqSAm1ZLyzSebNBQ=;
        b=WggaApTBxShcf76IcLF9FQL3VmFbWmOxURaHQyFE9wTydKo86dUMWtx8bHykyjC9rL
         1tcFmVhaJ1Zc6ofMnF79dXKtEsMzjcpQxoDx6YexYnz5ZaTQT4I13mKRbWIYMNAoACj4
         IqXAUHSFugshrogUQlbnGJ8j3Lz08eqTEkP8wvzDQ+4HXFerF+Gm5aUWht6lKiCueMgm
         KxRIPOJ7C9Ehto+iK9zVnoV0ZZBgqyhwIHJvT51kDz0d1+PIrSZHq0F8HgM+u3yO6USd
         DpMo7IJI9f0kEvW6eZZm8haoJ9LNaHvVXH1276UlvGWw4LnUZznWdw87I86gCVETA6+B
         RsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178363; x=1744783163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5h5ovOyfAn7yPEFX4yOHA/j00T0uqSAm1ZLyzSebNBQ=;
        b=jYlgX5gzK09u54I1bZxzlgrIGbAJFuafbUfDevZFNO1SHKMjVba+NK/0L8Faa1KtsR
         loSbf50xjyz+bql11x4rZ6dLOEPNAB0jVvdqYvy2zV7WiBEOS7vOGOq6RyCRl9KkvsXu
         di02Anww8CI7DJ9Xlbo5xliEUv8MnwKfPCVi1RkQpC0yAmo2/37C3lTre2o2KzM0CtVm
         q1i/+ifPAI/4jk8eSn4w5nhhK4JYJRhe/zm3ZQSmxgQX2sjs8lT+FITBx1nJ4R+NirEX
         81izaCgdtsLo3YD+sr4seLyR80R36Q2E3eWrYVjGFjpp2hMscolldQTznwKj7xSfCf5i
         ifOg==
X-Gm-Message-State: AOJu0Yzn693H77wrXl2bAfLZn2vgKkJhvDB+sDS2wv1+uSKE4fsntQOo
	aiLOR4Rr0JiPf8cLV5ODK2hfCjsQO6e4xIe/sc23Eqe8LX8rq6zMR9oWYxu74A==
X-Gm-Gg: ASbGncvdTkiaqAGCmgM8+9C3RFQkKzlH7kf/biynS37tm6M9GkLiWaQfvdOLbC0yi+P
	IwZIxquJk0hKZBp9DjWR7jEo8V2fGb1rfu4G7Q6oWg7G4JY+lSS107rE6NoF9mibML/dmMGUD8X
	70Lr+fSPkgTvAm6AhhJDKrdC83PnhE3yOuYgVmOdVDHcE885Kv76y+k1YhhSxRnZUhwPI6M0xVO
	lVjjY9Y6AEwqK/bAEW6SQoIyk5OTz2P0Jkn9lDKzp1oqt/GksBluoxY7ILR6Q7NQnNyqWDofEgF
	uMzA9KYB8NFTxpK7rthZxgRQ/W+uQr+25xi6TCjojZBwDch6YMTCB9npURpTqXHbF6EQT+1/M4t
	VqOa3ZQ==
X-Google-Smtp-Source: AGHT+IHc7Q1kV8Kaz6yYTOBNqLkhj3FRON/2uBgtut0lF8Myn3iTAsf49vRKnNZyYcvyzb+7zZyJWw==
X-Received: by 2002:a17:902:e750:b0:224:256e:5e4e with SMTP id d9443c01a7336-22ac2991b3dmr21506375ad.16.1744178363105;
        Tue, 08 Apr 2025 22:59:23 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8b2absm3486745ad.83.2025.04.08.22.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:22 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 14/21] staging: gpib: Using struct gpib_sad_ioctl
Date: Wed,  9 Apr 2025 05:58:56 +0000
Message-ID: <20250409055903.321438-15-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409055903.321438-1-matchstick@neverthere.org>
References: <20250409055903.321438-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for 'struct gpib_sad_ioctl' to remove typedef.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  | 2 +-
 drivers/staging/gpib/uapi/gpib_ioctl.h | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 2fc93a3c4b00..8febd683fe0b 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1474,7 +1474,7 @@ static int pad_ioctl(struct gpib_board *board, struct gpib_file_private *file_pr
 static int sad_ioctl(struct gpib_board *board, struct gpib_file_private *file_priv,
 		     unsigned long arg)
 {
-	sad_ioctl_t cmd;
+	struct gpib_sad_ioctl cmd;
 	int retval;
 	struct gpib_descriptor *desc;
 
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 7cb09cac6cd0..a0fbc660ab99 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -97,10 +97,10 @@ struct gpib_pad_ioctl {
 	unsigned int pad;
 };
 
-typedef struct {
+struct gpib_sad_ioctl {
 	unsigned int handle;
 	int sad;
-} sad_ioctl_t;
+};
 
 // select a piece of hardware to attach by its sysfs device path
 typedef struct {
@@ -135,7 +135,7 @@ enum gpib_ioctl {
 	IBCAC = _IOW(GPIB_CODE, 12, int),
 	IBLINES = _IOR(GPIB_CODE, 14, short),
 	IBPAD = _IOW(GPIB_CODE, 15, struct gpib_pad_ioctl),
-	IBSAD = _IOW(GPIB_CODE, 16, sad_ioctl_t),
+	IBSAD = _IOW(GPIB_CODE, 16, struct gpib_sad_ioctl),
 	IBTMO = _IOW(GPIB_CODE, 17, unsigned int),
 	IBRSP = _IOWR(GPIB_CODE, 18, struct gpib_serial_poll_ioctl),
 	IBEOS = _IOW(GPIB_CODE, 19, struct gpib_eos_ioctl),
-- 
2.43.0

