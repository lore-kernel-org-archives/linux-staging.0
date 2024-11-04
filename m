Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D05E1C7269
	for <linux-staging@lists.linux.dev>; Mon,  4 Nov 2024 17:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730742633; cv=none; b=A4FBnpzdjn4HoXEBmRcXtq/HvSwreLXeJeyKsKcGnktOr9X56WMvMh6fD1l358k1qVWZunCeqsKz7UvFRapGIMBeH9eDxpWvRLuj75i6P/m5Sekg3CB/uXQXt3FtPR29+XVky+eGCHUJz+xFqipJk47feRRTKYGDCOkEsygs2k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730742633; c=relaxed/simple;
	bh=vQzpGg7deYclM9yBsT3wwI2mUpipEYQCDmwXV/+K5Vc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GPt78xlUV7VTAqrSGYhuyGOhNdB3LverV81PByH/MzX/lXUbsvBR3uDgBHxMyxG9Tgw+TjagSiFofYAVenaD/s5kFUwJLy79RwZo68guoLGt/LCbHt82ZVEITR0ftsoNAspmIYeKK/j9BrBlE7bLg0wHL+CMMT7RB2pVYdkgW54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYYAAGsX; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYYAAGsX"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d5aedd177so2839596f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 09:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730742630; x=1731347430; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DD8a3bEYVTRlBul1UBKXN/QyJ117Vbrsn/u7Gv5aRXI=;
        b=VYYAAGsXRQGPBPu1M+B8dwbB80msbnFhiRCczZUTBzLduFGtZgMtYSKRKlY7jmv7jg
         d0amJ+aaI1tBwjrp8aER3OwYQ30PsvFwST9xmwEjVOQznwQrQNiREhlzkdRovjlPgRN2
         5cVm/zCVpwvneV0TlPffC76sHl2w+qbRzO6d0o6WrXGazrk8qHjBD95Qf1x+q9lJOxyl
         Mh44dWcNY8MoRT+aJw3N02bodgF6MiUronmrzHFN0JnrTRBBUkH4k4TIaw64i20CU4rH
         Xtfm1HLxT4DmUSrVVD3ascOeb6t6zsLWAN03jAZopYJDoDQtTpgW/5KiOoB384mRt5f7
         4liA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730742630; x=1731347430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DD8a3bEYVTRlBul1UBKXN/QyJ117Vbrsn/u7Gv5aRXI=;
        b=e6HQlBby9l9JOWYRTJ9SxP6HN4U9Y6f7FuhAI5W42wN391iAZm/TFinxvFj7nTuCtB
         Q0AzJ34RlwTIRnXNgM8CuCI0UpstvfpRlZCHFupcQGfWfqYVPZRZgbzvK3vmknbl+kgU
         x7yjJb9e4tbfEBPZEixQt9DLjraNoaJ7+fYyZH2wisCT+bn241yeZrw3T6Q1zAlsykN+
         MVp2E0U7VagVcYHr7mmzrb3cUCiD+5RWSiJYaKBKNUKx6FBMZ2g1N9iRTbIQcfLPOe8O
         ebhJRWzW3ZVKUuUY8wQ61vVISRL3QLoxjyBz8QfB8LUxS2qDu5dRbdU0XtpSeRHSu1bm
         y+Jg==
X-Forwarded-Encrypted: i=1; AJvYcCUXB2CtHe+eJ5w4fMlB7tpxOZ6xuom9jGCgiAa90n5nO0jc9Z8lNEgPMjFOb1dlrhxO+YXORR24LFu1elXb@lists.linux.dev
X-Gm-Message-State: AOJu0Yxd7Lk/Z1Kdo6okiZrRbvcNObzAq4rk3o3nCKMx6vbgVwYlaUJ7
	nKdf1jeWS4MB6usHKRJstR5k9iLqgqTCATfPPvgJmlY6O7q5ykF8
X-Google-Smtp-Source: AGHT+IGXOzZj3KlJpbXOL+v3I9GmYe6fkZ2MRZtotgWqVaFVvxrrJgRkPxCxh25tQacS3aOFS9nVSw==
X-Received: by 2002:a5d:64a8:0:b0:37d:46e3:4e88 with SMTP id ffacd0b85a97d-381be7654c6mr15656681f8f.9.1730742630403;
        Mon, 04 Nov 2024 09:50:30 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7f80sm13839821f8f.20.2024.11.04.09.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 09:50:29 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@linaro.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH v3 06/12] staging: gpib: Add comment for mutex define
Date: Mon,  4 Nov 2024 18:50:07 +0100
Message-ID: <20241104175014.12317-7-dpenkler@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241104175014.12317-1-dpenkler@gmail.com>
References: <20241104175014.12317-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Handle checkpatch CHECK message

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index 02c6ec9a42a0..a6b177d7f8a0 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -19,7 +19,7 @@ MODULE_DESCRIPTION("GPIB driver for Agilent 82357A/B usb adapters");
 
 #define MAX_NUM_82357A_INTERFACES 128
 static struct usb_interface *agilent_82357a_driver_interfaces[MAX_NUM_82357A_INTERFACES];
-DEFINE_MUTEX(agilent_82357a_hotplug_lock);
+DEFINE_MUTEX(agilent_82357a_hotplug_lock); // protect board insertion and removal
 
 static unsigned int agilent_82357a_update_status(gpib_board_t *board, unsigned int clear_mask);
 
-- 
2.46.2

