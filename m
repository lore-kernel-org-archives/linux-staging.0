Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5D240B0E1
	for <linux-staging@lists.linux.dev>; Sat, 15 Aug 2026 07:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786777327; cv=none; b=AfzWwT6VYFyQH71rqveoATiZOfIUANfHEPhd9V2phZ3kh/x1CHURyxpNvM7aYOhvjywM2q4ITi4AwNtovYknw8fg2RsU8p5bFIDCXR9UXwBPsDYDtq9tpjlP2M4Xfl8cKHH/HE/0lRmxTp58YhLWw9KRgD5CERhnKXuNI4T3m30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786777327; c=relaxed/simple;
	bh=iPualk3ExWlEnxN7ZTR58LOodbMlHOM9QkLFiZ0s2k0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ivj+6gUpqPOUbWPuX7BlEoSmurVWH37wFM2ReeiPeAqQmFBQFago5Ag1oWGF1qxmxjYG8EScJ1Bkdd1xmkQzCiUo4R0FjYh5yyj4BjPp0tMGRFbh3TUyjbeGbddkA5y64iPmcuZ+x/8HSSmeoeOx2GlhFZiIJgqgU/x+h42+8c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W6FwZw5D; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W6FwZw5D"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so1942984a91.0
        for <linux-staging@lists.linux.dev>; Sat, 15 Aug 2026 00:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786777322; x=1787382122; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MyxSssjLe/0OOnYg8ql2xBDGIwb07hj7I4YlvifUNpo=;
        b=W6FwZw5DlqAi+AvOgcfpCTBUy4pMg+T8CHYFa1F9DUUHZrB3b6VVBSZsx7gILt8Mbb
         3n7ocRSQ+XwaYrw4dlnJewjsLPQtqq78BsFm8QVsGzlFkKYE29G48TBQw9DZb3P1NU+f
         U0IKNNu5BGO5wdJQvEx7HmuknrrmW/+YrkqhYQboW/WqXah1bx32PLjVe7MvZCTRLqTr
         fw/TDFG0Eb3epvXXP0C7dCHAfBj17a+HH+VV/c4drKfi62DD6reRlV9DKJMYcFtl9ULK
         PqsNHe8/P7RxldTko1gNFsAy4ZDvz9pL0FWMILajNX2k76GgJf01Q/Qq/5b4qaLIHfyx
         bwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786777322; x=1787382122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MyxSssjLe/0OOnYg8ql2xBDGIwb07hj7I4YlvifUNpo=;
        b=kHCvepm/z1Q3ywYD2YlkThzF4Qs+Xy9BrB73UF2olLFJHqSdA4Ljq6wuyb5XT57obL
         Yd6DFDmrrb8VftWKynhZsusxlgYhQcY1xRw4Lw7NqkBCiNzrnIBHg0H0WsUk8p/pKhHD
         CkQYuukqGzoBbNNnlnmOi24qCYhwaYxAKPSOwHjxyEIOsUg4s+UsFnLunTN52XcFaycC
         PtVYXKbeROPRuwJySA0Vdxy2AtaVBz5yiwaxPqCCtUg3JBTzk0TLF/OqNsWuqwlLl/EW
         7QGxE2W233KwqbjVqOLUS3Fk8qukEy25eaBn7/u9sHe2hFsKmJGdAha6Y0WBWcLaz9es
         FkJg==
X-Forwarded-Encrypted: i=1; AHgh+RrWU8z+gznbKx++8gAdgU8aRBe1WbpJwR7NpOE2MlJLLircnmMwRK3mzsvZAlxSUDa7twUlsy/ySQiO7YtX@lists.linux.dev
X-Gm-Message-State: AOJu0YxabMd01TzGyvOgC4nrTSO0WaWbXl2y6zurDJFt4/rm2z4B0XQV
	O7xqLTQQ5Nw1Xb5HXuceaj7p23H8lJJd90nmN2h6cdMVBzuKCKUBHoqE
X-Gm-Gg: AR+sD11jYzwi0KcDutr64LZ9LKvJHUHvJ+IO4hGM7zm8sd8jRfxdvOwHG7iA+S6GXOb
	NCp7hcEQugz5D67pE2HI50cO/ygR8GCUn/C3HaEsFKDhwbW6vJBY6iWZz1KVGKSXnG0H/kqwwtL
	fVrIY1EWfS2D0zbsXsZrTuY5aiHKW05xvCtLHUrf9In4J28RupkBLQ6URnqUJ1rimtfbWDDeirG
	OZ4o7NXpgoAC1YawueIGls4s3tWIBU7xNJxPzPk8+fUPa0DTtISOMxD1UiDIbDFl/bGNHI+RUok
	frRorNdqovUIQ3cZCB1SqoZZ+0wqrozdhMidFjG2dO5oAy+m2EFn8e4uqcCLGpntMTL/Q0Y0bt7
	OXIDjxxLmyYXu4zSZ9X2wdTr9YijfX2UOhoEe1rjdN9etACem8oaLcw0JG27G36JAabJPCyr2Om
	3jq0YtnDg/7Tr1NT8/fvtEh/9BW3jgu7R0OY2NXLJW3CaEr4qV581Ex/Q2iElqnA==
X-Received: by 2002:a17:90b:5803:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-3933cb3b889mr13039740a91.8.1786777322154;
        Sat, 15 Aug 2026 00:02:02 -0700 (PDT)
Received: from localhost ([103.210.95.70])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea7fe465sm12363343eec.25.2026.08.15.00.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 00:02:01 -0700 (PDT)
From: Raushan Kumar <mitramaurya80@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Raushan Kumar <mitramaurya80@gmail.com>
Subject: [PATCH] staging: media: atomisp: remove unnecessary return in gdc_reg_store()
Date: Sat, 15 Aug 2026 12:31:05 +0530
Message-ID: <20260815070105.124813-1-mitramaurya80@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the return statement at the end of the void function
gdc_reg_store(), as it's not needed since the function returns
implicitly, as flagged by checkpatch.pl.

Signed-off-by: Raushan Kumar <mitramaurya80@gmail.com>
---
 drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
index b31e3809c0e4..c60f53514553 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
@@ -96,5 +96,4 @@ static inline void gdc_reg_store(
     const hrt_data		value)
 {
 	ia_css_device_store_uint32(GDC_BASE[ID] + reg * sizeof(hrt_data), value);
-	return;
 }
-- 
2.55.0

