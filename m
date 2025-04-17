Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2E61ADFFE
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744850746; cv=none; b=eq7zYBrgqFFNMaVvw2ceE95UTkgT75yNtmRtwwehVZ4ZzGgE9zWTU7xNv5gtl04/xv4KEqklF+RDhrdl0VW/Q6QMlLnBQUlvwbBmTPFFxYA0Le07ZsR4nxXE6JNNokHdgwMbTAbl5Iu3kJb7IeaZdDQ9vffao06jsSuQGXl+Imc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744850746; c=relaxed/simple;
	bh=wB0+LV91DnXQQGNzqKR/BclsH5n95+e2l+fGurYx9zI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jof0dV5pepzH2DqSyXpc5GMKT5qp1+FYKrbfMJ7jCNrZG1UC9HZmtCxFNaTV7zKoW7xdntrEo532yiH/x2gE83PkZU8SCadHRCYkyemgJ4rTEUtklLTd6FAKPREpLuQJVzw28NIAqDoPKkrJGwdCJppJ5N6ktS2P0A+swoh2fUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=ki6c9h1k; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="ki6c9h1k"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2264aefc45dso4321035ad.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744850745; x=1745455545; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFrFNnlUmxoJuqsI1VEzyrbevotU4o2PIpnAF37A/EY=;
        b=ki6c9h1k8roIvGfl6Rdc6LeOftl9B0i0DQivLaJ7fpJQSUx63O1B4EKTFQWbZxmAGT
         rU6CBL8M8eHllqcq9tN8/rdXJBvtCvx0Koxy0pjvOishn9YCTY6qy7UDWavnuTpcv1+V
         duSV41nimTkqItX+Ik4O7zbyfEMFoVxd5EMwPzSK+mN1ZbGGsi7uYlhg/vo8+Z7AYz5C
         Gdi0qz12DkcIPvzvA1I/treUvKXZLQnyGlX3JDJZBsDF0UboQ9IDQKb08Nb5Z8R2FZ5A
         xDe03erf5jNdqtlO/+SmUtKDMjhG/5aD2NrTH3s3ah8j8GPqF63aeUJnxfJtijHwkN2U
         iowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744850745; x=1745455545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFrFNnlUmxoJuqsI1VEzyrbevotU4o2PIpnAF37A/EY=;
        b=lz4rOkWFxHvi4Qlantd0FkwRekNVAybQ9A4rivhdBdOEKuqF44ufVK7bduZ1sawjlS
         MbinMbjpeUk4nr/Bss8iY1RYr20DVtOUU95Nlwb5Mk1eTzkIyZs4e7eD2OzsbwVtrBI5
         azF3QuL6OTwnfqZV4yMnTEAIxD/5Pk0vSUfZ+nWoWOzlx2IBhvgrTXr3XeviCHiOhfv+
         2LzAr1653MhMTsHSfLtiUY8cYZ7dhtAU0otyY69tlXewRvDy+3nU1KSrb4cTAk6UqvK2
         hIkMH4+WHU2t0gdwUi/EVAlqPdoKRkw8uywDpNXuDQ6COA9RBIFUFaJLFi8yVEPMNP78
         eqvQ==
X-Gm-Message-State: AOJu0Yw9cCa2Yado09As9/VDLkUlq7R65KY+2sZQnYGcGbhNf1WL47Xd
	ikOfgOa8KuW52laJyWntHQIn6blkmtiIsE9MpdhN7NdHi0ggJQwCJN2szP2w8A==
X-Gm-Gg: ASbGncvksX1kQScCcPI83zsCRWU9qU0ITry2kG6ZNfyvZED8TC5+yq7fZLe5LlZTesH
	4u3By5GY5owh3uFxDZQrNLoHcVwZwReGFIbZaQNzIeGRRauBp9qUWkMCvxFaaf3prmdMBnEkTYh
	BdMUdQQb0BTjXorEmU8OFpAcfYAgdRebQyqI8Gxaw6cGs0yYz3bWxF3L97h8klhxECZ95Ul8nSr
	NZ0sxQNx7XFpHXopBBmSnQSd5N1xqs+/7PCg8NhqxvbVBTk8pN1MaqMrtpRDKB0dr3hhBW7ktEx
	Lyd9x80YDAbVfp0KHmvdPtd15iMqz/+dAubVBluuLs2DBtGFM23+Fx75QtSHa5GYOPru8vhkbE0
	BTfxyMg==
X-Google-Smtp-Source: AGHT+IHupqzfoJY9EqLHDGlcyjRAk88IbaBDb/wMwF/OcvBE0w1hJEg1mGy1VxOeddmY+TH6QHmQtg==
X-Received: by 2002:a17:902:d487:b0:220:f87d:9d5b with SMTP id d9443c01a7336-22c3591836amr56173735ad.24.1744850744760;
        Wed, 16 Apr 2025 17:45:44 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33f1d16bsm20981105ad.58.2025.04.16.17.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:45:44 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 06/14] staging: gpib: gpib_os: u8 over uint8_t
Date: Thu, 17 Apr 2025 00:45:25 +0000
Message-ID: <20250417004533.86765-7-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417004533.86765-1-matchstick@neverthere.org>
References: <20250417004533.86765-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch.pl.

CHECK: Prefer kernel type 'u8' over 'uint8_t'

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 87329d35ca47..163d9a64e7df 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -263,7 +263,7 @@ struct gpib_status_queue *get_gpib_status_queue(struct gpib_board *board, unsign
 }
 
 int get_serial_poll_byte(struct gpib_board *board, unsigned int pad, int sad,
-			 unsigned int usec_timeout, uint8_t *poll_byte)
+			 unsigned int usec_timeout, u8 *poll_byte)
 {
 	struct gpib_status_queue *device;
 
@@ -339,7 +339,7 @@ static int setup_serial_poll(struct gpib_board *board, unsigned int usec_timeout
 }
 
 static int read_serial_poll_byte(struct gpib_board *board, unsigned int pad,
-				 int sad, unsigned int usec_timeout, uint8_t *result)
+				 int sad, unsigned int usec_timeout, u8 *result)
 {
 	u8 cmd_string[8];
 	int end_flag;
@@ -410,7 +410,7 @@ static int cleanup_serial_poll(struct gpib_board *board, unsigned int usec_timeo
 }
 
 static int serial_poll_single(struct gpib_board *board, unsigned int pad, int sad,
-			      unsigned int usec_timeout, uint8_t *result)
+			      unsigned int usec_timeout, u8 *result)
 {
 	int retval, cleanup_retval;
 
@@ -475,7 +475,7 @@ int serial_poll_all(struct gpib_board *board, unsigned int usec_timeout)
  */
 
 int dvrsp(struct gpib_board *board, unsigned int pad, int sad,
-	  unsigned int usec_timeout, uint8_t *result)
+	  unsigned int usec_timeout, u8 *result)
 {
 	int status = ibstatus(board);
 	int retval;
-- 
2.43.0

