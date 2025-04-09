Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E7B2777FC
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 18:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222204; cv=none; b=uN7VdmqDYDL3Op7C8ckXL6H+waTGdPfTpAvqM0DTCOatPzO1dush5hKLqP35HNSRuBcZRjzDkoMigJZkjo41NqA5mljion1lIfNQDxV34EeNpjpYJLCkV2HuaCFQD8sJpb7wUadFH4iQioW9FeDzi9VxvIa/HgWIQvIYs4rKy/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222204; c=relaxed/simple;
	bh=N95I4jtfm8tV/UxSD/+PkNeT+KRbUV2lDcZrHgxcpkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ac7aTK7W9PR1oiUGQT6S0T7N+JwiWrgdSaTQSHewZxL4f63mWWLnhFD+z4i3cycSC+bXGEIuBRxEAphUAj47yeweUIAWBK7QnavsgGxVut9PHncoJrR0vLaC3HqrFFgCdmhQdOLsBslGJYV4eeTpSWUK3sDrUevsgdOK/lQe7oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=gPPoAKjp; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="gPPoAKjp"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-301302a328bso7566172a91.2
        for <linux-staging@lists.linux.dev>; Wed, 09 Apr 2025 11:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222202; x=1744827002; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGz8cuaRzJJ2oAljQysG1oQTihJGr/6KvD6+YWx4kWA=;
        b=gPPoAKjpGyuweo7BNDE1hC9XljBA4IT5QnaKxON4/fesBKL63qHWArl9WUpH7c5TbI
         r/WWkatUH7s/4t3g0LH2ok+vbIzV6LpvMDImA/uL3IBGbeJxchbm8o2wo0nOLMDgOUxE
         kgLyjIH0tbVGEXlSKM5NdXq6+IzgP83QD5w3xhAscehms2AQQF+tVjkyHvtBSOdLOKo3
         dfYoWUcCFvYNrMBj7Y4FBf42E88VizsuRq7HAPfiBedxcH+5IsTVUKZ86F1k2L7fogfG
         6YNofNQw/tDH+ccLxO+Cs/XlC6nog55LIzlHVfiIma5e+cC/c8CwbgYyLq6N7GEh5u5p
         KBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222202; x=1744827002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gGz8cuaRzJJ2oAljQysG1oQTihJGr/6KvD6+YWx4kWA=;
        b=AK1R+hSYiUZzsy0Wj64v5h52aehobvWC8mIe2fsr2FT0eRP1Jm9NzVnBAagm46mWMQ
         85sNyf7TTeTNQZ/V1YfygOfH68I+lQrjLWDt5l6qVTirJL/L09IzAHCer5EFpqxD7D33
         up9Zm9fCCMLSG5BcYFssXcZKUv7UiTeHJJO+MQEjlN8Z2cNSJ1gn1dpbLoGFh+LJoavQ
         39wvcZ8sw6vI1ZgVmmaUKlndlHc6IjgzZ2yZnXQ4TClBCbZSyMewAlgOwpbyW2bHHIHp
         O5DkldAW6yS4EwDVbSl3U9dSfeli3h8ZpsW6v10d5P4zmiNaT0PtQyZMRTARwQYnkp9+
         zC2w==
X-Gm-Message-State: AOJu0YxPV0uFLT+5fdqUf1QZ6h5zpLKU6Mqt2ti+a6sAsWPb7SBg7ADY
	cXTYPDYow4eoLmxf2OSjrSbBTXnd6QjO9Abn1Xv+3gNeFCno3qjuy1edkM123Q==
X-Gm-Gg: ASbGncsIIMerRzD+2XzIGWzya/OPcfMr/wJf+2HZLD2wqOE+05qGgRwbsO4K1ClcrLO
	vv70CqrEqc2K8RnkjhEYm019aG5SCXwlhae6Jv6tgVt7WI0NZoW3JqmdWegVtMY/L2VEKnheNsf
	9tKHBBi1aBzSmif0jkNf/fnPpXQG8Y0fj6esblnWRBsMn3F4+ZYl2iL04p37LIoQqybas5QYTly
	UCLPE+20X9dwKX7N8P3m7QUEcFJu+qzWF0vHha+LmvM7dva702L4vkPoOXzIwHz0VDYQH29qfp8
	FmL0MZkm3tJAtSE0enk6meHwW8nK4QV59Qo2U22ZDo0bWKt4v6zxxjNE7x/BR7BGW2Kq6JNV5gv
	b22MZ0XWm6eocKjiE
X-Google-Smtp-Source: AGHT+IEgs6RUWozkbh4QD2FqyyruOz6bjWFjR2k+VOZ4ezhRHSrXbXvDWyrrTiQT8q17rBG4ISXwQA==
X-Received: by 2002:a17:90b:270c:b0:2ff:5c4e:5acd with SMTP id 98e67ed59e1d1-306dbc2e412mr5791558a91.35.1744222201702;
        Wed, 09 Apr 2025 11:10:01 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd11e659sm1970502a91.16.2025.04.09.11.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:01 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 05/23] staging: gpib: gpib_proto: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:35 +0000
Message-ID: <20250409180953.398686-6-matchstick@neverthere.org>
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
 drivers/staging/gpib/include/gpib_proto.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/gpib/include/gpib_proto.h b/drivers/staging/gpib/include/gpib_proto.h
index 4c01c436b9a7..1c8e5955b9ce 100644
--- a/drivers/staging/gpib/include/gpib_proto.h
+++ b/drivers/staging/gpib/include/gpib_proto.h
@@ -21,16 +21,16 @@ static inline unsigned long usec_to_jiffies(unsigned int usec)
 int serial_poll_all(struct gpib_board *board, unsigned int usec_timeout);
 void init_gpib_descriptor(struct gpib_descriptor *desc);
 int dvrsp(struct gpib_board *board, unsigned int pad, int sad,
-	  unsigned int usec_timeout, uint8_t *result);
+	  unsigned int usec_timeout, u8 *result);
 int ibcac(struct gpib_board *board, int sync, int fallback_to_async);
-int ibcmd(struct gpib_board *board, uint8_t *buf, size_t length, size_t *bytes_written);
+int ibcmd(struct gpib_board *board, u8 *buf, size_t length, size_t *bytes_written);
 int ibgts(struct gpib_board *board);
 int ibonline(struct gpib_board *board);
 int iboffline(struct gpib_board *board);
 int iblines(const struct gpib_board *board, short *lines);
-int ibrd(struct gpib_board *board, uint8_t *buf, size_t length, int *end_flag, size_t *bytes_read);
-int ibrpp(struct gpib_board *board, uint8_t *buf);
-int ibrsv2(struct gpib_board *board, uint8_t status_byte, int new_reason_for_service);
+int ibrd(struct gpib_board *board, u8 *buf, size_t length, int *end_flag, size_t *bytes_read);
+int ibrpp(struct gpib_board *board, u8 *buf);
+int ibrsv2(struct gpib_board *board, u8 status_byte, int new_reason_for_service);
 void ibrsc(struct gpib_board *board, int request_control);
 int ibsic(struct gpib_board *board, unsigned int usec_duration);
 int ibsre(struct gpib_board *board, int enable);
@@ -39,11 +39,11 @@ int ibsad(struct gpib_board *board, int addr);
 int ibeos(struct gpib_board *board, int eos, int eosflags);
 int ibwait(struct gpib_board *board, int wait_mask, int clear_mask, int set_mask,
 	   int *status, unsigned long usec_timeout, struct gpib_descriptor *desc);
-int ibwrt(struct gpib_board *board, uint8_t *buf, size_t cnt, int send_eoi, size_t *bytes_written);
+int ibwrt(struct gpib_board *board, u8 *buf, size_t cnt, int send_eoi, size_t *bytes_written);
 int ibstatus(struct gpib_board *board);
 int general_ibstatus(struct gpib_board *board, const struct gpib_status_queue *device,
 		     int clear_mask, int set_mask, struct gpib_descriptor *desc);
 int io_timed_out(struct gpib_board *board);
-int ibppc(struct gpib_board *board, uint8_t configuration);
+int ibppc(struct gpib_board *board, u8 configuration);
 
 #endif /* GPIB_PROTO_INCLUDED */
-- 
2.43.0

