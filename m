Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C3F21ADC6
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 00:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752627364; cv=none; b=aHxDvyE71hQ2Vqo9e4gH3qVlAxOBcuej3doWSVRfS4zEoRUtxkoWjo81q+3gD1l0/o/QsreysMeDSjJ/AlJVP3XJSyT45ZwBiviYrF8UYbauyD5GZ+rgiblkDLXWSFcWb2nPqwMxLgIi0J4iwQ3xpfZ+t+5F8klZtSCb5CtUAVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752627364; c=relaxed/simple;
	bh=+1v0U5GLDthMIHnNPtPP4SPq7+6oMjMZjP2InLRU9os=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rh6BxzcQjxMyoy64IchEp1/PpYHRcSaMZNVCPXWJCCp5AwCmBCuSSoEWNrn4zNIq9R4XRpgh9bUC4RlT0QFSFXfzYVY9CBuO/7do8dGVnoz1Tj1OovOeSD5T+KHJTJ0b6Ztqed1syBHopMxcVs8/nqoUxppfLvm4/2IJBrDxP3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgnbQUc3; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgnbQUc3"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-72c27166ab3so3803206a34.1
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 17:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752627362; x=1753232162; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHtZ4w4/IEU262S0YzaEvwuya4AQfl6hM4w75Ky/YrM=;
        b=PgnbQUc3gsSabJ1h9vBzsDPckD55BBAhEmTFSMfYiZJFD6yK8J6tuBEyILRH6z5NWv
         jfhYz5IHKpRgi4YP3F+2u/x8tiqqoXN+jtfG4VYg6CEokDrb7q00RXjbIil6VlJXdCP3
         M+3/O8F6rb/sju8EDa06Q0r7h2whwhfhHJ4afHiNorKhkwaBUVTiz/6+FrlVsqWN6kre
         h1NHUfhuHhnBXMFd7EG26n349N2wXvJTHDMIdSOocBR/HJF0X5CcINH7KgKQevuCslwD
         5r3PW11WT8fy6VBiblbCXmQe5TkexjyZUk3chkdrzncvak8AZLL+RKLakJHP67MaN6Yf
         5XaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752627362; x=1753232162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHtZ4w4/IEU262S0YzaEvwuya4AQfl6hM4w75Ky/YrM=;
        b=W3v7zG5XakkJXO78fRQCl0gKbGAMr3LKVlptp+9A298XUt7KFfGBLj+OdtPnfV4X/l
         6tC8BdMTnMEQUTyBxZLqKhL07uUfrZ7cE0XWzCVfxAU58y6IhPY/na2KgTS/srZ7n47Q
         VUhMaHS7CS3FEhuzd4Mmg+Uq0bUfUjADwPfYhvs/UdBv/qLPAk71PnUD4IWL3AYkbenP
         5HabHpqXRhgUGkKize7I4JWWfksl9rtTWY8fwMOcg9F19ElJ342qxZN7pAOG9cW3K4h7
         BB4SN3VspLyqBzJSE/LIwb1rEQ4+gFJ3+cyYTgCHGwWemCF4317sZUQo+fKQa0ggRizb
         pGYw==
X-Forwarded-Encrypted: i=1; AJvYcCUxGRZl4I87TxPg/hHw3flHbghKtUMcKI1MRnamNupct7jwef3PiErvZtjk8FKP+j9qjA1qSilaaLCfQTcw@lists.linux.dev
X-Gm-Message-State: AOJu0YwILjuJcloJ1+3S5PKSMtZ3Xq6IwH1/0uXgninz1ADgQcww8SON
	J4OWaHYIN2VbcYIfACKfHDGBNDQL2QhrVIzyOJk7uzMDzTobsn6GELPv
X-Gm-Gg: ASbGnct2SH7gdpTfwuJExyNDk3K8BlnfoUnzVE5ESZT6nwzYkBxBbIxFMr+NNUWKD+l
	G5qTcgjNoFeCtsrf5P7TIyYJcUT4NybVyAdbCUYBgzfNLLIkmM9rDK1AzelqjJ6+/5EMqTgHv8Y
	p8Nl+iLjpilEp4fYG1ie3GZeQHvLc7ILlMn0bXKz4m0hX4qCDS8QGd67p8r9wOZbjeYg1YIivh/
	07OrzeowHCdTULpWqDzuATG1bsvOYi2osWsQlgzAaJ+CvyNAvyS8XP5QFstWiRzIcAAk7JvKCGQ
	n3w/1oLi13nz7olkUTrSuQJZylNEiRnc8U8WZhda7AWDZceeuSu7w0XWsN6XY30VWx1EGiiP8Uu
	8MvChmmwAGXj09/kslOYlCSwqamdDPy/YHZcw9abOo06mFJnOFrWH
X-Google-Smtp-Source: AGHT+IG6flzBzXghptha8ePyXiKBfwVXd1Ab4SV7QRY9tv+YIXB3xB4EcONZ1d+50BMFsir2ET/QXw==
X-Received: by 2002:a05:6830:442b:b0:73e:5cb9:e576 with SMTP id 46e09a7af769-73e6662d006mr571265a34.27.1752627362179;
        Tue, 15 Jul 2025 17:56:02 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e56024edasm1035047a34.34.2025.07.15.17.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 17:56:01 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: dan.carpenter@linaro.org
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	devel@driverdev.osuosl.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
Subject: [PATCH 2/3] staging: sm750fb: Fix function parameter alignment
Date: Tue, 15 Jul 2025 20:55:52 -0400
Message-Id: <20250716005553.52369-3-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250716005553.52369-1-ignacio.pena87@gmail.com>
References: <20250716005553.52369-1-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align function parameters properly to fix checkpatch.pl warnings about
misaligned function arguments.
---
 drivers/staging/sm750fb/sm750.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index d3bce107f..a896227ef 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -121,13 +121,13 @@ static int lynxfb_ops_cursor(struct fb_info *info, struct fb_cursor *fbcursor)
 	sm750_hw_cursor_disable(cursor);
 	if (fbcursor->set & FB_CUR_SETSIZE)
 		sm750_hw_cursor_set_size(cursor,
-					fbcursor->image.width,
-					fbcursor->image.height);
+					 fbcursor->image.width,
+					 fbcursor->image.height);
 
 	if (fbcursor->set & FB_CUR_SETPOS)
 		sm750_hw_cursor_set_pos(cursor,
-				       fbcursor->image.dx - info->var.xoffset,
-				       fbcursor->image.dy - info->var.yoffset);
+					fbcursor->image.dx - info->var.xoffset,
+					fbcursor->image.dy - info->var.yoffset);
 
 	if (fbcursor->set & FB_CUR_SETCMAP) {
 		/* get the 16bit color of kernel means */
-- 
2.39.5 (Apple Git-154)

