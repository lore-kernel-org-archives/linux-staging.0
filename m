Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E59D2F6;
	Sun, 29 Oct 2023 19:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="deG5Lmgq"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40850b244beso29787915e9.2;
        Sun, 29 Oct 2023 12:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698607029; x=1699211829; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ITSqca1evCzkzhn7N4VS98YhVKLbCaQ6LkheIXfd40c=;
        b=deG5LmgqOKX/N1J+a+Bi7Efp3Y5TJlhmpOrILTxsgvbQUJkrEUfks9hgnN0asYcJDx
         2ogMAYeMJ9/jEiJRj0ViRpoT94l87kMKuqZl4O6mIaEGUGJUx7FiK0CQFR4ZLfHz2lLQ
         7AcUhXLAIZurNZnT7zUWwJV7S/ktt+vxblOOJMkjviX9gRCfofTkXAZdchyXw3E7dCt+
         TYMwoG5tgqm6dXT7mL0o+44306MuATW3Gyn6NX8BOJpkh51aAkhLsPNfCIaaTtsM2Zrv
         /fdy6L/aB7rnApe2fzk4/c5G/ZgPEI3O1s/DuPg6lF9MvFD5/J9yrszdZx7lyjPG4zvU
         /RaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698607029; x=1699211829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ITSqca1evCzkzhn7N4VS98YhVKLbCaQ6LkheIXfd40c=;
        b=DCQuA0m+uwYTrYK8eLJ56/lMxTZIYXsd0AP25L/sa0mj9W82gRY2DhGJvBowUbKCzg
         vjXoIIXV8GOW78L3FcLxf9wb0u6WuGObC1mTQ71F0JdqpCX2fq7sbN3/JhG9IFu213kZ
         S+O/u1vyniju61W08JVmBv4vble3UsfshxsUnIO7idJdfPAjpwgygKHceZoAkPN+N6d2
         KGRt5sEFXmEsuFDjG9X507R8oYzPi9LhV4wObstX7dwbgRcOPZaYDZpYI33BlJqPQJwo
         3XaaadSWm06rtIvI9I8TdcHjFxUUr0gb3W++lHKx0b0kIYsk8IHTGFJFldkb8eAFEQUv
         IZNQ==
X-Gm-Message-State: AOJu0YxIbkHYoRhVWbR5K25hZAlJhFlP9yyWs7qb0ElieqcvZyIeapOr
	20IYcr1yzH/PJDJA2BA2UQA=
X-Google-Smtp-Source: AGHT+IHXE2bjhwJPibipKZXXVYDAVNLrcQqlZkEYTJRNgF/vz2gBUtTk5/EHvKpgfBfIDriqLRKsMw==
X-Received: by 2002:a05:6000:1865:b0:32f:74ee:fcd4 with SMTP id d5-20020a056000186500b0032f74eefcd4mr7064455wri.2.1698607028509;
        Sun, 29 Oct 2023 12:17:08 -0700 (PDT)
Received: from nancy-1-2.. ([105.163.156.232])
        by smtp.googlemail.com with ESMTPSA id p1-20020a5d68c1000000b0032db8f7f378sm6483343wrw.71.2023.10.29.12.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Oct 2023 12:17:08 -0700 (PDT)
From: Nancy Nyambura <nicymimz@gmail.com>
To: 
Cc: nicydaniels@gmail.com,
	outreachy@lists.linux.dev,
	Nancy Nyambura <nicymimz@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rts5208: Replace strncpy() with strscpy() for appropriate string copying in rtsx_scsi line 524 warning: found by checkpatch.pl script
Date: Sun, 29 Oct 2023 22:16:42 +0300
Message-Id: <20231029191647.44127-1-nicymimz@gmail.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Nancy Nyambura <nicymimz@gmail.com>
---
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

