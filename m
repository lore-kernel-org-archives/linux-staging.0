Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1D121A449
	for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 17:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744997711; cv=none; b=PLPq8M7rvh2WtxhLd4EWSvyVDG39kC/3MBfE0575e42OuN91GaIeXWeGsh7aJgLLnXMvVWvlIR9MKryiT/tLCsCaLiQN3r0f7hzQ9WAgSO5yiUktaQqgv8tBQ3Lyf088aR2p+Z6plmCMUF/PpHXRwOA6p7MwsFgOpwA1baQAShU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744997711; c=relaxed/simple;
	bh=m6buCUOBnFMRhDlhSjM4/c7jl04g5VpMz1TxvjXuR8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SHQm9JUo7yKX7zuIeeD8ULNCdL0RZd9PF/QTmjI2qPFMNqPIFITYfz6xnAnQgmtGz6yK3ygxspUqoAinYoGu9tcXctE87QDneAjUe5iJDFWvRdg415abBKOKXkheV0WQgDIeiXj8TWk+8KfhOv1PN7cJ/05GvDW8XS6M7nSIe7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z1Q7pdCW; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1Q7pdCW"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso1381063f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 10:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744997704; x=1745602504; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJILlUmxlNOkJz/bn/NxCrCFwA3F1U2EoPAh/Z2tm+8=;
        b=Z1Q7pdCWFyDjzk2LGzSsHZABCO/nG5fQo1s6eoCBHQpm8OH1tUXrZtDufDGpcry0nr
         EheKWh0IIxOUAJV+tVNa+IRaStM3CfD5QA1EKKfzDihLIIHiunk8YD8UVx6lDtz8B246
         FzcgGncMPOIr11zjrRU7nSX5g9ENX+4aR7kCuS3AC3ITbfs7ltYz6OzCeSbdFuDr/IcT
         mjmud4Y2EkpFIALXagN8k7otPmIOmUV/Dt5XtvvcswRY9aQAdqw8Tc6KdqXPVxVWJFq5
         2Cwndki4R3kKMZ/Yb5bzFQGViUBdS/5RAmYWzLy3t+gM6VJhYSBk6rWKF9sw3SR1sFcQ
         rYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744997704; x=1745602504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJILlUmxlNOkJz/bn/NxCrCFwA3F1U2EoPAh/Z2tm+8=;
        b=IJg1uK4t09QDn/YzRigICVlXnrCyGQVIOnfKtjSCpKEoZGSnWARgT45EDusNdyK/vF
         JbfILwxE4N9yDq5P22Q4JHg8jYxt5S3ugGkHB/gqypvypUGTqdl0YtiBWzEXT/Zd+g5K
         ttbtOskAEfe16fwqk2tn4TjDC0eXm/6ym0i7HLRqgf44eJQ7G906FPp+Demgzf0Q+eeZ
         lFDAwo2UtSR9Mdk2kqRNYQ7Og7EnDn19PDIZdniCg0p92f8kgxAoonm/ZMrPuSWp0X+E
         y+jVXjXbZQhz9VCZzpTynUVWVgbNu1npXiEA6nVzS/JeBMdZR6xbev59f+0Mj2W8B5Ce
         WxEw==
X-Forwarded-Encrypted: i=1; AJvYcCVew+Jdsxegmu4fKJdhJiij5q8Ym2wjvOe9LsiNNVUeqGuu7DeDJ/7ffz9vRjSm75OpQEZ8grhiL1U2Jkyf@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0oCuRbiIDmpG5Pd/pvVLOslCWB+7TPrfmK0qA4o/+W0DcZiIl
	yi/Gdkn76++onSVtBp9pifgAAN0L+Kqfs3Ml5Rq7EQVG7QP1T2fa
X-Gm-Gg: ASbGncuxMM6RfqBv7AR86w29+/mFakOcPPgKGthl0s94kU0DQKvrpYURVJgNqxrPyR0
	JYSpyw6hzf/meqzKPDIcN8us4CtrEjYkFdQ8dT5z4JixMGqzCxwm+liIJ3GTx9lLtb2mV43mFZq
	PEyPCBQPj78NLZ+m4Sj9/zNxHVFTgI31WzKdKKN1PL5IHgUw98Jnk65RmVgg8pSg4zo4ooMzu+L
	5olrCsVkaHN7w7hZvi8XndCzOcwHodWbQtRa8O0/iVxij9DAOZFDcNdOVh7UynMIboRn5U8a/1J
	cWKzpJ357LRIlHDWJ0cac4BG40VaZXdl94I5mH/9pIDfErL4i6Ii1rWuv5QVjFULO/HZZdwH+hG
	9
X-Google-Smtp-Source: AGHT+IGm6D7XQQYbJ3aBE5vZYxL8XaPOdXvawSEdeCq9wxVhJrXnyxNQy/H/R9umb2uWWhdcsZdjSw==
X-Received: by 2002:a05:6000:2913:b0:39e:f641:c43 with SMTP id ffacd0b85a97d-39efbaf689bmr2763694f8f.53.1744997703672;
        Fri, 18 Apr 2025 10:35:03 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4332f8sm3287320f8f.40.2025.04.18.10.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:35:03 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: marcello.carla@gmx.com,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 7/8] staging: gpib: Cleanup allocate_gpios code
Date: Fri, 18 Apr 2025 19:34:33 +0200
Message-ID: <20250418173434.2892-8-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418173434.2892-1-dpenkler@gmail.com>
References: <20250418173434.2892-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function was using unnecessary variables error and retval.
Simplify the code by testing for failure first and remove the
redundant variables.

Tested-by: Dave Penkler <dpenkler@gmail.com>
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 39 +++++++++++-------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 86b98eb1ce69..5c134cfb6d61 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -1123,8 +1123,7 @@ static void release_gpios(void)
 
 static int allocate_gpios(struct gpib_board *board)
 {
-	int j, retval = 0;
-	bool error = false;
+	int j;
 	int table_index = 0;
 	char name[256];
 	struct gpio_desc *desc;
@@ -1135,8 +1134,8 @@ static int allocate_gpios(struct gpib_board *board)
 		return -ENOENT;
 	}
 
-	lookup_table = lookup_tables[0];
-	lookup_table->dev_id   = dev_name(board->gpib_dev);
+	lookup_table = lookup_tables[table_index];
+	lookup_table->dev_id = dev_name(board->gpib_dev);
 	gpiod_add_lookup_table(lookup_table);
 	dbg_printk(1, "Allocating gpios using table index %d\n", table_index);
 
@@ -1153,28 +1152,26 @@ static int allocate_gpios(struct gpib_board *board)
 			gpiod_remove_lookup_table(lookup_table);
 			table_index++;
 			lookup_table = lookup_tables[table_index];
-			if (lookup_table) {
-				dbg_printk(1, "Allocation failed,  now  using table_index %d\n",
-					   table_index);
-				lookup_table->dev_id = dev_name(board->gpib_dev);
-				gpiod_add_lookup_table(lookup_table);
-				goto try_again;
+			if (!lookup_table) {
+				dev_err(board->gpib_dev, "Unable to obtain gpio descriptor for pin %d error %ld\n",
+					gpios_vector[j], PTR_ERR(desc));
+				goto alloc_gpios_fail;
 			}
-			dev_err(board->gpib_dev, "Unable to obtain gpio descriptor for pin %d error %ld\n",
-				gpios_vector[j], PTR_ERR(desc));
-			error = true;
-			break;
+			dbg_printk(1, "Allocation failed, now using table_index %d\n", table_index);
+			lookup_table->dev_id = dev_name(board->gpib_dev);
+			gpiod_add_lookup_table(lookup_table);
+			goto try_again;
 		}
 		all_descriptors[j] = desc;
 	}
 
-	if (error) { /* undo what already done */
-		release_gpios();
-		retval = -1;
-	}
-	if (lookup_table)
-		gpiod_remove_lookup_table(lookup_table);
-	return retval;
+	gpiod_remove_lookup_table(lookup_table);
+
+	return 0;
+
+alloc_gpios_fail:
+	release_gpios();
+	return -1;
 }
 
 static void bb_detach(struct gpib_board *board)
-- 
2.49.0

