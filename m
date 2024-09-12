Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB0A189B8F
	for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 04:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726113878; cv=none; b=luwFJ4zGm1clqJtwgtr3G6WN0ivFMZe2ZbzyveQZh4RHwyXMaaqlOh0I2FOOYyNgxC+uEe1SSRgPjxe95rFRATykYtxA5SJYMa3Zk1ZhdqKQlWMln/TCFR8fu5vLX5raJqsb6aKZLtOwnWqbQqtcH1Ts3UQyeFUXd41kPbnTF/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726113878; c=relaxed/simple;
	bh=bdIGBU+mN34bLbOLajFGFB6iyFx+5wKylOR3Xogz2ZM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CUEaqd7EOOgHYBc/FyENeuz1ehyKvItl3Q973dTef2CiDQ2+nDK7PGD/UQMvYcPA6UhIMKfvmB/w4uQTD5ZS9gzXJLq2fIi6zKciw0Skz34EbKJloWrvwLUSZt/AHUa77Y4vJycTPK2ZOm+Id0bTJdaEwCop5zO2vjpziZeGYkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mju0J2wB; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mju0J2wB"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71911585911so388337b3a.3
        for <linux-staging@lists.linux.dev>; Wed, 11 Sep 2024 21:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726113876; x=1726718676; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jyB7App+A0wL+Wf0fFusO+M//VVEnQeF5FHyKNWVAA=;
        b=mju0J2wBBskJCa5loRYWATaewR1P7Jatnoeo0eaclZc/GMpq0XQG55iJmaCGvGO8ll
         N4cwdYhayUN+/af6Nc3BjGBYbecPHFJqJgjnNzjwy59uOOGNE9VVb2cCZuRSiEY1e1ub
         aVdY+wLxfmrf9sEAjkcINH6aVr/pIM7ZmPMmWwEQhwxUqkzOXLgfWWCFpIa8NR+NsRmU
         B0FvfWmDFnKHcyCg15GSNQMji/ieEJwO0HpgTzgybt105679gJqfjRgII2WIkGEV7rVv
         Ar9OIYcHQxP9iA2R+65PGSSVZlB+STB9ZehBF+y58CCb96K/OpJuYwT8k3oPgUxoLnaQ
         l6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726113876; x=1726718676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1jyB7App+A0wL+Wf0fFusO+M//VVEnQeF5FHyKNWVAA=;
        b=b7mb0xoBVW6TtK6F5v7hOYXTgLJAc9x8S3KP59ZlgnSPU7kIjkfzxk5sawfqwlCXr2
         jag7SnqY46QUipMo154Wf+PGYF2xQuHlCoESSKSKf/R783o6kR+EecRpfgL6dfefAxnv
         l9AYQhk37MYiafuLUWtgZQoJvAaeUrHrk7M7n7tLqICGu9LSn+3gt5LQcauby7gkNXey
         fIiWd9N3DXBu2MxFLLgWhkMO0+ZUbUgQADl36eOnvXdHe2+EEBSDEl6BM3K4PWUwQNG5
         XmivKFmOI7j/Crt9EaMHLzAlAOCkjz2+PUhG82Ry3mqWKdZnBlMi8zhaoG5ZZ2DPBhSB
         3nwQ==
X-Gm-Message-State: AOJu0YyuKKF0uJR6ZVY0tX2vh/+hGvXjOAN6ZWKvqI8n54gicW0SOd1V
	ngevEHL7DzEipt1ZELvA0TjZ3kaM7pIU9qgRWzUjbNV1YlDh6W0cUlf4yIA3r+E=
X-Google-Smtp-Source: AGHT+IHoAJwpGouIkghtKvkT+FudpoXg3/xOSYGChcm5MDvyNE4oN7rlrza/YeB4qkv+l0DSFMJJ2w==
X-Received: by 2002:a05:6a00:228a:b0:717:87af:fca0 with SMTP id d2e1a72fcca58-71925f9de4emr2599012b3a.0.1726113876396;
        Wed, 11 Sep 2024 21:04:36 -0700 (PDT)
Received: from debian.tail629bbc.ts.net ([2409:40c2:12a7:616d:eca9:534f:4e49:7c41])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fba469fsm768359a12.11.2024.09.11.21.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 21:04:36 -0700 (PDT)
From: Sayyad Abid <sayyad.abid16@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	guilherme@puida.xyz,
	philipp.g.hortmann@gmail.com,
	linux-kernel@vger.kernel.org,
	Sayyad Abid <sayyad.abid16@gmail.com>
Subject: [PATCH v2 5/8] staging: rtl8723bs: include: Fix indent for struct _byte_ in rtw_security.h
Date: Thu, 12 Sep 2024 09:34:06 +0530
Message-Id: <20240912040409.3315067-6-sayyad.abid16@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912040409.3315067-1-sayyad.abid16@gmail.com>
References: <20240912040409.3315067-1-sayyad.abid16@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change ensures consistent formatting of the struct declaration.
Improves code readability.

Reported by `checkpatch.pl`:
WARNING: please, no spaces at the start of a line

Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_security.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 0c3271fb7e9d..7901cce76443 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -50,14 +50,14 @@ union pn48	{
 #ifdef __LITTLE_ENDIAN

 struct {
-  u8 TSC0;
-  u8 TSC1;
-  u8 TSC2;
-  u8 TSC3;
-  u8 TSC4;
-  u8 TSC5;
-  u8 TSC6;
-  u8 TSC7;
+	u8 TSC0;
+	u8 TSC1;
+	u8 TSC2;
+	u8 TSC3;
+	u8 TSC4;
+	u8 TSC5;
+	u8 TSC6;
+	u8 TSC7;
 } _byte_;
 #else
 struct {
--
2.39.2

