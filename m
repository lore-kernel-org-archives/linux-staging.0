Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A0C1E1E10
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 05:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178357; cv=none; b=L1vEjh0Bo2RPoNCeE3BRGouKEPkG8iuz+vMnxf6T5sJ8egHlyJ29tRTlP572/rv3TSn4g8cq9ykiMmGfWAuk1wPB1HKH69oX5XlyYMj+uBbO7JccN63hij4EBjFITjHo/EyAIDRDBpOGc+SJUer4rj4p+/HKuG4HZ4Zi1ZxBJaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178357; c=relaxed/simple;
	bh=/bZHTaMP6qZNG+6B+h6xZLBEPyyqDzKN3WknItrbwz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iv1BhTcc31Fps6rcj0finjyfNYq5uxdYZka8c3fJ8dV0qjn8vTNce4FLhUvAe1wzccqL3Ptos3vnDq63+6FG9szbbzvjXhvF7H0DwoL+UysrL8d8MwozuB4x/oxw81myq/Cn155xx/kV2kJYWwIz+gcr2/EpldsSPUMSLrLmR0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=HoHQgdR+; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="HoHQgdR+"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-730517040a9so7806795b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 22:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178356; x=1744783156; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgSCc/CZI/7pOuwGbarGcJIHW5TIhb+Lwu6y3er4SkQ=;
        b=HoHQgdR+v5Z+sw1RMmLYbt0uaV+oSB4RD5AlDtE/jo3YZBZTiwDPTW34eI62Jo4pSI
         P3pLGXNc01KuhOZtMzl13yJssN/ZF/97Q2kBYt4tPuXLun1xNAcKPxlmglmPoemer6ch
         FZtk05cOyNajscA20dbA0pOm54UH648tBMgeMD31XC/z3sZnfETxwGPvMBBTtN20VdoV
         LHkfSafEw0NLlscsM0fi3bBP5oSEy5xAxObLfDHMm2ky/SrBI1HuOr2rMybN0ZG9AJob
         BwqdqPl54RlmbC40Bpn7jeaQFdvWL+li+5DOXv+gyF6Aaj5d0RE4L4AgUCs0P45tDlDX
         /rtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178356; x=1744783156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SgSCc/CZI/7pOuwGbarGcJIHW5TIhb+Lwu6y3er4SkQ=;
        b=Q6pFYuP87aBcZv1sbblXaYwP7GO3xldmLhQgcnNqlRHAT2nOn8QFcieyr5OtEJeYfq
         dU5IuYnsX5yQXHAKiONMlIq78srDXw1qCJJl5z187KOFXS/lCpwPVJGf6QFHI5/79lsq
         KWvXbh5TCwgasunUjGzA7g2hYyCIQarpOefduvEQxAW24ogUkDqpvk8vgmdbiBRhQiSz
         KjDZiQSl75DCoShcRNw0Up/I5t3/6irPeyxC/Vu1yplupXxvTfKzpuNksMv/0aQFPPiN
         v9FkRWUQ46fvSBXlyilq/06Y7GPoaj9WO8ryy3Z3uCvc5hgf2cA+RJ0Uaz8lIY+LwPTu
         emuQ==
X-Gm-Message-State: AOJu0Yy6n+rOXnp6ILSTy3SneyFjuz8jIpWvv/uOjQ1yqh3lk/bHHFT1
	bqwLC70TAyDn73m8XmIwTXFLd0K84FdYfxjHrhZESMN1oppvPNhy5gyhz11efA==
X-Gm-Gg: ASbGncsOtTwX9VmujH+v2zlhgX6Vo1wvzOLfRG7QASAeD1jmDSvKpjkZqGm9uYukHNb
	BAfoL9EbW3l+Yi3fnXOpCplpZWcX+Tk6XGRXmNZwDfM6A2q3UbCsN5fS1eCG6H4BXyFtvhjejXP
	p6BkLv2SqEqx8Eij2RaSM/xwwAqTbn2k9hP0oQ3Hulf8L7jqJOAGuXQKaVy+yLSQaD4W8Yzs6+i
	DM5hrQKBqsQyvzkze/cnrLf9GaFqgazFqdbs3oaICIS1G6snWJsMdFdAEuCvScZCF2sF6OFHQpb
	kzMYJy2S1OaxVHDowFR9Wz43W/5+zLboc3haaLr5THD8kXi5+OVfPne4nCoXgMvJ2zbhcM9O3e4
	liBiAiQ==
X-Google-Smtp-Source: AGHT+IHDsKQzq+kRdRhtw0xx+ABY5gFAKYBsxmbvMxvH7JNhzPz2aoKQbOSByQbidAktAYZGHjSkpQ==
X-Received: by 2002:a05:6a21:3943:b0:1f5:55b7:1bb2 with SMTP id adf61e73a8af0-2015ae8f9c7mr1881092637.6.1744178355797;
        Tue, 08 Apr 2025 22:59:15 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e5171dsm419092b3a.153.2025.04.08.22.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:15 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 08/21] staging: gpib: Using struct gpib_online_ioctl
Date: Wed,  9 Apr 2025 05:58:50 +0000
Message-ID: <20250409055903.321438-9-matchstick@neverthere.org>
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

Using Linux code style for 'struct gpib_online_ioctl' to remove typedef.

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
index 6d0191c9f730..b215521d0ee5 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1353,7 +1353,7 @@ static int parallel_poll_ioctl(struct gpib_board *board, unsigned long arg)
 
 static int online_ioctl(struct gpib_board *board, unsigned long arg)
 {
-	online_ioctl_t online_cmd;
+	struct gpib_online_ioctl online_cmd;
 	int retval;
 	void __user *init_data = NULL;
 
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 71c5e3d020bb..dab170b09764 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -58,11 +58,11 @@ struct gpib_wait_ioctl {
 	unsigned int usec_timeout;
 };
 
-typedef struct {
+struct gpib_online_ioctl {
 	uint64_t init_data_ptr;
 	int init_data_length;
 	int online;
-} online_ioctl_t;
+};
 
 typedef struct {
 	unsigned int num_bytes;
@@ -158,7 +158,7 @@ enum gpib_ioctl {
 	IBLOC = _IO(GPIB_CODE, 36),
 
 	IBAUTOSPOLL = _IOW(GPIB_CODE, 38, autospoll_ioctl_t),
-	IBONL = _IOW(GPIB_CODE, 39, online_ioctl_t),
+	IBONL = _IOW(GPIB_CODE, 39, struct gpib_online_ioctl),
 	IBPP2_SET = _IOW(GPIB_CODE, 40, local_ppoll_mode_ioctl_t),
 	IBPP2_GET = _IOR(GPIB_CODE, 41, local_ppoll_mode_ioctl_t),
 	IBSELECT_DEVICE_PATH = _IOW(GPIB_CODE, 43, select_device_path_ioctl_t),
-- 
2.43.0

