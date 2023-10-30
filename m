Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D2E179A9;
	Mon, 30 Oct 2023 14:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WYvN9d8K"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-32daeed7771so2855011f8f.3;
        Mon, 30 Oct 2023 07:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698676079; x=1699280879; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8bh30D821O7pisqZqTkIBA0xZHpQPYVy9p5w5SCB02E=;
        b=WYvN9d8KZsl9gMZsNF0uszwnlbCjKfGOnsnQYLv+BYZAP/6PHPLtFb7VmWXgAQJ1Yt
         fAKAW1LSxbsyD2IfcZZflg8F88L8CK6i5pJ3PydguBbGD8m6m/dgkKW6kDdlZ+qsyzsj
         3DFUzLZ9/DvRd/FebdGhXsApivIlW2eufLrpk0XUBUPTa3bLLOlioOeeg3TEaWOWN/US
         tiPAygp3HsTkN3YdLVBR9RYGEMvRaLa40FR97CFYpC7OTlT8M/ZBJfxm9rhXYxnHuN8R
         7XqrUDY6cwQFAbP/LYi13E+1zCEeboAmG/FduC5am1ER1tWV/8SRq+sko0S2NVhXnZP1
         zltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698676079; x=1699280879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8bh30D821O7pisqZqTkIBA0xZHpQPYVy9p5w5SCB02E=;
        b=D4oG1BziL70bHD+tcyRDtiCM/ltWaPQo1hQUVMdj+aC56krTRPMnlQPgd8b85K5L09
         mSF/rvScW8MzyM0xrWsa+hTYcwuDFdJSJzFuLoMuIdiWaH8TriZBpeFGoCD3hnulAfDX
         Tfw57UNrkuNlLNcMfarh9XXF7k/tNuUisA0HSs1fV3PwR9HrHga1G46XAORVRejiztb6
         lIF56snddTXHOZXWrrSIvoWz/uCMLI3pTtUaJYcAaE6PP6ZdOzSkCQnwWWPk3hjA90VV
         S+J7U/mLl331XWTa+doJztA3EDN13vAIhzor1fcIdIPjpuSBkkgsncWnHvUZSn3CkQ58
         Plww==
X-Gm-Message-State: AOJu0Yxaa2RKfgz1V0oTkfu8Szgxpy/cwlhz4l6G9bKar+noI8F84sGy
	a/MJWPZalMCZHUhKgSc+5ws=
X-Google-Smtp-Source: AGHT+IE3SQg91TEitYFJnQaQAgiOXMoUSTQs8i2qySEtTVeVUoQXBmjsnkqttxIyG/Sf9l0B1dk1Iw==
X-Received: by 2002:a5d:64eb:0:b0:32f:79e5:5ea9 with SMTP id g11-20020a5d64eb000000b0032f79e55ea9mr4382841wri.10.1698676078663;
        Mon, 30 Oct 2023 07:27:58 -0700 (PDT)
Received: from nancy-1-2.. ([105.163.156.232])
        by smtp.googlemail.com with ESMTPSA id d14-20020a5d4f8e000000b0032d96dd703bsm8276569wru.70.2023.10.30.07.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 07:27:58 -0700 (PDT)
From: Nancy Nyambura <nicymimz@gmail.com>
To: 
Cc: nicydaniels@gmail.com,
	outreachy@lists.linux.dev,
	Nancy Nyambura <nicymimz@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] Staging: rts5208: Replace strncpy() with strscpy()
Date: Mon, 30 Oct 2023 17:27:47 +0300
Message-Id: <20231030142751.49913-1-nicymimz@gmail.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Warning found by checkpath.pl
I replaced strncpy with strscpy because strscpy is suitable when the destination buffer is NUL-terminated, which is often the case when copying strings. Strscpy ensures that the destination buffer is properly NUL-terminated without padding. In the code, the objective is to copy a string (inquiry_string) to the buf buffer, and it's likely that the buf buffer is NUL-terminated since it is handling a string. Strscpy_pad is used when you have afixed-size buffer, and you want to copy a string into it while ensuring the remaining space is padded with a specific character (like '\0') hence not appropriate for this context.

Signed-off-by: Nancy Nyambura <nicymimz@gmail.com>
---
Changes in v2:
  - Explain why strscpy and not strscpy_pad

 drivers/staging/rts5208/rtsx_scsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rts5208/rtsx_scsi.c b/drivers/staging/rts5208/rtsx_scsi.c
index 08bd768ad34d..52324b8ebbc7 100644
--- a/drivers/staging/rts5208/rtsx_scsi.c
+++ b/drivers/staging/rts5208/rtsx_scsi.c
@@ -523,7 +523,7 @@ static int inquiry(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 
 	if (sendbytes > 8) {
 		memcpy(buf, inquiry_buf, 8);
-		strncpy(buf + 8, inquiry_string, sendbytes - 8);
+		strscpy(buf + 8, inquiry_string, sendbytes - 8);
 		if (pro_formatter_flag) {
 			/* Additional Length */
 			buf[4] = 0x33;
-- 
2.40.1

