Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E3717A2FA
	for <linux-staging@lists.linux.dev>; Sun, 25 May 2025 06:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748155475; cv=none; b=ksc0I5E12Kc5IEZ9Om+tkkxun8HJK3qGTcVQlrHPX/KpGslP0Oy9Hz3Q/Ubc537s55c3ZocCgyrYcKnXFhRnFF6PDevQi6Q4c8bwgzfumgULY6TSOMqmTUg3pSq8EfyEJ0vTEhAKa4/Mz0G34gNrwBga+93LwKbrjIkreYF+rp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748155475; c=relaxed/simple;
	bh=Dd1q7WRp33ehmP8qO24QWF92ZWz2jd1JUhpcvFdYDjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dVl21yIsenUyqPt4ydou2jdunb9O3Zgb8Wu8W169hk/a4qQVB+a9MwYF/xMKMHtLyNn5+7IkalNVzyXyewqykmeRQ/tLKwqXsfz0754MnulPN0pl89aA4lHd6MpIX0Ho6nX4WLaMMPs9I2ngEanfalaFZln9DAu+vhZPmmyQdrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVIaKSKZ; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVIaKSKZ"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-70e2dda56ceso6544547b3.2
        for <linux-staging@lists.linux.dev>; Sat, 24 May 2025 23:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748155472; x=1748760272; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTzscTj+YcQ1SwnnplFh8eTlzFm7X3URXr/8FG1Ysm8=;
        b=nVIaKSKZ1wcDgMVYZBmGMT9I1J8p9x05Mx5uh5NIzahTH/6tnZqBaiw72JgwyRP73J
         CLMkmiUWwTT0xjeciC3UjNxjF2B+1hxB4wp0/Wem+pIAUnxwb3hJBIEfE+Io18mfUzMK
         IdAZFkQIQghJ91nna7w3oXB4fx6+hR8GVlw2Pu70bOEAXq571gtfV0GfgbeTmZHETZzH
         kKzjwcD9V/2DGjb2QuAiQHucPbE0cX75uPSZbigAWcxwmX9kOYEa0qPk7IAH45NhiXOv
         4Plm+DzvCyhLzUwN0XBowpmw8GnKLORWPamck6wxH9K5pxV1qnDfDT6RbOaVXaIixP9p
         tA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748155472; x=1748760272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZTzscTj+YcQ1SwnnplFh8eTlzFm7X3URXr/8FG1Ysm8=;
        b=LHYWEZcPs3KxurnQx83zLIBzS83ntxQI1kCafiWr/wi9a00B3Dfxcboif2f1wqe7mS
         DqrMbK1DG/VqZztl1A9HH+1RB/iPhr87obcQUSFlbG++kiGtCj0htcjNxva+r6oPCTmv
         PcS137eqT1TcfOMA5BrrABj3MTJxKxXapjgBfvUlZRO0mtcRHDlUUT6b63uEZaYg8teV
         EM4zS351w5n1QQchbsXlBGV0GIeFFC5Gbe5zYrjvISufWKARw3qBX9xT7odir6kHBbrC
         TfMtStraF6riRHU0Y0Lh3GBaYsJIee7j1FMIg+6HPn0zA+IZfYzKlFWWgzJ3s/7e6E75
         0G5Q==
X-Gm-Message-State: AOJu0YwAPReLbxM6xKSOFTrMldVVN+P7l+jfxA7+tIuUMXBRj4wj2SCj
	4+lTRo1b2zqRQjQcT/QUGe9gIAiXECqaom4zxMZls4pNcU3o5BVCj1kJ
X-Gm-Gg: ASbGncuL+qZSxbigg8fcqTQnT8ciUSEJtIhVg36v3ZxMp/9FOcpbwWewXBrobyDyF/i
	TfwX576WRiLTlZkE0Uw+ISGv/WKAf0btT8sxmRHQy+NIVqEVwuilCNkISXuBC6kaEegEKC3gebU
	JI4+iNk5ADUEFoTjgjSbQCSe+xm15Y/T8EIFEu/fZotLfJRZ8exhsXQ1YWSKslt+Gan5t2KxQq5
	AvKeMaaX46odUIUFK7MXJxKYC7nJoLRX1N9CE3BOYBu+PN4dyXe7l41XzzAX6Efjpin+Y5tX411
	tzVeDpZ4aB5zvjQlBqQOzMbZvuLVFN31NFUi0hfpmO10EgVmblkaRhYg2lEKBbPirngPzF2BA3+
	ljAU=
X-Google-Smtp-Source: AGHT+IG80Kj8pAlqxh//VhzPivSEgHHMLwge+CNbDXCkpO8hiEvMp/AhC8cTEnZXB1F2CHEOOEcfXQ==
X-Received: by 2002:a05:690c:4d8a:b0:70d:fe74:17ff with SMTP id 00721157ae682-70e2dabc1c4mr45381827b3.26.1748155472300;
        Sat, 24 May 2025 23:44:32 -0700 (PDT)
Received: from maquina-virtual-para-linux.. ([191.156.247.35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70e23250267sm8666637b3.65.2025.05.24.23.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 23:44:31 -0700 (PDT)
From: Donny Turizo <donnyturizo13@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donny Turizo <donnyturizo13@gmail.com>
Subject: [PATCH v4] staging: rtl8723bs: Fix camelCase to snake_case style in core files
Date: Sun, 25 May 2025 06:44:25 +0000
Message-ID: <20250525064426.9662-1-donnyturizo13@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch renames functions _Read_Macreg and _Write_Macreg to
_read_macreg and _write_macreg respectively, aligning them with the
Linux kernel naming convention of using snake_case for identifiers.

These Changes improve code readability and maintain consistency with
the kernel coding style, particulary in the rtl8723bs staging driver.

No functional changes introduced.

Signed-off-by: Donny Turizo <donnyturizo13@gmail.com>

---
v2: Corrected the base branch used for the patch.

v3: Rebased onto a branch not maintained by Greg Kroah-Hartmant.
Also updated the commit message body, changed the "From" field to my
real name, and updated the Signed-off-by line accordingly.

v4: Rebased properly onto Greg Kroah-Hartman staging tree to ensure
correct upstream submission.

In v2, the patch was rebased onto the correct tree, but in v3 it was
rebased onto a branch not maintained by Greg Kroah-Hartman by mistake
This version fixes that by ensuring the patch is based properly on
GREGKH staging tree, required for upstream acceptance.
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 437934dd255e..49bcefb5e8d2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -9,8 +9,8 @@
 #include <linux/jiffies.h>
 
 static struct _cmd_callback rtw_cmd_callback[] = {
-	{GEN_CMD_CODE(_Read_MACREG), NULL}, /*0*/
-	{GEN_CMD_CODE(_Write_MACREG), NULL},
+	{GEN_CMD_CODE(_read_macreg), NULL}, /*0*/
+	{GEN_CMD_CODE(_write_macreg), NULL},
 	{GEN_CMD_CODE(_Read_BBREG), &rtw_getbbrfreg_cmdrsp_callback},
 	{GEN_CMD_CODE(_Write_BBREG), NULL},
 	{GEN_CMD_CODE(_Read_RFREG), &rtw_getbbrfreg_cmdrsp_callback},
-- 
2.43.0

