Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103AB14830A;
	Sat,  5 Apr 2025 22:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743891731; cv=none; b=S7NKBhVPisaRm/5QLHmBPK9D0+RZGBh8/mYi0z/sK4tZu69hRJtiXa1U7/+oXaVX14bVQQnnwVcqMHPAgrqqve4g0dZh9X7vMhuVOTMNO1ykcIvR4/Y0UeA0gtukLFhnai8w1KmBVrIG+3GB2Aj5LkjjZAYoMuj0n3sCDqc+EvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743891731; c=relaxed/simple;
	bh=1J79/UzQQQqgglAwHQAJTS9DXGRi63VF4VRPFCp7sHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cpANXkbZAlemghHMd9Qch1utYk55mBWxGzhsMqm3+L1NqGKKxqH0UMvybf7OJFk554e2keYCuVVnPawkatfakapdnFICuURIFxYo7zbydt8CfgSFHqByUlGrEn4sgirHi7yS5uer8+Gk7CHsobxnRnlpp/0Fl1LjCqIW978msWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rz3C2RZu; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rz3C2RZu"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c07cd527e4so299562285a.3;
        Sat, 05 Apr 2025 15:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743891728; x=1744496528; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DJhX/oN89+OT5FiiKG9iuTErcMM31EEtHlt0ti5ugWE=;
        b=Rz3C2RZu0WInE/hHUHCf3wCL12wAUc04uv6DhF+R4Dl/tr6jP12624UDmtwTZBwpHg
         e9YG/dj6HucZ848gsBs4UvrY+DqzRjx6ZdK1jPmUVs8cTuv29fXpquwAR2Gudmw/pv73
         6plY7SdBaPiuxEQFfycpK8a/DSG+QjzrLWgF80J5Ydo59FJG2BW6BafhwpNA6LLSxq8W
         polfyJiEyVO5XO+FXrmClqmANZc1K7q00xLURp3Cf1fDvZst8O3O9aE+O6p8Ya903Jc8
         jl7e3f0OfAJ58HxOqGT9tp1c4uaM9exy6PPtVZTTuHV1hgaFUhuXVpLCo0x2gXSlooFI
         QB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743891728; x=1744496528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJhX/oN89+OT5FiiKG9iuTErcMM31EEtHlt0ti5ugWE=;
        b=JApzCJsYbb1DwFNQ0cOEK7T/HZZX16jTe6nhxmLo0Vv3ODFdbqg6InlwuSJu0u4ybY
         R+SAzGZjXi5we0sTsenc98Lp+R3zq0+2kUOoW3kmaroqEokiqvgPq3la+vIcXrSgq+wN
         h/DCGaf3ILj7+6C8oBl7Qppy/J5KqDo77dABt2p9cps6YLcNrNdIGGDm6KXxXHik7TxC
         Wmf8hh2s9wItcYwWDHmcaUElyPqNDDhMBGrnyR4Jx2+3uiraxHFfxZWt/W6PtMCKa+NI
         W8N1gjhhfx1ZbW89KRzJzujnszGuZ3Oj1RYIKyvEBJFuDurLBDs7airea2R38mgVePMW
         uZcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeFHx51W6qkW3LS/ACaHNF62UpoPlUO0Cw0QL8e47B1a9GARxeLsApw+dhAjvYYUzlqaL87KIYEyc9Zu9ZcUxjZhSY5Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2fk+2gKmEHw+J09UOyiBiRFoLQbVzV+IqhEzJ0y7QcTIngxnI
	Rn+amRtyX45fHrWJcIqe4zHB5OJfaOu80D6Ikv9+4IXNTKJEhIXGcTA3og8V3ak=
X-Gm-Gg: ASbGncs0PwFCXYigawE1OiYC7i/Ilp0Y7w7aph4MxmTW/5EWD8M3hGpMzAwkPL17VfM
	VjWRMnSyroWa6HWK4aLWZPu4wW9EN4urvujpa2k4gIiie4WDNsEZ1Lr+2w+MgwRR+k/xVDbTqQD
	zajKaaMxkV0Mq8VWicaWErcbRxUrcx4aBbfFuVki0Lh4ktqZO9lE0IQPnKmd9Bs8ZfKtu1cNo6j
	0FnWEucGFqgNZnhTOtyC6Mz67F1z7q5UMyekg1IkwE6OscFcLDfh1CIbOMyRZ/AK6tna5wAlKHH
	BBBunX3WQ4kf5yomuRIINiR6QDu6oFPdzGbyRyWPKW8usla9ZnlBIas93JL6h/M+opLTnanCXBl
	3RB7oLZ7843sIRZxpW6EvEF4=
X-Google-Smtp-Source: AGHT+IEAkm2CGrA07UUYNs+3Oj8DORY9RfX77/eDcgtvcFKRCKL7rHAHXMHx1ciFwFeqAJQjKxleng==
X-Received: by 2002:ac8:5993:0:b0:477:6ec9:169a with SMTP id d75a77b69052e-4792490f798mr107257191cf.1.1743891728613;
        Sat, 05 Apr 2025 15:22:08 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4791b0713f6sm40603311cf.21.2025.04.05.15.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 15:22:08 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: linux-staging@lists.linux.dev
Cc: philipp.g.hortmann@gmail.com,
	eamanu@riseup.net,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	gregkh@linuxfoundation.org,
	Gabriel Shahrouzi <gshahrouzi@gmail.com>
Subject: [PATCH v4] staging: rtl8723bs: Remove trailing whitespace
Date: Sat,  5 Apr 2025 17:02:40 -0400
Message-ID: <20250405210240.584821-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove trailing whitespace to comply with kernel coding style.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
Changes in v2:
	- Resend using git send-email to fix formatting issues in email body.
Changes in v3:
	- Fix indent level of diff.
Changes in v4:
	- Remove suggested tag because it was incorrectly used.
---
 drivers/staging/rtl8723bs/include/hal_pwr_seq.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
index b93d74a5b9a5..48bf7f66a06e 100644
--- a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
+++ b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
@@ -209,7 +209,7 @@
 #define RTL8723B_TRANS_END															\
 	/* format */																\
 	/* { offset, cut_msk, fab_msk|interface_msk, base|cmd, msk, value }, comments here*/								\
-	{0xFFFF, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, 0, PWR_CMD_END, 0, 0}, 
+	{0xFFFF, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, 0, PWR_CMD_END, 0, 0},
 
 
 extern struct wlan_pwr_cfg rtl8723B_power_on_flow[RTL8723B_TRANS_CARDEMU_TO_ACT_STEPS+RTL8723B_TRANS_END_STEPS];
-- 
2.43.0

