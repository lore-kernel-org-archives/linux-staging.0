Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB0A8F62
	for <linux-staging@lists.linux.dev>; Sat, 24 Aug 2024 14:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724510633; cv=none; b=QFf84L45Fs4FDfmzgAJcuUz5f3upqGIC0TT/WPyMcQEoQmHut0W+UvH0bZdTaiANc5d7vHknXM8vhtqyKuq7HkSUNBPEmVsyJQ1pqjQ+vBh2mxF4sCvP54eJo4QnoKJIYXnLOvvnLsmlcSXDE+rAqoY5uNziV3FVupAWtqONC9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724510633; c=relaxed/simple;
	bh=mugQ4GfH0FHRk027Vim4SiBmF6OBwGROshOZP93f478=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ENP7Jmtjarww9LA6G/lFKzzCmcF+TLXePp2Y2YQWGWytqYuasyU5rmvx5vnlve7wJ4wr7rqFWEX8vVvLVX3eU9puhx3io9RGgKOhVVlSAcc4Js174kV5/8pAs/K+MQhEK9Qam/dCr4cPjmlPacl6ZBFqtRMuK4RtfndP+3ROW8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z57K/lLm; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z57K/lLm"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-201fbd0d7c2so25805355ad.0
        for <linux-staging@lists.linux.dev>; Sat, 24 Aug 2024 07:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724510631; x=1725115431; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PHDB2uC+cQI/ej+Sb9ord5BSiF4jQITbMRFWYYCom0M=;
        b=Z57K/lLm5GRHyg4/N9g9bj65iNy0OuNpfISJM1gpgrxY6sHB0RRuUqsWogNMsJGxoS
         pHpPyK7P3+8165NmvSw9kOlakRYBwXKmh0IkEpUyyUDbiSh8KGnDj/egY76WGUZGXv4e
         8lKCA5TGRM8NRpuM9EQqYNril2uz4kc1+Ro4NxMPdzeEZb8QM2r+bCBKy5drJmzSrtHl
         Z/q4n6JrErwQlK7uHJBCjnjMrJIe57X8eVMH2CbKE4+QhE8y9zflfjzpFwwmIUTiwykb
         MSD7JFnO7yNSECBbOryMK3a51Xuqc+bF63KaBw0/MH2tTfY/AGtPdl+Rq0Pw13ctQVfO
         /gJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724510631; x=1725115431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PHDB2uC+cQI/ej+Sb9ord5BSiF4jQITbMRFWYYCom0M=;
        b=Y8HRyEmsb8UiLlaDSuRO8QilLhonasGdEGhS2N4rK9MNh7Pb5B7mXpwpEkQ4j8QjrQ
         GZwvTWnaVOpcUEwO8MhrZsn3WrpOgB1E5J4zNdSRGsBqs7AiDYbPm075KPq9B8ISozFA
         mltmEI2IZfcNkQBvEn34hWDwWKnTCQiwmzvM5t27vBCOF2FGTKS85M+rtoC9aORKTxsY
         ZzKTZ0n1fnGFnTMVYQ2drQkOgWG3XaQ1luMEA8rd6RTali8m5v0aG94YYgzAOSjYdGGa
         Mc4I/yrl88gNV1Le2BRO9VbqS4hpvyk8rrWY3YtF9rndvX/dGQ8UcM8fANjJl4NhdLVU
         rj1Q==
X-Gm-Message-State: AOJu0Yx4AsEtgZRf1BwF59caHdmVM32aQOH/AMuwbHDa1S9al6JtOKXD
	ZN/Wrp1vwmwZJGw7TfySAXaw6Cd3fGTelyK0fp9xGxOH0Y9NV/nqHe+D1KED
X-Google-Smtp-Source: AGHT+IFQNKHxBl/8QY8BVdguVO+dTMK4/vy97zix5z/g1vnD6nmKwlBsfY/kd5V4ez07N/iIL6BSSQ==
X-Received: by 2002:a17:903:230c:b0:1ff:5135:130f with SMTP id d9443c01a7336-2039e67cb39mr50938185ad.53.1724510630828;
        Sat, 24 Aug 2024 07:43:50 -0700 (PDT)
Received: from localhost.localdomain ([2804:4b0:1408:4900:9408:c7b2:31:3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855805bbsm43279475ad.108.2024.08.24.07.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 07:43:50 -0700 (PDT)
From: Gabriel Tassinari <gabrieldtassinari@gmail.com>
To: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] staging: rtl8192e: Fix parenthesis alignment
Date: Sat, 24 Aug 2024 11:43:03 -0300
Message-ID: <20240824144345.8873-1-gabrieldtassinari@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix parenthesis alignment in _rtl92e_qos_handle_probe_response to
silence checkpatch warning:

CHECK: Alignment should match open parenthesis

Signed-off-by: Gabriel Tassinari <gabrieldtassinari@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index ad21263e725f..18739583f579 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -322,7 +322,7 @@ static int _rtl92e_qos_handle_probe_response(struct r8192_priv *priv,
 
 	if (network->flags & NETWORK_HAS_QOS_MASK) {
 		if (active_network &&
-				(network->flags & NETWORK_HAS_QOS_PARAMETERS))
+		   (network->flags & NETWORK_HAS_QOS_PARAMETERS))
 			network->qos_data.active = network->qos_data.supported;
 
 		if ((network->qos_data.active == 1) && (active_network == 1) &&
-- 
2.46.0

