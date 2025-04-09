Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8837C27C179
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 18:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222216; cv=none; b=nxZURQZmse1fnmHc6LSzzcihnqPOKsfiF+jhnwNzZtwePdLAyXwwKTzx1n9oXkE5qHsbIwgHVJK2LKLFc8NPZkKFxa+O3+Fyii8vZjtfDxq/4zSdQLgVTk36EKJnx/ZLluQ07UYLAb3PcAuRPalDStKtTPzWjgX30kL3i43K/mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222216; c=relaxed/simple;
	bh=ORaFewiMotVN/KSTVC9JeUrAwDzXl5jTaIJ3ZdlqVog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=unXryq47OTOHtvJMOWdHLP/y3ozjyaAuObkwJOlldRBTDlRkqC/E6152b6t+6H4MI7Lh4rCWgRZ1AVPif95koVgsOGa4gyo0R3LXUlL/9zDgvlWZE4x+APeAS59kmQ/8ybegqidFJ5XJH1RerbI3GSmfPF5YUDMZ2tMYgXFVcQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=ZCVAGAJw; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="ZCVAGAJw"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22928d629faso74196675ad.3
        for <linux-staging@lists.linux.dev>; Wed, 09 Apr 2025 11:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222213; x=1744827013; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLQrdeAsDQm2cgT9iwT/rZbmrhZ0r2i7KpwlM+r1xuY=;
        b=ZCVAGAJwVRbV1vbpQ/G7PRrWxkoK2kTEn3Jfuw49s4DXjR0kyr27TlX6TOTDs4aZIu
         O34tCLMYn06h/bp/ZeuzdymK2k6VXNbBWDC1rK9UCni8P3o/022rmjmEZQEL+oBt4nE/
         Fqoqo72xL1v/faw16ytAC6d5dChbZykCcqVhCQHmq6tMSYsvKi9+R5H0P4+Jkb9JvNBa
         lQbJGgePwxDD9xSqEh3Hcr54ILJZc9BOo2Va2h7WsZheQ+Mi2BhhYGrc83qDHQZDJgEM
         Sbj4FhuzmFnAcg2SuGTHvGmcpUQMs3h1BPc1AnXKV/LTTgjKpK5fA8j0GFB/9Hz1e6qk
         Y4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222213; x=1744827013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aLQrdeAsDQm2cgT9iwT/rZbmrhZ0r2i7KpwlM+r1xuY=;
        b=OlMk2Hdfib5Vf9rXyHXfAfa3kv0AReU17bXK2YOE+69xtAkSuaJanB1vcPqJtWg/zm
         TK7lLECesAZtSxGosUGsUyJ8dQxfNMPtbqTGvedYGNKiFhGoxSDU+bHkjSKijVJ+khOm
         vMcduJa95Gq/tFuJitD28QMaxIwWkGabeEQ/PFXYXdyRcMe0vNo6N6HKNdZCXDyF22Pc
         ddzlikGBp1EDrdUZFr1TCAgD0V0Bu6OSaDd7m0NDvyzZr7yRwK3Cnv1ewmsEchxX4qSc
         Q0Z86xLJI8yJWPy8OSF1Wr7DhISThm1ahpkBJiRX8TODnhXTq8XosbDTiq805kzP6YDv
         4UZQ==
X-Gm-Message-State: AOJu0Yy/j3bJ60o6bZO3kKEX2n4/WSymvq3ShC1Cm6+EdJHPTW7STrcl
	xScHCpXWkSNGjtsWjC3+q3v7+do3A/n1HnfoVPFoc9a8is6b8VjHj4Cx7jHWsA==
X-Gm-Gg: ASbGnctCTUUlgoFzCCnnugF8N55oHkQa3HwrxVGZkYlTp0QYWHLVWFHXIWr4FzjxptO
	ukpnM3ad4kvRxevrue6gF39Xg6pp5IEWeCSGj2x2Gz+JVoBUOXcHiJ0DrMPJUWMp0qLOYGZD72q
	2Dte3L8VXIhFeVNf0SVteO0YfM3QYRo5qXAG/TUDDgVay41LljYB8C/PJf13IDj5WK7NJcHNfl9
	u+AumXy6Sufl2uUiKgGwjtrFG75X4ydZ6PPoITuZXPDmskQ/3UuWmXBGV+ZMP5XgQPGNAs4WSAj
	qyf05KNEMo6IDvgK3mlPCLVhC6/Jzi4VO3+Wxx9Fusz5WQ/yeY45l11B9dWpdJ7i19HAlPtvFg8
	YJnyp0w==
X-Google-Smtp-Source: AGHT+IGg1atvIA/BG5UDn7znsUu0dmzq+eyMn9p6pX4aN8/CWH8Z2tIunaPVygVjY1BOtPEmulUIRQ==
X-Received: by 2002:a17:902:ecc1:b0:224:191d:8a87 with SMTP id d9443c01a7336-22ac29ab182mr43357915ad.26.1744222213651;
        Wed, 09 Apr 2025 11:10:13 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb79esm15136065ad.243.2025.04.09.11.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:13 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 15/23] staging: gpib: gpib_os: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:45 +0000
Message-ID: <20250409180953.398686-16-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409180953.398686-1-matchstick@neverthere.org>
References: <20250409180953.398686-1-matchstick@neverthere.org>
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
index 7d0c03ebe624..3c72f0583985 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -262,7 +262,7 @@ struct gpib_status_queue *get_gpib_status_queue(struct gpib_board *board, unsign
 }
 
 int get_serial_poll_byte(struct gpib_board *board, unsigned int pad, int sad,
-			 unsigned int usec_timeout, uint8_t *poll_byte)
+			 unsigned int usec_timeout, u8 *poll_byte)
 {
 	struct gpib_status_queue *device;
 
@@ -337,7 +337,7 @@ static int setup_serial_poll(struct gpib_board *board, unsigned int usec_timeout
 }
 
 static int read_serial_poll_byte(struct gpib_board *board, unsigned int pad,
-				 int sad, unsigned int usec_timeout, uint8_t *result)
+				 int sad, unsigned int usec_timeout, u8 *result)
 {
 	u8 cmd_string[8];
 	int end_flag;
@@ -408,7 +408,7 @@ static int cleanup_serial_poll(struct gpib_board *board, unsigned int usec_timeo
 }
 
 static int serial_poll_single(struct gpib_board *board, unsigned int pad, int sad,
-			      unsigned int usec_timeout, uint8_t *result)
+			      unsigned int usec_timeout, u8 *result)
 {
 	int retval, cleanup_retval;
 
@@ -473,7 +473,7 @@ int serial_poll_all(struct gpib_board *board, unsigned int usec_timeout)
  */
 
 int dvrsp(struct gpib_board *board, unsigned int pad, int sad,
-	  unsigned int usec_timeout, uint8_t *result)
+	  unsigned int usec_timeout, u8 *result)
 {
 	int status = ibstatus(board);
 	int retval;
-- 
2.43.0

