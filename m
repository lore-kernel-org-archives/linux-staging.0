Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E511821B8FE
	for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 12:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739797014; cv=none; b=jhYz2jKSGGO1sLVhW2fW9yck0UN2PiteS98B2rI6QSnn+MILZzbcEVe/cKhlfZ5t6HLiBMwWRyR5trL+BcM6FEEMHZ3DuSudqfVHTdcuDenXQ2WdssuGkoeRk6AeIjUgCY/QjquRNX1ekaR6kUnBugkjx0ROHZFbSv+o3+4CqK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739797014; c=relaxed/simple;
	bh=Tj1MUtrrHYN3dtuh02om2PeXmRrh4rBT8jyqsExbAhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=prruqRkabfFmWRwBFLHbHHWWNXk67KkyHPt5ZDB5FXOXR4pQlzNiZJc9XLxGvDa/BwvR2+7e66ERXaB1vXj9ZtwNF81i9kYIbKDyf/V2Xnz+U0QanaZ5jW8SWNHk/E3tbu9JhrUi5S9EwJ+Jba/rUwAtH2kmUuMfGgZwDG3Cw/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cx9tRzbV; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cx9tRzbV"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-220c2a87378so59330205ad.1
        for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 04:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739797012; x=1740401812; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqT+HtUapWQjxJsoaklq/LsDFIgfZnyX69Um1q4t73o=;
        b=Cx9tRzbVFiZWAl6Y/7nUsNZRGtOUtoln0gy99w6WyUOBcaj+83UlvwTqBq/t89cIkY
         HRnGYBrAZkjZg0gtzWnFVv6gcliUHIKq9WOMVyfRfSNX3lysCfLnmGD4jlVJIGWL3ISm
         oqsyMBy7Ypc6heDmf++aWp5Hk2Z7cqmUoLWLA4u5Ft04QZB+ADu13rFhAmF/Hw+5JpeH
         7U3wwinFrTdzdeHdKA9iPzshXmvQgd/nSQ5eALO6p+E65qrnM0mLNUW8buRiHrjxL4cu
         RRDb6qbWDAsS7N33ZrSiItlLI3FcOmhURMdsEMzjgbleX+btwBv7tdyuiZzu1uOqpkL/
         Mdng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739797012; x=1740401812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqT+HtUapWQjxJsoaklq/LsDFIgfZnyX69Um1q4t73o=;
        b=bdrtMXpIZm7uDtrkOt4YRoPipovL/zYbqUsXo5c4Yl3KKFzi0cf0cJLNxAJ95oje+Q
         v5zMUmOCEp5XMK9ayyimRUbneotkZL7aNDLGzPfiHJQZovZzhELugXhvB3KMxW2RMjRS
         bSNldJLbkTDJypMp/kwEracfQi8klDPWs2/OP+hYzTt+0nHCy/0qKMm4sDNANmNVVDrY
         TcDyO69YM59S+CL7Dzt27VQ3BJqFsC7l3LTiFc/RCXlRj7gp+lOPrx4nRZsjfYKB1jCH
         EcuIJ4kb0nQujPlDxzUCwKMWsUvZbFmypPbAYv3unMFKNC2r8ZcjY7aHNFAvYKM/566M
         FhPw==
X-Forwarded-Encrypted: i=1; AJvYcCWmCaKruzl6vmA0kGKX++Jqj/mcLi1zXQUAuqSybTS+ncJ8D6HCNo3g4faPTS2YECQcl12UI9FXf2hhuzZE@lists.linux.dev
X-Gm-Message-State: AOJu0YwxMVaRnM261AT1uDdUmUvuDTZhV/BReb+Iqder5noNYQpYwAuV
	Kl1h3YrlHVt36BpmskR4+zZNtnKq3Cb8BmHLCeREo84VtjvJJa/4
X-Gm-Gg: ASbGncupIgIypoVJsRjrpBrGbmNQELBfS+XiIVwdj1GdixB38ekCEifFoOkt38V7tKD
	LnPxF58N38ZjE2eZbzJ6jhdFe/2p17qN55F6K6jxXzV9MbkhqFT6Uylu+k2m1jUKvfB7mKNxqrs
	hTWNqovVQ/++FAaG4UJ7IaQoZ1MqnEdjaXF94XoOo4Qool8QEribrlna0xVxFunNVjC/oVbbeuw
	q5Phqod5R+nW6c1nsMOwLCSqci6oAm7slbH7BG6AVQEbBfUBr+qq0W+75/PN2PblNrOyd/it8Gp
	kznj3mgBuc8JzmsF19Yl
X-Google-Smtp-Source: AGHT+IFQsDLLICtZTwp1fHa3MkySuBKcyWhJhsaW31e/cQmIMTsA8p9xCDYokjLDXm1wveuKaXpjdg==
X-Received: by 2002:a17:902:e54e:b0:220:ff3f:6cc5 with SMTP id d9443c01a7336-221040bf806mr162699635ad.35.1739797011931;
        Mon, 17 Feb 2025 04:56:51 -0800 (PST)
Received: from localhost ([2409:4066:d04:319e:1d76:db25:b6bf:4f52])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-220d556d45dsm71102925ad.168.2025.02.17.04.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 04:56:51 -0800 (PST)
From: Ravi Kumar kairi <kumarkairiravi@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	kuba@kernel.org,
	rmk+kernel@armlinux.org.uk,
	broonie@kernel.org
Cc: arnd@arndb.de,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ravi Kumar Kairi <kumarkairiravi@gmail.com>
Subject: [PATCH 2/2] [PATCH 2/2] staging:glib:hp_82335: Refactor kzalloc size calculation to use pointer dereference
Date: Mon, 17 Feb 2025 18:26:17 +0530
Message-ID: <b3358e0d2c50a7d0777dd11d6e34ed9a52c00377.1739794938.git.kumarkairiravi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739794938.git.kumarkairiravi@gmail.com>
References: <cover.1739794938.git.kumarkairiravi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>

Replaced sizeof(struct hp82335_priv) with sizeof(*board->private_data)
*as checkpatch* suggested.

Signed-off-by: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
---
 drivers/staging/gpib/hp_82335/hp82335.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index f1c2045570..66557d6964 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -205,7 +205,7 @@ static gpib_interface_t hp82335_interface = {
 
 static int hp82335_allocate_private(gpib_board_t *board)
 {
-	board->private_data = kzalloc(sizeof(struct hp82335_priv), GFP_KERNEL);
+	board->private_data = kzalloc(sizeof(*board->private_data), GFP_KERNEL);
 	if (!board->private_data)
 		return -1;
 	return 0;
-- 
2.48.1

